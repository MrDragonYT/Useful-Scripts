-- Courtesy of DragonSpawner12

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		local humanoid = char:WaitForChild("Humanoid")
		humanoid.Died:Connect(function()
			player:Kick("You died.")
		end)
	end)
end)