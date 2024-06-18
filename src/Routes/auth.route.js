const express = require("express");
const router = express.Router();
const AuthController = require("../controllers/auth.controller");
const VerifyToken = require("../middlewares/verify.token")

router.route("/login").post(AuthController.AuthLogin);
router.route("/signup").post(AuthController.AuthRegister);
router.route("/verifyToken").get(VerifyToken, AuthController.AuthTest);

module.exports = router;
