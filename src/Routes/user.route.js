const express = require("express");
const router = express.Router();
const UserController = require("../controllers/user.controller");
const VerifyToken = require("../middlewares/verify.token");

router.route("/getUser").get(VerifyToken, UserController.getUserData);

module.exports = router;
