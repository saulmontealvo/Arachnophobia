local Remotes = game.ReplicatedStorage.Remotes

local ToggleLight = Remotes.ToggleLight

ToggleLight.OnServerEvent:Connect(function(player, tool, toggle: BoolValue)
	local Light = tool:FindFirstChild("Light")

	if Light then
		if typeof(toggle) == "boolean" then
			Light.Light.Enabled = toggle
			Light.Shadow.Enabled = toggle
		end
	end
end)
