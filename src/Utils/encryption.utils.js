const uuid = require("uuid");
const CryptoJS = require("crypto-js");
require("dotenv").config()

class EncryptionService {
    GenerateV4 = async () => {
        const generatedRandomV4 = uuid.v4()
        return generatedRandomV4
    }
    Encrypt_AES = async (plainText) => {
        try {
            // Convert the plaintext to string if it's not already
            const plaintextString = typeof plainText === 'string' ? plainText : JSON.stringify(plainText);
            // Perform AES encryption
            const encrypted = CryptoJS.AES.encrypt(plaintextString, process.env.REFRESH_TOKEN_SUB_SECRETE).toString();
            return encrypted;
        } catch (err) {
            throw err;
        }
    }
    DECRYPT_AES = async (encryptedText) => {
        try {
            var bytes  = CryptoJS.AES.decrypt(encryptedText, process.env.REFRESH_TOKEN_SUB_SECRETE);
            var originalText = bytes.toString(CryptoJS.enc.Utf8);
            return originalText
        } catch (err) {
            throw err
        }
    }
}

module.exports = new EncryptionService();