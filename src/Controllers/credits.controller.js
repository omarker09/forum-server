const bcrypt = require("bcrypt");
const { ValidationError,  AuthenticationError } = require("../utils/custom.error");
const { StandardEmailRegex } = require("../utils/custom.regex")
const CreditsService = require("../services/credits.service")
const TokenService = require("../services/token.service")

require("dotenv").config()

class CreditsController {
    SendCredits = async (req,res) => {
        try {
            await TokenService.VerifyAccessToken(req.token)
            const payload = {
                sender_id: req.body.sender_user_address,
                receiver_id: req.body.receiver_user_address,
                message: req.body.message,
                amount: req.body.credit_amount
            }
            const response = await CreditsService.SendTransaction(payload)
            if (response) {
                return res.status(201).json(response)
            }
        } catch (err) {
            return res.status(err.statusCode).json({
                message: err.message,
                errorType: err.name,
                statusCode: err.statusCode
            })
        }
    }
}

module.exports = new CreditsController()