---@diagnostic disable: undefined-global
------------------------------------------------------------------------------------------------------
------------------------------------------ USERS MENU ------------------------------------------------

local hideUI = false

function OpenTrainerMenu()
    MenuData.CloseAll()


    local elements = {

        { label = _U("Report"),       value = 'report',       desc = _U("reportoptions_desc") },       
        { label = "My Garage",   value = 'Vehicles',     desc = _U("showmyinfo_desc") },		
        { label = "HUD",     value = 'commands',     desc = "Hud Misc Options" },
        { label = "Battlepass",    value = 'menu',         desc = "OPEN BATTLEPASS" },
    }



    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title    = _U("MenuTitle"),
            subtext  = _U("MenuSubTitle"),
            align    = 'top-right',
            elements = elements,
        },
        function(data, menu)
            if data.current == "backup" then
                _G[data.trigger]()
            end

            if data.current.value == "scoreboard" then
                ScoreBoard()
            elseif data.current.value == "report" then
                if not Config.useQWreports then
                    Report()
                else
                    ExecuteCommand("revive")
					menu.close()
                end
            elseif data.current.value == "Boost" then
                Boost()
            elseif data.current.value == "Vehicles" then
                Ironhorses()
            elseif data.current.value == "commands" then
                OpenCommands()
            elseif data.current.value == "menu" then
                ExecuteCommand("battlepass")
                menu.close()
            end
        end,
        function(data, menu)
            menu.close()
        end)
end

-- client.lua
local vehicleConfigs = {}

RegisterNetEvent("receiveVehicleConfig")
AddEventHandler("receiveVehicleConfig", function(config)
    vehicleConfigs = config
end)

-- Request the vehicle config when the resource starts
AddEventHandler("onClientResourceStart", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        TriggerServerEvent("requestVehicleConfig")
    end
end)


function Vehicles()
    MenuData.CloseAll()


    local elements = {

        { label = "Iron Horses",       value = 'Ironhorses',       desc = "Spawn Dealer rides" },       
        { label = "Water Horses",   value = 'Waterhorses',     desc = "Spawn Dealer water rides" },
		
		{ label = "DELETE Vehicle", value = 'deleter', desc = "Deletes your ride" },
    }



    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title    = _U("MenuTitle"),
            subtext  = _U("MenuSubTitle"),
            align    = 'top-right',
            elements = elements,
        },
        function(data, menu)
            if data.current == "backup" then
                
				OpenTrainerMenu()
            end

            if data.current.value == "Ironhorses" then
                Ironhorses()
            elseif data.current.value == "Waterhorses" then
                    Waterhorses()
				elseif data.current.value == "wagonlist" then
                SpawnPeds("peds")
				elseif data.current.value == "deleter" then
                    TriggerEvent("deleteaddons")
				end	
				
        end,

        function(data, menu)
            menu.close()
        end)
end
				
-- Event registration at the top level of the script
RegisterNetEvent("receiveOwnedVehicles")
AddEventHandler("receiveOwnedVehicles", function(ownedVehicles)
    IronhorsesMenu(ownedVehicles)
end)

function Ironhorses()
    TriggerServerEvent("getOwnedVehicles")
end

function IronhorsesMenu(ownedVehicles)
    MenuData.CloseAll()
    local elements = {}
    for _, vehicle in ipairs(ownedVehicles) do
        table.insert(elements, { label = vehicle, value = vehicle, desc = "Select to spawn this vehicle" })
    end

    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title    = "My Garage",
            subtext  = "Custom Server Vehicles",
            align    = 'top-right',
            elements = elements,
        },
        function(data, menu)
            local vehicleModel = data.current.value
            local vehicleConfig = vehicleConfigs[vehicleModel] -- Access the vehicle config here

            if vehicleConfig then
                TriggerServerEvent("addon_vehicles:spawn_car", vehicleConfig)
                menu.close()
            else
                print("Error: No vehicle configuration found for:", vehicleModel)
            end
        end,
        function(data, menu)
            menu.close()
        end)
end


