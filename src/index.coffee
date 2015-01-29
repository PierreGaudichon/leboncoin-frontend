request = require "request"
fs = require "fs"
jsdom = require "jsdom"

extract = require "./extract"
template = require "./template"


###
lbc = fs.readFileSync "log/body.html"
###


stringify = (d) ->
	JSON.stringify d, null, "\t"







###
extract lbc, (all) ->
	template.page all, (err, html) ->
		fs.writeFile "log/response.html", html
###



###
request path, (err, res, body) ->
	if err then throw err

	res.body = "deleted"
	fs.writeFile "log/request.json", stringify(res)
	fs.writeFile "log/body.html", body

	jsdom.env body, [jquery], (err, {$}) ->
		if err then throw err


		$(".list-lbc").children().each (a) ->
			console.log $(a).attr "title"
###



###
request "http://code.jquery.com/jquery.js", (err, res, body) ->
	fs.writeFile "log/jquery.js", body
###
