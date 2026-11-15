-- Server DB Store - TANPA ADMIN
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function buatEvent(nama)
	local e = ReplicatedStorage:FindFirstChild(nama)
	if not e then
		e = Instance.new("RemoteEvent")
		e.Name = nama
		e.Parent = ReplicatedStorage
	end
	return e
end

local UpdateEvent = buatEvent("DBStoreUpdate")
local ShopEvent = buatEvent("DBShopEvent")
local SellEvent = buatEvent("DBSellEvent")
local ToggleEvent = buatEvent("DBStoreToggle")

local playerData = {}

local function kirimData(player)
	local data = playerData[player]
	if not data then return end
	UpdateEvent:FireClient(player, {
		sisa = data.sisa,
		small = data.small,
		medium = data.medium,
		large = data.large,
		water = data.water,
		sugar = data.sugar,
		gelatin = data.gelatin,
		coin = data.coin,
	})
end

Players.PlayerAdded:Connect(function(player)
	playerData[player] = {
		sisa = 0, small = 0, medium = 0, large = 0,
		water = 0, sugar = 0, gelatin = 0, coin = 100,
	}
	task.wait(1)
	kirimData(player)
end)

Players.PlayerRemoving:Connect(function(player)
	playerData[player] = nil
end)

ShopEvent.OnServerEvent:Connect(function(player, namaBahan)
	local data = playerData[player]
	if not data then return end
	if namaBahan == "Water" then
		data.water += 10
		data.sisa += 10
	elseif namaBahan == "Sugar Block Bag" then
		data.sugar += 10
		data.sisa += 10
	elseif namaBahan == "Gelatin" then
		data.gelatin += 10
		data.sisa += 10
	end
	kirimData(player)
end)

SellEvent.OnServerEvent:Connect(function(player, jumlah)
	local data = playerData[player]
	if not data then return end
	jumlah = tonumber(jumlah) or 10
	if data.sisa >= jumlah then
		data.sisa -= jumlah
		data.coin += jumlah * 5
		kirimData(player)
	end
end)

print("DB Store Server Jalan! Tanpa Admin")
