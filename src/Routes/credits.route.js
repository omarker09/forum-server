const express = require("express");
const router = express.Router();
const CreditsController = require("../controllers/credits.controller")
const VerifyToken = require("../middlewares/verify.token");

router.route("/send").post(VerifyToken, CreditsController.SendCredits);

module.exports = router;