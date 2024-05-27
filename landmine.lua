-- Courtesy of DragonSpawner12

-- Settings (can change)
local soundEnabled = true
-- End of settings

local part = script.Parent

part.Touched:Connect(function(hit)
	local humanoid = hit:FindFirstAncestorWhichIsA("Model"):FindFirstChild("Humanoid")
	if humanoid then
		local explosion = Instance.new("Explosion", workspace)
		explosion.Position = part.Position
		if soundEnabled then
			local sound = Instance.new("Sound", workspace)
			sound.SoundId = "rbxasset://sounds/collide.wav"
			sound:Play()
			sound.Ended:Connect(function()
				sound:Destroy()
			end)
		end
		part:Destroy()
	end
end)