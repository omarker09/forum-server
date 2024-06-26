const express = require("express");
const router = express.Router();
const AuthController = require("../Controllers/auth.controller");
const VerifyToken = require("../Middlewares/verify.token")

router.route("/login").post(AuthController.AuthLogin);
router.route("/logout").post(AuthController.Logout)
router.route("/signup").post(AuthController.AuthRegister);
router.route("/session-verification").get( AuthController.AuthVerify);

module.exports = router;
