-- Some variables you can change

-- How often (in seconds) homes file saves
local save_delta = 10
-- How often (in seconds) player can teleport
-- Set it to 0 to disable
local cooldown = 0
-- Max distance player can teleport, otherwise he will see error messsage
-- Set it to 0 to disable
local max_distance = 0
----------------------------------



local homes_file = minetest.get_modpath('sethome3')..'/homes9'
local homepos = {}
local last_moved = {}

local function loadhomes()
    local input = io.open(homes_file, "r")
    while true do
        local x = input:read("*n")
        if x == nil then
            break
        end
        local y = input:read("*n")
        local z = input:read("*n")
        local name = input:read("*l")
        homepos[name:sub(2)] = {x = x, y = y, z = z}
    end
    io.close(input)
end

loadhomes()

local function get_time()
	return os.time()
end

local function distance(a, b)
	return math.sqrt(math.pow(a.x-b.x, 2) + math.pow(a.y-b.y, 2) + math.pow(a.z-b.z, 2))
end

local function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

local changed = false

minetest.register_on_chat_message(function(name, message)
    if message == '/sethome9' then
        local player = minetest.env:get_player_by_name(name)
        local pos = player:getpos()
        homepos[name] = pos
        minetest.chat_send_player(name, "Home 9 set!")
        changed = true
		return true
    elseif message == "/home9" then
        local player = minetest.env:get_player_by_name(name)
        if player == nil then
			-- just a check to prevent server death
			return false
		end
		if homepos[name] then
			local time = get_time()
            if cooldown ~= 0 and last_moved[name] ~= nil and time - last_moved[name] < cooldown then
				minetest.chat_send_player(name, "You can teleport only once in "..cooldown.." seconds. Wait another "..round(cooldown - (time - last_moved[name]), 3).." secs...")
				return true
			end
			local pos = player:getpos()
			local dst = distance(pos, homepos[name])
			if max_distance ~= 0 and distance(pos, homepos[name]) > max_distance then
				minetest.chat_send_player(name, "You are too far away from your home 9. You must be "..round(dst - max_distance, 3).." meters closer to teleport to your home 9.")
				return true
			end
			last_moved[name] = time
			player:setpos(homepos[name])
            minetest.chat_send_player(name, "Teleported to home 9!")
        else
            minetest.chat_send_player(name, "You don't have a home 9 now! Set it using /sethome9")
        end
        return true
    end
end)

local delta = 0
minetest.register_globalstep(function(dtime)
    delta = delta + dtime
    -- save it every <save_delta> seconds
    if delta > save_delta then
        delta = delta - save_delta
		if changed then
			local output = io.open(homes_file, "w")
			for i, v in pairs(homepos) do
				output:write(v.x.." "..v.y.." "..v.z.." "..i.."\n")
			end
			io.close(output)
		end
    end
end)








local homes_file = minetest.get_modpath('sethome3')..'/homes8'
local homepos = {}
local last_moved = {}

local function loadhomes()
    local input = io.open(homes_file, "r")
    while true do
        local x = input:read("*n")
        if x == nil then
            break
        end
        local y = input:read("*n")
        local z = input:read("*n")
        local name = input:read("*l")
        homepos[name:sub(2)] = {x = x, y = y, z = z}
    end
    io.close(input)
end

loadhomes()

local function get_time()
	return os.time()
end

local function distance(a, b)
	return math.sqrt(math.pow(a.x-b.x, 2) + math.pow(a.y-b.y, 2) + math.pow(a.z-b.z, 2))
end

local function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

local changed = false

minetest.register_on_chat_message(function(name, message)
    if message == '/sethome8' then
        local player = minetest.env:get_player_by_name(name)
        local pos = player:getpos()
        homepos[name] = pos
        minetest.chat_send_player(name, "Home 8 set!")
        changed = true
		return true
    elseif message == "/home8" then
        local player = minetest.env:get_player_by_name(name)
        if player == nil then
			-- just a check to prevent server death
			return false
		end
		if homepos[name] then
			local time = get_time()
            if cooldown ~= 0 and last_moved[name] ~= nil and time - last_moved[name] < cooldown then
				minetest.chat_send_player(name, "You can teleport only once in "..cooldown.." seconds. Wait another "..round(cooldown - (time - last_moved[name]), 3).." secs...")
				return true
			end
			local pos = player:getpos()
			local dst = distance(pos, homepos[name])
			if max_distance ~= 0 and distance(pos, homepos[name]) > max_distance then
				minetest.chat_send_player(name, "You are too far away from your home 8. You must be "..round(dst - max_distance, 3).." meters closer to teleport to your home 8.")
				return true
			end
			last_moved[name] = time
			player:setpos(homepos[name])
            minetest.chat_send_player(name, "Teleported to home 2!")
        else
            minetest.chat_send_player(name, "You don't have a home 8 now! Set it using /sethome8")
        end
        return true
    end
end)

