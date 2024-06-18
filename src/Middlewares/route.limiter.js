const rateLimit = require("express-rate-limit");

class Limter {
  RouteLimiter(duration, limitRate, message) {
    return rateLimit({
      windowMs: duration * 60 * 1000, // Per minutes
      limit: limitRate, // Limit each IP to 100 requests per `window` (here, per 15 minutes).
      standardHeaders: "draft-7", // draft-6: `RateLimit-*` headers; draft-7: combined `RateLimit` header
      legacyHeaders: false, // Disable the `X-RateLimit-*` headers.
      message: message, // Display Your Message
    });
  }
}

module.exports = new Limter();