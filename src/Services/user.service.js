const UserRepository = require("../Repositories/user.repository")

class UserService {
    getUserById = async (data) => {
        try {
            const response = UserRepository.SelectUserByID(data)
            return response;
        } catch (err) {
            throw err
        }
    }
    getAllUsers = async () => {
        
    }
}

module.exports = new UserService();