local Key = Config.Key
local CanOpen = Config.CanOpenMenuWhenDead
local Inmenu
local spectating = false
local lastcoords
MenuData = {}
VORP = {}

TriggerEvent("getCore", function(core)
    VORP = core
end)

-- get menu
TriggerEvent("menuapi:getData", function(call)
    MenuData = call
end)

ClientRPC = exports.vorp_core:ClientRpcCall() --[[@as ClientRPC]]

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        return
    end
    local player = PlayerPedId()
    ClearPedTasksImmediately(player, true, true) -- clear tasks
   MenuData.CloseAll()                                   --close menu
    AdminAllowed = false
end)

AddEventHandler("onClientResourceStart", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        return
    end
    --FOR TESTS ENABLED THIS
    if not Config.DevMode then
        return
    end

end)









--OPEN MENU
Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()
        local isDead = IsPedDeadOrDying(player, false)

            if IsControlJustPressed(0, Key) and not Inmenu then

                    OpenTrainerMenu()
                end

        Citizen.Wait(0)
    end
end)

-- perms

