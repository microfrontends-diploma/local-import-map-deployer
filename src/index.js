const express = require("express");
const cors = require("cors");
const { createProxyMiddleware } = require("http-proxy-middleware");

/**
 * Simple proxy-server for accessing import-map-deployer within browser
 * Adds CORS to response headers
 */
const PORT = 5000;
const proxyOptions = {
  target: "http://localhost:4999"
}

const proxyMiddleware = createProxyMiddleware(proxyOptions);
const app = express();

app.use(cors());
app.use("/*", proxyMiddleware);

app.listen(PORT);
