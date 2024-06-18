const BlogRepository = require("../repositories/blog.repository")

// This Only for Testing

class BlogsService {
    async GetAllBlogs() {
        try {
            const data = await BlogRepository.SelectAllBlogs()
            return data;
        } catch (err) {
            throw new Error("Error while GetAllBlogs")
        }
    }
}

module.exports = new BlogsService();