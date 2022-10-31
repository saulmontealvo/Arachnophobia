local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local HttpDate = HttpService:GenerateGUID()
local Remotes = ReplicatedStorage.Remotes
local AskToJoin = Remotes.AskToJoin
local StartGame = Remotes.StartGame

--[[
    Date: 10/30/2022
    Time: 19:01:34

    Path: server\Lobby\Game\Lobbys.server.lua

    Script made by Gamerboy72008
]]
local list = {
	[1] = "One",
	[2] = "Two",
	[3] = "Three",
	[4] = "Four",
}

AskToJoin.OnServerEvent:Connect(function(player: Player, Folder: Folder)
	local Count = Folder.Count.Value

	if Count > 4 then
		return
	else
		Folder.Count.Value = Folder.Count.Value + 1
		local Item = Folder.Players:FindFirstChild(list[Folder.Count.Value])
		Item.Value = player.UserId
	end
end)
