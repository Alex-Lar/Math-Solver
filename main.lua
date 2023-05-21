local function logo()
	print("\n\tArithmetic Gym")
	print("\t--------------\n")
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
	print(
		"\n\t\t\trounds: "
			.. rounds
			.. "\t\t\tscores: "
			.. scores
			.. "\t\t\tcorrect: "
			.. correct
			.. "\t\t\tincorrect: "
			.. incorrect
			.. "\t\t\tOperations: "
			.. operation
	)

	print(string.rep("-", 190, ""))
end

local gameover = false
local range, rounds
local scores = 50
local correct = 0
local incorrect = 0
local operation

os.execute("clear")
logo()

io.write("\tPlease, input max range for numbers: ")
range = tonumber(io.read())

if type(range) ~= "number" then
	while type(range) ~= "number" do
		io.write("\tThe value for range must be a number: ")
		range = tonumber(io.read())
	end
end

os.execute("clear")
logo()

io.write("\tHow many rounds do you want to play: ")
rounds = tonumber(io.read())

if type(rounds) ~= "number" then
	while type(rounds) ~= "number" do
		io.write("\tThe value for rounds must be a number: ")
		rounds = tonumber(io.read())
	end
end

os.execute("clear")
logo()

io.write("\tType of arithmetic operation (+, -, /, *): ")
operation = io.read()

if operation ~= "+" and operation ~= "-" and operation ~= "*" and operation ~= "/" then
	while operation ~= "+" and operation ~= "-" and operation ~= "*" and operation ~= "/" do
		io.write("Please, try again (+, -, /, *): ")
		operation = io.read()
	end
end

print("\n\tHave a nice game!")
os.execute("sleep " .. tonumber(1))

-- Game Loop
while not gameover do
	os.execute("clear")
	status_bar(rounds, scores, correct, incorrect, operation)

	local x, y = math.random(range), math.random(range)
	local true_answer = get_answer(operation, x, y)

	print("\n\tSolve: ")
	io.write("\t\t" .. x .. " " .. operation .. " " .. y .. " = ")

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
		scores = scores + 10
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
	print("\n\tGood Job! My boyyyyyy!")
else
	print("\n\tYou lost, but...")
	print("\tDon't worry.")
	print("\tThere is much to strive for (=^ ◡ ^=)")
	print("\tYou can try again!")
end
