local safe_reports = 0
-- read the input first
local file = io.open("inputs/day2.txt", "r")
for line in file:lines() do
	local temp_num_jail = {}
	for number in string.gmatch(line, "%d+") do
		table.insert(temp_num_jail, tonumber(number))
	end

	--local cardinality = 0
	--local safe_counter = 0
	--if temp_num_jail[2] - temp_num_jail[1] > 0 and temp_num_jail[2] - temp_num_jail[1] < 4 then
	--	cardinality = 1
	--elseif temp_num_jail[2] - temp_num_jail[1] < 0 and temp_num_jail[2] - temp_num_jail[1] > -4 then
	--	cardinality = -1
	--else
	--	goto continue
	--end

	--local current_number = 0
	--local behind_number = 0
	--for i = 2,#temp_num_jail do
	--	current_number = temp_num_jail[i]
	--	behind_number = temp_num_jail[i-1]
	--	local difference = current_number - behind_number
	--	if difference == 0 or cardinality == 0 then
	--		goto continue
	--	elseif cardinality == -1 and (difference > -1 or difference < -3) then
	--		goto continue
	--	elseif cardinality == 1 and (difference < 1 or difference > 3) then
	--		goto continue
	--	end
	--end
	--safe_reports = safe_reports + 1

	--::continue::
	local cardinality = 0
	local safe_counter = 0
	if temp_num_jail[2] - temp_num_jail[1] > 0 and temp_num_jail[2] - temp_num_jail[1] < 4 then
		cardinality = 1
	elseif temp_num_jail[2] = temp_num_jail[1] < 0 and temp_num_jail[2] - temp_num_jail[1] > -4 then
		cardinality = -1
	else
		goto continue
	end

	local current_number = 0
	local behind_number = 0
	local differences = {}
	local level_safe = {}
	for i = 2,#temp_num_jail do
		current_number = temp_num_jail[i]
		behind_number = temp_num_jail[i-1]
		local difference = current_number - behind_number
		table.insert(differences, difference)
		if difference == 0 then
			table.insert(level_safe, false)
		elseif cardinality == -1 and (difference > -1 or difference < -3) then
			table.insert(level_safe, false)
		elseif cardinality == 1 and (difference < 1 or difference > 3) then
			table.insert(level_safe, false)
		else
			table.insert(level_safe, true)
		end
	end
end

print(safe_reports)
