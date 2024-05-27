-- Courtesy of DragonSpawner12

-- Settings (can change)
local petObject = game.ReplicatedStorage.Pet -- make sure this is NOT a model/folder
local offset = CFrame.new(-3, 3, 3)
-- End of settings

local run = game:GetService("RunService")

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		local pet = petObject:Clone()
		pet.Parent = char
		
		local humanoid = char:WaitForChild("Humanoid")
		local hrp = char:WaitForChild("HumanoidRootPart")
		
		local bodyPos = pet:FindFirstChildWhichIsA("BodyPosition")
		local bodyGyro = pet:FindFirstChildWhichIsA("BodyGyro")
		
		if not bodyPos then
			bodyPos = Instance.new("BodyPosition", pet)
			bodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bodyPos.Position = Vector3.new(0, 0, 0)
		end
		
		if not bodyGyro then
			bodyGyro = Instance.new("BodyGyro", pet)
			bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		end
		
		while humanoid.Health > 0 do
			bodyPos.Position = (hrp.CFrame * offset).p
			bodyGyro.CFrame = hrp.CFrame
			wait()
		end
		pet:Destroy()
	end)
end)