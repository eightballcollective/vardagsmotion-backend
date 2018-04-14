var config = require('../knexfile')
var knex = require('knex')(config)

module.exports.test = function() {
  return knex('votering').select('*').limit(1)
}

module.exports.getPartyVotes = function(req) {
  return getAllVotes(req.query.id)
}

module.exports.getDecisions = function(req) {
  return getDecisions()
}

getDecisions = function() {
  const data = knex('taggar')
    .join('dokument', 'taggar.hangar_id', 'dokument.hangar_id')
    .select('dokument.hangar_id as id', 'dokument.titel as title', 'dokument.typrubrik as subtitle', 'dokument.datum as date', 'dokument.dokument_url_html as href', 'taggar.tag as tags',)
  return data
}

getAllVotes = function(hangarid) {
  return knex('votering').select('parti',
    knex.raw('SUM(case when rost="Ja" then 1 else 0 end) as yes'),
    knex.raw('SUM(case when rost="Nej" then 1 else 0 end) as no'),
    knex.raw('SUM(case when rost="Frånvarande" then 1 else 0 end) as absent'),
    knex.raw('SUM(case when rost="Avstår" then 1 else 0 end) as pass')).where('hangar_id', hangarid).groupBy('parti')
}