function GetVehicleSpawnCommand(vehicleModel)
    -- Add logic here to map vehicle model to its corresponding spawn command
    -- For example:
    if vehicleModel == "g37" then
        return "g37"
    elseif vehicleModel == "ironsport" then
        return "ironsport"
    -- Add other cases as needed
	elseif vehicleModel == "muscle" then
        return "silocar"
	elseif vehicleModel == "f15078" then
        return "spawn_truck"
    elseif vehicleModel == "policesuv" then
        return "spawn_police2"		
	elseif vehicleModel == "xwing" then
        return "xwing"	
	elseif vehicleModel == "jetski" then
        return "jetwaterhorski"	
	elseif vehicleModel == "ironmobile" then
        return "bat"	
	elseif vehicleModel == "ironmobile2" then
        return "bat2"	
		elseif vehicleModel == "fireplane" then
        return "fireplane"
	elseif vehicleModel == "micahcycle" then
        return "micahcycle"
	elseif vehicleModel == "lancer" then
        return "lancer"
	elseif vehicleModel == "sandrail" then
        return "sandrail"
	elseif vehicleModel == "hellcat" then
        return "hellcat"
	elseif vehicleModel == "ironroadster" then
        return "roadster"
	elseif vehicleModel == "irongtr" then
        return "gtr"
	elseif vehicleModel == "ironmalibu" then
        return "malibu"
	elseif vehicleModel == "tank" then
        return "tank"
		elseif vehicleModel == "ironlambo" then
        return "ironlambo"
		elseif vehicleModel == "ironimpala" then
        return "ironimpala"
		elseif vehicleModel == "irontrucklifted" then
        return "irontrucklifted"
		elseif vehicleModel == "ironcharger" then
        return "ironcharger"
		elseif vehicleModel == "cyberhorse" then
        return "cyberhorse"
		elseif vehicleModel == "ironfranklin" then
        return "ironfranklin"
    end
end


function Waterhorses()
    MenuData.CloseAll()
    local elements = {
        { label = "Jet WaterHorse Ski",        value = 'jetski',   desc = _U("usercommands") },
        { label = "Yacht",        value = 'yacht',   desc = _U("usercommands") },
    }

    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title    = _U("MenuTitle"),
            subtext  = "Custom Server Vehicles",
            align    = 'top-right',
            elements = elements,
            lastmenu = 'OpenUsersMenu', --Go back
        },
        function(data, menu)
            local player = GetPlayerServerId(tonumber(PlayerId()))
            if data.current == "backup" then
                MenuData.CloseAll()
				Vehicles()
            end
            if data.current.value == "yacht" then
                ExecuteCommand("yacht")
				menu.close()
				
			elseif data.current.value == "jetski" then
			ExecuteCommand("jetwaterhorski")
			menu.close()
            end
        end,

        function(data, menu)
            menu.close()
        end)
end




------ REQUEST STAFF ---------------------------------


---------------------------------------------------------------------------------------------------------

function OpenCommands()
    MenuData.CloseAll()
    local elements = {
        { label = "Toggle Chat",        value = 'togglechat',   desc = _U("usercommands") },
        { label = "Toggle UI",          value = 'hideui',     desc = _U("usercommands") },
		{ label = "Toggle Player Names",          value = 'playernames',     desc = _U("usercommands") },
		{ label = "Toggle Crosshair",          value = 'crosshair',     desc = _U("usercommands") },
        { label = _U("cancelanimation"), value = 'cancelanim', desc = _U("usercommands") },
    }

    MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
        {
            title    = _U("MenuTitle"),
            subtext  = _U("MenuSubTitle"),
            align    = 'top-right',
            elements = elements,
            lastmenu = 'OpenUsersMenu', --Go back
        },
        function(data, menu)
            if data.current == "backup" then
			MenuData.CloseAll()
                OpenTrainerMenu()
            end

            if data.current.value == "togglechat" then
                ExecuteCommand("toggleChat")

            elseif data.current.value == "hideui" then
                HideUI()
		    elseif data.current.value == "playernames" then
                ExecuteCommand("playernames")
				elseif data.current.value == "playernames" then
                ExecuteCommand("crosshair")
            elseif data.current.value == "cancelanim" then
                local player = PlayerPedId()
                ClearPedTasksImmediately(player)
            end
        end,
        function(data, menu)
            menu.close()
        end)
end

function DelHorse()
    local player = PlayerPedId()
    local mount  = GetMount(player)
    if IsPedOnMount(player) then
        DeleteEntity(mount)
    else
        TriggerEvent("vorp:TipRight", _U("youneedtobeseatead"), 3000)
    end
end

function Delwagon()
    local player = PlayerPedId()
    local wagon = GetVehiclePedIsIn(player, true)

    if IsPedInAnyVehicle(player, true) then
        wagon = GetVehiclePedIsIn(player, true)
    end
    if DoesEntityExist(wagon) then
        DeleteVehicle(wagon)
        DeleteEntity(wagon)
        TriggerEvent('vorp:TipRight', _U("youdeletedWagon"), 3000)
    else
        TriggerEvent('vorp:TipRight', _U("youneedtobeseatead"), 3000)
    end
end

function HideUI()
    if not hideUI then
        --ExecuteCommand("togglechat")
        DisplayRadar(false)
        DisplayHud(false)
        TriggerEvent("syn_displayrange", false)
        TriggerEvent("vorp:showUi", false)
        hideUI = true
    else
        -- ExecuteCommand("togglechat")
        DisplayRadar(true)
        DisplayHud(true)
        TriggerEvent("syn_displayrange", true)
        TriggerEvent("vorp:showUi", true)
        hideUI = false
    end
end
