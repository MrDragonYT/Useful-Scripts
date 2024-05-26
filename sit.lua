-- Courtesy of DragonSpawner12

-- Settings (can change)
local prefix = "/"
-- End of settings

game.Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if msg == prefix.."sit" then
			plr.Character.Humanoid.Sit = true
		end
	end)
end)