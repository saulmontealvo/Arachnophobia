local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Packages
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local New, Children, OnEvent, Value, Spring, Computed, Tween =
	Fusion.New, Fusion.Children, Fusion.OnEvent, Fusion.Value, Fusion.Spring, Fusion.Computed, Fusion.Tween
local Fliter = require(ReplicatedStorage.Common.Utils.Fliter)

--[[
    Date: 10/24/2022
    Time: 16:30:17

    Path: Lobby\Main.client.lua

    Script made by Gamerboy72008
]]

-- UI
local Padding = require(ReplicatedStorage.Common.UI.Utils.Padding)
local Button = require(ReplicatedStorage.Common.UI.Button)
-- Main

Fliter:ApplyFilter("Vintage")

local GUI = New("ScreenGui")({
	Name = "Select",
	IgnoreGuiInset = true,
	Parent = player.PlayerGui,

	[Children] = {
		New("Frame")({
			Name = "Frame",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(40, 48, 48),
			BackgroundTransparency = 0.2,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.313, 0.417),
			ZIndex = 2,

			[Children] = {
				New("UIAspectRatioConstraint")({
					Name = "UIAspectRatioConstraint",
					AspectRatio = 1.33,
				}),

				Padding({
					Number = 5,
				}),

				New("UIStroke")({
					Name = "UIStroke",
					Color = Color3.fromRGB(16, 80, 72),
					Thickness = 2,
				}),

				New("Frame")({
					Name = "Frame",
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(0.198, 1),
					ZIndex = 2,

					[Children] = {
						Button({
							Text = "Games",
						}),

						New("UIListLayout")({
							Name = "UIListLayout",
							Padding = UDim.new(0, 3),
							SortOrder = Enum.SortOrder.LayoutOrder,
						}),

						New("UIPadding")({
							Name = "UIPadding",
							PaddingBottom = UDim.new(0, 5),
							PaddingLeft = UDim.new(0, 5),
							PaddingRight = UDim.new(0, 5),
							PaddingTop = UDim.new(0, 5),
						}),
					},
				}),
			},
		}),

		New("TextLabel")({
			Name = "TextLabel",
			FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
			Text = "This game is in beta",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextSize = 14,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0.954),
			Size = UDim2.fromScale(0.154, 0.0281),
			ZIndex = 2,
		}),
	},
})
