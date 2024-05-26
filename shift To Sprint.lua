-- Courtesy of DragonSpawner12

local uis = game:GetService("UserInputService")

-- Settings (can change)
local runSpeed = 25
-- End of settings

uis.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = runSpeed
	end
end)

uis.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
	end
end)