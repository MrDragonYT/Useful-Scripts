-- Courtesy of DragonSpawner12

-- Settings (can change)
local gamepasses = { -- [ID] = Object. You can add multiple gamepasses
    [12345678901] = game.ServerStorage.Gun -- Example, remove this or replace it
}
local backpackOrCharacter = false -- False = backpack, true = character (loads with tool equipped)
-- End of settings

local market = game:GetService("MarketplaceService")

game.Players.PlayerAdded:Connect(function(player)
    local ownedRewards = {}
    for id, object in pairs(gamepasses) do
        if market:UserOwnsGamePassAsync(player.UserId, id) then
            table.insert(ownedRewards, {id, object})
        end
    end

    player.CharacterAdded:Connect(function(char)
        for _, reward in pairs(ownedRewards) do
            if not backpackOrCharacter then
                reward:Clone().Parent = player.Backpack
            else
                reward:Clone().Parent = char
            end
        end
    end)
end)