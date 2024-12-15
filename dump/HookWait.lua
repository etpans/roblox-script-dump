local A
A = hookfunc(wait, function(a)
	a = nil
	return A(a)
end)