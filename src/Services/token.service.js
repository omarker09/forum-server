const jwt = require("jsonwebtoken");
require("dotenv").config();
const { AuthenticationError } = require("../utils/custom.error");

class TokenService {
    async GenerateAccessToken() {
        try {
            const accessToken = await jwt.sign({ type: "accTk" }, process.env.ACCESS_TOKEN_SECRET, { expiresIn: process.env.ACCESS_TOKEN_DURATION });
            return accessToken;
        } catch (err) {
            throw new AuthenticationError('Failed to generate access token');
        }
    }

    async GenerateRefreshToken(payload) {
        try {
            const refreshToken = await jwt.sign({ sub: payload}, process.env.REFRESH_TOKEN_SECRET, { expiresIn: process.env.REFRESH_TOKEN_DURATION });
            return refreshToken;
        } catch (err) {
            throw new AuthenticationError('Failed to generate refresh token');
        }
    }

    async VerifyAccessToken(accessToken) {
        try {
            const verify = await jwt.verify(accessToken, process.env.ACCESS_TOKEN_SECRET);
            if (!verify) {
                throw new AuthenticationError("Access token is not valid");
            }
            return verify;
        } catch (err) {
            throw new AuthenticationError("Access token verification failed");
        }
    }

    async VerifyRefreshToken(refreshToken) {
        try {
            const verify = await jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET);
            if (!verify) {
                throw new AuthenticationError("Refresh token is not valid");
            }
            return verify;
        } catch (err) {
            throw new AuthenticationError("Refresh token verification failed");
        }
    }
}

module.exports = new TokenService();
