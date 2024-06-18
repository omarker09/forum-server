const express = require("express");
const router = express.Router();
const VerifyToken = require("../middlewares/verify.token");
const MrketplaceController = require("../Controllers/marketplace.controller");

router.route("/usernames").post(MrketplaceController)

module.exports = router;