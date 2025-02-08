local vehicles = Config.Vehicles
local currentVehicle = nil 
local clonePed = nil
local cloneOffsets = nil 
local distanceStates = nil 
local currentRotationAngle = 0.0
local turnSmoothing = 5.0
local thrusterCurrentRotationAngle = 0.0
local thrusterTargetRotationAngle = 0.0
local thrusterRotationSpeed = 1.0  
local thrusterRotated = false
local currentForce = 0  
local decayRate = 0.02  -- Rate at which the force decreases when Shift is not pressed
local doorOpen = false
local maxDoorRotationAngle = 34.0  -- Maximum angle to open the OSPREY door
local doorRotationSpeed = 1.0      -- Speed of rotation
local currentDoorRotationAngle = 0.0
local currentBaseSpeed = 0
local maxBaseSpeed = 3.2
local speedIncrement = 0.005 -- Adjust this value for smoother acceleration
local maxSpeedMPH = 40
local maxSpeedMetersPerSecond = maxSpeedMPH / 2.23694
local currentRotationAngle = 0.0
-- Initialize car variables
local currentRotationAngle = 0.0
local turningRight = false
local turningLeft = false
local currentTurnAngle = 0.0
local turnSmoothing = 20.0
local new_ptfx_dictionary = "core"
local new_ptfx_name = "ent_amb_smoke_cabin"
local is_particle_effect_active = false
local current_ptfx_handles = {}
local vKey = 0x7F8D09B8
local currentStateIndex = 1
local camDistance = distanceStates and distanceStates[currentStateIndex] or 1.0
local animationPlayed = false  
local objectVisible = true 
   -- Key codes for controls
    local keyD = 0x7065027D  
    local keyA = 0xB4E465B4  
    local keyW = 0x8FD015D8  
    local keyShift = 0x8FFC75D6  
    local keyAlt = 0x8AAA0AD4
    local keyS = 0xD27782E3
    local keyLeftClick = 0x07CE1E61
    local keyRightClick = 0xF84FA74F
    local keySpace = 0xD9D0E1C0


