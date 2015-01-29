request = require "request"

extract = require "./extract"
{parse} = require "./expression"


lbcPath = (q) ->
	q = parse q
	"http://www.leboncoin.fr/annonces/offres/bretagne/?q=#{q}"


cache = {}




module.exports = (query, callback) ->
	if cache[query]?
		callback null, cache[query]

	else
		request lbcPath(query), (err, res, body) ->
			if err
				callback err, null
			else
				extract body, (err, all) ->
					cache[query] = all
					callback err, all
