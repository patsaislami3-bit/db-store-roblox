-- ServerScriptService - DB Store Server
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local ToggleEvent = ReplicatedStorage:WaitForChild("DBStoreToggle")
local UpdateEvent = ReplicatedStorage:WaitForChild("DBStoreUpdate")

local playerData = {} -- Simpan data tiap player
local playerStatus = {} -- Simpan ON/OFF tiap player

-- Bikin data awal 0 untuk player baru
Players.PlayerAdded:Connect(function(player)
	playerData[player] = {
		sisa = 0,
		small = 0,
		medium = 0,
		large = 0,
		water = 0,
		sugar = 0,
		gelatin = 0
	}
	playerStatus[player] = true -- Default ON
end)

Players.PlayerRemoving:Connect(function(player)
	playerData[player] = nil
	playerStatus[player] = nil
end)

-- Terima ON / OFF dari Client
ToggleEvent.OnServerEvent:Connect(function(player, isOn)
	playerStatus[player] = isOn
	print(player.Name .. " DB Store: " .. (isOn and "ON" or "OFF"))
end)

-- FUNGSI BUAT KIRIM UPDATE KE CLIENT
-- Panggil fungsi ini kalau ada perubahan bahan / hasil crafting
local function sendUpdate(player)
	local data = playerData[player]
	if data then
		UpdateEvent:FireClient(player, data)
	end
end

-- CONTOH CARA NAMBAH BAHAN (Kamu panggil ini dari sistem shop kamu)
-- Misal player beli 10 Water, panggil:
-- playerData[player].water += 10
-- playerData[player].sisa += 10
-- sendUpdate(player)

-- LOOP CRAFTING SEDERHANA (Contoh, hapus kalau sudah ada sistem sendiri)
task.spawn(function()
	while true do
		task.wait(1)
		for player, isOn in pairs(playerStatus) do
			if isOn and playerData[player] then
				local data = playerData[player]
				-- Cek kalau bahan cukup, baru crafting jalan
				if data.water > 0 and data.sugar > 0 and data.gelatin > 0 then
					data.water -= 1
					data.sugar -= 1
					data.gelatin -= 1
					data.small += 1
					data.sisa -= 1
					if data.sisa < 0 then data.sisa = 0 end
					sendUpdate(player)
				end
			end
		end
	end
end)
