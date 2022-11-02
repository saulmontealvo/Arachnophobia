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
	return New("Frame")({ -- List of buttons
		Name = "Frame",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(0.198, 1),
		ZIndex = 2,

		[Children] = {
			New("UIListLayout")({
				Name = "UIListLayout",
				Padding = UDim.new(0, 5),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
			}),
			Padding({
				Number = 5,
			}),
			props[Children],
		},
	})
end

return e
