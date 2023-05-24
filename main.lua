local q = require("question")
local is_valid = require("is_valid")
local parser = require("parser")
local c = require("colors")

local yellow = c.yellow
local green = c.green
local red = c.red
local cyan = c.cyan

local gameover = false
local range, rounds
local scores = 30
local correct = 0
local incorrect = 0
local operation
local colors

local function logo()
	print("\n\t" .. cyan("Math Solver"))
	print("\t" .. cyan("-----------") .. "\n")
end

local function get_answer(oper, x, y)
	if oper == "+" then
		return x + y
	elseif oper == "-" then
		return x - y
	elseif oper == "*" then
		return x * y
	elseif oper == "/" then
		return x / y
	end
end

local function status_bar(rounds, scores, correct, incorrect, oper)
	correct = correct == 0 and correct or green(correct)
	incorrect = incorrect == 0 and incorrect or red(incorrect)
	scores = scores < 15 and red(scores) or yellow(scores)

	print(
		cyan("\n\t\t\trounds: ")
			.. yellow(rounds)
			.. cyan("\t\t\tscores: ")
			.. scores
			.. cyan("\t\t\tcorrect: ")
			.. correct
			.. cyan("\t\t\tincorrect: ")
			.. incorrect
			.. cyan("\t\t\tOperations: ")
			.. yellow(oper)
	)

	-- TODO: Make this responsive
	print(cyan(string.rep("-", 190, "")))
end

-- Logo
os.execute("clear")
logo()

-- Questions
range = q.ask({
	main = "\tPlease, input " .. yellow("max range") .. " for numbers: ",
	error = "\n\tThe value for range must be a number: ",
}, is_valid.range, tonumber)

rounds = q.ask({
	main = "\n\tHow many " .. yellow("rounds") .. " do you want to play: ",
	error = "\n\tThe value for rounds must be a number: ",
}, is_valid.rounds, tonumber)

operation = q.ask({
	main = "\n\t"
		.. yellow("Type")
		.. " of arithmetic operation ("
		.. yellow("+")
		.. ", "
		.. yellow("-")
		.. ", "
		.. yellow("/")
		.. ", "
		.. yellow("*")
		.. "): ",
	error = "\n\tPlease, try again (" .. yellow("+") .. ", " .. yellow("-") .. ", " .. yellow("/") .. ", " .. yellow(
		"*"
	) .. "): ",
}, is_valid.operation)

colors = q.ask({
	main = "\n\tColorscheme (" .. yellow("y") .. "\\" .. yellow("n") .. "): ",
	error = "\n\tAnswer should be yes or no (" .. yellow("y") .. "\\" .. yellow("n") .. "): ",
}, is_valid.colors, parser.to_bool)

if not colors then
	cyan = c.white
	red = c.white
	yellow = c.white
	green = c.white
end

print("\n\t" .. green("Have a nice game!"))
os.execute("sleep " .. 1)

-- Game Loop
while not gameover do
	os.execute("clear")
	status_bar(rounds, scores, correct, incorrect, operation)

	local x, y = math.random(range), math.random(range)
	local true_answer = get_answer(operation, x, y)

	print("\n\t" .. cyan("Solve: "))
	io.write("\t\t" .. yellow(x) .. " " .. operation .. " " .. yellow(y) .. " = " .. c.YELLOW)

	local answer = tonumber(io.read())

	if type(answer) ~= "number" then
		while type(answer) ~= "number" do
			os.execute("clear")
			status_bar(rounds, scores, correct, incorrect, operation)
			print("The answer must be a number")
			io.write("Solve: " .. x .. operation .. y .. " = ")

			answer = tonumber(io.read())
		end
	end

	if answer == true_answer then
		scores = scores + 5
		correct = correct + 1
	else
		scores = scores - 10
		incorrect = incorrect + 1
	end

	if rounds <= 1 then
		gameover = true
	end

	rounds = rounds - 1
end

os.execute("clear")
status_bar(rounds, scores, correct, incorrect, operation)

-- TODO: Create decent gameover message output
if correct > incorrect then
	print("\n\tGood Job! (ﾉ◕ヮ◕)ﾉ")
else
	print("\n\tYou lost, but...")
	print("\tDon't worry.")
	print("\tThere is much to strive for (=^ ◡ ^=)")
	print("\tYou can try again!")
end
