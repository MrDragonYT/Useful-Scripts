-- Courtesy of DragonSpawner12

-- Settings (can change)
local speed = 10 -- How long a day lasts in seconds (e.g. 60 seconds IRL = 1 day in game)
local startTime = 0 -- 24 hours, decimal (e.g. 14.5 = 2:30 PM)
-- End of settings

local lighting = game:GetService("Lighting")

lighting.ClockTime = startTime

while task.wait() do
	lighting.ClockTime = 24 / speed * ((time() + startTime / 24 * speed) % speed)
end