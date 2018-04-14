let db = require('./db')
let express = require('express')
let router = express.Router()

router.get('/test', (req, res) => {
  db.test().then(data => {
    res.send(data)
  })
})

router.get('/decisions', (req, res) => {
  db.getDecisions().then(data => {
  	res.send(data);
  })
})

router.get('/partyVotes', (req, res) => {
  db.getPartyVotes(req).then(data => {
    res.send(data);
  })
})

module.exports = router
