local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--[[
    Date: 10/27/2022
    Time: 20:22:33

    Path: server\Game\Player\CharacterLoader.server.lua

    Script made by Gamerboy72008
]]

local function playerAdded(player: Player)
	player:LoadCharacter()
end

Players.PlayerAdded:Connect(playerAdded)
