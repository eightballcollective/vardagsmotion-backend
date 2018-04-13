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
