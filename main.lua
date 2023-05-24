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

local function status_bar(rounds, scores, correct, incorrect, operation)
	local inc = incorrect == 0 and incorrect or red(incorrect)
	local corr = correct == 0 and correct or green(correct)
	scores = scores < 15 and red(scores) or yellow(scores)

	print(
		cyan("\n\t\t\trounds: ")
			.. yellow(rounds)
			.. cyan("\t\t\tscores: ")
			.. scores
			.. cyan("\t\t\tcorrect: ")
			.. corr
			.. cyan("\t\t\tincorrect: ")
			.. inc
			.. cyan("\t\t\tOperations: ")
			.. yellow(operation)
	)

	-- TODO: Make this responsive
	print(cyan(string.rep("-", 190, "")))
end

os.execute("clear")
logo()

io.write("\tPlease, input " .. yellow("max range") .. " for numbers: ")
range = tonumber(io.read())

if type(range) ~= "number" then
	while type(range) ~= "number" do
		io.write("\n\tThe value for range must be a number: ")
		range = tonumber(io.read())
	end
end

-- os.execute("clear")
-- logo()

io.write("\n\tHow many " .. yellow("rounds") .. " do you want to play: ")
rounds = tonumber(io.read())

if type(rounds) ~= "number" then
	while type(rounds) ~= "number" do
		io.write("\n\tThe value for rounds must be a number: ")
		rounds = tonumber(io.read())
	end
end

-- os.execute("clear")
-- logo()

io.write(
	"\n\t"
		.. yellow("Type")
		.. " of arithmetic operation ("
		.. yellow("+")
		.. ", "
		.. yellow("-")
		.. ", "
		.. yellow("/")
		.. ", "
		.. yellow("*")
		.. "): "
)
operation = io.read()

if operation ~= "+" and operation ~= "-" and operation ~= "*" and operation ~= "/" then
	while operation ~= "+" and operation ~= "-" and operation ~= "*" and operation ~= "/" do
		io.write("\tPlease, try again (+, -, /, *): ")
		operation = io.read()
	end
end

io.write("\n\tColorscheme (y\\n): ")
local colors = string.lower(io.read())

if colors ~= "y" and colors ~= "n" and colors ~= "yes" and colors ~= "no" then
	while colors ~= "y" and colors ~= "n" and colors ~= "yes" and colors ~= "no" do
		io.write("\n\tAnswer should be yes or no (y\n): ")
		colors = string.lower(io.read())
	end
end

print("\n\t" .. green("Have a nice game!"))

if colors == "no" or colors == "n" then
	cyan = c.white
	red = c.white
	yellow = c.white
	green = c.white
end

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
