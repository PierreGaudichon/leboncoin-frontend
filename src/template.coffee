fs = require "fs"
Kup = require "kup"
{tidy} = require "htmltidy"
{render, parse} = require "mustache"



template = fs.readFileSync "public/index.html", {encoding: "utf8"}
parse template



module.exports =

	# Hash x (Error x String)
	page: (d, callback) ->
		callback null, render template, d

