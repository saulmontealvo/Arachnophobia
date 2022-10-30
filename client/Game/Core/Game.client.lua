repeat
	task.wait()
until game:IsLoaded()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local Grain = require(ReplicatedStorage.Common.Utils.Grain)
local New, Children, OnEvent, Value, Spring, Computed, Tween, Sping, Ref, Hydrate =
	Fusion.New,
	Fusion.Children,
	Fusion.OnEvent,
	Fusion.Value,
	Fusion.Spring,
	Fusion.Computed,
	Fusion.Tween,
	Fusion.Spring,
	Fusion.Ref,
	Fusion.Hydrate

--[[
    Date: 10/26/2022
    Time: 20:36:38

    Path: client\Game\Core\Game.client.lua

    Script made by Gamerboy72008
]]
local Action = "Camera"
local FovValue = Value(70)
local Camera = Hydrate(game.Workspace.CurrentCamera)({
	FieldOfView = Tween(FovValue, TweenInfo.new(0.001, Enum.EasingStyle.Linear, Enum.EasingDirection.In)),
})

local max = 10
local camera = false

local ActionNormal = "Sprint"
local Sprint = false

local Character = player.Character or player.CharacterAdded:Wait()
local Humanoid: Humanoid = Character:WaitForChild("Humanoid")
local Number = 5700
local LeftShift = true

coroutine.resume(coroutine.create(function()
	while true do
		if Sprint then
			if game:GetService("RunService"):IsStudio() then
				warn(Number)
			end
			if Humanoid.MoveDirection.Magnitude > 0 then
				Number = Number - 1
				if Number < 1000 then
					Humanoid.WalkSpeed = 17
				end
				if Number < 0 then
					Humanoid.WalkSpeed = 16
					Sprint = false
					Number = 5700
				end
			end
		end

		if Humanoid.MoveDirection.Magnitude > 0 then
		else
			if Number < 5700 then
				print("add")
				Number = Number + 1
			end
		end

		if Number < 1000 then
			Humanoid.WalkSpeed = 17
		end

		task.wait()
	end
end))
coroutine.resume(coroutine.create(function()
	game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
		if camera then
			if UserInputService:IsKeyDown(Enum.KeyCode.E) then
				FovValue:set(FovValue:get() - 1)
				if FovValue:get() < max then
					FovValue:set(max)
				end
			end

			if UserInputService:IsKeyDown(Enum.KeyCode.R) then
				FovValue:set(FovValue:get() + 1)
				if FovValue:get() > 70 then
					FovValue:set(70)
				end
			end
		end
		task.wait(deltaTime * 300)
	end)
end))

local function toggle(actionName, inputStat)
	if inputStat == Enum.UserInputState.Begin then
		if camera then
			FovValue:set(70)
		end
		camera = not camera
		Grain:bool(camera)
		warn("State:", camera)
	end
end

local function toggleSprint(actionName, inputStat)
	LeftShift = false
	if inputStat == Enum.UserInputState.Begin then
		if Sprint == false then
			Humanoid.WalkSpeed = 20
			Sprint = true
		else
			Humanoid.WalkSpeed = 16
			Sprint = false
		end
	end
end

local function update(KeyCode, event)
	if LeftShift then
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
			Humanoid.WalkSpeed = 20
			Sprint = true
		else
			Sprint = false
			Humanoid.WalkSpeed = 16
		end
	end
end

local function zoom()
	if camera then
		FovValue:set(FovValue:get() - 10)
		if FovValue:get() < max then
			FovValue:set(max)
		end
	end
end

local function zoomOut()
	if camera then
		FovValue:set(FovValue:get() + 10)
		if FovValue:get() > 70 then
			FovValue:set(70)
		end
	end
end

UserInputService.InputBegan:Connect(update)
UserInputService.InputEnded:Connect(update)

-- Zoom
ContextActionService:BindAction("Zoom", zoom, true)
ContextActionService:SetImage("Zoom", "rbxassetid://10734924532")
ContextActionService:SetPosition("Zoom", UDim2.fromOffset(165, -25))

ContextActionService:BindAction("zoomOut", zoomOut, true)
ContextActionService:SetImage("zoomOut", "rbxassetid://10734896206")
ContextActionService:SetPosition("zoomOut", UDim2.fromOffset(165, -70))

ContextActionService:BindAction(ActionNormal, toggleSprint, true)
ContextActionService:SetImage(ActionNormal, "rbxassetid://10734920149")
ContextActionService:SetPosition(ActionNormal, UDim2.fromOffset(120, -10))

ContextActionService:BindAction(Action, toggle, true, Enum.KeyCode.B)
ContextActionService:SetImage(Action, "rbxassetid://10709789686")
ContextActionService:SetPosition(Action, UDim2.fromOffset(120, 40))
