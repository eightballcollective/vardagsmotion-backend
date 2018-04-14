let db = require('./db')
let express = require('express')
let router = express.Router()

router.get('/test', (req, res) => {
  db.test().then(data => {
    res.send(data)
  })
})

router.get('/motions', (req, res) => {
  const motions = require('../resources/data')
  res.send(motions)
})

module.exports = router
