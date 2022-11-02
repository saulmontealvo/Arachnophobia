local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local New, Children, OnEvent, Value, Spring, Computed, Tween =
	Fusion.New, Fusion.Children, Fusion.OnEvent, Fusion.Value, Fusion.Spring, Fusion.Computed, Fusion.Tween

--[[
    Date: 11/01/2022
    Time: 19:42:32

    Path: client\Game\UI\LoadingScreen.client.lua

    Script made by Gamerboy72008
]]
local function Image(props)
	return New("ImageLabel")({
		Name = "Frame",
		Image = "http://www.roblox.com/asset/?id=6755657357",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0.142, 0.0883),
		Size = UDim2.fromScale(0.15, 0.45),

		[Children] = {
			New("UIAspectRatioConstraint")({
				Name = "UIAspectRatioConstraint",
			}),
		},
	})
end

local GUI = New("ScreenGui")({
	Name = "LoadingGui",
	Parent = player.PlayerGui,
	IgnoreGuiInset = true,
	Enabled = false,
	[Children] = {
		New("Frame")({
			Name = "Frame",
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
				New("TextLabel")({
					Name = "RandomText",
					FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
					Text = "This is a random fact",
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

						Image({}),
						Image({}),
						Image({}),
					},
				}),
			},
		}),
	},
})
