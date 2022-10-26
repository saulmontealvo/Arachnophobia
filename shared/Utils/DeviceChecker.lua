local PlayerDevice = {}
local UserInputService = game:GetService("UserInputService")

function PlayerDevice.isComputer(): boolean
	return UserInputService.MouseEnabled and UserInputService.KeyboardEnabled
end

function PlayerDevice.isTouchDevice(): boolean
	if
		game:GetService("UserInputService").TouchEnabled
		and game:GetService("UserInputService").KeyboardEnabled == false
	then
		return true
	end
end

function PlayerDevice.isXbox(): boolean
	return UserInputService.GamepadEnabled
end

function PlayerDevice.isVR(): boolean
	return UserInputService.VREnabled
end

return PlayerDevice
