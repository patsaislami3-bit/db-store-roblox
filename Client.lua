-- LocalScript - DB Store V2 Modern UI
-- Taruh di StarterGui

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local ToggleEvent = ReplicatedStorage:FindFirstChild("DBStoreToggle")
if not ToggleEvent then
	ToggleEvent = Instance.new("RemoteEvent")
	ToggleEvent.Name = "DBStoreToggle"
	ToggleEvent.Parent = ReplicatedStorage
end
local UpdateEvent = ReplicatedStorage:FindFirstChild("DBStoreUpdate")
if not UpdateEvent then
	UpdateEvent = Instance.new("RemoteEvent")
	UpdateEvent.Name = "DBStoreUpdate"
	UpdateEvent.Parent = ReplicatedStorage
end

-- ===== GUI UTAMA =====
local gui = Instance.new("ScreenGui")
gui.Name = "DBStoreGui"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = PlayerGui

-- ===== TOMBOL BUKA (MUNCUL KALAU UI DISEMBUNYIIN) =====
local openBtn = Instance.new("TextButton")
openBtn.Name = "OpenButton"
openBtn.Size = UDim2.new(0, 60, 0, 60)
openBtn.Position = UDim2.new(0, 15, 0.5, -30)
openBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
openBtn.Text = "DB"
openBtn.TextColor3 = Color3.fromRGB(0, 255, 170)
openBtn.TextSize = 20
openBtn.Font = Enum.Font.GothamBlack
openBtn.Visible = false
openBtn.Parent = gui

local openCorner = Instance.new("UICorner")
openCorner.CornerRadius = UDim.new(1, 0)
openCorner.Parent = openBtn

local openStroke = Instance.new("UIStroke")
openStroke.Thickness = 2
openStroke.Color = Color3.fromRGB(0, 255, 170)
openStroke.Parent = openBtn

-- ===== FRAME UTAMA =====
local main = Instance.new("Frame")
main.Name = "MainFrame"
main.Size = UDim2.new(0, 300, 0, 340)
main.Position = UDim2.new(0.5, -150, 0.5, -170)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 1.5
mainStroke.Color = Color3.fromRGB(0, 255, 170)
mainStroke.Transparency = 0.5
mainStroke.Parent = main

-- ===== HEADER =====
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(28, 28, 45)
header.BorderSizePixel = 0
header.Parent = main

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 16)
headerCorner.Parent = header

-- Biar bawah header tidak melengkung
local headerFix = Instance.new("Frame")
headerFix.Size = UDim2.new(1, 0, 0, 20)
headerFix.Position = UDim2.new(0, 0, 1, -20)
headerFix.BackgroundColor3 = Color3.fromRGB(28, 28, 45)
headerFix.BorderSizePixel = 0
headerFix.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "✦ DB STORE"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 20
title.Font = Enum.Font.GothamBlack
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local subTitle = Instance.new("TextLabel")
subTitle.Size = UDim2.new(1, -90, 0, 15)
subTitle.Position = UDim2.new(0, 15, 0, 28)
subTitle.BackgroundTransparency = 1
subTitle.Text = "Auto Marshmallow"
subTitle.TextColor3 = Color3.fromRGB(0, 255, 170)
subTitle.TextSize = 11
subTitle.Font = Enum.Font.GothamBold
subTitle.TextXAlignment = Enum.TextXAlignment.Left
subTitle.Parent = header

-- Tombol Minimize ( - )
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 32, 0, 32)
minBtn.Position = UDim2.new(1, -75, 0.5, -16)
minBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
minBtn.Text = "—"
minBtn.TextColor3 = Color3.fromRGB(255,255,255)
minBtn.TextSize = 18
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = header

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 8)
minCorner.Parent = minBtn

-- Tombol Close ( X )
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -38, 0.5, -16)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.TextSize = 16
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

-- ===== ISI =====
local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, -30, 1, -130)
content.Position = UDim2.new(0, 15, 0, 65)
content.BackgroundTransparency = 1
content.Parent = main

