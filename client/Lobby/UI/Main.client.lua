-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")
local StarterPack = game:GetService("StarterPack")
local player = Players.LocalPlayer

-- Packages
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local New, Children, OnEvent, Value, Spring, Computed, Tween, Ref =
	Fusion.New, Fusion.Children, Fusion.OnEvent, Fusion.Value, Fusion.Spring, Fusion.Computed, Fusion.Tween, Fusion.Ref

local ForPairs = Fusion.ForPairs
local ForValues = Fusion.ForValues
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
local SimpleButton = require(ReplicatedStorage.Common.UI.ButtonSimple)
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

local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size100x100

local MainFrame = Value(true)
local JoinedFrame = Value(false)
local render = Value()
local playerList = Value()
local ListFrame = Value()
local enabledButton = Value(false)
local data = Value(ReplicatedStorage.Games:GetChildren())
local ListData

local PlayerOne = Value(0)
local PlayerTwo = Value(0)
local PlayerThere = Value(0)
local PlayerFour = Value(0)

local function userIdImage(id: number)
	if id ~= nil then
		if id == 0 then
			print("UserId is 0")
			return "http://www.roblox.com/asset/?id=2539402051"
		end
		print("Normal output")
		return Players:GetUserThumbnailAsync(id, thumbType, thumbSize)
	else
		print("No valueAdded")
		return "http://www.roblox.com/asset/?id=2539402051"
	end
end

local bo = ForValues(data, function(value)
	local Players = Value(value.Count.Value)
	local EndMessage = Computed(function()
		return value.Name .. "'s game " .. Players:get() .. "/4"
	end)

	value.Count.Changed:Connect(function(updateValue)
		Players:set(updateValue)
	end)

	return New("Frame")({
		Name = "Frame",
		BackgroundColor3 = Color3.fromRGB(72, 144, 120),
		Position = UDim2.fromScale(0.0147, 0.000189),
		Size = UDim2.fromScale(0.993, 0.00157),
		ZIndex = 2,

		[Children] = {
			New("TextLabel")({
				Name = "TextLabel",
				FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
				Text = EndMessage,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextScaled = true,
				TextSize = 14,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0, 0.0476),
				Size = UDim2.fromScale(0.631, 0.88),
				ZIndex = 2,
			}),

			Padding({
				Number = 2,
			}),

			New("TextButton")({
				Name = "TextButton",
				FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
				Text = "Join",
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextScaled = true,
				TextSize = 14,
				TextWrapped = true,
				BackgroundColor3 = Color3.fromRGB(48, 184, 168),
				Position = UDim2.fromScale(0.8, 0.0476),
				Size = UDim2.fromScale(0.133, 0.88),
				ZIndex = 2,

				[Children] = {
					New("UICorner")({
						Name = "UICorner",
					}),
				},
				[OnEvent("MouseButton1Click")] = function()
					ListData = {
						["One"] = value.Players.One,
						["Two"] = value.Players.Two,
						["Three"] = value.Players.Three,
						["Four"] = value.Players.Four,
					}
					if value.Name == player.Name then
						enabledButton:set(true)
					end

					ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("AskToJoin"):FireServer(value)
					playerList:set(value.Players)
					MainFrame:set(false)
					JoinedFrame:set(true)
				end,
			}),

			New("UICorner")({
				Name = "UICorner",
			}),
		},
	})
end)

local run = function()
	-- PlayerOne:set(render:get()["One"].Value)
	-- PlayerTwo:set(render:get()["Two"].Value)
	-- PlayerThere:set(render:get()["Three"].Value)
	-- PlayerFour:set(render:get()["Four"].Value)
	print("HI")
end

local a, b, c, d

local update = function()
	while true do
		data:set(ReplicatedStorage.Games:GetChildren())
		task.wait()
	end
end

local playerLuis = function()
	while true do
		if ListData then
			a = ListData["One"].Value
			b = ListData["Two"].Value
			c = ListData["Three"].Value
			d = ListData["Four"].Value

			PlayerOne:set(a)
			PlayerTwo:set(b)
			PlayerThere:set(c)
			PlayerFour:set(d)

			task.wait()
		end
		task.wait()
	end
end

-- Update to playerList also PlayerLuis lol
coroutine.resume(coroutine.create(playerLuis))

-- Update to GameList
coroutine.resume(coroutine.create(update))

local GUI = New("ScreenGui")({
	Name = "Select",
	IgnoreGuiInset = true,
	Parent = player.PlayerGui,

	[Children] = {
		New("Frame")({ -- MainFrame
			Name = "Frame",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(40, 48, 48),
			BackgroundTransparency = 0.2,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = Size,
			Visible = MainFrame,
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
								New("ScrollingFrame")({
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
												bo,
											},
										}),
									},
								}),
								SimpleButton({
									Size = UDim2.fromScale(0.165, 0.0682),
									Position = UDim2.fromScale(0.835, 0.853),
									Text = "Create",
									Function = function()
										print("Pressed")
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

				New("Frame")({ -- List of buttons
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

		New("Frame")({
			Name = "GameInfo",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(40, 48, 48),
			BackgroundTransparency = 0.2,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = Size,
			Visible = JoinedFrame,
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
					[Ref] = ListFrame,
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0),
					Size = UDim2.fromScale(0.708, 0.185),
					ZIndex = 2,

					[Children] = {
						New("UIPadding")({
							Name = "UIPadding",
							PaddingBottom = UDim.new(0, 3),
							PaddingLeft = UDim.new(0, 3),
							PaddingRight = UDim.new(0, 3),
							PaddingTop = UDim.new(0, 3),
						}),

						New("UIListLayout")({
							Name = "UIListLayout",
							Padding = UDim.new(0, 4),
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
						}),

						New("ImageLabel")({
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(0.186, 0.983),
							Name = "Image",
							Image = Computed(function()
								return userIdImage(PlayerOne:get())
							end),
							[Children] = {
								New("UIAspectRatioConstraint")({
									Name = "UIAspectRatioConstraint",
								}),

								New("UICorner")({
									Name = "UICorner",
								}),
							},
						}),
						New("ImageLabel")({
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(0.186, 0.983),
							Name = "Image",
							Image = Computed(function()
								return userIdImage(PlayerTwo:get())
							end),
							[Children] = {
								New("UIAspectRatioConstraint")({
									Name = "UIAspectRatioConstraint",
								}),

								New("UICorner")({
									Name = "UICorner",
								}),
							},
						}),
						New("ImageLabel")({
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(0.186, 0.983),
							Name = "Image",
							Image = Computed(function()
								return userIdImage(PlayerThere:get())
							end),
							[Children] = {
								New("UIAspectRatioConstraint")({
									Name = "UIAspectRatioConstraint",
								}),

								New("UICorner")({
									Name = "UICorner",
								}),
							},
						}),
						New("ImageLabel")({
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(0.186, 0.983),
							Name = "Image",
							Image = Computed(function()
								return userIdImage(PlayerFour:get())
							end),
							[Children] = {
								New("UIAspectRatioConstraint")({
									Name = "UIAspectRatioConstraint",
								}),

								New("UICorner")({
									Name = "UICorner",
								}),
							},
						}),
					},
				}),
				SimpleButton({
					Visible = enabledButton,
					Position = UDim2.fromScale(0.5, 0.309),
					Size = UDim2.fromScale(0.113, 0.0757),
					Text = "Start",
					AnchorPoint = Vector2.new(0.5, 0),
					Function = function()
						game.ReplicatedStorage.Remotes.StartGame:FireServer()
					end,
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
