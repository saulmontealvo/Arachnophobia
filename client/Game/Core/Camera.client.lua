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

    Path: client\Game\Core\Camera.client.lua

    Script made by Gamerboy72008
]]
local Action = "Camera"
local FovValue = Value(70)
local Camera = Hydrate(game.Workspace.CurrentCamera)({
	FieldOfView = Tween(FovValue, TweenInfo.new(0.001, Enum.EasingStyle.Linear, Enum.EasingDirection.In)),
})

local max = 20
local camera = false

coroutine.resume(coroutine.create(function()
	while true do
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
		task.wait()
	end
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

ContextActionService:BindAction(Action, toggle, true, Enum.KeyCode.B)
ContextActionService:SetImage(Action, "rbxassetid://10709789686")
ContextActionService:SetPosition(Action, UDim2.fromOffset(40, 40))