-- Card Sisa MS
local sisaCard = Instance.new("Frame")
sisaCard.Size = UDim2.new(1, 0, 0, 55)
sisaCard.BackgroundColor3 = Color3.fromRGB(28, 28, 45)
sisaCard.BorderSizePixel = 0
sisaCard.Parent = content

local sisaCorner = Instance.new("UICorner")
sisaCorner.CornerRadius = UDim.new(0, 12)
sisaCorner.Parent = sisaCard

local sisaLabel = Instance.new("TextLabel")
sisaLabel.Name = "SisaMS"
sisaLabel.Size = UDim2.new(1, 0, 0, 22)
sisaLabel.Position = UDim2.new(0, 0, 0, 5)
sisaLabel.BackgroundTransparency = 1
sisaLabel.Text = "SISA MS"
sisaLabel.TextColor3 = Color3.fromRGB(150,150,170)
sisaLabel.TextSize = 11
sisaLabel.Font = Enum.Font.GothamBold
sisaLabel.Parent = sisaCard

local sisaValue = Instance.new("TextLabel")
sisaValue.Name = "SisaValue"
sisaValue.Size = UDim2.new(1, 0, 0, 25)
sisaValue.Position = UDim2.new(0, 0, 0, 25)
sisaValue.BackgroundTransparency = 1
sisaValue.Text = "0"
sisaValue.TextColor3 = Color3.fromRGB(255, 215, 0)
sisaValue.TextSize = 22
sisaValue.Font = Enum.Font.GothamBlack
sisaValue.Parent = sisaCard

-- Label Hasil
local hasilLabel = Instance.new("TextLabel")
hasilLabel.Size = UDim2.new(1, 0, 0, 20)
hasilLabel.Position = UDim2.new(0, 0, 0, 65)
hasilLabel.BackgroundTransparency = 1
hasilLabel.Text = "MS SUDAH JADI"
hasilLabel.TextColor3 = Color3.fromRGB(150,150,170)
hasilLabel.TextSize = 11
hasilLabel.Font = Enum.Font.GothamBold
hasilLabel.TextXAlignment = Enum.TextXAlignment.Left
hasilLabel.Parent = content

-- Card Hasil (Small/Medium/Large)
local hasilFrame = Instance.new("Frame")
hasilFrame.Size = UDim2.new(1, 0, 0, 60)
hasilFrame.Position = UDim2.new(0, 0, 0, 85)
hasilFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 45)
hasilFrame.BorderSizePixel = 0
hasilFrame.Parent = content

local hasilCorner = Instance.new("UICorner")
hasilCorner.CornerRadius = UDim.new(0, 12)
hasilCorner.Parent = hasilFrame

local function buatKolom(nama, posisi, warna)
	local f = Instance.new("Frame")
	f.Size = UDim2.new(0.33, -5, 1, -10)
	f.Position = posisi
	f.BackgroundTransparency = 1
	f.Parent = hasilFrame
	local l1 = Instance.new("TextLabel")
	l1.Size = UDim2.new(1,0,0,18)
	l1.BackgroundTransparency = 1
	l1.Text = nama
	l1.TextColor3 = Color3.fromRGB(150,150,170)
	l1.TextSize = 10
	l1.Font = Enum.Font.GothamBold
	l1.Parent = f
	local l2 = Instance.new("TextLabel")
	l2.Name = nama.."Value"
	l2.Size = UDim2.new(1,0,0,25)
	l2.Position = UDim2.new(0,0,0,22)
	l2.BackgroundTransparency = 1
	l2.Text = "0"
	l2.TextColor3 = warna
	l2.TextSize = 20
	l2.Font = Enum.Font.GothamBlack
	l2.Parent = f
	return l2
end

