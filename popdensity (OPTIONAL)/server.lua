local densityMultipliers = Config.densityMultipliers

RegisterNetEvent("popdensity:sync")

AddEventHandler("popdensity:sync", function()
	TriggerClientEvent("popdensity:setMultipliers", source, densityMultipliers)
end)
RegisterNetEvent('suppressVehicles')
AddEventHandler('suppressVehicles', function()
    TriggerClientEvent('client:suppressVehicles', -1)  -- Sends the event to all clients
end)


