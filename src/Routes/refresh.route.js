const express = require("express");
const router = express.Router();
const RefresController = require("../Controllers/refresh.controller");
const VerifyToken = require("../middlewares/verify.token");
const RouteLimiter = require("../middlewares/route.limiter");

const limit = RouteLimiter.RouteLimiter(1,440, 180, "Too much Refresh Try later !!");

router.route("/").get( RefresController.RefreshAccessToken);

module.exports = router;
