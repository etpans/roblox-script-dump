hookfunction = hookfunc(game.HttpGet, function(a, link, c)
	print(a, link, c)
	return hookfunction(a, link, c)
end)