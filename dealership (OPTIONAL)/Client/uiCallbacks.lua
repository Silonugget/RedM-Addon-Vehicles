RidePreviewRef = nil
local instanceCam = nil

-- Register the client event listener once, outside any functions that are repeatedly called
RegisterNetEvent("onRidePurchased", function()
    TriggerEvent("exit")
end)

RegisterNuiCallback("buyRide", function(data, callback)


    local rideName = "Vehicle"  -- Directly set the ride name

    if #rideName < 3 then
        TriggerEvent("vorp:TipRight", "~e~" .. Config.Lang.TipNameTooShort, 3000)
    else
        -- When this server event is triggered, the server will handle the purchase and then
        -- if the purchase is successful, it should trigger the "onRidePurchased" event to this client
        TriggerServerEvent(Events.onBuyRide, rideName, data.rideModel, data.rideType, data.price)
    end

    -- It's a good practice to have a callback at the end of your NUI Callback function
    -- to notify the UI that the action was completed
    if callback then
        callback('ok')
    end
end)


-- Define a global variable to store wheel references
-- Define a global variable to store wheel references
local WheelRefs = {}

RegisterNuiCallback("showRide", function(data, callback)
    Citizen.CreateThread(function()
        local entityRef
        local rideHash = GetHashKey(data.rideName)

        -- Delete previous wheels
        for _, wheelRef in ipairs(WheelRefs) do
            DeleteObject(wheelRef)
        end
        WheelRefs = {}

        -- Delete previous ride preview
        DeleteObject(RidePreviewRef)
        Wait(500)

        if data.rideType == "horse" then
            local x, y, z, h = table.unpack(Config.Stables[CurrentVendorIndex].SpawnHorse)
            entityRef = CreateObject(rideHash, x, y, z, false, false, false, true)
        elseif data.rideType == "cart" then
            local x, y, z, h = table.unpack(Config.Stables[CurrentVendorIndex].SpawnCart)
            entityRef = CreateObject(rideHash, x, y, z, false, false, false, true)
        end

        local wheelOffsets = {
            rear = {
                { x = 0.95, y = -2.10, z = -0.16 },
                { x = -0.95, y = -2.10, z = -0.16 }
            },
            front = {
                { x = 0.95, y = 1.3, z = -0.16 },
                { x = -0.95, y = 1.3, z = -0.16 }
            }
        }

        if rideHash == GetHashKey("f15078") then
            -- Initialization for f15078 wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("f15078wheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y, offset.z, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("f15078wheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y, offset.z, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
        elseif rideHash == GetHashKey("policesuv") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("policesuvwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.4, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("policesuvwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.4, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
			        elseif rideHash == GetHashKey("ironsport") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("ironsportwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.7, offset.z - 0.0, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("ironsportwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.2, offset.z - 0.0, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
						        elseif rideHash == GetHashKey("muscle") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("musclewheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.6, offset.z + 0.4, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("musclewheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.6, offset.z + 0.4, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
			elseif rideHash == GetHashKey("g37") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("g37wheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.3, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("g37wheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.2, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
						elseif rideHash == GetHashKey("ironroadster") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("g37wheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.3, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("ironroadsterwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.2, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
									elseif rideHash == GetHashKey("irongtr") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("irongtrwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.3, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("irongtrwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.2, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
									elseif rideHash == GetHashKey("ironmalibu") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("ironmalibuwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.3, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("ironmalibuwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.2, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
			elseif rideHash == GetHashKey("ironlambo") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("ironlambowheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.3, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("ironlambowheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.2, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
			elseif rideHash == GetHashKey("cyberhorse") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("cyberhorsewheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.3, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("cyberhorsewheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.2, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
			elseif rideHash == GetHashKey("irontrucklifted") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("irontruckliftedwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.3, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("irontruckliftedwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.2, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
			elseif rideHash == GetHashKey("ironimpala") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("ironimpalawheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.3, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("ironimpalawheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.2, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
			elseif rideHash == GetHashKey("ironcharger") then
            -- Initialization for policesuv wheels
            for _, offset in ipairs(wheelOffsets.rear) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("ironchargerrearwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.3, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end

            for _, offset in ipairs(wheelOffsets.front) do
                local x, y, z = table.unpack(GetEntityCoords(entityRef, false))
                local wheel = CreateObject("ironchargerrearwheel", x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(WheelRefs, wheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(wheel, entityRef, 0, offset.x, offset.y + 0.2, offset.z - 0.2, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
        end

        RidePreviewRef = entityRef
    end)
end)

RegisterNuiCallback("activateCam", function(data, callback)
    FreezeEntityPosition(PlayerPedId(), true);

    local x, y, z, rx, ry, rz, fov
    if data.rideType == "horse" then
        x, y, z, rx, ry, rz = table.unpack(Config.Stables[CurrentVendorIndex].CamHorse)
        fov = 70.0
    elseif data.rideType == "cart" then
        x, y, z, rx, ry, rz = table.unpack(Config.Stables[CurrentVendorIndex].CamCart)
        fov = 50.0
    end


    DestroyCam(instanceCam, true)
    instanceCam = Citizen.InvokeNative(0x40C23491CE83708E,"DEFAULT_SCRIPTED_CAMERA", x, y, z, rx, ry, rz, fov, false, 0);
    SetCamActive(instanceCam, true);
    RenderScriptCams(true, true, 1000, true, true, 0);

end)



RegisterNuiCallback("setDefault", function(data, callback)
    TriggerServerEvent(Events.setDefault, data.newRide, data.prevRide)
end)

RegisterNuiCallback("transfer", function(data, callback)
    local actPlayers = {}
    for i, v in ipairs(GetActivePlayers()) do
        actPlayers[i] = GetPlayerServerId(v)
    end
    TriggerServerEvent(Events.onTransfer, data.rideId, data.selectedChar, data.price, actPlayers)
end)

RegisterNuiCallback("transferRecieve", function(data, callback)local actPlayers = {}
    local actPlayers = {}
    for i, v in ipairs(GetActivePlayers()) do
        actPlayers[i] = GetPlayerServerId(v)
    end
    TriggerServerEvent(Events.onTransferRecieve, data.rideId, data.state, data.price, actPlayers)
end)

RegisterNuiCallback("free", function(data, callback)
    DeleteObject(RidePreviewRef)
    TriggerServerEvent(Events.onDelete, data.rideId)
end)



RegisterNuiCallback("exit", function(data, callback)

    DeleteObject(RidePreviewRef)
	        for _, wheelRef in ipairs(WheelRefs) do
            DeleteObject(wheelRef)
        end
        WheelRefs = {}
    FreezeEntityPosition(PlayerPedId(), false);
    TriggerEvent("vorp:setInstancePlayer", false);
    DestroyAllCams(true)
    SetNuiFocus(false)
end)

function LoadModel(hash)
    if IsModelValid(hash) then
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(100);
        end
        return true
    else
        return false
    end

end
