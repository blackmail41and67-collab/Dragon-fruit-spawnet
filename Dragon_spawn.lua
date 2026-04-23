local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")

local toggleEvent = replicatedStorage:WaitForChild("ToggleSpawn")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Parent = screenGui
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextScaled = true

local enabled = false

local function updateButton()
	if enabled then
		button.Text = "Spawn: ON"
		button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	else
		button.Text = "Spawn: OFF"
		button.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	end
end

updateButton()

button.MouseButton1Click:Connect(function()
	enabled = not enabled
	updateButton()

	toggleEvent:FireServer(enabled)
end)
