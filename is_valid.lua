local is_valid = {}

function is_valid.range(answer)
	local ans = tonumber(answer)

	if type(ans) ~= "number" then
		return false
	end

	return true
end

function is_valid.rounds(answer)
	local ans = tonumber(answer)

	if type(ans) ~= "number" then
		return false
	end

	return true
end

function is_valid.operation(answer)
	if answer ~= "+" and answer ~= "-" and answer ~= "*" and answer ~= "/" then
		return false
	end

	return true
end

function is_valid.colors(answer)
	local lower_answer = string.lower(answer)

	if lower_answer ~= "y" and lower_answer ~= "n" and lower_answer ~= "yes" and lower_answer ~= "no" then
		return false
	end

	return true
end

return is_valid
