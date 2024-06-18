const TokenService = require("../services/token.service");
const cookie = require('cookie');

class RefreshController {
    async RefreshAccessToken(req, res) {
        try {
            const verifyRefreshToken = await TokenService.VerifyRefreshToken(req.token);
        
            if (verifyRefreshToken) {
              const newAccessToken = await TokenService.GenerateAccessToken();
        
              // Set the access token as a secure and HttpOnly cookie
              const refreshTokenCookie = cookie.serialize('refreshToken', verifyRefreshToken.token, {
                httpOnly: true,
                secure: process.env.NODE_ENV === 'production', // Send securely only in production
                maxAge: 60 * 60 * 24 * 7, // One week (adjust as needed)
                sameSite: 'strict', // Prevent cross-site request forgery (CSRF) attacks
                path: '/refresh-token' // Restrict cookie access to the refresh token endpoint
              });
        
              res.setHeader('Set-Cookie', refreshTokenCookie); // Set cookie in response header
        
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
