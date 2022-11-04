local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local StarterPack = game:GetService("StarterPack")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local BoatTween = require(ReplicatedStorage:WaitForChild("BoatTween"))
local New, Children, OnEvent, Value, Spring, Computed, Tween, Sping, Ref =
	Fusion.New,
	Fusion.Children,
	Fusion.OnEvent,
	Fusion.Value,
	Fusion.Spring,
	Fusion.Computed,
	Fusion.Tween,
	Fusion.Spring,
	Fusion.Ref

--[[
    Date: 11/01/2022
    Time: 19:42:32

    Path: client\Game\UI\LoadingScreen.client.lua

    Script made by Gamerboy72008
]]
local Normal = UDim2.fromScale(0.07, 0.395)
local Big = UDim2.fromScale(0.144, 0.354)
local Run = true
local LoadingScreen: RemoteEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LoadingScreen")

local info = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In)

local frame = Value(false)
local RandomFactData = require(ReplicatedStorage.Common.RandomFact)
local randomFact = Value("Random fact")
local ImageOne = Value(Normal)
local ImageTwo = Value(Normal)
local ImageThree = Value(Normal)
local loadingImage = Value()
local Background = Value(1)

local update = function()
	while true do
		if Run then
			ImageOne:set(Big)
			ImageTwo:set(Normal)
			ImageThree:set(Normal)
			task.wait(0.5)
			ImageOne:set(Normal)
			ImageTwo:set(Big)
			ImageThree:set(Normal)
			task.wait(0.5)
			ImageOne:set(Normal)
			ImageTwo:set(Normal)
			ImageThree:set(Big)
			task.wait(0.5)
			ImageOne:set(Normal)
			ImageTwo:set(Normal)
			ImageThree:set(Normal)
			task.wait(1)
		else
			ImageOne:set(Normal)
			ImageTwo:set(Normal)
			ImageThree:set(Normal)
			task.wait()
		end
	end
end

local randomFunction = function()
	while true do
		if Run then
			local fact = RandomFactData[math.random(1, #RandomFactData)]

			if randomFact:get() == fact then
				local e = RandomFactData[math.random(1, #RandomFactData)]

				randomFact:set(e)
			else
				randomFact:set(fact)
			end
		else
			randomFact:set("Hi 👋")
		end
		task.wait(5)
	end
end

local function toggleEvent(timeLitmt)
	Run = true
	Background:set(0)
	frame:set(true)
	task.wait(timeLitmt)
	Run = false
	Background:set(1)
	task.wait(0.5)
	frame:set(false)
end

local function Image(props)
	return New("Frame")({
		Name = "Frame",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Size = Tween(props.Size, info),

		[Children] = {
			New("UIAspectRatioConstraint")({
				Name = "UIAspectRatioConstraint",
			}),

			New("UICorner")({
				Name = "UICorner",
				CornerRadius = UDim.new(1, 0),
			}),
		},
	})
end

coroutine.resume(coroutine.create(update))
coroutine.resume(coroutine.create(randomFunction))

local Info = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In)

local GUI = New("ScreenGui")({
	Name = "LoadingGui",
	Parent = player.PlayerGui,
	IgnoreGuiInset = true,
	Enabled = true,
	[Children] = {
		New("Frame")({
			Name = "Frame",
			BackgroundTransparency = Tween(Background, Info),
			Visible = frame,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.fromScale(1, 1),
			[Children] = {
				New("TextLabel")({
					Name = "TextLabel",
					FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
					Text = "Loading",
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextScaled = true,
					TextSize = 19,
					TextWrapped = true,
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.644),
					Size = UDim2.fromScale(1, 0.0463),
				}),
				New("ImageLabel")({
					Name = "ImageLabel",
					Image = "rbxassetid://6105407885",
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.294),
					Size = UDim2.fromScale(0.176, 0.312),

					[Children] = {
						New("UIAspectRatioConstraint")({
							Name = "UIAspectRatioConstraint",
						}),
					},
					[Ref] = loadingImage,
				}),
				New("TextLabel")({
					Name = "RandomText",
					FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
					Text = randomFact,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 19,
					TextWrapped = true,
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.737),
					Size = UDim2.fromScale(1, 0.0463),
				}),
				New("Frame")({
					Name = "Frame",
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.812),
					Size = UDim2.fromScale(0.156, 0.0926),

					[Children] = {
						New("UIPadding")({
							Name = "UIPadding",
							PaddingBottom = UDim.new(0, 5),
							PaddingLeft = UDim.new(0, 5),
							PaddingRight = UDim.new(0, 5),
							PaddingTop = UDim.new(0, 5),
						}),

						New("UIListLayout")({
							Name = "UIListLayout",
							Padding = UDim.new(0, 20),
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
						}),

						Image({
							Size = ImageOne,
						}),
						Image({
							Size = ImageTwo,
						}),
						Image({
							Size = ImageThree,
						}),
					},
				}),
			},
		}),
	},
})
LoadingScreen.OnClientEvent:Connect(toggleEvent)

local Tween = BoatTween:Create(loadingImage:get(), {
	Time = 0.5,
	EasingStyle = "Sine",
	EasingDirection = "In",
	RepeatCount = -1,
	StepType = "Heartbeat",
	Repeat = true,
	Goal = {
		Rotation = 360,
	},
})
Tween:Play()
