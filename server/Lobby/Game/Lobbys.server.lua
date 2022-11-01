local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local HttpDate = HttpService:GenerateGUID()
local TeleportService = game:GetService("TeleportService")
local Remotes = ReplicatedStorage.Remotes
local AskToJoin = Remotes.AskToJoin
local StartGame: RemoteEvent = Remotes.StartGame
local GameAnalytics = require(ReplicatedStorage.GameAnalytics)
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

local function removePlayers(player: Player)
	for index, value in pairs(ReplicatedStorage.Games:GetDescendants()) do
		print(index, value)
		if value:IsA("IntValue") then
			print(value)
			if value.Value == player.UserId then
				print(value)
				print("Gone")
				value.Value = 0
			else
				print("Nothing")
				print(value.Value, player.UserId)
			end
		end
	end
end

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

StartGame.OnServerEvent:Connect(function(player: Player)
	if ReplicatedStorage.Games:FindFirstChild(player.Name) then
		local FinTable = {}
		local Folder = ReplicatedStorage.Games:FindFirstChild(player.Name)
		local PlayerFolder = Folder.Players

		local firstPlayer = Players:GetPlayerByUserId(PlayerFolder.One.Value)
		local secondPlayer = Players:GetPlayerByUserId(PlayerFolder.Two.Value)
		local thridPlayer = Players:GetPlayerByUserId(PlayerFolder.Three.Value)
		local fourthPlayer = Players:GetPlayerByUserId(PlayerFolder.Four.Value)

		if firstPlayer then
			table.insert(FinTable, firstPlayer)
		end

		if secondPlayer then
			table.insert(FinTable, secondPlayer)
		end

		if thridPlayer then
			table.insert(FinTable, thridPlayer)
		end

		if fourthPlayer then
			table.insert(FinTable, fourthPlayer)
		end

		print(FinTable)
		local works, errorCode = pcall(function()
			TeleportService:TeleportAsync(11371061130, FinTable)
		end)

		if works then
			print("Enjoy the game!")
		else
			GameAnalytics:addErrorEvent(player.UserId, {
				severity = GameAnalytics.EGAErrorSeverity.critical,
				message = "Teleport failed",
			})
		end
	else
		warn("Player tried starting without having a game?")
	end
end)

Players.PlayerRemoving:Connect(removePlayers)
-- ReplicatedStorage.Remotes.TestEvent.OnServerEvent:Connect(removePlayers)