local function spawnVehicle(vehicleConfig)
   ExecuteCommand(Config.DeleteCommand)
    Citizen.Wait(150)
    if not currentVehicle then
        local pc = GetEntityCoords(PlayerPedId())        	
		local vehicleModel = GetHashKey(vehicleConfig.objectModel)
		local attach = vehicleConfig.attachOffsets
		if vehicleConfig.weaponType then 
		weaponType = vehicleConfig.weaponType 
	end
	if vehicleConfig.soundType == 'truck' then 
	idleSound = "truckidle.wav"   
	startSound = "truckstart.wav"   
	stopSound = "truckstop.wav"   
	elseif vehicleConfig.soundType == 'bigtruck' then 
	idleSound = "bigtruckidle.wav"   
	startSound = "bigtruckstart.wav"   
	stopSound = "bigtruckstop.wav"   
	elseif vehicleConfig.soundType == 'bat' then 
	idleSound = "batidle.wav"   
	startSound = "batstart.wav"   
	stopSound = "batstop.wav"   
	elseif vehicleConfig.soundType == 'camaro' then 
	idleSound = "camaroidle.wav"   
	startSound = "camarostart.wav"   
	stopSound = "camarostop.wav"  
	elseif vehicleConfig.soundType == 'dirtbike' then 
	idleSound = "dirtbikeidle.wav"   
	startSound = "dirtbikestart.wav"   
	stopSound = "dirtbikestop.wav"  
	elseif vehicleConfig.soundType == 'electric' then 
	idleSound = "electricidle.wav"   
	startSound = "electricstart.wav"   
	stopSound = "electricstop.wav"  	
	elseif vehicleConfig.soundType == 'hellcat' then 
	idleSound = "hellcatidle.wav"   
	startSound = "hellcatstart.wav"   
	stopSound = "hellcatstop.wav"   
	elseif vehicleConfig.soundType == 'heli' then 
	idleSound = "heliidle.wav"   
	startSound = "helistart.wav"   
	stopSound = "helistop.wav"   
	elseif vehicleConfig.soundType == 'chopper' then 
	idleSound = "chopperbikeidle.wav"   
	startSound = "chopperbikestart.wav"   
	stopSound = "chopperbikestop.wav"   
	elseif vehicleConfig.soundType == 'moped' then 
	idleSound = "mopedidle.wav"   
	startSound = "mopedstart.wav"   
	stopSound = "mopedstop.wav"   
	elseif vehicleConfig.soundType == 'mustang' then 
	idleSound = "mustangidle.wav"   
	startSound = "mustangstart.wav"   
	stopSound = "mustangstop.wav"   
	elseif vehicleConfig.soundType == 'oldtruck' then 
	idleSound = "oldtruckidle.wav"   
	startSound = "oldtruckstart.wav"   
	stopSound = "oldtruckstop.wav"   
	elseif vehicleConfig.soundType == 'lambo' then 
	idleSound = "lamboidle.wav"   
	startSound = "lambostart.wav"   
	stopSound = "lambostop.wav"   
	elseif vehicleConfig.soundType == 'lancer' then 
	idleSound = "lanceridle.wav"   
	startSound = "lancerstart.wav"   
	stopSound = "lancerstop.wav"   
	elseif vehicleConfig.soundType == 'plane' then 
	idleSound = "planeidle.wav"   
	startSound = "planestart.wav"   
	stopSound = "planestop.wav"   
	elseif vehicleConfig.soundType == 'jet' then 
	idleSound = "jetidle.wav"   
	startSound = "jetstart.mp3"   
	stopSound = "jetstop.wav"   
	elseif vehicleConfig.soundType == 'speedboat' then 
	idleSound = "speedboatidle.wav"   
	startSound = "speedboatstart.wav"   
	stopSound = "speedboatstop.wav"   
	elseif vehicleConfig.soundType == 'sport' then 
	idleSound = "sportcaridle.wav"   
	startSound = "sportcarstart.wav"   
	stopSound = "sportcarstop.wav"   
	elseif vehicleConfig.soundType == 'vintage' then 
	idleSound = "vintageidle.wav"   
	startSound = "vintagestart.wav"   
	stopSound = "vintagestop.wav"   
	elseif vehicleConfig.soundType == 'xwing' then 
	idleSound = "xwingidle.wav"   
	startSound = "xwingstart.wav"   
	stopSound = "xwingstop.wav"   
	elseif vehicleConfig.soundType == 'jetski' then 
	idleSound = "jetskiidle.wav"   
	startSound = "jetskistart.wav"   
	stopSound = "jetskistop.wav"   
	else
	idleSound = "batidle.mp3"   
	startSound = "truckstart.wav"   
	stopSound = "truckstop.wav"   
	end		
		if vehicleConfig.type == 'bike' or vehicleConfig.type == 'car' then
        local model = GetHashKey("coach4")
        if Config.AltHandling then
            model = GetHashKey("buggy01")
        end		       						
        local frontWheelModel = GetHashKey(vehicleConfig.frontWheelModel)
        local rearWheelModel = GetHashKey(vehicleConfig.rearWheelModel)      
        RequestModel(model)
        RequestModel(vehicleModel)
        RequestModel(rearWheelModel)
        RequestModel(frontWheelModel)     
        while not HasModelLoaded(model) or not HasModelLoaded(vehicleModel) or not HasModelLoaded(frontWheelModel) or not HasModelLoaded(rearWheelModel) do
            Citizen.Wait(5)
        end
        local vehicle = CreateVehicle(model, pc.x + 2.0, pc.y, pc.z, (pc.h or 1.0), 1, 1, 0)
        Citizen.Wait(150)
        FreezeEntityPosition(vehicle, 1)
        SetEntityVisible(vehicle, 0)
        Citizen.Wait(150)
        local obj = CreateObject(vehicleModel, pc.x, pc.y, pc.z, 1, 1, 1)
        Citizen.Wait(300)
		if Config.AltHandling then
        -- Adjust the z position for AltHandling
        local adjustedZ = attach[3] + 0.2
        AttachEntityToEntity(obj, vehicle, 0, attach[1], attach[2], adjustedZ, attach[4], attach[5], attach[6], 0, 1, 1, 0, 0, 2)
    else
        -- Normal attachment
        AttachEntityToEntity(obj, vehicle, 0, attach[1], attach[2], attach[3], attach[4], attach[5], attach[6], 0, 1, 1, 0, 0, 2)
    end         wheels = { front = {}, rear = {} } 
            frontWheelOffsets = vehicleConfig.frontWheelOffsets
            rearWheelOffsets = vehicleConfig.rearWheelOffsets
			frontDistanceToGrnd = vehicleConfig.frontDistanceToGrnd
			frontSuspensionUpperLimit = vehicleConfig.frontSuspensionUpperLimit
			frontSuspensionLowerLimit = vehicleConfig.frontSuspensionLowerLimit
			rearDistanceToGrnd = vehicleConfig.rearDistanceToGrnd
			rearSuspensionUpperLimit = vehicleConfig.rearSuspensionUpperLimit
			rearSuspensionLowerLimit = vehicleConfig.rearSuspensionLowerLimit
			
            for _, offset in ipairs(rearWheelOffsets) do
                local x, y, z = table.unpack(GetEntityCoords(vehicle, false))
                local rearWheel = CreateObject(rearWheelModel, x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(wheels.rear, rearWheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(rearWheel, obj, 0, offset.x, offset.y, offset.z, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end
            for _, offset in ipairs(frontWheelOffsets) do
                local x, y, z = table.unpack(GetEntityCoords(vehicle, false))
                local frontWheel = CreateObject(frontWheelModel, x + offset.x, y + offset.y, z + offset.z, 1, 1, 1)
                table.insert(wheels.front, frontWheel)
                local orientationAngle = (offset.x > 0) and 180.0 or 0.0
                AttachEntityToEntity(frontWheel, obj, 0, offset.x, offset.y, offset.z, 0, 0, orientationAngle, 0, 1, 1, 0, 0, 2)
            end        
        local exhaustModel = GetHashKey("p_pebble01x")
        RequestModel(exhaustModel)
        while not HasModelLoaded(exhaustModel) do
            Citizen.Wait(5)
        end
        local exhausts = {}
        if vehicleConfig.exhaustOffsets then
            for _, exhaustOffset in ipairs(vehicleConfig.exhaustOffsets) do
                local x, y, z = table.unpack(GetEntityCoords(vehicle, false))
                local exhaust = CreateObject(exhaustModel, x + exhaustOffset.x, y + exhaustOffset.y, z + exhaustOffset.z, true, true, true)
                AttachEntityToEntity(exhaust, obj, 0, exhaustOffset.x, exhaustOffset.y, exhaustOffset.z, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                table.insert(exhausts, exhaust)
				
            end
        else
            print("No exhaust offsets found for this vehicle.")
        end        		
		if vehicleConfig.AltTopSpeed and vehicleConfig.AltAccelMultiplier then 
		 AltTopSpeed = vehicleConfig.AltTopSpeed 
		 AltAccelMultiplier = vehicleConfig.AltAccelMultiplier
		end		
		Citizen.Wait(50)
        local vehicleData = {
            vehicle = vehicle,
            object = obj,
            engine = false,
            headlights = false,
            intruck = false,
            curr_speed = 0,
            wheels = wheels,
            exhausts = exhausts,
			weaponType = weaponType,
			AltTopSpeed = AltTopSpeed,
			AltAccelMultiplier = AltAccelMultiplier,
			type = "car"
        }

        Citizen.Wait(50)
        currentVehicle = vehicleData       
        FreezeEntityPosition(vehicle, 0)
        SetModelAsNoLongerNeeded(model)
        SetModelAsNoLongerNeeded(vehicleModel)
        SetModelAsNoLongerNeeded(rearWheelModel)
        SetModelAsNoLongerNeeded(frontWheelModel)
        Citizen.Wait(1)
        SetVehicleLights(vehicle, 1)
        
        local headlightModel = GetHashKey("p_steamerlight01x")
		local brakelightModel = GetHashKey("p_stageshelllight_red01x")
        RequestModel(headlightModel)
		RequestModel(brakelightModel)
        while not HasModelLoaded(headlightModel) do
            Citizen.Wait(5)
        end
        local headlights = {}
		local brakeLights = {}
		for i = 1, #vehicleConfig.headlightOffsets do
		local headlight = CreateObject(headlightModel, pc.x, pc.y, pc.z, 1, 1, 1)
		table.insert(headlights, headlight)
	end
		for i = 1, #vehicleConfig.brakelightOffsets do
		local brakeLight = CreateObject(brakelightModel, pc.x, pc.y, pc.z, 1, 1, 1)
		table.insert(brakeLights, brakeLight)
	end

	Citizen.Wait(100)
	for i, offset in ipairs(vehicleConfig.headlightOffsets) do
    AttachEntityToEntity(headlights[i], obj, 0, offset.x, offset.y, offset.z, offset.rx, offset.ry, offset.rz, 0, 0, 0, 0, 0, 2)
    SetEntityVisible(headlights[i], false)
	
	end
	for i, offset in ipairs(vehicleConfig.brakelightOffsets) do
    AttachEntityToEntity(brakeLights[i], obj, 0, offset.x, offset.y, offset.z, offset.rx, offset.ry, offset.rz, 0, 0, 0, 0, 0, 2)
    SetEntityVisible(brakeLights[i], false)	
	end
        currentVehicle.headlights = headlights
        currentVehicle.brakeLights = brakeLights              
    else
        if vehicleConfig.type == 'plane' then
		local model = GetHashKey("boatsteam02x")
		RequestModel(model)
        RequestModel(vehicleModel)
		while not HasModelLoaded(model) or not HasModelLoaded(vehicleModel) do
		Citizen.Wait(5)
		end
		local vehicle = CreateVehicle(model, pc.x + 2.0, pc.y, pc.z, (pc.h or 1.0), 1, 1, 0)
    Citizen.Wait(150)
    FreezeEntityPosition(vehicle, 1)
    SetEntityVisible(vehicle, 0)
    Citizen.Wait(150)
    local obj = CreateObject(vehicleModel, pc.x, pc.y, pc.z, 1, 1, 1)
    Citizen.Wait(300)
    AttachEntityToEntity(obj, vehicle, 0, attach[1], attach[2], attach[3], attach[4], attach[5], attach[6], 0, 1, 1, 0, 0, 2)	
	if vehicleConfig.propellerOffsets then
	propellerOffset = vehicleConfig.propellerOffsets  
	end
	
		local propellerModel = GetHashKey(vehicleConfig.propellerModel)
		RequestModel(propellerModel)
		while not HasModelLoaded(propellerModel) do
    Citizen.Wait(5)
	end
		local propeller = CreateObject(propellerModel, pc.x, pc.y, pc.z, true, true, true)
		AttachEntityToEntity(propeller, vehicle, 0, propellerOffset.x, propellerOffset.y, propellerOffset.z, 0, 0, 0, false, false, true)
		FreezeEntityPosition(vehicle, 0)

	local vehicleData = {
        vehicle = vehicle, 
        object = obj,
        engine = false,    
        invehicle = false,
		propeller = propeller,
        curr_speed = 0,
		weaponType = weaponType,
        type = "plane"   		
        
      }
      
      Citizen.Wait(50)
       currentVehicle = vehicleData
	   
	   SetModelAsNoLongerNeeded(model)

	end
		if  vehicleConfig.type == 'jet' then
		local model = GetHashKey("boatsteam02x")
		RequestModel(model)
        RequestModel(vehicleModel)
		while not HasModelLoaded(model) or not HasModelLoaded(vehicleModel) do
		Citizen.Wait(5)
		end
		local vehicle = CreateVehicle(model, pc.x + 2.0, pc.y, pc.z, (pc.h or 1.0), 1, 1, 0)
    Citizen.Wait(150)
    FreezeEntityPosition(vehicle, 1)
    SetEntityVisible(vehicle, 0)
    Citizen.Wait(150)
    local obj = CreateObject(vehicleModel, pc.x, pc.y, pc.z, 1, 1, 1)
    Citizen.Wait(300)
    AttachEntityToEntity(obj, vehicle, 0, attach[1], attach[2], attach[3], attach[4], attach[5], attach[6], 0, 1, 1, 0, 0, 2)
	-- Request and load the propeller model		
	FreezeEntityPosition(vehicle, 0)

		local exhaustModel = GetHashKey("p_pebble04x")
        RequestModel(exhaustModel)
        while not HasModelLoaded(exhaustModel) do
            Citizen.Wait(5)
        end
        local exhausts = {}
        if vehicleConfig.exhaustOffsets then
            for _, exhaustOffset in ipairs(vehicleConfig.exhaustOffsets) do
                local x, y, z = table.unpack(GetEntityCoords(vehicle, false))
                local exhaust = CreateObject(exhaustModel, x + exhaustOffset.x, y + exhaustOffset.y, z + exhaustOffset.z, true, true, true)
                AttachEntityToEntity(exhaust, vehicle, 0, exhaustOffset.x, exhaustOffset.y, exhaustOffset.z, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                table.insert(exhausts, exhaust)
            end
        else
            print("No exhaust offsets found for this vehicle.")
        end

		local vehicleData = {
        vehicle = vehicle, 
        object = obj,
        engine = false,    
        invehicle = false,
		exhausts = exhausts,
        curr_speed = 0,
		weaponType = weaponType,
        type = "jet"   		        
      }      
      Citizen.Wait(50)
       currentVehicle = vehicleData	   
	   SetModelAsNoLongerNeeded(model)
	end
		if vehicleConfig.type == 'heli' then 
		local model = GetHashKey("boatsteam02x")
		RequestModel(model)
        RequestModel(vehicleModel)
		while not HasModelLoaded(model) or not HasModelLoaded(vehicleModel) do
		Citizen.Wait(5)
		end
		local vehicle = CreateVehicle(model, pc.x + 2.0, pc.y, pc.z, (pc.h or 1.0), 1, 1, 0)
		Citizen.Wait(150)
		FreezeEntityPosition(vehicle, 1)
		SetEntityVisible(vehicle, 0)
		Citizen.Wait(150)
		local obj = CreateObject(vehicleModel, pc.x, pc.y, pc.z, 1, 1, 1)
		Citizen.Wait(300)
		AttachEntityToEntity(obj, vehicle, 0, attach[1], attach[2], attach[3], attach[4], attach[5], attach[6], 0, 1, 1, 0, 0, 2)
    local topPropellerModel = GetHashKey(vehicleConfig.topbladeModel)
    RequestModel(topPropellerModel)	
    while not HasModelLoaded(topPropellerModel) do
        Citizen.Wait(5)
    end
    topPropellerOffset = vehicleConfig.topbladeOffsets 
    local topPropeller = CreateObject(topPropellerModel, pc.x, pc.y, pc.z, true, true, true)
    AttachEntityToEntity(topPropeller, vehicle, 0, topPropellerOffset.x, topPropellerOffset.y, topPropellerOffset.z, 0, 0, 0, false, false, true)
    local rearBladeModel = GetHashKey(vehicleConfig.rearbladeModel)
    RequestModel(rearBladeModel)
    while not HasModelLoaded(rearBladeModel) do
        Citizen.Wait(5)
    end
    rearBladeOffset = vehicleConfig.rearbladeOffsets 
    local rearBlade = CreateObject(rearBladeModel, pc.x, pc.y, pc.z, true, true, true)
    AttachEntityToEntity(rearBlade, vehicle, 0, rearBladeOffset.x, rearBladeOffset.y, rearBladeOffset.z, 0, 0, 0, false, false, true)		
	if vehicleConfig.weaponType then 
	local weaponType = vehicleConfig.weaponType
	end

	local vehicleData = {
    vehicle = vehicle, 
    object = obj,
    engine = false,    
    invehicle = false,
    curr_speed = 0,        
    topPropeller = topPropeller, 
    rearBlade = rearBlade, 
	weaponType = weaponType,
	type = "heli"
	}
    
    Citizen.Wait(50)
    currentVehicle = vehicleData
    FreezeEntityPosition(vehicle, 0)
    SetModelAsNoLongerNeeded(model)
    SetModelAsNoLongerNeeded(vehicleModel)
    Citizen.Wait(1)  	
	end		
		if vehicleConfig.type == 'boat' then 
		if IsEntityInWater(PlayerPedId()) then
		local model = GetHashKey("boatsteam02x")
		RequestModel(model)
        RequestModel(vehicleModel)
		while not HasModelLoaded(model) or not HasModelLoaded(vehicleModel) do
		Citizen.Wait(5)
		end
		local vehicle = CreateVehicle(model, pc.x + 2.0, pc.y, pc.z, (pc.h or 1.0), 1, 1, 0)
    Citizen.Wait(150)
    FreezeEntityPosition(vehicle, 1)
    SetEntityVisible(vehicle, 0)
    Citizen.Wait(150)
    local obj = CreateObject(vehicleModel, pc.x, pc.y, pc.z, 1, 1, 1)
    Citizen.Wait(300)
    AttachEntityToEntity(obj, vehicle, 0, attach[1], attach[2], attach[3], attach[4], attach[5], attach[6], 0, 1, 1, 0, 0, 2)
	
	local vehicleData = {
    vehicle = vehicle, 
    object = obj,
    engine = false,    
    invehicle = false,
    curr_speed = 0,        
	type = "boat"
	}
	Citizen.Wait(50)
	currentVehicle = vehicleData
	FreezeEntityPosition(vehicle, 0)
else
    print("You must be in water to spawn a boat.")
	TriggerServerEvent("Notification:NeedWaterToSpawn")
		end
	end --boat end
	
		if vehicleConfig.type == 'tank' then 
		local model = GetHashKey("coach4")
        if Config.AltHandling then
            model = GetHashKey("buggy01")
			end
		RequestModel(model)
        RequestModel(vehicleModel)
		while not HasModelLoaded(model) or not HasModelLoaded(vehicleModel) do
		Citizen.Wait(5)
		end
		local vehicle = CreateVehicle(model, pc.x + 2.0, pc.y, pc.z, (pc.h or 1.0), 1, 1, 0)
    Citizen.Wait(150)
    FreezeEntityPosition(vehicle, 1)
    SetEntityVisible(vehicle, 0)
    Citizen.Wait(150)
    local obj = CreateObject(vehicleModel, pc.x, pc.y, pc.z, 1, 1, 1)
    Citizen.Wait(300)
    AttachEntityToEntity(obj, vehicle, 0, attach[1], attach[2], attach[3], attach[4], attach[5], attach[6], 0, 1, 1, 0, 0, 2)
	
	local tanktop = CreateObject(vehicleConfig.tanktopModel, pc.x + 3.0, pc.y, pc.z, (pc.h or 1.0), 1, 1, 1) 
  tanktopOffsets = vehicleConfig.tanktopOffsets
  AttachEntityToEntity(tanktop, vehicle, 0, tanktopOffsets.x, tanktopOffsets.y, tanktopOffsets.z, tanktopOffsets.rx, tanktopOffsets.ry, tanktopOffsets.rz, 0, 1, 1, 0, 0, 2)
	
	local vehicleData = {
    vehicle = vehicle, 
    object = obj,
	tanktop = tanktop,
    engine = false,    
    invehicle = false,
    curr_speed = 0,        
	type = "tank"
	}
	Citizen.Wait(50)
	currentVehicle = vehicleData
	FreezeEntityPosition(vehicle, 0)
	end --tank end
	
		if vehicleConfig.type == 'osprey' then 
	local model = GetHashKey("boatsteam02x")
	local doormodel = GetHashKey(vehicleConfig.doorModel)
		RequestModel(model)
		RequestModel(doormodel)
        RequestModel(vehicleModel)
		while not HasModelLoaded(model) or not HasModelLoaded(vehicleModel) do
		Citizen.Wait(5)
		end
		local vehicle = CreateVehicle(model, pc.x + 2.0, pc.y, pc.z, (pc.h or 1.0), 1, 1, 0)
    Citizen.Wait(150)
	doorattach = vehicleConfig.doorattachOffsets	
    FreezeEntityPosition(vehicle, 1)
    SetEntityVisible(vehicle, 0)
    Citizen.Wait(150)
    local obj = CreateObject(vehicleModel, pc.x, pc.y, pc.z, 1, 1, 1)
    Citizen.Wait(300)
    AttachEntityToEntity(obj, vehicle, 0, attach[1], attach[2], attach[3], attach[4], attach[5], attach[6], 0, 1, 1, 0, 0, 2)
	local doorobj = CreateObject(doormodel, pc.x + 3.0, pc.y, pc.z, (pc.h or 1.0), 1, 1, 0)
    Citizen.Wait(50)
    AttachEntityToEntity(doorobj, vehicle, 0, doorattach[1], doorattach[2], doorattach[3], doorattach[4], doorattach[5], doorattach[6], 0, 1, 1, 0, 0, 2)
    local rightthrusterModel = GetHashKey(vehicleConfig.rightthrusterModel)
    RequestModel(rightthrusterModel)   
    while not HasModelLoaded(rightthrusterModel) do
        Citizen.Wait(15)
    end    
    local leftthrusterModel = GetHashKey(vehicleConfig.leftthrusterModel)
    RequestModel(leftthrusterModel)    
    while not HasModelLoaded(leftthrusterModel) do
        Citizen.Wait(15)
    end
	    leftThrustOffset = vehicleConfig.leftthrusterattachOffsets 
        local Leftthruster = CreateObject(leftthrusterModel, pc.x, pc.y, pc.z, true, true, true)
    AttachEntityToEntity(Leftthruster, vehicle, 0, leftThrustOffset.x, leftThrustOffset.y, leftThrustOffset.z, 0, 0, 0, false, false, true, false, 2, true)
        rightThrustOffset = vehicleConfig.rightthrusterattachOffsets  
    local rightThruster = CreateObject(rightthrusterModel, pc.x, pc.y, pc.z, true, true, true)
    AttachEntityToEntity(rightThruster, vehicle, 0, rightThrustOffset.x, rightThrustOffset.y, rightThrustOffset.z, 0, 0, 0, false, false, true, false, 2, true)
    local topPropellerModel = GetHashKey(vehicleConfig.bladeModel)
    RequestModel(topPropellerModel)    
    while not HasModelLoaded(topPropellerModel) do
        Citizen.Wait(15)
    end
    topPropellerOffset = vehicleConfig.rightbladeOffsets 
    local topPropeller = CreateObject(topPropellerModel, pc.x, pc.y, pc.z, true, true, true)
    AttachEntityToEntity(topPropeller, Leftthruster, 0, 0, 0, topPropellerOffset.z, 0, 0, 0, false, false, true, false, 2, true)
    local rearBladeModel = GetHashKey(vehicleConfig.bladeModel)
    RequestModel(rearBladeModel)
    while not HasModelLoaded(rearBladeModel) do
        Citizen.Wait(15)
    end
    rearBladeOffset = vehicleConfig.leftbladeOffsets 
    local rearBlade = CreateObject(rearBladeModel, pc.x, pc.y, pc.z, true, true, true)
    AttachEntityToEntity(rearBlade, rightThruster, 0, 0, 0, rearBladeOffset.z, 0, 0, 0, false, false, true, false, 2, true)	
	local vehicleData = {
    vehicle = vehicle, 
    object = obj,
	doorobj = doorobj,
	leftThruster = Leftthruster,
	rightThruster = rightThruster,
	topPropeller = topPropeller,
	rearBlade = rearBlade,
    engine = false,    
    invehicle = false,
    curr_speed = 0,
	weaponType = weaponType,
	type = "osprey"
	}
	Citizen.Wait(50)
	currentVehicle = vehicleData
	FreezeEntityPosition(vehicle, 0)	
	end -- osprey end
	
		if vehicleConfig.type == 'cargobob' then 
	local model = GetHashKey("boatsteam02x")
	local doormodel = GetHashKey(vehicleConfig.doorModel)
	RequestModel(model)
	RequestModel(doormodel)
    RequestModel(vehicleModel)
	while not HasModelLoaded(model) or not HasModelLoaded(vehicleModel) do
		Citizen.Wait(5)
		end
		local vehicle = CreateVehicle(model, pc.x + 2.0, pc.y, pc.z, (pc.h or 1.0), 1, 1, 0)
    Citizen.Wait(150)
	doorattach = vehicleConfig.doorattachOffsets	
    FreezeEntityPosition(vehicle, 1)
    SetEntityVisible(vehicle, 0)
    Citizen.Wait(150)
    local obj = CreateObject(vehicleModel, pc.x, pc.y, pc.z, 1, 1, 1)
    Citizen.Wait(300)
    AttachEntityToEntity(obj, vehicle, 0, attach[1], attach[2], attach[3], attach[4], attach[5], attach[6], 0, 1, 1, 0, 0, 2)
	local doorobj = CreateObject(doormodel, pc.x + 3.0, pc.y, pc.z, (pc.h or 1.0), 1, 1, 0)
    Citizen.Wait(50)
    AttachEntityToEntity(doorobj, vehicle, 0, doorattach[1], doorattach[2], doorattach[3], doorattach[4], doorattach[5], doorattach[6], 0, 1, 1, 0, 0, 2)
    local topPropellerModel = GetHashKey(vehicleConfig.bladeModel)
    RequestModel(topPropellerModel)    
    while not HasModelLoaded(topPropellerModel) do
        Citizen.Wait(15)
    end
    topPropellerOffset = vehicleConfig.frontbladeOffsets 
    local topPropeller = CreateObject(topPropellerModel, pc.x, pc.y, pc.z, true, true, true)
    AttachEntityToEntity(topPropeller, vehicle, 0, topPropellerOffset.x, topPropellerOffset.y, topPropellerOffset.z, 0, 0, 0, false, false, true, false, 2, true)
    local rearBladeModel = GetHashKey(vehicleConfig.bladeModel)
    RequestModel(rearBladeModel)
    while not HasModelLoaded(rearBladeModel) do
        Citizen.Wait(15)
    end
    rearBladeOffset = vehicleConfig.rearbladeOffsets  
    local rearBlade = CreateObject(rearBladeModel, pc.x, pc.y, pc.z, true, true, true)
    AttachEntityToEntity(rearBlade, vehicle, 0, rearBladeOffset.x, rearBladeOffset.y, rearBladeOffset.z, 0, 0, 0, false, false, true, false, 2, true)
	local vehicleData = {
    vehicle = vehicle, 
    object = obj,
	doorobj = doorobj,
	topPropeller = topPropeller,
	rearBlade = rearBlade,
    engine = false,    
    invehicle = false,
    curr_speed = 0,
	weaponType = weaponType,
	type = "cargobob"
}
Citizen.Wait(50)
currentVehicle = vehicleData
	FreezeEntityPosition(vehicle, 0)
	
	end -- cargobob end	
   end
        cloneOffsets = {
            position = {
                x = vehicleConfig.cloneOffsets.x,
                y = vehicleConfig.cloneOffsets.y,
                z = vehicleConfig.cloneOffsets.z
            },
            rotation = {
                rx = vehicleConfig.cloneOffsets.rx,
                ry = vehicleConfig.cloneOffsets.ry,
                rz = vehicleConfig.cloneOffsets.rz
            }
        }
        distanceStates = vehicleConfig.ThirdPersonCamDistances
	end
end -- end of spawn logic

function AdjustAircraftPitch(vehicle, pitchDirection)
    local pitch, roll, yaw = table.unpack(GetEntityRotation(vehicle, 2))    
    -- Adjust pitch based on direction; use a smaller increment for smoother rotation
    local pitchSpeed = 0.38  -- Adjust this value for smoother or faster rotation
    pitch = pitch + (pitchDirection * pitchSpeed)
    SetEntityRotation(vehicle, pitch, roll, yaw, 2, true)
end
function AdjustAircraftOrientation(vehicle, rollDirection, yawDirection)
    local pitch, roll, yaw = table.unpack(GetEntityRotation(vehicle, 2))
    
    local rotationSpeed = 0.5  -- Adjust this value for smoother or faster rotation
    roll = roll + (rollDirection * rotationSpeed)
    yaw = yaw + (yawDirection * rotationSpeed)

    SetEntityRotation(vehicle, pitch, roll, yaw, 2, true)
end

Citizen.CreateThread(function()
    local wasInVehicle = false
    local minVolume = 0.15  -- Define the minimum volume here
    while true do
        Citizen.Wait(100)  
        if currentVehicle and currentVehicle.engine then
            local vehicle = currentVehicle.vehicle
            local speed = GetEntitySpeed(vehicle) 
			local playerCoords = GetEntityCoords(PlayerPedId())
            local vehicleCoords = GetEntityCoords(vehicle)
            local distance = #(playerCoords - vehicleCoords) -- Calculate the distance to the vehicle
			if currentVehicle.type == 'car' or currentVehicle.type == 'bike' or currentVehicle.type == 'boat' or currentVehicle.type == 'tank' then
			minVolume = 0.15 - (distance) * 0.006
			else
			minVolume = 0.15 - (distance) * 0.003
			end
    if minVolume < 0.00 then
        minVolume = 0.00
		end
            local gearBoost = 0
            if IsControlPressed(0, keyShift) and currentVehicle.inVehicle then
			if currentVehicle.type == 'car' or currentVehicle.type == 'bike' then
                if speed < 20 then
                    gearBoost = 12.0  -- Gear 1 boost                
                end
				else
				gearBoost = 8.0
				end
            end
            speed = speed + gearBoost  -- Apply the sound based on the current gear
			-- Cap the rate at 200
            if speed > 200 then
                speed = 200
            end
            if not wasInVehicle then
                SendNUIMessage({
                    key = "onEnteredVehicle",
                    soundFile = idleSound,  
                    minVolume = minVolume  
                })
                wasInVehicle = true
            else
                SendNUIMessage({
                    key = "onSpeedChanged",
                    value = speed,  
                    minVolume = minVolume 
                })
            end
        else
            if wasInVehicle then
                SendNUIMessage({
                    key = "onStopVehicle",
					soundFile = stopSound
                })
                wasInVehicle = false
            end
        end
    end
end)
local scaleSet = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if Config.AltHandling and not scaleSet then 
            if currentVehicle and currentVehicle.vehicle then 
			if currentVehicle.type == "car" or currentVehicle.type == "bike" then
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local radius = 10.0
                
                -- Get the closest ped (including horses)
                local retval, closestPed = GetClosestPed(playerCoords.x, playerCoords.y, playerCoords.z, radius, true, true, false, false, true, -1)

                if retval and DoesEntityExist(closestPed) then
                    SetPedScale(closestPed, 0.8)
                    scaleSet = true  
                else
                    Citizen.Wait(100)
                end
            else
                Citizen.Wait(100)
            end
		  end
        end 
    end	
end)
	
    -- Update loop for controlling the ospreycopter based on keypress
Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10)
            
            if currentVehicle and currentVehicle.type == 'osprey' then
                currentVehicle.inVehicle = IsPedInVehicle(PlayerPedId(), currentVehicle.vehicle, 1)
                if currentVehicle.inVehicle then
                if DoesEntityExist(currentVehicle.vehicle) then
                    local speedMetersPerSecond = GetEntitySpeed(currentVehicle.vehicle)
                    local speedMPH = speedMetersPerSecond * 2.23694
                    local curr_speed = string.format("%.1f", speedMPH) -- formatted speed

                    if flightMode then
                        -- Plane mode
                        if IsControlPressed(0, keyShift) then
                            if speedMPH < 5 and GetEntityHeightAboveGround(currentVehicle.vehicle) < 7 then
                                currentForce = 0.888  -- Set the desired lift speed
                                currentForce = math.max(0, currentForce - decayRate)
                                ApplyForceToEntityCenterOfMass(currentVehicle.vehicle, 1, 0.0, 0.0, currentForce, true, true, true, true)
                            elseif speedMPH >= 5 or GetEntityHeightAboveGround(currentVehicle.vehicle) >= 17 then
                                SetVehicleForwardSpeed(currentVehicle.vehicle, speedMetersPerSecond + 0.13)
                            end
                        end
                    else
                        -- Heli mode
                        if IsControlPressed(0, keyShift) then
                            currentForce = 0.99  -- Set the desired lift speed when Shift is pressed
                        else
                            currentForce = math.max(0, currentForce - decayRate)
                        end
                        ApplyForceToEntityCenterOfMass(currentVehicle.vehicle, 1, 0.0, 0.0, currentForce, true, true, true, true)
                    end
                        
                        -- Adjust aircraft orientation on A or D press
                        if IsControlPressed(0, keyA) and not IsControlPressed(0, keyAlt) then
                            AdjustAircraftOrientation(currentVehicle.vehicle, 1, 0)  -- Roll Left
                        elseif IsControlPressed(0, keyD) and not IsControlPressed(0, keyAlt) then
                            AdjustAircraftOrientation(currentVehicle.vehicle, -1, 0)  -- Roll Right
                        end
                        
                        -- Adjust yaw on A or D press with Alt
                        if IsControlPressed(0, keySpace) and IsControlPressed(0, keyA) then
                            AdjustAircraftOrientation(currentVehicle.vehicle, 0, -1)  -- Yaw Left
                        elseif IsControlPressed(0, keySpace) and IsControlPressed(0, keyD) then
                            AdjustAircraftOrientation(currentVehicle.vehicle, 0, 1)   -- Yaw Right
                        end
                        
                        if IsControlJustPressed(0, keyLeftClick) then
                            if doorOpen then
                                -- Close the door
                                while currentDoorRotationAngle > 0 do
                                    Citizen.Wait(10)
                                    currentDoorRotationAngle = currentDoorRotationAngle - doorRotationSpeed
                                    AttachEntityToEntity(currentVehicle.doorobj, currentVehicle.vehicle, 0, doorattach[1], doorattach[2], doorattach[3], currentDoorRotationAngle, doorattach[5], doorattach[6], 0, 1, 1, 0, 0, 2) 
                                end
                                currentDoorRotationAngle = 0
                            else
                                -- Open the door
                                while currentDoorRotationAngle < maxDoorRotationAngle do
                                    Citizen.Wait(10)
                                    currentDoorRotationAngle = currentDoorRotationAngle + doorRotationSpeed
                                    AttachEntityToEntity(currentVehicle.doorobj, currentVehicle.vehicle, 0, doorattach[1], doorattach[2], doorattach[3], currentDoorRotationAngle, doorattach[5], doorattach[6], 0, 1, 1, 0, 0, 2)
                                end
                                currentDoorRotationAngle = maxDoorRotationAngle
                            end
                            doorOpen = not doorOpen  -- Toggle the door state
                        end

                        if IsControlJustPressed(0, keyRightClick) then
						flightMode = not flightMode
                            thrusterRotated = not thrusterRotated
                            thrusterTargetRotationAngle = thrusterRotated and 90.0 or 0.0
                        end

                        if thrusterCurrentRotationAngle ~= thrusterTargetRotationAngle then
                            if thrusterCurrentRotationAngle < thrusterTargetRotationAngle then
                                thrusterCurrentRotationAngle = thrusterCurrentRotationAngle + thrusterRotationSpeed
                                if thrusterCurrentRotationAngle > thrusterTargetRotationAngle then
                                    thrusterCurrentRotationAngle = thrusterTargetRotationAngle
                                end
                            else
                                thrusterCurrentRotationAngle = thrusterCurrentRotationAngle - thrusterRotationSpeed
                                if thrusterCurrentRotationAngle < thrusterTargetRotationAngle then
                                    thrusterCurrentRotationAngle = thrusterTargetRotationAngle
                                end
                            end

                            AttachEntityToEntity(currentVehicle.leftThruster, currentVehicle.vehicle, 0, leftThrustOffset.x, leftThrustOffset.y, leftThrustOffset.z, -thrusterCurrentRotationAngle, 0.0, 0.0, false, false, true, false, 2, true)
                            AttachEntityToEntity(currentVehicle.rightThruster, currentVehicle.vehicle, 0, rightThrustOffset.x, rightThrustOffset.y, rightThrustOffset.z, -thrusterCurrentRotationAngle, 0.0, 0.0, false, false, true, false, 2, true)
                            AttachEntityToEntity(currentVehicle.topPropeller, currentVehicle.leftThruster, 0, 0, 0, topPropellerOffset.z, 0, 0, -thrusterCurrentRotationAngle, false, false, true, false, 2, true)
                            AttachEntityToEntity(currentVehicle.rearBlade, currentVehicle.rightThruster, 0, 0, 0, topPropellerOffset.z, 0, 0, -thrusterCurrentRotationAngle, false, false, true, false, 2, true)
                        end

                        -- Adjust pitch on W or S press if speed is less than 20 MPH
                        if speedMPH < 20 then
                            if IsControlPressed(0, keyW) then
                                AdjustAircraftPitch(currentVehicle.vehicle, -1)  -- Pitch Down
                            elseif IsControlPressed(0, keyS) then
                                AdjustAircraftPitch(currentVehicle.vehicle, 1)   -- Pitch Up
                            end
                        end
                    end
                end
            end
        end
    end)  
    
  local function RotationToDirection(rotation)
	local adjustedRotation = 
	{ 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local direction = 
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		z = math.sin(adjustedRotation.x)
	}
	return direction
end
------------------------------------------------------------------------------------------------------------------------------------------
local function RayCastGamePlayCamera(distance)
	local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination = 
	{ 
		x = cameraCoord.x + direction.x * distance, 
		y = cameraCoord.y + direction.y * distance, 
		z = cameraCoord.z + direction.z * distance 
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, -1, 1))
	return b, c, e
end
  
  function lerp(a, b, t)
    return a + (b - a) * t
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if currentVehicle and currentVehicle.engine and currentVehicle.type == 'osprey' then
            local vehicleSpeed = GetEntitySpeed(currentVehicle.vehicle)

            -- Increment base speed smoothly until it reaches the max base speed
            if currentBaseSpeed < maxBaseSpeed then
                currentBaseSpeed = math.min(currentBaseSpeed + speedIncrement, maxBaseSpeed)
            end
            if vehicleSpeed > maxSpeedMetersPerSecond then
                vehicleSpeed = maxSpeedMetersPerSecond
            end

            local rotSpeedIncrement = -3.0 * (currentBaseSpeed + vehicleSpeed)
            currentRotationAngle = (currentRotationAngle + rotSpeedIncrement) % 360
            AttachEntityToEntity(currentVehicle.topPropeller, currentVehicle.leftThruster, 0, topPropellerOffset.x, topPropellerOffset.y, topPropellerOffset.z, 0, 0, currentRotationAngle, 0, 1, 1, 0, 0, 2)
                        AttachEntityToEntity(currentVehicle.rearBlade, currentVehicle.rightThruster, 0, rearBladeOffset.x, rearBladeOffset.y, rearBladeOffset.z, 0, 0, currentRotationAngle, 0, 1, 1, 0, 0, 2)
        end
    end
end)

