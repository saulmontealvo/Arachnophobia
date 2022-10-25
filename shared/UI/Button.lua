local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local New, Children, OnEvent, Value, Spring, Computed, Tween =
	Fusion.New, Fusion.Children, Fusion.OnEvent, Fusion.Value, Fusion.Spring, Fusion.Computed, Fusion.Tween
--[[
    Date: 10/24/2022
    Time: 22:02:59

    Path: shared\UI\Button.lua

    Script made by Gamerboy72008
]]
local function e(props)
	local stroke = Value(1)

	return New("TextButton")({
		Name = "TextButton",
		FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextScaled = true,
		TextSize = 14,
		TextWrapped = true,
		BackgroundColor3 = Color3.fromRGB(72, 128, 112),
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0.0682),
		ZIndex = 2,

		[Children] = {
			New("TextLabel")({
				Name = "TextLabel",
				FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
				Text = props.Text,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextScaled = true,
				TextSize = 14,
				TextWrapped = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 127),
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 1, 1, 1),
				ZIndex = 2,
			}),

			New("UIPadding")({
				Name = "UIPadding",
				PaddingBottom = UDim.new(0, 5),
				PaddingLeft = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 5),
				PaddingTop = UDim.new(0, 5),
			}),

			New("UICorner")({
				Name = "UICorner",
				CornerRadius = UDim.new(0, 2),
			}),

			New("UIStroke")({
				Name = "UIStroke",
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.fromRGB(255, 255, 255),
				Enabled = true,
				Thickness = 2,
				Transparency = Tween(stroke, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In)),
				Archivable = false,
			}),
		},
		[OnEvent("MouseEnter")] = function()
			stroke:set(0)
		end,
		[OnEvent("MouseLeave")] = function()
			stroke:set(1)
		end,
	})
end

return e
