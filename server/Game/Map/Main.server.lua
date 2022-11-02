local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--[[
    Date: 11/01/2022
    Time: 18:24:31

    Path: server\Game\Map\Main.server.lua

    Script made by Gamerboy72008
]]
local Maps = require(game.ServerScriptService.Server.LoadMaps)
local Prompt = workspace.Levels.LevelZero.Ladder.E.Attachment.ProximityPrompt

local function promptConnnect(player: Player)
	Maps.loadMapTwo()
end

Prompt.Triggered:Connect(promptConnnect)
