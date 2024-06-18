function verifyToken(req, res, next) {
    const baerer = req.headers["authorization"]
    if (typeof baerer !== "undefined") {
        const slitBarer = baerer.split(" ")
        const token = slitBarer[1]
        req.token = token
        next()
    } else {
        res.status(401).json({
            errorMessage: "No token provided"
        })
    }
}
module.exports = verifyToken