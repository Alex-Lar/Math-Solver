C = {
	RESET = "\27[0m",
	BLACK = "\27[30m",
	RED = "\27[31m",
	GREEN = "\27[32m",
	YELLOW = "\27[33m",
	BLUE = "\27[34m",
	PURPLE = "\27[35m",
	CYAN = "\27[36m",
	WHITE = "\27[37m",
	CLEAR = "\27[H\27[2J",
	HBLACK = "\27[40m",
	HRED = "\27[41m",
	HGREEN = "\27[42m",
	HYELLOW = "\27[43m",
	HBLUE = "\27[44m",
	HPURPLE = "\27[45m",
	HCYAN = "\27[46m",
	HWHITE = "\27[47m",
}

-- Text Colors

C.white = function(string)
	return C.WHITE .. string .. C.RESET
end

C.cyan = function(string)
	return C.CYAN .. string .. C.RESET
end

C.purple = function(string)
	return C.PURPLE .. string .. C.RESET
end

C.red = function(string)
	return C.RED .. string .. C.RESET
end

C.black = function(string)
	return C.BLACK .. string .. C.RESET
end

C.green = function(string)
	return C.GREEN .. string .. C.RESET
end

C.yellow = function(string)
	return C.YELLOW .. string .. C.RESET
end

C.blue = function(string)
	return C.BLUE .. string .. C.RESET
end

-- Background Colors

C.bg_red = function(string)
	return C.HRED .. string .. C.RESET
end

C.bg_white = function(string)
	return C.HWHITE .. string .. C.RESET
end

C.bg_cyan = function(string)
	return C.HCYAN .. string .. C.RESET
end

C.bg_purple = function(string)
	return C.HPURPLE .. string .. C.RESET
end

C.bg_black = function(string)
	return C.HBLACK .. string .. C.RESET
end

C.bg_green = function(string)
	return C.HGREEN .. string .. C.RESET
end

C.bg_yellow = function(string)
	return C.HYELLOW .. string .. C.RESET
end

C.bg_blue = function(string)
	return C.HBLUE .. string .. C.RESET
end

return C
