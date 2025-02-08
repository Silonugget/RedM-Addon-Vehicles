data = {}
local VorpCore
local VorpInv
local db = exports.oxmysql

--------------------------------------------------------------------------------------------------------------------------------------------

  TriggerEvent("getCore",function(core)
      VorpCore = core
  end)
  VorpInv = exports.vorp_inventory:vorp_inventoryApi()



function GetPlayerData(src)
  local a = nil 
      local Character = VorpCore.getUser(src).getUsedCharacter
      local job =  Character.job
      local identifier = Character.identifier
      local charid = Character.charIdentifier
      local money =  Character.money
      a = {identifier = identifier, charid = charid, name = pname, money = money, job = job}
 
  
  return a
end
--------------------------------------------------------------------------------------------------------------------------------------------
function ReadSQL(dat)
    local result = db:executeSync("SELECT * FROM ironhorses WHERE charidentifier = ? AND modelname = ?", {dat.charid, dat.vehicle.objectModel})
    if result[1] then
        return result
    else
        return false
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("addon_vehicles:spawn_car")
AddEventHandler("addon_vehicles:spawn_car", function(vehicleConfig)
    local _source = source
    local player = GetPlayerData(_source)

    -- Check if 'vorp' is true in the vehicleConfig
    if Config.Vorp == true then
        -- If 'vorp' is true, attempt to read from the database
        local dat = ReadSQL({identifier = player.identifier, charid = player.charid, vehicle = vehicleConfig})
        Wait(400)

        -- If data is found, spawn the car, otherwise show the notification
        if dat then
            TriggerClientEvent("addon_vehicles:spawn_c", _source, vehicleConfig)
        else
            TriggerClientEvent("Notification:addon_vehicles", _source, Config.Texts.Dealership, Config.Texts.NoTruck, Config.Textures.locked[1], Config.Textures.locked[2], 2500)
        end
    else
        -- If 'vorp' is not true, just spawn the car as normal
        TriggerClientEvent("addon_vehicles:spawn_c", _source, vehicleConfig)
    end

    Wait(400)
end)


RegisterServerEvent("requestVehicleConfig")
AddEventHandler("requestVehicleConfig", function()
    local _source = source
    TriggerClientEvent("receiveVehicleConfig", _source, Config.Vehicles)
end)
RegisterServerEvent("requestVehicleConfigJSON")
AddEventHandler("requestVehicleConfigJSON", function()
    local _source = source

    -- Convert the Config.Vehicles table to a JSON string and send it to the client
    local jsonData = json.encode(Config.Vehicles)
    TriggerClientEvent("receiveVehicleConfigJSON", _source, jsonData)
end)

RegisterServerEvent("Notification:NeedWaterToSpawn")
AddEventHandler("Notification:NeedWaterToSpawn", function()
    local _source = source
    	TriggerClientEvent("Notification:redm_policesuv", _source, "Dealership", "You must be IN WATER to spawn this!", "menu_textures", "stamp_locked_rank", 2500)
end)