Citizen.CreateThread(function()
    local smoothFactor = 0.1 -- Determines the smoothness (lower is smoother)
    local lastRotY, lastRotZ = 0, 0 -- Keep track of the last rotation for smoothing

    while true do
        if currentVehicle and currentVehicle.inVehicle and currentVehicle.type == "tank" then
            local camRot = GetGameplayCamRot(2)
            local vehRot = GetEntityRotation(currentVehicle.vehicle, 2)
            local deltaRotY = camRot.y - vehRot.y
            local deltaRotZ = camRot.z - vehRot.z
            local targetRotY = deltaRotY
            local targetRotZ = deltaRotZ
            local smoothedRotY = lerp(lastRotY, targetRotY, smoothFactor)
            local smoothedRotZ = lerp(lastRotZ, targetRotZ, smoothFactor)
            lastRotY, lastRotZ = smoothedRotY, smoothedRotZ
            AttachEntityToEntity(currentVehicle.tanktop, currentVehicle.vehicle, 0, tanktopOffsets.x, tanktopOffsets.y, tanktopOffsets.z, tanktopOffsets.rx, smoothedRotY, smoothedRotZ, 0, false, false, false, 2, true)			
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(20)
        if Config.AltHandling then 
            if currentVehicle then
                currentVehicle.inVehicle = IsPedInVehicle(PlayerPedId(), currentVehicle.vehicle, 1)
                
                if currentVehicle.type == "car" or currentVehicle.type == "bike" then
                    if currentVehicle.inVehicle then
                        local vehicle = currentVehicle.vehicle
                        
                        if DoesEntityExist(vehicle) then
                            local speed = GetEntitySpeed(vehicle)
                            local speedMph = speed * 2.23694  -- Convert m/s to mph
                            local vehicleHeightAboveGround = GetEntityHeightAboveGround(vehicle)
                            if vehicleHeightAboveGround <= 0.67 then
                                if IsControlPressed(0, keyShift) and speedMph < currentVehicle.AltTopSpeed and speedMph > 10 and not IsControlPressed(0, keyA) and not IsControlPressed(0, keyD) then
                                    SetVehicleForwardSpeed(vehicle, speed + currentVehicle.AltAccelMultiplier)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()    
    while true do
        Wait(0) 

        if currentVehicle and currentVehicle.inVehicle then
		if currentVehicle.type == "tank" then
		local pressed = false  -- Track whether the fire button has been pressed to prevent repeated firing
    local explosionTag_id = 27  -- Define the explosion tag here
    local damageScale = 1.0  -- Define the scale of the explosion damage here
            if IsControlPressed(0, keySpace) then 
                if not pressed then
                    pressed = true
                    
                    -- Perform raycasting with offset to avoid self-damage
                    local cameraRotation = GetGameplayCamRot(2)
                    local cameraCoord = GetGameplayCamCoord()
                    local direction = RotationToDirection(cameraRotation)
                    local forwardOffset = 20.0  -- Move start point 10 units forward
                    local startCoord = {
                        x = cameraCoord.x + direction.x * forwardOffset,
                        y = cameraCoord.y + direction.y * forwardOffset,
                        z = cameraCoord.z + direction.z * forwardOffset
                    }
                    local distance = 1000.0
                    local destination = {
                        x = startCoord.x + direction.x * distance,
                        y = startCoord.y + direction.y * distance,
                        z = startCoord.z + direction.z * distance
                    }
                    local rayHandle = StartShapeTestRay(startCoord.x, startCoord.y, startCoord.z, destination.x, destination.y, destination.z, -1, -1, 1)
                    local _, hit, hitCoords, _, hitEntity = GetShapeTestResult(rayHandle)

                    if hit then
                        Citizen.InvokeNative(0x7D6F58F69DA92530, hitCoords.x, hitCoords.y, hitCoords.z, explosionTag_id, damageScale, true, false, true)
                    else
                        print("Raycast did not hit")
                    end
                    Citizen.Wait(1000)
                    pressed = false 
                end
            else
                if pressed then
                    pressed = false 
                end
            end
        else
            Wait(500) 
        end
    end
	end
end)

