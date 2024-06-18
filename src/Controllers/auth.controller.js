const TokenService = require("../services/token.service")
const AuthService = require("../services/auth.service")
const Encryption = require("../Utils/encryption.utils")

class AuthController {
     async AuthLogin(req,res) {
        const payload = {
            username: req.body.username,
            password: req.body.password
        }
        try {
            const response = await AuthService.LoginService(payload)
            if (response) {
                var tt = "U2FsdGVkX1/6zYGJJFfhaw2oeCAmZuxFGArGxm9bThQ="
                const useid = response.user_id
                const accessToken = await TokenService.GenerateAccessToken()
                const refreshToken = await TokenService.GenerateRefreshToken(await Encryption.Encrypt_AES(useid.toString())); //Encryption.Encrypt_AES(response.use_id)
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
    async AuthTest(req,res) {
        try {
            const isAccessValid = await TokenService.VerifyAccessToken(req.token)
            return res.json({"isValid": isAccessValid});
        } catch (error) {
            return res.status(error.statusCode).json({
                message: error.message,
                errorType: error.errorType,
                statusCode: error.statusCode
            })
        }
    }
}

module.exports = new AuthController();