local delta = 0
minetest.register_globalstep(function(dtime)
    delta = delta + dtime
    -- save it every <save_delta> seconds
    if delta > save_delta then
        delta = delta - save_delta
		if changed then
			local output = io.open(homes_file, "w")
			for i, v in pairs(homepos) do
				output:write(v.x.." "..v.y.." "..v.z.." "..i.."\n")
			end
			io.close(output)
		end
    end
end)








local homes_file = minetest.get_modpath('sethome3')..'/homes7'
local homepos = {}
local last_moved = {}

local function loadhomes()
    local input = io.open(homes_file, "r")
    while true do
        local x = input:read("*n")
        if x == nil then
            break
        end
        local y = input:read("*n")
        local z = input:read("*n")
        local name = input:read("*l")
        homepos[name:sub(2)] = {x = x, y = y, z = z}
    end
    io.close(input)
end

loadhomes()

local function get_time()
	return os.time()
end

local function distance(a, b)
	return math.sqrt(math.pow(a.x-b.x, 2) + math.pow(a.y-b.y, 2) + math.pow(a.z-b.z, 2))
end

local function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

local changed = false

minetest.register_on_chat_message(function(name, message)
    if message == '/sethome7' then
        local player = minetest.env:get_player_by_name(name)
        local pos = player:getpos()
        homepos[name] = pos
        minetest.chat_send_player(name, "Home 7 set!")
        changed = true
		return true
    elseif message == "/home7" then
        local player = minetest.env:get_player_by_name(name)
        if player == nil then
			-- just a check to prevent server death
			return false
		end
		if homepos[name] then
			local time = get_time()
            if cooldown ~= 0 and last_moved[name] ~= nil and time - last_moved[name] < cooldown then
				minetest.chat_send_player(name, "You can teleport only once in "..cooldown.." seconds. Wait another "..round(cooldown - (time - last_moved[name]), 3).." secs...")
				return true
			end
			local pos = player:getpos()
			local dst = distance(pos, homepos[name])
			if max_distance ~= 0 and distance(pos, homepos[name]) > max_distance then
				minetest.chat_send_player(name, "You are too far away from your home 7. You must be "..round(dst - max_distance, 3).." meters closer to teleport to your home 7.")
				return true
			end
			last_moved[name] = time
			player:setpos(homepos[name])
            minetest.chat_send_player(name, "Teleported to home 7!")
        else
            minetest.chat_send_player(name, "You don't have a home 7 now! Set it using /sethome7")
        end
        return true
    end
end)

local delta = 0
minetest.register_globalstep(function(dtime)
    delta = delta + dtime
    -- save it every <save_delta> seconds
    if delta > save_delta then
        delta = delta - save_delta
		if changed then
			local output = io.open(homes_file, "w")
			for i, v in pairs(homepos) do
				output:write(v.x.." "..v.y.." "..v.z.." "..i.."\n")
			end
			io.close(output)
		end
    end
end)








local homes_file = minetest.get_modpath('sethome3')..'/homes5'
local homepos = {}
local last_moved = {}

local function loadhomes()
    local input = io.open(homes_file, "r")
    while true do
        local x = input:read("*n")
        if x == nil then
            break
        end
        local y = input:read("*n")
        local z = input:read("*n")
        local name = input:read("*l")
        homepos[name:sub(2)] = {x = x, y = y, z = z}
    end
    io.close(input)
end

loadhomes()

local function get_time()
	return os.time()
end

local function distance(a, b)
	return math.sqrt(math.pow(a.x-b.x, 2) + math.pow(a.y-b.y, 2) + math.pow(a.z-b.z, 2))
end

local function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

local changed = false

