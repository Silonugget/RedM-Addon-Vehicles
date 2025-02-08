local db = exports.oxmysql



data = {}
local VorpCore
local VorpInv
local QBRItems
local QRCore
local qc
--------------------------------------------------------------------------------------------------------------------------------------------

  TriggerEvent("getCore",function(core)
      VorpCore = core
  end)


function GetPlayerData(src)
    local a = nil  
        local Character = VorpCore.getUser(src).getUsedCharacter
        local identifier = Character.identifier
        local charid = Character.charIdentifier
        local money =  Character.money
        a = {identifier = identifier, charid = charid, money = money}
    
    return a
end

RegisterServerEvent("getOwnedVehicles")
AddEventHandler("getOwnedVehicles", function()
    local _source = source
    local playerData = GetPlayerData(_source)
    local result = db:executeSync("SELECT modelname FROM ironhorses WHERE charidentifier = ?", {playerData.charid})
    local ownedVehicles = {}
    for _, vehicle in ipairs(result) do
        table.insert(ownedVehicles, vehicle.modelname)
    end
    TriggerClientEvent("receiveOwnedVehicles", _source, ownedVehicles)
end)
