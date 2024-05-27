-- Courtesy of DragonSpawner12

-- MAKE SURE TO ADD Afk Detector Server AS WELL

local uis = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local setAfkEvent = game.ReplicatedStorage:WaitForChild("SetAFK")

uis.WindowFocusReleased:Connect(function()
	setAfkEvent:FireServer(true)
end)

uis.WindowFocused:Connect(function()
	setAfkEvent:FireServer(false)
end)

player.Idled:Connect(function(time)
	setAfkEvent:FireServer(true)
end)

humanoid.Running:Connect(function(speed)
	if speed > 0 then
		setAfkEvent:FireServer(false)
	end
end)