Citizen.CreateThread(function()        
    while true do
        Wait(10) 
        if currentVehicle and currentVehicle.inVehicle and currentVehicle.weaponType == 'a10' then
		local explosionTag_id = 0  -- Define the explosion tag here
    local damageScale = 1.0  -- Define the scale of the explosion damage here
		
            if IsControlPressed(0, keyLeftClick) then 
                                    local vehicle = currentVehicle.vehicle
                    local vehicleCoords = GetEntityCoords(vehicle)
                    local forwardVector = GetEntityForwardVector(vehicle)
                    local forwardOffset = 10.0  -- Adjust the forward offset as needed
                    local startCoord = {
                        x = vehicleCoords.x + forwardVector.x * forwardOffset,
                        y = vehicleCoords.y + forwardVector.y * forwardOffset,
                        z = vehicleCoords.z + forwardVector.z * forwardOffset
                    }
                    local distance = 1000.0  -- Shooting distance
                    local destination = {
                        x = startCoord.x + forwardVector.x * distance,
                        y = startCoord.y + forwardVector.y * distance,
                        z = startCoord.z + forwardVector.z * distance
                    }
                    local rayHandle = StartShapeTestRay(startCoord.x, startCoord.y, startCoord.z, destination.x, destination.y, destination.z, -1, -1, 1)
                    local _, hit, hitCoords, _, hitEntity = GetShapeTestResult(rayHandle)

                    if hit then
                        Citizen.InvokeNative(0x7D6F58F69DA92530, hitCoords.x, hitCoords.y, hitCoords.z, explosionTag_id, damageScale, true, false, true)
                    else
                        print("Raycast did not hit")
                    end

                    Citizen.Wait(10)                                   
            end
        else
            Wait(500) 
        end
    end
end)

