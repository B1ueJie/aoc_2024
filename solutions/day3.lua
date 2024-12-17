local file = io.open("inputs/day3.txt", "r")

local mult_total = 0
--for line in file:lines() do
--	local temp_jail = ""
--	for multiply in string.gmatch(line, "mul%(%d%d?%d?,%d%d?%d?%)") do
--		temp_jail = multiply
--		local jail = {}
--		for number in string.gmatch(temp_jail, "%d+") do
--			table.insert(jail, tonumber(number))
--		end
--		mult_total = mult_total + (jail[2] * jail[1])
--	end
--end

for line in file:lines() do
	local temp_jail = ""
	for multiply in string.gmatch(line, "mul%(%d%d?%d?,%d%d?%d?%)") do
		temp_jail = multiply
		local jail = {}
		for number in string.gmatch(temp_jail, "%d+") do
			table.insert(jail, tonumber(number))
		end
		mult_total = mult_total + (jail[2] * jail[1])
	end
end

print(mult_total)
