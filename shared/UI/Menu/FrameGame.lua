local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local New, Children, OnEvent, Value, Spring, Computed, Tween, Ref =
	Fusion.New, Fusion.Children, Fusion.OnEvent, Fusion.Value, Fusion.Spring, Fusion.Computed, Fusion.Tween, Fusion.Ref
local Padding = require(ReplicatedStorage.Common.UI.Utils.Padding)

--[[
    Date: 11/01/2022
    Time: 17:32:44

    Path: shared\UI\ListButton.lua

    Script made by Gamerboy72008
]]

local function e(props)
	return New("Frame")({ -- MainFrame
		Name = "Frame",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(40, 48, 48),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = props.Size,
		Visible = props.Visible,
		ZIndex = 2,

		[Children] = {
			props[Children],
		},
	})
end

return e
