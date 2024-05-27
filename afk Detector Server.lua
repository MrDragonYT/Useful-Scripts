-- Courtesy of DragonSpawner12

-- MAKE SURE TO ADD Afk Detector Local AS WELL

local setAfkEvent = Instance.new("RemoteEvent", game.ReplicatedStorage)
setAfkEvent.Name = "SetAFK"

setAfkEvent.OnServerEvent:Connect(function(player, toggle)
	if toggle then
		if not player.Character.Head:FindFirstChild("AFK") then
			local afkUI = Instance.new("BillboardGui")
			afkUI.Name = "AFK"
			afkUI.Size = UDim2.new(6, 0, 2, 0)
			afkUI.StudsOffset = Vector3.new(0, 3, 0)
			
			local afkLabel = Instance.new("TextLabel", afkUI)
			afkLabel.Size = UDim2.new(1, 0, 1, 0)
			afkLabel.BackgroundTransparency = 1
			afkLabel.Text = "AFK"
			afkLabel.TextScaled = true
			afkLabel.Font = Enum.Font.SourceSansBold
			afkLabel.TextColor3 = Color3.new(255, 255, 255)
			
			afkUI.Parent = player.Character.Head
		end
	else
		if player.Character.Head:FindFirstChild("AFK") then
			player.Character.Head:FindFirstChild("AFK"):Destroy()
		end
	end
end)