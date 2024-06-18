const bcrypt = require("bcrypt");
const AuthRepository = require("../repositories/auth.repository")
const { ValidationError, AuthenticationError, NotFoundError } = require("../utils/custom.error");
const { StandardEmailRegex } = require("../utils/custom.regex");
const { pool } = require("../configs/db");
require("dotenv").config()

class AuthService {
    LoginService = async (data) => {
        try {
            const payload = {
                username: data.username,
                password: data.password
            }
            const responseData = await AuthRepository.SelectUserByUsername(payload);

            if (payload.username.length < parseInt(process.env.USERNAME_LENGTH)) {
                throw new ValidationError(`Username Length should be more than ${process.env.USERNAME_LENGTH}`)
            }
            if (payload.password.length < parseInt(process.env.PASSWORD_LENGTH)) {
                throw new ValidationError(`Password Length should be more than ${process.env.PASSWORD_LENGTH}`)
            }

            const passwordMatch = await bcrypt.compare(payload.password,responseData.hashedPassword)

            if (!passwordMatch) {
                throw new AuthenticationError("Incorrect password");
            }
            
            return responseData;
        } catch (error) {
            throw error;
        }
    }
    RegisterService = async (data) => {
        try {
            const username = data.username;
            const password = data.password;
            const email = data.email;

            if (username.length < parseInt(process.env.USERNAME_LENGTH)) {
                throw new ValidationError(`Username Length should be more than ${process.env.USERNAME_LENGTH}`)
            }
            if (password.length < parseInt(process.env.PASSWORD_LENGTH)) {
                throw new ValidationError(`Password Length should be more than ${process.env.PASSWORD_LENGTH}`)
            }
            if (!await StandardEmailRegex(email)) {
                throw new ValidationError(`Your Email is not valid`)
            }
            const hashSalt = await bcrypt.genSalt(parseInt(process.env.PASSWORD_HASH_SALT))
            const hashedPassword = await bcrypt.hash(password,hashSalt)

            const payload = {
                username: username,
                password: hashedPassword,
                email: email
            }
            const responseData = await AuthRepository.InsertNewUser(payload)
            if (!responseData || responseData[0].affectedRows === 0) {
                throw new ValidationError("User registration failed");
            }
            return true
        } catch (error) {
            throw error;
        }
    }
}

module.exports = new AuthService();