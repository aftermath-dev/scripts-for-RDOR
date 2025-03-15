--[[


MADE BY AFTR
TELEGRAM: @BEFORECODE
DISCORD: @aftermath1488
SPECIALLY FOR RDOR
JOIN RDOR!



]]














-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local TextButton1 = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.381578952, 0, 0.392857134, 0)
Frame.Size = UDim2.new(0, 223, 0, 114)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0, -0.00187977578, 0)
TextLabel.Size = UDim2.new(0, 222, 0, 24)
TextLabel.Font = Enum.Font.Michroma
TextLabel.Text = "RDOR Link Spam Chat"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.179372191, 0, 0.350877196, 0)
TextButton.Size = UDim2.new(0, 143, 0, 34)
TextButton.Font = Enum.Font.Michroma
TextButton.Text = "Spam!"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.88596493, 0)
TextLabel_2.Size = UDim2.new(0, 222, 0, 13)
TextLabel_2.Font = Enum.Font.Michroma
TextLabel_2.Text = "discord.gg/russianDOR"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

TextButton1.Parent = Frame
TextButton1.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
TextButton1.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton1.BorderSizePixel = 0
TextButton1.Position = UDim2.new(0.179372191, 0, 0.350877196, 0)
TextButton1.Size = UDim2.new(0, 143, 0, 34)
TextButton1.Font = Enum.Font.Michroma
TextButton1.Text = "Spam!"
TextButton1.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton1.TextScaled = true
TextButton1.TextSize = 14.000
TextButton1.TextWrapped = true
TextButton1.Visible = false

local UserInputService = game:GetService("UserInputService")

local gui = ScreenGui

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

spam = false
local function send(message)
	if game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, All)
	elseif game:GetService("TextChatService"):FindFirstChild("TextChannels") then
		local channel = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")
		if channel then
			channel:SendAsync(message)
		end
	else
		warn("Chat system not found")
	end
end

while spam == true do
	send("JOIN TO RDOR! .gg/russianDOR")		
	wait(1)
end

TextButton.MouseButton1Click:Connect(function() 
	spam = true
	TextButton.Text = "Started!"
	wait(3)
	TextButton.Visible = false
	TextButton1.Visible = true
end)

TextButton1.MouseButton1Click:Connect(function() 
	spam = false
	TextButton1.Text = "Stopped!"
	TextButton.Text = "Spam!"
	wait(3)
	TextButton1.Visible = false
	TextButton.Visible = true
end)

