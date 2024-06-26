const TokenService = require("../Services/token.service");
const cookie = require('cookie');
const EncryptionService = require("../Utils/encryption.utils")
const { AuthenticationError } = require("../Utils/custom.error")

class RefreshController {
    async RefreshAccessToken(req, res) {
        try {
            const refreshToken = req?.cookies?._gha;

            if (!refreshToken) {
              throw new AuthenticationError("Refresh Token not provided")
            }
            const verifyRefreshToken = await TokenService.VerifyRefreshToken(refreshToken);
            const decryptedUserID = await EncryptionService.DECRYPT_AES(verifyRefreshToken.sub)

            if (verifyRefreshToken) {
              const newAccessToken = await TokenService.GenerateAccessToken(await EncryptionService.Encrypt_AES(decryptedUserID.toString()));
        
              // Set the access token as a secure and HttpOnly cookie
              const refreshTokenCookie = cookie.serialize('refreshToken', verifyRefreshToken.token, {
                httpOnly: true,
                secure: false,
                maxAge: 60 * 60 * 24 * 7, // One week (adjust as needed)
                sameSite: 'strict', // Prevent cross-site request forgery (CSRF) attacks
                path: '/' // Restrict cookie access to the refresh token endpoint
              });
        
             // res.setHeader('Set-Cookie', refreshTokenCookie); // Set cookie in response header
        
              return res.status(200).json({ accessToken: newAccessToken });
            }
          } catch (error) {
            return res.status(error.statusCode || 500).json({
              message: error.message,
              errorType: error.name,
              statusCode: error.statusCode
            });
          }
    }
}

module.exports = new RefreshController();
