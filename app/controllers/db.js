var config = require('../knexfile')
var knex = require('knex')(config)

module.exports.test = function() {
  return knex('votering').select('*').limit(1)
}

module.exports.getPartyVotes = function(req) {
	//req ska skicka med hangar_id
  return getAllVotes(4781751)
}

module.exports.getDecisions = function(req) {
  return getDecisions()
}

getDecisions = function() {
  const data = knex('testdata').select('hangar_id as id', 'titel as title', 'typrubrik as subtitle', 'datum as date', 'dokument_url_html as href','sammanfattning as summary')
  return data
}

getAllVotes = function(hangarid) {
  return knex('votering').select('parti',
    knex.raw('SUM(case when rost="Ja" then 1 else 0 end) as yes'),
    knex.raw('SUM(case when rost="Nej" then 1 else 0 end) as no'),
    knex.raw('SUM(case when rost="Frånvarande" then 1 else 0 end) as absent'),
    knex.raw('SUM(case when rost="Avstår" then 1 else 0 end) as pass')).where('hangar_id', hangarid).groupBy('parti')
}