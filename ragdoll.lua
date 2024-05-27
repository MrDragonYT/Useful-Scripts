-- Courtesy of DragonSpawner12

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		local humanoid = char:WaitForChild("Humanoid")
		humanoid.BreakJointsOnDeath = false
		humanoid.Died:Connect(function()
			for _, v in pairs(char:GetDescendants()) do
				if not v:IsA("Motor6D") then continue end
				local a0 = Instance.new("Attachment")
				a0.CFrame = v.C0
				a0.Parent = v.Part0
				
				local a1 = Instance.new("Attachment")
				a1.CFrame = v.C1
				a1.Parent = v.Part1
				
				local cons = Instance.new("BallSocketConstraint")
				cons.Attachment0 = a0
				cons.Attachment1 = a1
				cons.Parent = v.Part0
				
				v:Destroy()
			end
		end)
	end)
end)