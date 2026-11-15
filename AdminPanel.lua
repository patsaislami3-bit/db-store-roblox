-- Code 3 - Admin Panel (Buat Kamu / Owner)
-- Taruh di StarterGui sebagai LocalScript
-- Tekan tombol F5 di game untuk buka/tutup

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local AdminEvent = ReplicatedStorage:WaitForChild("DBAdminEvent")

local gui = Instance.new("ScreenGui")
gui.Name = "AdminGui"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 280)
frame.Position = UDim2.new(0.5, -140, 0.5, -140)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local fc = Instance.new("UICorner")
fc.CornerRadius = UDim.new(0, 16)
fc.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 40)
title.Position = UDim2.new(0, 15, 0, 5)
title.BackgroundTransparency = 1
title.Text = "👑 ADMIN PANEL"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextSize = 18
title.Font = Enum.Font.GothamBlack
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -30, 0, 20)
info.Position = UDim2.new(0, 15, 0, 42)
info.BackgroundTransparency = 1
info.Text = "Tekan F5 untuk buka / tutup"
info.TextColor3 = Color3.fromRGB(180,180,200)
info.TextSize = 11
info.Font = Enum.Font.Gotham
info.TextXAlignment = Enum.TextXAlignment.Left
info.Parent = frame

local jumlahBox = Instance.new("TextBox")
jumlahBox.Size = UDim2.new(1, -30, 0, 35)
jumlahBox.Position = UDim2.new(0, 15, 0, 70)
jumlahBox.BackgroundColor3 = Color3.fromRGB(45,45,60)
jumlahBox.Text = "100"
jumlahBox.PlaceholderText = "Jumlah (misal: 100)"
jumlahBox.TextColor3 = Color3.fromRGB(255,255,255)
jumlahBox.TextSize = 14
jumlahBox.Font = Enum.Font.GothamBold
jumlahBox.Parent = frame
local jc = Instance.new("UICorner")
jc.CornerRadius = UDim.new(0, 8)
jc.Parent = jumlahBox

local function buatTombol(nama, aksi, posisi, warna)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -30, 0, 35)
	btn.Position = posisi
	btn.BackgroundColor3 = warna
	btn.Text = nama
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.TextSize = 13
	btn.Font = Enum.Font.GothamBold
	btn.Parent = frame
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 8)
	c.Parent = btn
	btn.MouseButton1Click:Connect(function()
		local jumlah = tonumber(jumlahBox.Text) or 100
		AdminEvent:FireServer(aksi, jumlah)
		btn.Text = "✅ Dikirim!"
		task.wait(0.5)
		btn.Text = nama
	end)
	return btn
end

buatTombol("💧 + Water", "Water", UDim2.new(0, 15, 0, 115), Color3.fromRGB(0, 120, 255))
buatTombol("🍬 + Sugar Block Bag", "Sugar", UDim2.new(0, 15, 0, 155), Color3.fromRGB(255, 100, 150))
buatTombol("🧪 + Gelatin", "Gelatin", UDim2.new(0, 15, 0, 195), Color3.fromRGB(0, 200, 120))
buatTombol("🪙 + Coin", "Coin", UDim2.new(0, 15, 0, 235), Color3.fromRGB(255, 170, 0))

-- F5 untuk buka tutup
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.F5 then
		frame.Visible = not frame.Visible
	end
end)
