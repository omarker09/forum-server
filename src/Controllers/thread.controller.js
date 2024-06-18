const ThreadService = require("../Services/thread.service");
const TokenService = require("../Services/token.service")

class ThreadController {
    CreateThread = async (req,res) => {
        const payload = {
            thread_title: req.body.thread_title,
            thread_content: req.body.thread_content,
            user_id: req.body.user_id
        }
        try {
            await TokenService.VerifyAccessToken(req.token)
            const response = await ThreadService.CreateThread(payload)
            if (response) {
                return res.status(200).json({
                    message: "Thread created"
                })
            }
        } catch (err) {
            return res.status(err.statusCode).json({
                message: err.message,
                errorType: err.name,
                statusCode: err.statusCode
            })
        }
    }
    EditThread = async () => {
        
    }
    RemoveThread = async () => {
        
    }
}

module.exports = new ThreadController();