minetest.register_on_chat_message(function(name, message)
    if message == '/sethome2' then
        local player = minetest.env:get_player_by_name(name)
        local pos = player:getpos()
        homepos[name] = pos
        minetest.chat_send_player(name, "Home 5 set!")
        changed = true
		return true
    elseif message == "/home5" then
        local player = minetest.env:get_player_by_name(name)
        if player == nil then
			-- just a check to prevent server death
			return false
		end
		if homepos[name] then
			local time = get_time()
            if cooldown ~= 0 and last_moved[name] ~= nil and time - last_moved[name] < cooldown then
				minetest.chat_send_player(name, "You can teleport only once in "..cooldown.." seconds. Wait another "..round(cooldown - (time - last_moved[name]), 3).." secs...")
				return true
			end
			local pos = player:getpos()
			local dst = distance(pos, homepos[name])
			if max_distance ~= 0 and distance(pos, homepos[name]) > max_distance then
				minetest.chat_send_player(name, "You are too far away from your home 5. You must be "..round(dst - max_distance, 3).." meters closer to teleport to your home 5.")
				return true
			end
			last_moved[name] = time
			player:setpos(homepos[name])
            minetest.chat_send_player(name, "Teleported to home 5!")
        else
            minetest.chat_send_player(name, "You don't have a home 5 now! Set it using /sethome5")
        end
        return true
    end
end)

local delta = 0
minetest.register_globalstep(function(dtime)
    delta = delta + dtime
    -- save it every <save_delta> seconds
    if delta > save_delta then
        delta = delta - save_delta
		if changed then
			local output = io.open(homes_file, "w")
			for i, v in pairs(homepos) do
				output:write(v.x.." "..v.y.." "..v.z.." "..i.."\n")
			end
			io.close(output)
		end
    end
end)








local homes_file = minetest.get_modpath('sethome3')..'/homes4'
local homepos = {}
local last_moved = {}

local function loadhomes()
    local input = io.open(homes_file, "r")
    while true do
        local x = input:read("*n")
        if x == nil then
            break
        end
        local y = input:read("*n")
        local z = input:read("*n")
        local name = input:read("*l")
        homepos[name:sub(2)] = {x = x, y = y, z = z}
    end
    io.close(input)
end

loadhomes()

local function get_time()
	return os.time()
end

local function distance(a, b)
	return math.sqrt(math.pow(a.x-b.x, 2) + math.pow(a.y-b.y, 2) + math.pow(a.z-b.z, 2))
end

local function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

local changed = false

minetest.register_on_chat_message(function(name, message)
    if message == '/sethome4' then
        local player = minetest.env:get_player_by_name(name)
        local pos = player:getpos()
        homepos[name] = pos
        minetest.chat_send_player(name, "Home 4 set!")
        changed = true
		return true
    elseif message == "/home4" then
        local player = minetest.env:get_player_by_name(name)
        if player == nil then
			-- just a check to prevent server death
			return false
		end
		if homepos[name] then
			local time = get_time()
            if cooldown ~= 0 and last_moved[name] ~= nil and time - last_moved[name] < cooldown then
				minetest.chat_send_player(name, "You can teleport only once in "..cooldown.." seconds. Wait another "..round(cooldown - (time - last_moved[name]), 3).." secs...")
				return true
			end
			local pos = player:getpos()
			local dst = distance(pos, homepos[name])
			if max_distance ~= 0 and distance(pos, homepos[name]) > max_distance then
				minetest.chat_send_player(name, "You are too far away from your home 4. You must be "..round(dst - max_distance, 3).." meters closer to teleport to your home 4.")
				return true
			end
			last_moved[name] = time
			player:setpos(homepos[name])
            minetest.chat_send_player(name, "Teleported to home 4!")
        else
            minetest.chat_send_player(name, "You don't have a home 4 now! Set it using /sethome4")
        end
        return true
    end
end)

local delta = 0
minetest.register_globalstep(function(dtime)
    delta = delta + dtime
    -- save it every <save_delta> seconds
    if delta > save_delta then
        delta = delta - save_delta
		if changed then
			local output = io.open(homes_file, "w")
			for i, v in pairs(homepos) do
				output:write(v.x.." "..v.y.." "..v.z.." "..i.."\n")
			end
			io.close(output)
		end
    end
end)








local homes_file = minetest.get_modpath('sethome3')..'/homes6'
local homepos = {}
local last_moved = {}

local function loadhomes()
    local input = io.open(homes_file, "r")
    while true do
        local x = input:read("*n")
        if x == nil then
            break
        end
        local y = input:read("*n")
        local z = input:read("*n")
        local name = input:read("*l")
        homepos[name:sub(2)] = {x = x, y = y, z = z}
    end
    io.close(input)
end

loadhomes()

local function get_time()
	return os.time()
end

