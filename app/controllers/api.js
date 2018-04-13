let db = require('./db')
let express = require('express')
let router = express.Router()

router.use('/test', (req, res) => {
  db.test().then(data => {
    res.send(data)
  })
})

module.exports = router
