fs = require "fs"
jsdom = require "jsdom"

jquery = fs.readFileSync "public/jquery.js"



# jQuery -> [{title: String, src: String}]
each = ($) ->
	all = []
	list = $ ".list-lbc"
	list.find("a").each ->
		all.push searchA $ @
	all



# jquery -> {title: String, src: String}
searchA = (a) ->
	title: a.attr "title"
	href: a.attr "href"


# String x (Error x [{title: String, src: String}])
findAll = (page, callback) ->
	jsdom.env
		html: page,
		src: [jquery]
		done: (err, {$}) ->
			if err then throw err
			callback null, each $



module.exports = findAll