Citizen.CreateThread(function()      
    while true do
        Wait(250) 

        if currentVehicle and currentVehicle.inVehicle and currentVehicle.weaponType == 'xwing' then
		local explosionTag_id = 26  -- Define the explosion tag here
    local damageScale = 1.0  -- Define the scale of the explosion damage here
            if IsControlPressed(0, keyLeftClick) then  
                    local vehicle = currentVehicle.vehicle
                    local vehicleCoords = GetEntityCoords(vehicle)
                    local forwardVector = GetEntityForwardVector(vehicle)
                    local forwardOffset = 10.0  -- Adjust the forward offset as needed
                    local startCoord = {
                        x = vehicleCoords.x + forwardVector.x * forwardOffset,
                        y = vehicleCoords.y + forwardVector.y * forwardOffset,
                        z = vehicleCoords.z + forwardVector.z * forwardOffset
                    }
                    local distance = 1000.0  -- Shooting distance
                    local destination = {
                        x = startCoord.x + forwardVector.x * distance,
                        y = startCoord.y + forwardVector.y * distance,
                        z = startCoord.z + forwardVector.z * distance
                    }
                    local rayHandle = StartShapeTestRay(startCoord.x, startCoord.y, startCoord.z, destination.x, destination.y, destination.z, -1, -1, 1)
                    local _, hit, hitCoords, _, hitEntity = GetShapeTestResult(rayHandle)

                    if hit then
                        -- Trigger explosion effect at hit coordinates
                        Citizen.InvokeNative(0x7D6F58F69DA92530, hitCoords.x - 4.0, hitCoords.y, hitCoords.z, explosionTag_id, damageScale, true, false, true)
						Citizen.InvokeNative(0x7D6F58F69DA92530, hitCoords.x + 4.0, hitCoords.y, hitCoords.z, explosionTag_id, damageScale, true, false, true)
                    else
                        print("Raycast did not hit")
                    end

             
                    Citizen.Wait(100)  
            end
        else
            Wait(500) 
        end
    end
end)

