const UserService = require("../Services/user.service")
const TokenService = require("../Services/token.service")
const EncryptionService = require("../Utils/encryption.utils")

class UserController {
    getUserData = async (req,res) => {
        try {
            const verfiedTokenResponse = await TokenService.VerifyAccessToken(req.token)
            const decryptedUserID = await EncryptionService.DECRYPT_AES(verfiedTokenResponse.sub)
            const payload = {
                user_id: decryptedUserID
            }
            const response = await UserService.getUserById(payload)
            return res.status(200).json({
                data: response
            })
        } catch (error) {
            return res.status(error.statusCode).json({
                message: error.message,
                errorType: error.name,
                statusCode: error.statusCode
            });
        }
    }
}

module.exports = new UserController();