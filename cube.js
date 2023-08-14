const promBundle = require("express-prom-bundle");

const express = require("express");
const app = require("express")();
const metricsApp = express();
const config = {
   METRICS_PORT: process.env.METRICS_PORT || 9090,
}
const metricsMiddleware = promBundle({
  buckets: [0.1, 5, 15, 50, 100, 200, 300, 400, 500],
  includeMethod: true,
  includePath: true,
  autoregister: false,
  metricsPath: '/metrics',
  metricsApp: metricsApp,
  promClient: {
    collectDefaultMetrics: {},
  },
})

module.exports = {
  initApp: function (app) {
    app.use(metricsMiddleware)
    metricsApp.use(metricsMiddleware.metricsMiddleware)
    metricsApp.listen(config.METRICS_PORT, () => {
      console.log('Metrics listening on port', config.METRICS_PORT)
    })
  },
# This is just example using exporting NodeJs metrics by metricsMiddleware #
}