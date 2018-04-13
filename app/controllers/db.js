var config = require('../knexfile')
var knex = require('knex')(config)

module.exports.test = function() {
  return knex('votering').select('*').limit(1)
}
