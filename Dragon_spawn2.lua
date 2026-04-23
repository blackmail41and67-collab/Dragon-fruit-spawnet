local replicatedStorage = game:GetService("ReplicatedStorage")

local toggleEvent = Instance.new("RemoteEvent")
toggleEvent.Name = "ToggleSpawn"
toggleEvent.Parent = replicatedStorage

local FRUIT_NAME = "Dragon Fruit"

local playerStates = {}

toggleEvent.OnServerEvent:Connect(function(player, enabled)
	playerStates[player] = enabled
end)

game:GetService("RunService").Heartbeat:Connect(function()
	for player, enabled in pairs(playerStates) do
		if enabled then
			local character = player.Character
			if not character then continue end

			local hrp = character:FindFirstChild("HumanoidRootPart")
			if not hrp then continue end

			local fruit = replicatedStorage:FindFirstChild(FRUIT_NAME)
			if fruit then
				local clone = fruit:Clone()
				clone.Parent = workspace

				if clone:IsA("BasePart") then
					clone.CFrame = hrp.CFrame * CFrame.new(0, 0, -5)
				else
					clone:PivotTo(hrp.CFrame * CFrame.new(0, 0, -5))
				end
			end
		end
	end
end)
