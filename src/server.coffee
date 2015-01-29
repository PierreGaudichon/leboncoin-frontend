express = require "express"

template = require "./template"
fetch = require "./fetch"

app = express()





app.get "/", (req, res) ->
	template.page {items: []}, (err, html) ->
		res.send html


app.get "/:query", (req, res) ->
	fetch req.params.query, (err, all) ->
		template.page {items: all}, (err, html) ->
			res.send html


app.listen 1337
