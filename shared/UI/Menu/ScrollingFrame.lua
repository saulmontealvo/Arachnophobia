local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local New, Children, OnEvent, Value, Spring, Computed, Tween =
	Fusion.New, Fusion.Children, Fusion.OnEvent, Fusion.Value, Fusion.Spring, Fusion.Computed, Fusion.Tween
local Padding = require(ReplicatedStorage.Common.UI.Utils.Padding)
--[[
    Date: 11/01/2022
    Time: 17:37:38

    Path: shared\UI\ScrollingFrame.lua

    Script made by Gamerboy72008
]]

local function e(props)
	return New("ScrollingFrame")({
		Name = "ScrollingFrame",
		CanvasSize = UDim2.fromScale(0, 30),
		ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
		Active = true,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0, 5.76e-08),
		Size = UDim2.fromScale(1, 0.84),
		ZIndex = 2,
		[Children] = {
			New("Frame")({
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				[Children] = {
					Padding({
						Number = 2,
					}),
					New("UIListLayout")({
						Name = "UIListLayout",
						Padding = UDim.new(0, 2),
						SortOrder = Enum.SortOrder.LayoutOrder,
					}),
					props[Children],
				},
			}),
		},
	})
end

return e
