local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Tool = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Tool"):WaitForChild("Flashlight")

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid: Humanoid = Character:WaitForChild("Humanoid")
local Animator = Humanoid:WaitForChild("Animator")
local ContextActionService = game:GetService("ContextActionService")
local Idle
local item = true
local de = false
--[[
	Date: 10/25/2022
	Time: 19:18:58

	Path: client\Game\Core\ToolManger.client.lua

	Script made by Gamerboy72008
]]

Tool.Parent = Player.Backpack

local Action = "Light"
local Light = Tool.Light

local function toggle(actionName, inputStat)
	if inputStat == Enum.UserInputState.Begin then
		if item == true then -- Add
			Humanoid:EquipTool(Tool)
			Idle = Animator:LoadAnimation(ReplicatedStorage.Assets.Animation.Idle)
			Idle:Play()
			item = false
			game.ReplicatedStorage.Remotes.ToggleLight:FireServer(Tool, true)
		else -- Remove
			Humanoid:UnequipTools()
			Idle:Stop()
			item = true
			game.ReplicatedStorage.Remotes.ToggleLight:FireServer(Tool, false)
		end
	end
end

ContextActionService:BindAction(Action, toggle, true, Enum.KeyCode.F)
ContextActionService:SetImage(Action, "rbxassetid://10723376471")
ContextActionService:SetPosition(Action, UDim2.fromOffset(80, 20))
