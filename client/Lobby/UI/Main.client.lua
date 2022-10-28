-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")
local player = Players.LocalPlayer

-- Packages
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local New, Children, OnEvent, Value, Spring, Computed, Tween, Ref =
	Fusion.New, Fusion.Children, Fusion.OnEvent, Fusion.Value, Fusion.Spring, Fusion.Computed, Fusion.Tween, Fusion.Ref
local Fliter = require(ReplicatedStorage.Common.Utils.Fliter)
local DeviceChecker = require(ReplicatedStorage.Common.Utils.DeviceChecker)

--[[
    Date: 10/24/2022
    Time: 16:30:17

	Path: client\Lobby\Main.client.lua

	Script made by Gamerboy72008
]]

-- UI
local Padding = require(ReplicatedStorage.Common.UI.Utils.Padding)
local Button = require(ReplicatedStorage.Common.UI.Button)
local Frame = require(ReplicatedStorage.Common.UI.ItemFrame)
-- Main

Fliter:ApplyFilter("Vintage")

local mul = 1.8

local x = 0.375
local y = 0.500

local m = x * mul
local n = y * mul

local CountyCode = LocalizationService:GetCountryRegionForPlayerAsync(player)
local Size = Value(UDim2.fromScale(x, y))

-- warn(m, n)

if not DeviceChecker.isComputer() then
	Size:set(UDim2.fromScale(m, n))
end

local Folder = Value()

local GameFrame = Value()
local SettingsFrame = Value()

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
			Size = Size,
			ZIndex = 2,

			[Children] = {
				New("Folder")({
					Name = "Frames",
					[Ref] = Folder,
					[Children] = {
						Frame({
							Name = "Game",
							[Ref] = GameFrame,
							[Children] = {
								New("TextButton")({
									Name = "Hello",
									Size = UDim2.fromOffset(200, 50),
									Text = "Click to play",
									[OnEvent("MouseButton1Click")] = function()
										game:GetService("TeleportService"):Teleport(11371061130)
									end,
								}),
							},
						}),
						Frame({
							Name = "Settings",
							[Ref] = SettingsFrame,
							[Children] = {
								New("TextLabel")({
									Name = "Text",
									Size = UDim2.fromOffset(200, 50),
									Text = "Settings",
								}),
							},
						}),
					},
				}),
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
						New("UIListLayout")({
							Name = "UIListLayout",
							Padding = UDim.new(0, 5),
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Top,
						}),
						Padding({
							Number = 5,
						}),
						Button({
							Text = "Games",
							Frame = Folder,
							Item = GameFrame,
						}),
						Button({
							Text = "Settings",
							Frame = Folder,
							Item = SettingsFrame,
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