local smallVal = buatKolom("SMALL", UDim2.new(0,5,0,5), Color3.fromRGB(100,200,255))
local medVal = buatKolom("MEDIUM", UDim2.new(0.33,2,0,5), Color3.fromRGB(255,170,0))
local largeVal = buatKolom("LARGE", UDim2.new(0.66,2,0,5), Color3.fromRGB(255,100,150))

-- Label Bahan
local bahanLabel = Instance.new("TextLabel")
bahanLabel.Size = UDim2.new(1,0,0,20)
bahanLabel.Position = UDim2.new(0,0,0,152)
bahanLabel.BackgroundTransparency = 1
bahanLabel.Text = "BAHAN-BAHAN"
bahanLabel.TextColor3 = Color3.fromRGB(150,150,170)
bahanLabel.TextSize = 11
bahanLabel.Font = Enum.Font.GothamBold
bahanLabel.TextXAlignment = Enum.TextXAlignment.Left
bahanLabel.Parent = content

local bahanText = Instance.new("TextLabel")
bahanText.Name = "BahanText"
bahanText.Size = UDim2.new(1,0,0,45)
bahanText.Position = UDim2.new(0,0,0,172)
bahanText.BackgroundColor3 = Color3.fromRGB(28,28,45)
bahanText.BorderSizePixel = 0
bahanText.Text = "💧 Water: 0  |  🍬 Sugar: 0  |  🧪 Gelatin: 0"
bahanText.TextColor3 = Color3.fromRGB(255,255,255)
bahanText.TextSize = 12
bahanText.Font = Enum.Font.GothamBold
bahanText.Parent = content

local bahanCorner = Instance.new("UICorner")
bahanCorner.CornerRadius = UDim.new(0, 12)
bahanCorner.Parent = bahanText

-- ===== TOMBOL ON/OFF =====
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(1, -30, 0, 48)
toggleBtn.Position = UDim2.new(0, 15, 1, -63)
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
toggleBtn.Text = "⏹  STOP AUTOM S"
toggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
toggleBtn.TextSize = 16
toggleBtn.Font = Enum.Font.GothamBlack
toggleBtn.Parent = main

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = toggleBtn

-- ===== FUNGSI =====
local function updateUI(data)
	sisaValue.Text = tostring(data.sisa)
	smallVal.Text = tostring(data.small)
	medVal.Text = tostring(data.medium)
	largeVal.Text = tostring(data.large)
	bahanText.Text = "💧 Water: "..data.water.."  |  🍬 Sugar: "..data.sugar.."  |  🧪 Gelatin: "..data.gelatin
end

UpdateEvent.OnClientEvent:Connect(updateUI)

local isOn = true
local function updateButton()
	if isOn then
		toggleBtn.Text = "⏹  STOP AUTOM S"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
	else
		toggleBtn.Text = "▶  START AUTOM S"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
	end
end

toggleBtn.MouseButton1Click:Connect(function()
	isOn = not isOn
	updateButton()
	ToggleEvent:FireServer(isOn)
end)

-- Minimize: sembunyiin isi, tinggalin header
local isMinimized = false
minBtn.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	if isMinimized then
		content.Visible = false
		toggleBtn.Visible = false
		main.Size = UDim2.new(0, 300, 0, 50)
		minBtn.Text = "+"
	else
		content.Visible = true
		toggleBtn.Visible = true
		main.Size = UDim2.new(0, 300, 0, 340)
		minBtn.Text = "—"
	end
end)

-- Close: sembunyiin semua, munculin tombol DB
closeBtn.MouseButton1Click:Connect(function()
	main.Visible = false
	openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
	main.Visible = true
	openBtn.Visible = false
end)

-- Tombol Keyboard: Tekan M untuk sembunyiin / munculin
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.M then
		if main.Visible then
			main.Visible = false
			openBtn.Visible = true
		else
			main.Visible = true
			openBtn.Visible = false
		end
	end
end)

updateUI({sisa=0, small=0, medium=0, large=0, water=0, sugar=0, gelatin=0})
updateButton()
