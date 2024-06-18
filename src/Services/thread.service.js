const ThreadRepository = require("../Repositories/thread.repository")
const userService = require("../Services/user.service");

class ThreadService {
    CreateThread = async (data) => {
        try {
            const response = await ThreadRepository.InsertNewThread(data)
            return response
        } catch (err){
            throw err
        }
    }
}

module.exports = new ThreadService();