const express = require("express");
const router = express.Router();
const BlogController = require("../controllers/blog.controller");
const VerifyToken = require("../middlewares/verify.token");

router.route("/blogs").get(VerifyToken, BlogController.ExploreBlogs);

module.exports = router;
