const express = require("express");
const router = express.Router();
const ThreadController = require("../Controllers/thread.controller")
const VerifyToken = require("../Middlewares/verify.token")

router.route("/create").post(VerifyToken,ThreadController.CreateThread)

module.exports = router;