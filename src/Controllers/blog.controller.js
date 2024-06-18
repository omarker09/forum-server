const AuthService = require("../services/token.service")
const BlogService = require("../services/blogs.service")

class BlogController {
    async ExploreBlogs(req,res) {
        try {
            const isAuthorized = await AuthService.VerifyAccessToken(req.token)
            if (isAuthorized) {
                const data = await BlogService.GetAllBlogs()
                return res.status(200).json(data)
            }
        } catch (err) {
            return res.status(err.statusCode).json({
                message: err.message,
                errorType: err.name,
                statusCode: err.statusCode
            })
        }
    }
}

module.exports = new BlogController();