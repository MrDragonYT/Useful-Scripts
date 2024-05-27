-- Courtesy of DragonSpawner12
-- Make sure to enable "Enable Studio Access to API Services" in Game Settings > Security

-- Settings (can change)
local dataStoreName = "datastore"
-- End of settings

local dataStoreService = game:GetService("DataStoreService")

local dataStore = dataStoreService:GetDataStore(dataStoreName)

game.Players.PlayerAdded:Connect(function(player)
	repeat wait() until player:FindFirstChild("leaderstats")
	wait(.5) -- Wait for all stats to get added
	local data = dataStore:GetAsync(player.UserId)
	local statsObjects = {}
	
	for _, stat in pairs(player:FindFirstChild("leaderstats"):GetChildren()) do
		statsObjects[string.lower(stat.Name)] = stat
	end
	
	for key, value in pairs(data) do
		statsObjects[key].Value = value
	end
end)

game.Players.PlayerRemoving:Connect(function(player)
	local data = {}
	
	for _, stat in pairs(player:FindFirstChild("leaderstats"):GetChildren()) do
		data[string.lower(stat.Name)] = stat.Value
	end
	
	dataStore:SetAsync(player.UserId, data)
	print("Saved data for", player.Name, "("..player.UserId..")")
end)
