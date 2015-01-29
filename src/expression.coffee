###

http://en.wikipedia.org/wiki/Order_of_operations

	A || B && C ≡ A || (B && C)


Valid queries

	a
	a_OR_b
	a_AND_b
	a_OR_b_AND_c

Operators

	AND & && 'space'
	OR | ||
###


{flatten, map} = require "lodash"


# [String] ->
makeTree = (tokens) ->


module.exports =

	# String ->
	parse: (query) ->
		query.split("_").join("+")
