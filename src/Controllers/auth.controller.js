const TokenService = require("../Services/token.service")
const AuthService = require("../Services/auth.service")
const Encryption = require("../Utils/encryption.utils")
const cookie = require('cookie');

class AuthController {
     async AuthLogin(req,res) {
        const payload = {
            username: req.body.username,
            password: req.body.password
        }
        try {
            const response = await AuthService.LoginService(payload)
            if (response) {
                const user_id = response.user_id
                const accessToken = await TokenService.GenerateAccessToken(await Encryption.Encrypt_AES(user_id.toString()))
                const refreshToken = await TokenService.GenerateRefreshToken(await Encryption.Encrypt_AES(user_id.toString()));
                const cookieOptions = {
                    httpOnly: true,
                    secure: false, // Ensure this is true if using HTTPS
                    sameSite: 'strict',
                    maxAge: 86400000 , // 1 day in milliseconds
                    path: '/'
                }; 
                const serializedCookie = cookie.serialize('_gha', refreshToken, {
                    httpOnly: true,
                    secure: true, // Ensure this is true if using HTTPS
                    sameSite: 'strict',
                    expires: new Date(Date.now() + 86360000),
                    path: '/'
                });
                res.setHeader('Set-Cookie', serializedCookie);

                return res.json(
                {
                    Access_token: accessToken,
                    Refresh_token: refreshToken,
                    username: response.username,
                    user_id: response.user_id,
                  //  decrypted: await Encryption.DECRYPT_AES(tt.toString())
                });
            }
        } catch (error) {
            return res.status(error.statusCode).json({
                message: error.message,
                errorType: error.name,
                statusCode: error.statusCode
            })
        }
    }
    AuthRegister = async (req,res) => {
        const payload = {
            username: req.body.username,
            password: req.body.password,
            email: req.body.email
        }
        try {
            const response = await AuthService.RegisterService(payload)
            if (response) {
                return res.status(201).json({
                    message: "Your Account has been Created please login"
                })
            }
        } catch (error) {
            return res.status(error.statusCode).json({
                message: error.message,
                errorType: error.name,
                statusCode: error.statusCode
            })
        }
    }
    async AuthVerify(req,res) {
        try {
            const isAccessValid = req?.cookies?._gha; // Check if _gha cookie exists
            if (!isAccessValid) {
            return res.status(401).json({ isValid: false });
            }
            // Optionally, verify the access token or refresh token here
            await TokenService.VerifyRefreshToken(isAccessValid)
            res.status(200).json({ isValid: true });
        } catch (err) {
            res.status(200).json({ isValid: false });
        }
    }
    async Logout(req,res) {
        try {
            res.cookie('_gha', '', { 
                httpOnly: true, 
                secure: false, // set to true if using https
                expires: new Date(0) 
            });
              // Optionally, you can add a response to indicate successful logout
            res.status(200).json({ message: 'Logout successful' });
        } catch (error) {
            return res.status(error.statusCode).json({
                message: error.message,
                errorType: error.name,
                statusCode: error.statusCode
            })
        }
    }
}

module.exports = new AuthController();