local function distance(a, b)
	return math.sqrt(math.pow(a.x-b.x, 2) + math.pow(a.y-b.y, 2) + math.pow(a.z-b.z, 2))
end

local function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

local changed = false

minetest.register_on_chat_message(function(name, message)
    if message == '/sethome6' then
        local player = minetest.env:get_player_by_name(name)
        local pos = player:getpos()
        homepos[name] = pos
        minetest.chat_send_player(name, "Home 6 set!")
        changed = true
		return true
    elseif message == "/home6" then
        local player = minetest.env:get_player_by_name(name)
        if player == nil then
			-- just a check to prevent server death
			return false
		end
		if homepos[name] then
			local time = get_time()
            if cooldown ~= 0 and last_moved[name] ~= nil and time - last_moved[name] < cooldown then
				minetest.chat_send_player(name, "You can teleport only once in "..cooldown.." seconds. Wait another "..round(cooldown - (time - last_moved[name]), 3).." secs...")
				return true
			end
			local pos = player:getpos()
			local dst = distance(pos, homepos[name])
			if max_distance ~= 0 and distance(pos, homepos[name]) > max_distance then
				minetest.chat_send_player(name, "You are too far away from your home 6. You must be "..round(dst - max_distance, 3).." meters closer to teleport to your home 6.")
				return true
			end
			last_moved[name] = time
			player:setpos(homepos[name])
            minetest.chat_send_player(name, "Teleported to home 6!")
        else
            minetest.chat_send_player(name, "You don't have a home 6 now! Set it using /sethome6")
        end
        return true
    end
end)

local delta = 0
minetest.register_globalstep(function(dtime)
    delta = delta + dtime
    -- save it every <save_delta> seconds
    if delta > save_delta then
        delta = delta - save_delta
		if changed then
			local output = io.open(homes_file, "w")
			for i, v in pairs(homepos) do
				output:write(v.x.." "..v.y.." "..v.z.." "..i.."\n")
			end
			io.close(output)
		end
    end
end)








local homes_file = minetest.get_modpath('sethome3')..'/homes3'
local homepos = {}
local last_moved = {}

local function loadhomes()
    local input = io.open(homes_file, "r")
    while true do
        local x = input:read("*n")
        if x == nil then
            break
        end
        local y = input:read("*n")
        local z = input:read("*n")
        local name = input:read("*l")
        homepos[name:sub(2)] = {x = x, y = y, z = z}
    end
    io.close(input)
end

loadhomes()

local function get_time()
	return os.time()
end

local function distance(a, b)
	return math.sqrt(math.pow(a.x-b.x, 2) + math.pow(a.y-b.y, 2) + math.pow(a.z-b.z, 2))
end

local function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

local changed = false

minetest.register_on_chat_message(function(name, message)
    if message == '/sethome3' then
        local player = minetest.env:get_player_by_name(name)
        local pos = player:getpos()
        homepos[name] = pos
        minetest.chat_send_player(name, "Home 3 set!")
        changed = true
		return true
    elseif message == "/home3" then
        local player = minetest.env:get_player_by_name(name)
        if player == nil then
			-- just a check to prevent server death
			return false
		end
		if homepos[name] then
			local time = get_time()
            if cooldown ~= 0 and last_moved[name] ~= nil and time - last_moved[name] < cooldown then
				minetest.chat_send_player(name, "You can teleport only once in "..cooldown.." seconds. Wait another "..round(cooldown - (time - last_moved[name]), 3).." secs...")
				return true
			end
			local pos = player:getpos()
			local dst = distance(pos, homepos[name])
			if max_distance ~= 0 and distance(pos, homepos[name]) > max_distance then
				minetest.chat_send_player(name, "You are too far away from your home 3. You must be "..round(dst - max_distance, 3).." meters closer to teleport to your home 3.")
				return true
			end
			last_moved[name] = time
			player:setpos(homepos[name])
            minetest.chat_send_player(name, "Teleported to home 2!")
        else
            minetest.chat_send_player(name, "You don't have a home 2 now! Set it using /sethome3")
        end
        return true
    end
end)

local delta = 0
minetest.register_globalstep(function(dtime)
    delta = delta + dtime
    -- save it every <save_delta> seconds
    if delta > save_delta then
        delta = delta - save_delta
		if changed then
			local output = io.open(homes_file, "w")
			for i, v in pairs(homepos) do
				output:write(v.x.." "..v.y.." "..v.z.." "..i.."\n")
			end
			io.close(output)
		end
    end
end)








