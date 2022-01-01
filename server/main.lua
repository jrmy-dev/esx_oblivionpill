ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('oblivionPill', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('dix-oblivionpill:oblivionPill', source)
	xPlayer.removeInventoryItem('oblivionPill', 1)
	TriggerClientEvent('esx:showNotification', source, _U('oblivionPill_used'))
	Citizen.Wait(180000)
	TriggerClientEvent('dix-oblivionpill:stopPill', source)
end)
