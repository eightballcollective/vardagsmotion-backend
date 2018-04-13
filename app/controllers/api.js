let db = require('./db')
let express = require('express')
let router = express.Router()

router.use('/test', (req, res) => {
  res.send('test')
})

module.exports = router
