local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local New, Children, OnEvent, Value, Spring, Computed, Tween =
	Fusion.New, Fusion.Children, Fusion.OnEvent, Fusion.Value, Fusion.Spring, Fusion.Computed, Fusion.Tween
--[[
    Date: 10/19/2022
    Time: 15:39:10

    Path: src\shared\UI\Padding.lua

    Script made by Gamerboy72008
]]

local function e(props)
	if not props.Number then
		warn("Add Number")
		return
	else
		return New("UIPadding")({
			Name = "UIPadding",
			PaddingBottom = UDim.new(0, props.Number),
			PaddingLeft = UDim.new(0, props.Number),
			PaddingRight = UDim.new(0, props.Number),
			PaddingTop = UDim.new(0, props.Number),
		})
	end
end

return e
