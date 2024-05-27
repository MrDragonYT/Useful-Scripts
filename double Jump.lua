-- Courtesy of DragonSpawner12

-- Settings (can change)
local jumpDelay = .2
-- End of settings

local uis = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character:WaitForChild("Humanoid")

local hasDoubleJumped = false
local lastJump = tick()

function jumpRequest()
	if tick() - lastJump >= jumpDelay then
		if humanoid:GetState() == Enum.HumanoidStateType.Freefall and not hasDoubleJumped then
			hasDoubleJumped = true
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end

humanoid.StateChanged:Connect(function(old, new)
	if new == Enum.HumanoidStateType.Landed then
		hasDoubleJumped = false
	elseif new == Enum.HumanoidStateType.Jumping then
		lastJump = tick()
	end
end)

uis.JumpRequest:Connect(jumpRequest)