-- Courtesy of DragonSpawner12

local part = script.Parent

part.Touched:Connect(function(part)
    local humanoid = part:FindFirstAncestorWhichIsA("Model"):FindFirstChild("Humanoid")
    if humanoid then
        humanoid:TakeDamage(100)
    end
end)