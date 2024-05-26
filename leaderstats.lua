-- Courtesy of DragonSpawner12

game.Players.PlayerAdded:Connect(function(player)  

    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    -- You can add whatever stats you want to add
    local money = Instance.new("IntValue", leaderstats)
    money.Name = "Money"
    money.Value = 100
    
end)