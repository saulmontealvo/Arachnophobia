local Admins = {
	1567499171, -- Gamerboy72008
}

local Funny = {
	1567499171, -- Me
	293992320, -- John
	494683005, -- Friend
	1568153288, -- Cai
}

local prefix = "!"
local funPrefix = ";"

local commands = require(game.ServerScriptService.Server.Common.Commands)
local FunnyCommand = require(game.ServerScriptService.Server.Common.FunCommands)

local function isAdmin(player)
	for _, v in pairs(Admins) do
		if v == player.UserId then
			return true
		end
	end

	return false
end
local function isFunny(player)
	for _, v in pairs(Funny) do
		if v == player.UserId then
			return true
		end
	end

	return false
end

function chat(player)
	player.Chatted:Connect(function(msg)
		if isAdmin(player) then
			msg = string.lower(msg)
			local splitString = msg:split(" ")
			local slashcommand = splitString[1] -- /tp
			local cmd = slashcommand:split(prefix) -- ("/",)
			local cmdName = cmd[2]

			if commands[cmdName] then
				local arguments = {} -- added player in tabel

				for i = 2, #splitString, 1 do
					table.insert(arguments, splitString[i])
				end
				commands[cmdName](player, arguments)
				if not game:GetService("RunService"):IsStudio() then
					print("Did command?")
				end
			else
				if cmdName == nil then
				else
					local Str = "!%s is not a vaild command"
					local e = string.format(Str, cmdName)

					print(e)
				end
			end
		end
		if isFunny(player) then
			msg = string.lower(msg)
			local splitString = msg:split(" ")
			local slashcommand = splitString[1] -- /tp
			local cmd = slashcommand:split(funPrefix) -- (";",)
			local cmdName = cmd[2]

			if FunnyCommand[cmdName] then
				local arguments = {} -- added player in tabel

				for i = 2, #splitString, 1 do
					table.insert(arguments, splitString[i])
				end
				FunnyCommand[cmdName](player, arguments)
				if not game:GetService("RunService"):IsStudio() then
					print("Did command?")
				end
			else
				if cmdName == nil then
				else
					local Str = ";%s is not a vaild Funcommand"
					local e = string.format(Str, cmdName)

					print(e)
				end
			end
		end
	end)
end

local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

game.Players.PlayerAdded:Connect(chat)
for i, player in ipairs(Players:GetPlayers()) do
	chat(player)
end
