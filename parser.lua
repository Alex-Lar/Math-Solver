local p = {}

function p.to_bool(answer)
	if answer == "y" or answer == "yes" then
		return true
	end

	return false
end

return p
