local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Commands = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")

Commands.noclip = function(sender, args)
	local Character = sender.Character or sender.CharacterAdded:Wait()
	local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

	Character.PrimaryPart.CFrame = game.Workspace.Teleports.ClipOut.CFrame
	ReplicatedStorage.Remotes.StopAudio:FireClient(sender)
end

return Commands