local currentRotationAngle = 0.0
local turnSmoothing = 5.0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if currentVehicle then
		if currentVehicle.type == "plane" then
    
            local vehicleSpeed = GetEntitySpeed(currentVehicle.vehicle)
            local rotSpeedIncrement = -3.0 * vehicleSpeed
            currentRotationAngle = (currentRotationAngle + rotSpeedIncrement) % 360

            local offset = propellerOffset  
            local finalRotationAngle = currentRotationAngle 

            AttachEntityToEntity(currentVehicle.propeller, currentVehicle.vehicle, 0, propellerOffset.x, propellerOffset.y, propellerOffset.z, 0.0, finalRotationAngle, 0.0, 0, 1, 1, 0, 0, 2)
        end
    end
	end
end)

Citizen.CreateThread(function()
    local isSKeyPressed = false
        while true do
        Citizen.Wait(10)        
        if currentVehicle and currentVehicle.brakeLights then
		if currentVehicle.type == "car" or currentVehicle.type == "bike" then
		
            if IsControlPressed(0, keyS) then
                if not isSKeyPressed then
                    isSKeyPressed = true
                    for _, brakeLight in ipairs(currentVehicle.brakeLights) do
                        SetEntityVisible(brakeLight, true)
                    end
                end
            else
                if isSKeyPressed then
                    isSKeyPressed = false
                    for _, brakeLight in ipairs(currentVehicle.brakeLights) do
                        SetEntityVisible(brakeLight, false)
                    end
					end
                end
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if currentVehicle and currentVehicle.inVehicle then
            if currentVehicle.type == "car" or currentVehicle.type == "bike" then
                -- Control input for turning
                if IsControlJustPressed(0, keyA) then
                    turningLeft = true
                elseif IsControlJustReleased(0, keyA) then
                    turningLeft = false
                end

                if IsControlJustPressed(0, keyD) then
                    turningRight = true
                elseif IsControlJustReleased(0, keyD) then
                    turningRight = false
                end

                -- Vehicle speed and direction calculation
                local vehicleSpeed = GetEntitySpeed(currentVehicle.vehicle)
                local forwardVector = GetEntityForwardVector(currentVehicle.vehicle)
                local vx, vy, vz = table.unpack(GetEntityVelocity(currentVehicle.vehicle))
                local dotProduct = forwardVector.x * vx + forwardVector.y * vy + forwardVector.z * vz
                local directionMultiplier = (dotProduct >= 0) and 1.0 or -1.0
                local rotSpeedIncrement = -3.0 * vehicleSpeed * directionMultiplier

                -- Turn angle smoothing
                local targetTurnAngle = 0.0
                if turningRight then
                    targetTurnAngle = 30.0
                elseif turningLeft then
                    targetTurnAngle = -30.0
                end

                currentTurnAngle = currentTurnAngle + (targetTurnAngle - currentTurnAngle) / turnSmoothing
                currentRotationAngle = currentRotationAngle + rotSpeedIncrement

                -- Suspension logic (front wheels)
                local originalFrontDistanceToGround = frontDistanceToGrnd  -- Suspension height for front

                for i, frontWheel in ipairs(wheels.front) do
                    local wheelPosition = frontWheelOffsets[i]  -- Wheel position offset
                    local orientationAngle = (wheelPosition.x > 0) and 180.0 or 0.0
                    local rotationAngle = (wheelPosition.x > 0) and -currentRotationAngle or currentRotationAngle

                    -- Get the current distance from the ground
                    local currentDistanceToGround = GetEntityHeightAboveGround(frontWheel)
                    local distanceDifference = originalFrontDistanceToGround - currentDistanceToGround

                    if math.abs(distanceDifference) > 0.01 then  -- Threshold to avoid unnecessary updates
                        wheelPosition.z = wheelPosition.z + distanceDifference
                    end

                    -- Clamp the suspension within min/max limits
                    if wheelPosition.z < frontSuspensionLowerLimit then
                        wheelPosition.z = frontSuspensionLowerLimit
                    elseif wheelPosition.z > frontSuspensionUpperLimit then
                        wheelPosition.z = frontSuspensionUpperLimit
                    end

                    -- Attach the wheel to the vehicle
                    AttachEntityToEntity(frontWheel, currentVehicle.object, 0, wheelPosition.x, wheelPosition.y, wheelPosition.z, rotationAngle, 0.0, orientationAngle + currentTurnAngle, 0, 1, 1, 0, 0, 2)
                end

                -- Suspension logic (rear wheels)
                local originalRearDistanceToGround = rearDistanceToGrnd  -- Suspension height for rear

                for i, rearWheel in ipairs(wheels.rear) do
                    local wheelPosition = rearWheelOffsets[i]  -- Wheel position offset
                    local orientationAngle = (wheelPosition.x > 0) and 180.0 or 0.0
                    local rotationAngle = (wheelPosition.x > 0) and -currentRotationAngle or currentRotationAngle

                    -- Get the current distance from the ground
                    local currentDistanceToGround = GetEntityHeightAboveGround(rearWheel)
                    local distanceDifference = originalRearDistanceToGround - currentDistanceToGround

                    if math.abs(distanceDifference) > 0.01 then  -- Threshold to avoid unnecessary updates
                        wheelPosition.z = wheelPosition.z + distanceDifference
                    end

                    -- Clamp the suspension within min/max limits
                    if wheelPosition.z < rearSuspensionLowerLimit then
                        wheelPosition.z = rearSuspensionLowerLimit
                    elseif wheelPosition.z > rearSuspensionUpperLimit then
                        wheelPosition.z = rearSuspensionUpperLimit
                    end

                    -- Attach the wheel to the vehicle
                    AttachEntityToEntity(rearWheel, currentVehicle.object, 0, wheelPosition.x, wheelPosition.y, wheelPosition.z, rotationAngle, 0.0, orientationAngle, 0, 1, 1, 0, 0, 2)
                end

                -- Keep the rotation angle within bounds (0-360)
                if currentRotationAngle >= 360.0 then
                    currentRotationAngle = 0.0
                end
            end
        end
    end
end)



-- Update loop for turning front wheels based on keypress
local currentForce = 0  -- Initialize the current force applied
local decayRate = 0.0099  -- Rate at which the force decreases when Shift is not pressed

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)		       
        if currentVehicle then
		if currentVehicle.type == "plane" or currentVehicle.type == "jet" then
            currentVehicle.inVehicle = IsPedInVehicle(PlayerPedId(), currentVehicle.vehicle, 1)			
            if currentVehicle.inVehicle then
                if DoesEntityExist(currentVehicle.vehicle) then
                    local speed = GetEntitySpeed(currentVehicle.vehicle)
                    local heightAboveGround = GetEntityHeightAboveGround(currentVehicle.vehicle)
                    
                    if IsControlPressed(0, keyShift) then
                        if speed < 5 and heightAboveGround < 7 then
                            -- Apply force to center of mass
                            currentForce = 0.888  -- Set the desired lift speed
                            -- Gradually decrease the force when Shift is not pressed
                        currentForce = math.max(0, currentForce - decayRate)
                        ApplyForceToEntityCenterOfMass(currentVehicle.vehicle, 1, 0.0, 0.0, currentForce, true, true, true, true)
                        elseif speed >= 5 or heightAboveGround >= 17 then
                            -- Increase speed
                            SetVehicleForwardSpeed(currentVehicle.vehicle, speed + 0.13)
                        end
                    
                    end
                end
            end
			end
        end
    end
end)
-- Clone Ped Logic
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player, false)

        if currentVehicle and currentVehicle.vehicle and DoesEntityExist(vehicle) and vehicle == currentVehicle.vehicle and not DoesEntityExist(clonePed) then
            Citizen.CreateThread(function()
                Citizen.Wait(2)
                SetEntityVisible(player, false, false)
            end)

            local cloneCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -2.0, 0.0)
            clonePed = ClonePed(player, GetEntityHeading(player), false, true)
            SetEntityCoordsNoOffset(clonePed, cloneCoords.x, cloneCoords.y, cloneCoords.z, true, true, true)
            
            RequestAnimDict("script_re@check_point@small_cart")
            while not HasAnimDictLoaded("script_re@check_point@small_cart") do
                Citizen.Wait(100)
            end
            TaskPlayAnim(
                clonePed, 
                "script_re@check_point@small_cart", 
                "int_loop_driver", 
                8.0, 
                1.0, 
                -1, 
                1, 
                0.1, 
                0, 
                0, 
                0  
            )

            -- Use the global cloneOffsets
            AttachEntityToEntity(
                clonePed, currentVehicle.object, 0,
                cloneOffsets.position.x, cloneOffsets.position.y, cloneOffsets.position.z,
                cloneOffsets.rotation.rx, cloneOffsets.rotation.ry, cloneOffsets.rotation.rz,
                false, false, false, false, 2, true
            )
            SetEntityVisible(clonePed, false, false)

            Citizen.CreateThread(function()
                Citizen.Wait(700)
                SetEntityVisible(clonePed, true, false)
                SetBlockingOfNonTemporaryEvents(clonePed, true)
            end)
        elseif (not currentVehicle or not currentVehicle.vehicle or not DoesEntityExist(vehicle) or vehicle ~= currentVehicle.vehicle) and DoesEntityExist(clonePed) then
            SetEntityVisible(player, true, false)
            DeleteEntity(clonePed)                    
            clonePed = nil

        end
    end
