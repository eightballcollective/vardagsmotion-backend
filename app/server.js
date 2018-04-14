var express = require('express')
var logger = require('morgan')
var compression = require('compression')
var session = require('express-session')
var bodyParser = require('body-parser')
var dotenv = require('dotenv')

// Load environment variables from .env file
dotenv.load()
var app = express()

var API = require('./controllers/api')

app.use(function(req, res, next) {
  const allowedOrigins = [
    process.env.FRONTEND_ORIGIN || 'http://localhost:3000',
  ]
  const origin = allowedOrigins.find(origin => origin == req.headers.origin)
  if (origin) {
    res.header('Access-Control-Allow-Origin', origin)
    res.header('Access-Control-Allow-Credentials', 'true')
    res.header(
      'Access-Control-Allow-Headers',
      'Origin, X-Requested-With, Content-Type, Accept'
    )
  }
  // Allow preflight
  if (req.method === 'OPTIONS')
    return res.end()
  next()
})
app.set('port', process.env.PORT || 3000)
app.use(compression())
app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(session({ secret: process.env.SESSION_SECRET, resave: true, saveUninitialized: true }))

app.get('/', (req, res) => {
  res.send('Server up and running!')
})
app.use('/', API)

// Production error handler
if (app.get('env') === 'production') {
  app.use(function(err, req, res) {
    console.error(err.stack)
    res.sendStatus(err.status || 500)
  })
}

app.listen(app.get('port'), function() {
  console.log('Express server listening on port ' + app.get('port'))
})

module.exports = app
