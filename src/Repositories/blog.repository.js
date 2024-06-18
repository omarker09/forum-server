const data = [
    {id: 1, title: "How Feet", description: "dykjdghkfghlfhjlfhl"},
    {id: 1, title: "How Feet", description: "dykjdghkfghlfhjlfhl"},
    {id: 1, title: "How Feet", description: "dykjdghkfghlfhjlfhl"},
    {id: 1, title: "How Feet", description: "dykjdghkfghlfhjlfhl"},
    {id: 1, title: "How Feet", description: "dykjdghkfghlfhjlfhl"},
]

class BlogRepository {
    async SelectAllBlogs() {
        return data;
    }
}

module.exports =  new BlogRepository();