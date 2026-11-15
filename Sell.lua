-- Code 5 - Jual MS Dapat Coin
-- Taruh di StarterGui sebagai LocalScript

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local SellEvent = ReplicatedStorage:WaitForChild("DBSellEvent")
local UpdateEvent = ReplicatedStorage:WaitForChild("DBStoreUpdate")

local gui = Instance.new("ScreenGui")
gui.Name = "SellGui"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 260, 0, 130)
frame.Position = UDim2.new(0, 15, 0, 15)
frame.BackgroundColor3 = Color3.fromRGB(20,20,30)
frame.BorderSizePixel = 0
frame.Parent = gui

local fc = Instance.new("UICorner")
fc.CornerRadius = UDim.new(0, 14)
fc.Parent = frame

local coinLabel = Instance.new("TextLabel")
coinLabel.Size = UDim2.new(1, -30, 0, 30)
coinLabel.Position = UDim2.new(0, 15, 0, 10)
coinLabel.BackgroundTransparency = 1
coinLabel.Text = "🪙 Coin: 100"
coinLabel.TextColor3 = Color3.fromRGB(255,215,0)
coinLabel.TextSize = 16
coinLabel.Font = Enum.Font.GothamBlack
coinLabel.TextXAlignment = Enum.TextXAlignment.Left
coinLabel.Parent = frame

local msLabel = Instance.new("TextLabel")
msLabel.Size = UDim2.new(1, -30, 0, 25)
msLabel.Position = UDim2.new(0, 15, 0, 40)
msLabel.BackgroundTransparency = 1
msLabel.Text = "⭐ Sisa MS: 0"
msLabel.TextColor3 = Color3.fromRGB(255,255,255)
msLabel.TextSize = 13
msLabel.Font = Enum.Font.GothamBold
msLabel.TextXAlignment = Enum.TextXAlignment.Left
msLabel.Parent = frame

local sellBtn = Instance.new("TextButton")
sellBtn.Size = UDim2.new(1, -30, 0, 40)
sellBtn.Position = UDim2.new(0, 15, 0, 75)
sellBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
sellBtn.Text = "💰 JUAL 10 MS = 50 Coin"
sellBtn.TextColor3 = Color3.fromRGB(255,255,255)
sellBtn.TextSize = 13
sellBtn.Font = Enum.Font.GothamBold
sellBtn.Parent = frame
local sc = Instance.new("UICorner")
sc.CornerRadius = UDim.new(0, 10)
sc.Parent = sellBtn

sellBtn.MouseButton1Click:Connect(function()
	SellEvent:FireServer(10)
end)

UpdateEvent.OnClientEvent:Connect(function(data)
	coinLabel.Text = "🪙 Coin: " .. tostring(data.coin)
	msLabel.Text = "⭐ Sisa MS: " .. tostring(data.sisa)
end)