end)

function EnumerateVehicles()
    return coroutine.wrap(function()
        local handle, vehicle = FindFirstVehicle()
        if not vehicle then
            EndFindVehicle(handle)
            return
        end
        local success
        repeat
            coroutine.yield(vehicle)
            success, vehicle = FindNextVehicle(handle)
        until not success

        EndFindVehicle(handle)
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)  -- Loop checks every 10 milliseconds
		if currentVehicle then
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local closestVehicle
        local closestDistance = 5.0  -- Set a maximum range to search for vehicles

        -- Find the closest vehicle
        for vehicle in EnumerateVehicles() do
            local vehicleCoords = GetEntityCoords(vehicle)
            local distance = #(playerCoords - vehicleCoords)
            if distance < closestDistance then
                closestVehicle = vehicle
                closestDistance = distance
            end
        end

        -- Check if "E" is pressed, the closest vehicle is found, and it matches currentVehicle.vehicle
        if closestVehicle and closestVehicle == currentVehicle.vehicle and IsControlJustPressed(0, 0xCEFD9220) then  -- "E" key
            TaskWarpPedIntoVehicle(playerPed, closestVehicle, -1)  -- Warp player into the driver seat
        end
		end
    end
end)		

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)  

        if currentVehicle then

            if currentVehicle.inVehicle and currentVehicle.type == "boat" then
                    local speed = GetEntitySpeed(currentVehicle.vehicle)
                    local speedMph = speed * 2.23694  -- Convert m/s to mph

                    -- Check if "W" key is pressed and speed is less than 150 mph
                    if IsControlPressed(0, keyW) and speedMph < 80 and not IsControlPressed(0, 0xD27782E3) then
                        SetVehicleForwardSpeed(currentVehicle.vehicle, speed + 0.25)
                    end
                end
            end		
       end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if currentVehicle then
            if currentVehicle.inVehicle then
			if currentVehicle.type == "plane" or currentVehicle.type == "jet" then
                if IsControlPressed(0, keyA) and not IsControlPressed(0, keySpace) then
                    AdjustAircraftOrientation(currentVehicle.vehicle, 0, -1)  -- Yaw Left
                elseif IsControlPressed(0, keyD) and not IsControlPressed(0, keySpace) then
                    AdjustAircraftOrientation(currentVehicle.vehicle, 0, 1)  -- Yaw Right
                end

                if IsControlPressed(0, keySpace) and IsControlPressed(0, keyD) then
                    AdjustAircraftOrientation(currentVehicle.vehicle, -1, 0)  -- Roll Left
                elseif IsControlPressed(0, keySpace) and IsControlPressed(0, keyA) then
                    AdjustAircraftOrientation(currentVehicle.vehicle, 1, 0)   -- Roll Right
                end
            end
			end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Check if the helicopter exists and the engine is on
        if currentVehicle and currentVehicle.engine then
		if currentVehicle.type == "heli" or currentVehicle.type == "cargobob" then
            -- Logic to calculate rotation speed increment based on the helicopter's speed
            local vehicleSpeed = GetEntitySpeed(currentVehicle.vehicle)

            -- Increment base speed smoothly until it reaches the max base speed
            if currentBaseSpeed < maxBaseSpeed then
                currentBaseSpeed = math.min(currentBaseSpeed + speedIncrement, maxBaseSpeed)
            end

            -- Cap the vehicle speed to the max speed
            if vehicleSpeed > maxSpeedMetersPerSecond then
                vehicleSpeed = maxSpeedMetersPerSecond
            end

            local rotSpeedIncrement = -3.0 * (currentBaseSpeed + vehicleSpeed)
            currentRotationAngle = (currentRotationAngle + rotSpeedIncrement) % 360
			
			if currentVehicle.type == "cargobob" then
			AttachEntityToEntity(currentVehicle.topPropeller, currentVehicle.vehicle, 0, topPropellerOffset.x, topPropellerOffset.y, topPropellerOffset.z, 0.0, 0.0, currentRotationAngle, 0, 1, 1, 0, 0, 2)
			AttachEntityToEntity(currentVehicle.rearBlade, currentVehicle.vehicle, 0, rearBladeOffset.x, rearBladeOffset.y, rearBladeOffset.z, 0.0, 0.0, currentRotationAngle, 0, 1, 1, 0, 0, 2)
			else

            AttachEntityToEntity(currentVehicle.topPropeller, currentVehicle.vehicle, 0, topPropellerOffset.x, topPropellerOffset.y, topPropellerOffset.z, 0.0, 0.0, currentRotationAngle, 0, 1, 1, 0, 0, 2)
            
            AttachEntityToEntity(currentVehicle.rearBlade, currentVehicle.vehicle, 0, rearBladeOffset.x, rearBladeOffset.y, rearBladeOffset.z, currentRotationAngle, 0.0, 0.0, 0, 1, 1, 0, 0, 2)
			end
        end
		end
    end
end)

-- Update loop for controlling the helicopter based on keypress
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
		if currentVehicle then
        currentVehicle.inVehicle = IsPedInVehicle(PlayerPedId(), currentVehicle.vehicle, 1)
        if currentVehicle.inVehicle then
		if currentVehicle.type == "heli" or currentVehicle.type == "cargobob" then
                    local speedMetersPerSecond = GetEntitySpeed(currentVehicle.vehicle)
                    local speedMPH = speedMetersPerSecond * 2.23694
                    local curr_speed = string.format("%.1f", speedMPH) -- formatted speed
                    
                    -- Adjust vertical velocity on Shift press
                    if IsControlPressed(0, keyShift) then
                        currentForce = 0.99  -- Set the desired lift speed when Shift is pressed
                    else
                        -- Gradually decrease the force when Shift is not pressed
                        currentForce = math.max(0, currentForce - decayRate)
                    end
                    
                    -- Apply the current force to the vehicle
                    ApplyForceToEntityCenterOfMass(currentVehicle.vehicle, 1, 0.0, 0.0, currentForce, true, true, true, true) --- MAKE THIS NEGATIVE W FLAGS WONTT WORKK CAUSE ITS THE SAME HELLI ONLY
                    
                    -- Adjust aircraft orientation on A or D press
                    if IsControlPressed(0, keyA) and not IsControlPressed(0, keySpace) then
                        AdjustAircraftOrientation(currentVehicle.vehicle, 1, 0)  -- Roll Left
                    elseif IsControlPressed(0, keyD) and not IsControlPressed(0, keySpace) then
                        AdjustAircraftOrientation(currentVehicle.vehicle, -1, 0)  -- Roll Right
                    end
                    
                    -- Adjust yaw on A or D press with Alt
                    if IsControlPressed(0, keySpace) and IsControlPressed(0, keyA) then
                        AdjustAircraftOrientation(currentVehicle.vehicle, 0, -1)  -- Yaw Left
                    elseif IsControlPressed(0, keySpace) and IsControlPressed(0, keyD) then
                        AdjustAircraftOrientation(currentVehicle.vehicle, 0, 1)   -- Yaw Right
                    end

                    -- Adjust pitch on W or S press if speed is less than 20 MPH
                    if speedMPH < 20 then
                        if IsControlPressed(0, keyW) then
                            AdjustAircraftPitch(currentVehicle.vehicle, -1)  -- Pitch Down
                        elseif IsControlPressed(0, keyS) then
                            AdjustAircraftPitch(currentVehicle.vehicle, 1)   -- Pitch Up
                        end
                    
                    end
               end
           end
		end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)      
        if currentVehicle then           
            if currentVehicle.inVehicle then
                local vehicle = currentVehicle.vehicle
                
                    -- Change the camera distance if V key is pressed
                    if IsControlJustPressed(0, vKey) and IsFirstPersonCameraActive() == 0 then
                        currentStateIndex = currentStateIndex + 1
                        if currentStateIndex > #distanceStates then
                            currentStateIndex = 1
                        end
                        camDistance = distanceStates[currentStateIndex]
                        
                    end
					SetThirdPersonCamOrbitDistanceLimitsThisUpdate(1.0, camDistance)

                    -- Set the third-person camera distance
                    if IsFirstPersonCameraActive() == 1 then
                        -- Get the head bone location of the entity "cloneped"
                        local headBone = GetEntityBoneIndexByName(clonePed, "HEAD")
                        local headPos = GetPedBoneCoords(clonePed, headBone)
                        SetGameplayCamFollowPedThisUpdate(clonePed)

                        Citizen.SetTimeout(550, function()
                            SetEntityVisible(clonePed, false, false)
                            ClearPedTasks(clonePed)
                            animationPlayed = false  -- Reset the flag when the clone is hidden
                        end)
                    else
                        if not animationPlayed then  -- Check if the animation has not been played
                            SetEntityVisible(clonePed, true, false)
                            TaskPlayAnim(
                                clonePed, 
                                "script_re@check_point@small_cart", 
                                "int_loop_driver", 
                                8.0, 
                                1.0, 
                                -1, 
                                1, 
                                0.1, 
                                0, 
                                0, 
                                0  
                            )
                            animationPlayed = true  -- Set the flag to indicate the animation has been played
                        end
                    end
                
            end
        end
    end
end)

if not Config or not Config.Vehicles then
    print("Error: Config or Config.Vehicles is not properly defined.")
end

