//---------------------------------------------------------------//
//         Copyright© - powered by Cayonix.com - 2024            //
//---------------------------------------------------------------//

const express = require("express");
const httpServer = express();
const cors = require("cors");
const bodyParser = require("body-parser");
const helmet = require("helmet")
const cookieParser = require('cookie-parser');
const PORT = 5000;
require("dotenv").config();



const AuthRoute = require("./src/routes/auth.route");
const BlogsRoute = require("./src/routes/blogs.route");
const RefreshRoute = require("./src/routes/refresh.route");
const CreditsRoute = require("./src/routes/credits.route");
const ThreadRoute = require("./src/Routes/thread.route");
const UserRoute = require("./src/Routes/user.route")

// Implements Protection Functions
const corsOptions = {
  origin: 'http://localhost:3000',
  methods: ['GET', 'POST', 'PUT', 'DELETE'], // Specify the allowed HTTP methods
  allowedHeaders: ['Authorization', 'Content-Type'],
  credentials: true // Correctly spelled
};

const allowBrowserOnly = (req, res, next) => {
  const userAgent = req.headers['user-agent'];
  if (!userAgent || !userAgent.includes('Mozilla/5.0')) {
    return res.status(403).json({
      msg: 'Forbidden - Only requests from browsers are allowed.'
    })
  }
  next();
};

const allowFromTrustedDomain = (req, res, next) => {
  const referer = req.headers.host;
  const Host = process.env.FRONTEND_HOST
  if (!referer || !referer.includes(Host)) {
    return res.status(403).json({
      msg: 'Forbidden - Requests must originate from your frontend website.'
    });
  }
  next();
};

// Using Important Middlewares

//httpServer.use(allowFromTrustedDomain); // uncomment if you still developing the server
//httpServer.use(allowBrowserOnly);       // uncomment if you still developing the server
httpServer.use(cors(corsOptions));
httpServer.use(bodyParser.json());
httpServer.use(express.json());
httpServer.use(helmet());
httpServer.use(cookieParser());

// Implementing Routes
httpServer.use("/auth", AuthRoute);
httpServer.use("/blog", BlogsRoute);
httpServer.use("/refresh", RefreshRoute);
httpServer.use("/credits", CreditsRoute)
httpServer.use("/thread", ThreadRoute)
httpServer.use("/user", UserRoute)

// Running The Server
httpServer.listen(PORT, () => {
  const url = process.env.BASE_URL + PORT
  console.log(`server is running on ${url}`);
});

// Hello world
httpServer.get("/", (req, res) => {
  const headers = req.headers
  console.log(headers);
  res.send({
    headers: headers
  });
});

