local first_list = {}
local second_list = {}

-- read the input first
local file = io.open("inputs/day1.txt", "r")
for line in file:lines() do
	local temp_num_jail = {}
	for number in string.gmatch(line, "%d+") do
		table.insert(temp_num_jail, tonumber(number))
	end
	table.insert(first_list, temp_num_jail[1])
	table.insert(second_list, temp_num_jail[2])
end

-- sort the list of numbers
table.sort(first_list)
table.sort(second_list)

-- calculate the total difference
local sum = 0
for i = 1, #first_list do
	sum = sum + math.abs(first_list[i] - second_list[i])
end

-- find the similarity score
local encountered_list = {} -- key is number on the left, value is encountered on the right
for i,number in pairs(first_list) do
	encountered_list[number] = 0
end
for i,number in pairs(second_list) do
	if encountered_list[number] ~= nil then
		encountered_list[number] = encountered_list[number] + 1
	end
end

local similarity_score = 0
for number,encountered in pairs(encountered_list) do
	similarity_score = similarity_score + (number * encountered)
end

print(sum)
print(similarity_score)
