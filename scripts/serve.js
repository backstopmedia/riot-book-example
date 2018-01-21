const express = require('express')
const webpack = require('webpack')
const webpackDevMiddleware = require('webpack-dev-middleware')
const webpackHotMiddleware = require('webpack-hot-middleware')
const config = require('../webpack.config')

const compiler = webpack(config)
const app = express()

const devMiddleware = webpackDevMiddleware(compiler, {
  publicPath: config.output.publicPath,
  historyApiFallback: true,
})

app.use(webpackHotMiddleware(compiler))
app.use(devMiddleware)

/* Hardcoded mock data for deployments */
app.get('/api/deployments', function(req, res) {
  res.json([
    { service: 'Media', minutes: 10, success: true },
    { service: 'Users', minutes: 1, success: true },
    { service: 'Admin Portal', minutes: 5, success: false },
    { service: 'Website', minutes: 0, success: true },
  ])
})

app.get('*', function(req, res) {
  const htmlBuffer = devMiddleware.fileSystem.readFileSync(`${config.output.path}/index.html`)
  res.send(htmlBuffer.toString())
})

app.listen(8080, '0.0.0.0')
