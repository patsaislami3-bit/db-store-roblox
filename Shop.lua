-- Code 4 - Shop Beli Bahan
-- Taruh di StarterGui sebagai LocalScript

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local ShopEvent = ReplicatedStorage:WaitForChild("DBShopEvent")

local gui = Instance.new("ScreenGui")
gui.Name = "ShopGui"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local openBtn = Instance.new("TextButton")
openBtn.Size = UDim2.new(0, 110, 0, 40)
openBtn.Position = UDim2.new(0, 15, 1, -55)
openBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
openBtn.Text = "🛒 SHOP"
openBtn.TextColor3 = Color3.fromRGB(0,0,0)
openBtn.TextSize = 16
openBtn.Font = Enum.Font.GothamBlack
openBtn.Parent = gui

local openCorner = Instance.new("UICorner")
openCorner.CornerRadius = UDim.new(0, 12)
openCorner.Parent = openBtn

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 220)
frame.Position = UDim2.new(0.5, -140, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local fc = Instance.new("UICorner")
fc.CornerRadius = UDim.new(0, 16)
fc.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 0, 40)
title.Position = UDim2.new(0, 15, 0, 5)
title.BackgroundTransparency = 1
title.Text = "🛒 BELI BAHAN"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 18
title.Font = Enum.Font.GothamBlack
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -40, 0, 8)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.TextSize = 16
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = frame

local cc = Instance.new("UICorner")
cc.CornerRadius = UDim.new(0, 8)
cc.Parent = closeBtn

local function buatItem(nama, harga, posisi, warna, emoji)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -30, 0, 45)
	btn.Position = posisi
	btn.BackgroundColor3 = warna
	btn.Text = emoji .. " " .. nama .. " - " .. harga .. " Coin"
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.TextSize = 14
	btn.Font = Enum.Font.GothamBold
	btn.Parent = frame
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 10)
	c.Parent = btn

	btn.MouseButton1Click:Connect(function()
		ShopEvent:FireServer(nama)
		btn.Text = "✅ Dibeli!"
		task.wait(0.5)
		btn.Text = emoji .. " " .. nama .. " - " .. harga .. " Coin"
	end)
	return btn
end

buatItem("Water", 10, UDim2.new(0, 15, 0, 55), Color3.fromRGB(0, 120, 255), "💧")
buatItem("Sugar Block Bag", 20, UDim2.new(0, 15, 0, 105), Color3.fromRGB(255, 100, 150), "🍬")
buatItem("Gelatin", 15, UDim2.new(0, 15, 0, 155), Color3.fromRGB(0, 200, 120), "🧪")

openBtn.MouseButton1Click:Connect(function()
	frame.Visible = true
end)

closeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
end)
