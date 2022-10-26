local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local New, Children, OnEvent, Value, Spring, Computed, Tween, Ref =
	Fusion.New, Fusion.Children, Fusion.OnEvent, Fusion.Value, Fusion.Spring, Fusion.Computed, Fusion.Tween, Fusion.Ref

local function e(props)
	return New("Frame")({
		[Ref] = props[Ref],
		Name = props.Name,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		Position = UDim2.fromScale(0.225, 0),
		Size = UDim2.fromScale(0.773, 1),
		ZIndex = 2,
		Visible = false,
		[Children] = {
			props[Children],
		},
	})
end

return e
