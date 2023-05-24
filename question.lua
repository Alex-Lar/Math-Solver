local q = {}

function q.ask(questions, is_valid, parse)
	io.write(questions.main)
	local answer = io.read()

	if not is_valid(answer) then
		while not is_valid(answer) do
			io.write(questions.error)
			answer = io.read()
		end
	end

	if type(parse) == "function" then
		return parse(answer)
	end

	return answer
end

return q
