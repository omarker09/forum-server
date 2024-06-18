const UserService = require("../Services/user.service")
const TokenService = require("../Services/token.service")

class UserController {
    getUserData = async (req,res) => {
        try {
            await TokenService.VerifyAccessToken(req.token)
            const payload = {
                user_id: req.body.user_id
            }
            const response = await UserService.getUserById(payload)
            return res.status(200).json({
                data: response,
                message: "ok thanks"
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