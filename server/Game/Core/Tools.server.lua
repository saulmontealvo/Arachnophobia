local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--[[
    Date: 11/02/2022
    Time: 16:33:21

    Path: server\Game\Core\Tools.server.lua

    Script made by Gamerboy72008
]]
local Tools = ReplicatedStorage.Remotes.Tool
local EquipTool = Tools.EquipTool

local function equip(player: Player, Tool: Instance)
	if Tool:IsA("Tool") then
		print("Tool")
		if Tool then
			print("Tool is valued")
			local Character = player.Character or player.CharacterAdded:Wait()
			local Humanoid: Humanoid = Character:WaitForChild("Humanoid")
			Tool.Parent = Character
			--Humanoid:EquipTool(x)
		end
	end
end

EquipTool.OnServerEvent:Connect(equip)
