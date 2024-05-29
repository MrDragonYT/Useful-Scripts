-- Courtesy of DragonSpawner12
-- You can combine this with the Give Tool With Gamepass script!

-- Settings (can change)
local vips = { -- [ID] = Object. You can add multiple users
    [114942345] = game.ServerStorage.SpecialGun -- Example, remove this or replace it
}
local backpackOrCharacter = false -- False = backpack, true = character (loads with tool equipped)
-- End of settings

game.Players.PlayerAdded:Connect(function(player)
    local ownedRewards = {}

    if vips[player.UserId] then
        table.insert(ownedRewards, vips[player.UserId])
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