RegisterCommand("balboni", function(source, args)
    if Config.SpawnCommand then 
        local vehicleType = args[1] or "truck" 
        local vehicleConfig = Config.Vehicles[vehicleType]
        if vehicleConfig then
            TriggerServerEvent("addon_vehicles:spawn_car", vehicleConfig)
        else
            print("Error: Vehicle type not found in configuration.")
        end
    end
end, false)

RegisterNetEvent("addon_vehicles:spawn_c", function(vehicleConfig)
    spawnVehicle(vehicleConfig)
end)

local function toggleObjectVisibility()
    if currentVehicle and currentVehicle.object then
        objectVisible = not objectVisible
        SetEntityVisible(currentVehicle.object, objectVisible)
        if currentVehicle.wheels.front then 
            for _, wheel in ipairs(currentVehicle.wheels.front) do  
                SetEntityVisible(wheel, objectVisible) 
            end
        end      
        if currentVehicle.wheels.rear then 
            for _, wheel in ipairs(currentVehicle.wheels.rear) do  
                SetEntityVisible(wheel, objectVisible)  
            end
        end
    end
end

RegisterCommand(Config.DeleteCommand, function(_, args)
    if currentVehicle then 	
        DeleteEntity(currentVehicle.vehicle)       
        DeleteEntity(currentVehicle.object)
		if weaponType then
		weaponType = nil
		end	
		if currentVehicle.type == 'bike' or currentVehicle.type == 'car' then
		for _, handle in ipairs(current_ptfx_handles) do
                        StopParticleFxLooped(handle, false)
                    end
                    current_ptfx_handles = {}
                    is_particle_effect_active = false
		for _, exhaust in ipairs (currentVehicle.exhausts) do
        DeleteEntity(exhaust)
		end
		for _, headlight in ipairs(currentVehicle.headlights) do
            DeleteEntity(headlight)
        end
		for _, brakeLight in ipairs(currentVehicle.brakeLights) do
            DeleteEntity(brakeLight)
        end
        for _, wheel in ipairs(currentVehicle.wheels.front) do
            DeleteEntity(wheel)
        end
        for _, wheel in ipairs(currentVehicle.wheels.rear) do
            DeleteEntity(wheel)
        end	
		end
		if currentVehicle.type == 'heli' or currentVehicle.type == 'osprey' or currentVehicle.type == 'cargobob' then	
            DeleteEntity(currentVehicle.topPropeller)       	
            DeleteEntity(currentVehicle.rearBlade)
			 DeleteEntity(currentVehicle.leftThruster)
			 DeleteEntity(currentVehicle.rightThruster)
			 DeleteEntity(currentVehicle.doorobj)			 			 
		end
		if currentVehicle.type == 'tank' then		
            DeleteEntity(currentVehicle.tanktop)       		                  
		end
		if currentVehicle.type == 'plane' then		
            DeleteEntity(currentVehicle.propeller)        		                    
		end
        if clonePed then
            DeleteEntity(clonePed)
            clonePed = nil
        end
		firstEntry = true
		scaleSet = false
        currentVehicle = nil
		SetEntityVisible(PlayerPedId(), true)
    end
end)

firstEntry = true
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        Citizen.Wait(10)
        
        if currentVehicle then  
            if currentVehicle.inVehicle then  
                local vehicleEntity = GetVehiclePedIsIn(PlayerPedId())              
                if IsControlPressed(0, Config.Engine) or firstEntry then
                    if not currentVehicle.engine then
                        Citizen.Wait(500)
						-- Send a message to the NUI layer to start playing the audio
                SendNUIMessage({
                    key = "onStartVehicle",
					soundFile = startSound
                    
                })
                        Citizen.Wait(500)
						SetVehicleEngineOn(vehicleEntity, 1, 1)
						currentVehicle.particlesActive = true
						if currentVehicle.type == 'bike' or currentVehicle.type == 'car' then
                        for _, headlight in ipairs(currentVehicle.headlights) do
                            SetEntityVisible(headlight, true)
                        end
						
						end
						firstEntry = false
                    else
					
                        SetVehicleEngineOn(vehicleEntity, 0, 0)
						currentVehicle.particlesActive = false
						
						if currentVehicle.type == 'bike' or currentVehicle.type == 'car' then
                        for _, headlight in ipairs(currentVehicle.headlights) do
                            SetEntityVisible(headlight, false)
                        end
						end
                        Citizen.Wait(2000)
                    end               
                    currentVehicle.engine = not currentVehicle.engine
                    Citizen.Wait(1200)
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do  
        Citizen.Wait(2000)         
        if currentVehicle then  
            local vehicleEntity = currentVehicle.vehicle  
            local isDriveable = IsVehicleDriveable(vehicleEntity, false, false)
            if not isDriveable and currentVehicle.engine then
                SetVehicleEngineOn(vehicleEntity, 0, 0)
                SetEntityVisible(currentVehicle.headlights[1], false)
                SetEntityVisible(currentVehicle.headlights[2], false)
                SetEntityVisible(currentVehicle.headlights[3], false)
                Citizen.Wait(200)
                currentVehicle.engine = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if currentVehicle and currentVehicle.inVehicle then
            if (currentVehicle.type == 'bike' or currentVehicle.type == 'car') and currentVehicle.particlesActive then
                if not is_particle_effect_active then
                    -- Load the particle effect dictionary
                    if not HasNamedPtfxAssetLoaded(new_ptfx_dictionary) then
                        RequestNamedPtfxAsset(new_ptfx_dictionary)
                        while not HasNamedPtfxAssetLoaded(new_ptfx_dictionary) do
                            Citizen.Wait(0)
                        end
                    end

                    -- Start particle effects on each exhaust
                    for _, exhaust in ipairs(currentVehicle.exhausts) do
                        local coords = GetEntityCoords(exhaust)
                        UseParticleFxAsset(new_ptfx_dictionary)
                        local handle = StartParticleFxLoopedOnEntity(new_ptfx_name, exhaust, 0.0, -0.2, -0.0, 0.0, 0.0, 0.0, 0.5, false, false, false)
                        table.insert(current_ptfx_handles, handle)
                    end
                    is_particle_effect_active = true
                end
            else
                if is_particle_effect_active then
                    -- Stop particle effects on each exhaust
                    for _, handle in ipairs(current_ptfx_handles) do
                        StopParticleFxLooped(handle, false)
                    end
                    current_ptfx_handles = {}
                    is_particle_effect_active = false
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    local color1, color2 = {126,0,0, 200}, {126,0,0, 200}
    while true do
        Citizen.Wait(5)
        if currentVehicle then     
            if currentVehicle.inVehicle then
                local speedMetersPerSecond = GetEntitySpeed(currentVehicle.vehicle)
                local speedMPH = speedMetersPerSecond * 2.23694
                local curr_speed = string.format("%.1f", speedMPH)
                if currentVehicle and currentVehicle.engine then
                    color2 = {0,126,0, 200}
                else
                    color2 = {126,0,0, 200}
                end
                if currentVehicle and currentVehicle.headlights then
                    color1 = {0,126,0, 200}
                else
                    color1 = {126,0,0, 200}
                end
                SetTextColor(126,0,0, 215)
                SetTextScale(0.35,0.35)
                SetTextFontForCurrentCommand(0)
                SetTextCentre(1)
                local str = CreateVarString(10, "LITERAL_STRING", curr_speed.."mph", Citizen.ResultAsLong())
                DisplayText(str,0.46,0.9)
                DrawSprite("hud_textures", "gang_savings", 0.53, 0.91, 0.04, 0.04, 0.1, color2[1], color2[2], color2[3], color2[4], 0)
            end
        else
            Citizen.Wait(800)
        end
    end
end)

RegisterNetEvent('Notification:addon_vehicles')
AddEventHandler('Notification:addon_vehicles', function(t1, t2, dict, txtr, timer)
    if not HasStreamedTextureDictLoaded(dict) then
        RequestStreamedTextureDict(dict, true) 
        while not HasStreamedTextureDictLoaded(dict) do
            Citizen.Wait(5)
        end
    end
    if Config.VorpNotif then 
      if not VORPcore then 
        TriggerEvent("getCore", function(core)
            VORPcore = core
        end)
      end
      VORPcore.NotifyAvanced(t1, t2, dict, txtr, "COLOR_PURE_WHITE", timer)
    else
      exports[GetCurrentResourceName()].LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
    end
    SetStreamedTextureDictAsNoLongerNeeded(dict)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
        if currentVehicle then 	
        DeleteEntity(currentVehicle.vehicle)       
        DeleteEntity(currentVehicle.object)		
		if weaponType then
		weaponType = nil
		end		
		if currentVehicle.type == 'bike' or currentVehicle.type == 'car' then
		for _, handle in ipairs(current_ptfx_handles) do
                        StopParticleFxLooped(handle, false)
                    end
                    current_ptfx_handles = {}
                    is_particle_effect_active = false
		for _, exhaust in ipairs (currentVehicle.exhausts) do
        DeleteEntity(exhaust)
		end
		for _, headlight in ipairs(currentVehicle.headlights) do
            DeleteEntity(headlight)
        end
        for _, wheel in ipairs(currentVehicle.wheels.front) do
            DeleteEntity(wheel)
        end
        for _, wheel in ipairs(currentVehicle.wheels.rear) do
            DeleteEntity(wheel)
        end		
		end
		if currentVehicle.type == 'heli' or currentVehicle.type == 'osprey' then		
            DeleteEntity(currentVehicle.topPropeller)       		
            DeleteEntity(currentVehicle.rearBlade)
			 DeleteEntity(currentVehicle.leftThruster)
			 DeleteEntity(currentVehicle.rightThruster)       
		end
		if currentVehicle.type == 'tank' then
		
            DeleteEntity(currentVehicle.tanktop)
        		                   
		end
		if currentVehicle.type == 'plane' then
		
            DeleteEntity(currentVehicle.propeller)                    
		end
        if clonePed then
            DeleteEntity(clonePed)
            clonePed = nil
        end
		firstEntry = true
        currentVehicle = nil
    end
end)