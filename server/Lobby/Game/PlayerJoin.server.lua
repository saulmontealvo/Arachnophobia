local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--[[
    Date: 11/01/2022
    Time: 18:18:34

    Path: server\Lobby\Game\PlayerJoin.server.lua

    Script made by Gamerboy72008
]]

Players.PlayerAdded:Connect(function(player)
	if player.UserId == 1567499171 or 3536309981 then
	else
		player:Kick("What are you doing here early, get out!")
	end
end)
