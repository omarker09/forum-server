const express = require("express");
const router = express.Router();
const RefresController = require("../controllers/refresh.controller");
const VerifyToken = require("../middlewares/verify.token");
const RouteLimiter = require("../middlewares/route.limiter");

const limit = RouteLimiter.RouteLimiter(1,440, 180, "Too much Refresh Try later !!");

router.route("/").get(limit,VerifyToken, RefresController.RefreshAccessToken);

module.exports = router;
