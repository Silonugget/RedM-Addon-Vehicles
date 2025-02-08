-- At the top of your client.lua script, declare:
local isVehicleSpawnModeActive = false
local isDefaultDensityModeActive = true


local densityMultipliers = Config.densityMultipliers

RegisterNetEvent("popdensity:setMultipliers")

function SetAmbientAnimalDensityMultiplierThisFrame(multiplier)
	Citizen.InvokeNative(0xC0258742B034DFAF, multiplier)
end

function SetAmbientHumanDensityMultiplierThisFrame(multiplier)
	Citizen.InvokeNative(0xBA0980B5C0A11924, multiplier)
end

function SetAmbientPedDensityMultiplierThisFrame(multiplier)
	Citizen.InvokeNative(0xAB0D553FE20A6E25, multiplier)
end

function SetScenarioAnimalDensityThisFrame(multiplier)
	Citizen.InvokeNative(0xDB48E99F8E064E56, multiplier)
end

function SetScenarioHumanDensityThisFrame(multiplier)
	Citizen.InvokeNative(0x28CB6391ACEDD9DB, multiplier)
end

exports("getMultiplier", function(name)
	return densityMultipliers[name]
end)

exports("setMultiplier", function(name, value)
	densityMultipliers[name] = value
end)

exports("resetMultiplier", function(name)
	densityMultipliers[name] = Config.densityMultipliers[name]
end)

AddEventHandler("popdensity:setMultipliers", function(multipliers)
	densityMultipliers = multipliers
end)

local forbiddenVehiclesHashes = {
    GetHashKey('coach4'),
    GetHashKey('coach5'),
    GetHashKey('coach6')
}

Citizen.CreateThread(function()
    TriggerServerEvent("popdensity:sync")

    -- Explicitly set modes for testing
    isVehicleSpawnModeActive = false
    isDefaultDensityModeActive = true

    while true do

        
        if isVehicleSpawnModeActive then

            SetVehicleDensityMultiplierThisFrame(2.0)
            SetParkedVehicleDensityMultiplierThisFrame(1.0)
            SetRandomVehicleDensityMultiplierThisFrame(2.0)
        elseif isDefaultDensityModeActive then
            if SetPedDensityMultiplierThisFrame then

                SetPedDensityMultiplierThisFrame(densityMultipliers.ambientPeds)
                SetScenarioPedDensityMultiplierThisFrame(densityMultipliers.scenarioPeds, densityMultipliers.scenarioPeds)
            else

                SetAmbientAnimalDensityMultiplierThisFrame(densityMultipliers.ambientAnimals)
                SetAmbientHumanDensityMultiplierThisFrame(densityMultipliers.ambientHumans)
                SetAmbientPedDensityMultiplierThisFrame(densityMultipliers.ambientPeds)
                SetScenarioAnimalDensityThisFrame(densityMultipliers.scenarioAnimals)
                SetScenarioHumanDensityThisFrame(densityMultipliers.scenarioHumans)
                SetScenarioPedDensityMultiplierThisFrame(densityMultipliers.scenarioPeds)
            end
            
  
            SetParkedVehicleDensityMultiplierThisFrame(densityMultipliers.parkedVehicles)
            SetRandomVehicleDensityMultiplierThisFrame(densityMultipliers.randomVehicles)
            SetVehicleDensityMultiplierThisFrame(densityMultipliers.vehicles)
        end

        Citizen.Wait(0)
    end
end)





Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)  -- wait for next frame
		if isDefaultDensityModeActive then

        -- Get all the vehicles in the world.
        local vehicles = GetAllVehicles()
        
        for _, vehicle in ipairs(vehicles) do
            local model = GetEntityModel(vehicle)

            -- Check if this vehicle is in our list of forbidden vehicle hashes
            for _, forbiddenHash in pairs(forbiddenVehiclesHashes) do
                if model == forbiddenHash then
                    -- Delete the vehicle
                    DeleteEntity(vehicle)
                end
            end
        end
		end
    end
end)


-- This is a utility function to get all vehicles in the world.
-- You may already have a similar function.
function GetAllVehicles()
    local vehicles = {}

    local handle, veh = FindFirstVehicle()
    local success

    repeat
        table.insert(vehicles, veh)

        success, veh = FindNextVehicle(handle)
    until not success

    EndFindVehicle(handle)

    return vehicles
end

RegisterNetEvent('switchToVehicleSpawnMode')
AddEventHandler('switchToVehicleSpawnMode', function()
    isVehicleSpawnModeActive = true
    isDefaultDensityModeActive = false
end)

RegisterNetEvent('switchToDefaultDensityMode')
AddEventHandler('switchToDefaultDensityMode', function()
    isVehicleSpawnModeActive = false
    isDefaultDensityModeActive = true
end)