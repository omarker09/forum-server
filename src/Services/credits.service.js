const CreditsRepository = require("../repositories/credits.repository")
const {DatabaseError, ValidationError} = require("../utils/custom.error")

class CreditsService {
    SendTransaction = async (data) => {
        try {
            const response = await CreditsRepository.TransferCredits(data)
            return response
        } catch (err) {
            throw err
        }
    }
}

module.exports = new CreditsService();