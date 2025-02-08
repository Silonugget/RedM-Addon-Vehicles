Config = {}
Config.Vorp = false 
Config.Engine = 0x8AAA0AD4 -- LEFT ALT
Config.SpawnCommand = true 
Config.DeleteCommand = "delete_balboni"
Config.AltHandling = true
Config.Texts = {
    Dealership = "Dealership",  -- You can keep this or update it as needed
    NoTruck = "Vehicle is not owned",  -- This will be the new message
    -- You can add more messages here as necessary
}
Config.Textures = {
  cross = {"scoretimer_textures", "scoretimer_generic_cross"},
  locked = {"menu_textures","stamp_locked_rank"},
  tick = {"scoretimer_textures","scoretimer_generic_tick"},
  money = {"inventory_items", "money_moneystack"},
  alert = {"menu_textures", "menu_icon_alert"},
}

Config.Vehicles = {
    truck = {
        type = "car",
		soundType = "truck",
        objectModel = "f15078",
        frontWheelModel = "f15078wheel",
        rearWheelModel = "f15078wheel",
		AltTopSpeed = 50.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 0.5, -0.2, 0.0, 0.0, 0.0},
        frontWheelOffsets = {
            { x = 0.95, y = 1.32, z = -0.19 },
            { x = -0.95, y = 1.32, z = -0.19 }
        },
                frontDistanceToGrnd = 0.4,
                frontSuspensionUpperLimit = -0.02,
                frontSuspensionLowerLimit = -0.3,		
        rearWheelOffsets = {
            { x = 0.95, y = -2.05, z = -0.18 },
            { x = -0.95, y = -2.05, z = -0.18 }
        },
                rearDistanceToGrnd = 0.41,
                rearSuspensionUpperLimit = 0.02,
                rearSuspensionLowerLimit = -0.3,		
        headlightOffsets = {
            { x = 0.8, y = 1.9, z = 0.5, rx = -0.0, ry = 0.0, rz = 0 },
            { x = -0.8, y = 1.9, z = 0.5, rx = -0.0, ry = 0.0, rz = 0 }
			},
			brakelightOffsets = {
            { x = -0.22, y = -4.0, z = -1.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },		
		exhaustOffsets = {
                { x = 1.2, y = -2.73, z = 0.3 }
            },
        cloneOffsets = { x = -0.48, y = -0.35, z = 0.55, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
    },
    truckLifted = {
        type = "car",
		soundType = "bigtruck",
        objectModel = "irontrucklifted",
        frontWheelModel = "irontruckliftedwheel",
        rearWheelModel = "irontruckliftedwheel",
		AltTopSpeed = 50.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 0.5, 0.9, 0.0, 0.0, 0.0},
        frontWheelOffsets = {
            { x = 1.40, y = 2.4, z = -1.1 },
            { x = -1.38, y = 2.4, z = -1.1 }
        },
                frontDistanceToGrnd = 0.6,
                frontSuspensionUpperLimit = -0.4,
                frontSuspensionLowerLimit = -1.35,		
                
        rearWheelOffsets = {
            { x = 1.40, y = -2.1, z = -1.1 },
            { x = -1.38, y = -2.1, z = -1.1 }
        },
		rearDistanceToGrnd = 0.6,
        rearSuspensionUpperLimit = -0.4,
        rearSuspensionLowerLimit = -1.35,
        headlightOffsets = {
            { x = -0.9, y = 2.95, z = 0.5, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.9, y = 2.95, z = 0.5, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 1.1, y = -3.4, z = 0.0 },
				{ x = -1.1, y = -3.4, z = 0.0 }
            },
        cloneOffsets = { x = -0.48, y = 0.5, z = 0.49, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
    },
	atv = {
    type = "car",
    soundType = "dirtbike", 
    objectModel = "ironatv",
    frontWheelModel = "ironatvwheel",
    rearWheelModel = "ironatvwheel",
    AltTopSpeed = 75.0,
    AltAccelMultiplier = 0.2,
    attachOffsets = {-0.01, 1.0, -0.13, 0.0, 0.0, 0.0},  
    frontWheelOffsets = {
        { x = 0.58, y = 0.85, z = -0.3 }, 
        { x = -0.58, y = 0.85, z = -0.3 }  
    },
    frontDistanceToGrnd = 0.3,
    frontSuspensionUpperLimit = -0.24,
    frontSuspensionLowerLimit = -0.4,
    rearWheelOffsets = {
        { x = 0.59, y = -0.73, z = -0.3 },  
        { x = -0.58, y = -0.73, z = -0.3 }  
    },
    rearDistanceToGrnd = 0.31,
    rearSuspensionUpperLimit = -0.15,
    rearSuspensionLowerLimit = -0.4,
    headlightOffsets = {
        { x = -0.25, y = 0.8, z = 0.0, rx = 0.0, ry = 0.0, rz = 0 },
        { x = 0.25, y = 0.8, z = 0.0, rx = 0.0, ry = 0.0, rz = 0 }
    },
    brakelightOffsets = {
        { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = 180 }
    },
    cloneOffsets = { x = 0.0, y = -0.25, z = 0.4, rx = 0.0, ry = 0.0, rz = 0.0 },
    ThirdPersonCamDistances = { 8.0, 12.0, 15.0 }
},
	dirtbike = {
    type = "bike",
    soundType = "dirtbike",  
    objectModel = "dirtbike",
    frontWheelModel = "dirtbikewheelfront",
    rearWheelModel = "dirtbikewheelrear",
    topSpeed = 80.0,
    accelMultiplier = 0.2,
    attachOffsets = {-0.1, 1.85, -0.2, 0.0, 0.0, 0.0},  
    frontWheelOffsets = {
        { x = -0.021, y = 0.95, z = -0.2 }  
    },
    frontDistanceToGrnd = 0.39,
    frontSuspensionUpperLimit = -0.15,
    frontSuspensionLowerLimit = -0.25,
    rearWheelOffsets = {
        { x = 0.0, y = -0.73, z = -0.25 }  
    },
    rearDistanceToGrnd = 0.36,
    rearSuspensionUpperLimit = -0.15,
    rearSuspensionLowerLimit = -0.3,
    headlightOffsets = {
        { x = -0.1, y = 0.40, z = 0.55, rx = 0.0, ry = 0.0, rz = 0 } 
    },
    brakelightOffsets = {
        { x = 0.0, y = 0.0, z = 0.0, rx = -40.0, ry = 0.0, rz = 180 }  
    },
    exhaustOffsets = {
        { x = 0.15, y = -0.8, z = 0.8 } 
    },
    cloneOffsets = { x = 0.0, y = -0.2, z = 0.65, rx = 0.0, ry = 0.0, rz = 0.0 },
    ThirdPersonCamDistances = { 8.0, 12.0, 15.0 }  
	},
	delorean = {
    type = "car",
    soundType = "lancer",  
    objectModel = "delorean",
    frontWheelModel = "deloreanwheel",
    rearWheelModel = "deloreanwheel",
    topSpeed = 88.0,  
    accelMultiplier = 0.4, 
    attachOffsets = {-0.01, 1.2, -0.1, 0.0, -0.1, 0.0},  
    frontWheelOffsets = {
        { x = 1.00, y = 1.54, z = -0.43 },
        { x = -1.00, y = 1.54, z = -0.43 }
    },
    frontDistanceToGrnd = 0.35,
    frontSuspensionUpperLimit = -0.28,
    frontSuspensionLowerLimit = -0.45,
    rearWheelOffsets = {
        { x = 1.00, y = -1.4, z = -0.39 },
        { x = -1.00, y = -1.4, z = -0.39 }
    },
    rearDistanceToGrnd = 0.33,
    rearSuspensionUpperLimit = -0.25,
    rearSuspensionLowerLimit = -0.45,
    headlightOffsets = {
        { x = -0.8, y = 2.1, z = -0.14, rx = 0.0, ry = 0.0, rz = 0 },
        { x = 0.8, y = 2.1, z = -0.14, rx = 0.0, ry = 0.0, rz = 0 }
    },
    brakelightOffsets = {
        { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = 180.0 }
    },
    exhaustOffsets = {
        { x = 0.6, y = -2.5, z = 0.1 },
        { x = -0.6, y = -2.5, z = 0.1 }
    },
    cloneOffsets = { x = -0.48, y = -0.3, z = -0.13, rx = 0.0, ry = 0.0, rz = 0.0 },
    ThirdPersonCamDistances = { 8.0, 12.0, 15.0 }  
},
	roadster = {
        type = "car",
		soundType = "electric",
        objectModel = "ironroadster",
        frontWheelModel = "ironroadsterwheel",
        rearWheelModel = "ironroadsterwheel",
		AltTopSpeed = 250.0,
		AltAccelMultiplier = 0.4,
        attachOffsets = {-0.01, 1.2, -0.0, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.00, y = 1.7, z = -0.38 },  
            { x = -1.00, y = 1.7, z = -0.38 }  
        },
		frontDistanceToGrnd = 0.47,
        frontSuspensionUpperLimit = -0.3,
        frontSuspensionLowerLimit = -0.5,		
        rearWheelOffsets = {
            { x = 1.00, y = -1.85, z = -0.30 },  
            { x = -1.00, y = -1.85, z = -0.30 }  
        },
		        rearDistanceToGrnd = 0.41,
                rearSuspensionUpperLimit = -0.1,
                rearSuspensionLowerLimit = -0.5,
        headlightOffsets = {
            { x = -0.8, y = 2.1, z = -0.14, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.1, z = -0.14, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
        cloneOffsets = { x = -0.48, y = -0.25, z = -0.13, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	franklin = {
    type = "car",
    soundType = "hellcat",
    objectModel = "ironfranklin",
    frontWheelModel = "ironfranklinwheel",
    rearWheelModel = "ironfranklinwheel",
    AltTopSpeed = 150.0,
    AltAccelMultiplier = 0.3,
    attachOffsets = {-0.01, 1.0, -0.02, 0.0, 0.0, 0.0},  
    frontWheelOffsets = {
        { x = 0.97, y = 1.95, z = -0.32 },  
        { x = -0.97, y = 1.95, z = -0.32 }  
    },
	frontDistanceToGrnd = 0.42,
    frontSuspensionUpperLimit = -0.2,
    frontSuspensionLowerLimit = -0.5,
	
    rearWheelOffsets = {
        { x = 0.97, y = -1.63, z = -0.32 },  
        { x = -0.97, y = -1.63, z = -0.32 }  
    },
	rearDistanceToGrnd = 0.42,
                rearSuspensionUpperLimit = -0.2,
                rearSuspensionLowerLimit = -0.5,
    headlightOffsets = {
        { x = -0.8, y = 2.4, z = -0.0, rx = -0.0, ry = 0.0, rz = 0 },
        { x = 0.8, y = 2.4, z = -0.0, rx = -0.0, ry = 0.0, rz = 0 }
    },
    brakelightOffsets = {
        { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
    },    
    exhaustOffsets = {
        { x = 0.6, y = -2.8, z = -0.1 }, 
		{ x = -0.6, y = -2.8, z = -0.1 }		
    },
    cloneOffsets = { x = -0.48, y = -0.12, z = 0.00, rx = 0.0, ry = 0.0, rz = 0.0 },  
    ThirdPersonCamDistances = {5.0, 8.0, 12.0}
    
    },
	michael = {
    type = "car",
    soundType = "sport",
    objectModel = "ironmichael",
    frontWheelModel = "ironmichaelwheel",
    rearWheelModel = "ironmichaelwheel",
    AltTopSpeed = 150.0,
    AltAccelMultiplier = 0.2,
    attachOffsets = {-0.01, 1.0, -0.02, 0.0, 0.0, 0.0},  
    frontWheelOffsets = {
        { x = 0.97, y = 1.75, z = -0.32 },  
        { x = -0.97, y = 1.75, z = -0.32 }  
    },
	frontDistanceToGrnd = 0.47,
                frontSuspensionUpperLimit = -0.3,
                frontSuspensionLowerLimit = -0.45,
    rearWheelOffsets = {
        { x = 0.97, y = -1.6, z = -0.32 },  
        { x = -0.97, y = -1.6, z = -0.32 }  
    },
	rearDistanceToGrnd = 0.47,
                rearSuspensionUpperLimit = -0.3,
                rearSuspensionLowerLimit = -0.45,
    headlightOffsets = {
        { x = -0.7, y = 2.3, z = -0.1, rx = -0.0, ry = 0.0, rz = 0 },
        { x = 0.7, y = 2.3, z = -0.1, rx = -0.0, ry = 0.0, rz = 0 }
    },
    brakelightOffsets = {
        { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
    },    
    exhaustOffsets = {
        { x = 0.6, y = -2.6, z = -0.1 }, 
		{ x = -0.6, y = -2.6, z = -0.1 }
		
    },
    cloneOffsets = { x = -0.48, y = -0.12, z = 0.00, rx = 0.0, ry = 0.0, rz = 0.0 },  
    ThirdPersonCamDistances = {5.0, 8.0, 12.0}
    
},
	trevor = {
    type = "car",
    soundType = "truck",
    objectModel = "irontrevor",
    frontWheelModel = "irontrevorwheel",
    rearWheelModel = "irontrevorwheel",
    AltTopSpeed = 150.0,
    AltAccelMultiplier = 0.2,
    attachOffsets = {-0.01, 0.59, 0.18, 0.0, 0.0, 0.0},  
    frontWheelOffsets = {
        { x = 1.23, y = 2.0, z = -0.52 },  
        { x = -1.23, y = 2.0, z = -0.52 }  
    },
	frontDistanceToGrnd = 0.47,
                frontSuspensionUpperLimit = -0.48,
                frontSuspensionLowerLimit = -0.7,
    rearWheelOffsets = {
        { x = 1.23, y = -1.9, z = -0.52 },  
        { x = -1.23, y = -1.9, z = -0.52 }  
    },
	rearDistanceToGrnd = 0.47,
                rearSuspensionUpperLimit = -0.1,
                rearSuspensionLowerLimit = -0.7,
    headlightOffsets = {
        { x = -0.7, y = 2.3, z = -0.1, rx = -0.0, ry = 0.0, rz = 0 },
        { x = 0.7, y = 2.3, z = -0.1, rx = -0.0, ry = 0.0, rz = 0 }
    },
    brakelightOffsets = {
        { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
    },    
    exhaustOffsets = {
        { x = 0.8, y = -3.3, z = -0.1 }, 
		{ x = -0.8, y = -3.3, z = -0.1 }
		
    },
    cloneOffsets = { x = -0.48, y = 0.15, z = 0.0, rx = 0.0, ry = 0.0, rz = 0.0 },  
    ThirdPersonCamDistances = {5.0, 8.0, 12.0}
    
},
	bat = {
        type = "car",
		soundType = "bat",
        objectModel = "ironmobile",
        frontWheelModel = "ironmobilewheelfront",
        rearWheelModel = "ironmobilewheelrear",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, -0.1, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.27, y = 1.95, z = -0.28 },
            { x = -1.27, y = 1.95, z = -0.28 }
        },
		frontDistanceToGrnd = 0.42,
                frontSuspensionUpperLimit = -0.24,
                frontSuspensionLowerLimit = -0.4,
        rearWheelOffsets = {
            { x = 1.12, y = -1.95, z = -0.2 },
            { x = -1.15, y = -1.95, z = -0.2 }
        },
		rearDistanceToGrnd = 0.51,
                rearSuspensionUpperLimit = -0.15,
                rearSuspensionLowerLimit = -0.4,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
        cloneOffsets = { x = -0.1, y = -0.38, z = -0.3, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	batclassic = {
        type = "car",
		soundType = "bat",
        objectModel = "ironmobile2",
        frontWheelModel = "ironmobile2wheelfront",
        rearWheelModel = "ironmobile2wheelrear",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.5,
        attachOffsets = {-0.01, 1.0, -0.3, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.05, y = 1.67, z = -0.08 },
            { x = -1.05, y = 1.67, z = -0.08 }
        },
		frontDistanceToGrnd = 0.42,
                frontSuspensionUpperLimit = 0.02,
                frontSuspensionLowerLimit = -0.15,
        rearWheelOffsets = {
            { x = 1.1, y = -2.43, z = -0.0 },
            { x = -1.1, y = -2.43, z = -0.0 }
        },
		rearDistanceToGrnd = 0.51,
                rearSuspensionUpperLimit = 0.1,
                rearSuspensionLowerLimit = -0.15,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
        cloneOffsets = { x = -0.1, y = -1.1, z = 0.1, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	lancer = {
        type = "car",
		soundType = "lancer",
        objectModel = "lancer",
        frontWheelModel = "ironsportwheel",
        rearWheelModel = "ironsportwheel",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, 0.05, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.9, y = 1.5, z = -0.45 },
            { x = -0.9, y = 1.5, z = -0.45 }
		},
		frontDistanceToGrnd = 0.4,
                frontSuspensionUpperLimit = -0.4,
                frontSuspensionLowerLimit = -0.6,
        rearWheelOffsets = {
            { x = 0.9, y = -1.53, z = -0.46 },
            { x = -0.9, y = -1.53, z = -0.46 }
        },
		rearDistanceToGrnd = 0.4,
                rearSuspensionUpperLimit = -0.4,
                rearSuspensionLowerLimit = -0.6,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = { 
		{ x = 0.6, y = -2.5, z = -0.2 }		
        },
        cloneOffsets = { x = -0.38, y = -0.20, z = -0.0, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	ironsport = {
        type = "car",
		soundType = "lambo",
        objectModel = "ironsport",
        frontWheelModel = "ironsportwheel",
        rearWheelModel = "ironsportwheel",
		AltTopSpeed = 220.0,
		AltAccelMultiplier = 0.3,
        attachOffsets = {-0.01, 1.0, -0.29, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.95, y = 1.46, z = -0.17 },  
            { x = -0.95, y = 1.46, z = -0.17 }  
        },
		frontDistanceToGrnd = 0.34,
                frontSuspensionUpperLimit = -0.13,
                frontSuspensionLowerLimit = -0.25,
        rearWheelOffsets = {
            { x = 0.95, y = -1.43, z = -0.15 },  
            { x = -0.95, y = -1.43, z = -0.15 }  
        },
		rearDistanceToGrnd = 0.37,
                rearSuspensionUpperLimit = -0.11,
                rearSuspensionLowerLimit = -0.25,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
        cloneOffsets = { x = -0.40, y = -0.20, z = 0.00, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	ironcharger = {
        type = "car",
		soundType = "vintage",
        objectModel = "ironcharger",
        frontWheelModel = "ironchargerfrontwheel",
        rearWheelModel = "ironchargerrearwheel",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 0.8, -0.4, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.00, y = 2.0, z = 0.1 },  
            { x = -1.00, y = 2.0, z = 0.1 }  
        },
		frontDistanceToGrnd = 0.44,
                frontSuspensionUpperLimit = 0.2,
                frontSuspensionLowerLimit = -0.1,
        rearWheelOffsets = {
            { x = 1.00, y = -1.43, z = 0.1 },  
            { x = -1.00, y = -1.43, z = 0.1 }  
        },
		rearDistanceToGrnd = 0.47,
                rearSuspensionUpperLimit = 0.2,
                rearSuspensionLowerLimit = -0.1,
        headlightOffsets = {
            { x = -0.8, y = 2.6, z = 0.25, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.6, z = 0.25, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 0.4, y = -2.8, z = 0.4 },
				{ x = -0.4, y = -2.8, z = 0.4 }
            },
        cloneOffsets = { x = -0.48, y = 0.05, z = 0.45, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	ironimpala = {
        type = "car",
		soundType = "hellcat",
        objectModel = "ironimpala",
        frontWheelModel = "ironimpalawheel",
        rearWheelModel = "ironimpalawheel",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, -0.25, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.1, y = 1.9, z = -0.15 },  
            { x = -1.1, y = 1.9, z = -0.15 }  
        },
		frontDistanceToGrnd = 0.4,
                frontSuspensionUpperLimit = 0.1,
                frontSuspensionLowerLimit = -0.1,
        rearWheelOffsets = {
            { x = 1.1, y = -1.8, z = -0.15 },  
            { x = -1.1, y = -1.8, z = -0.15 }  
        },
		rearDistanceToGrnd = 0.4,
                rearSuspensionUpperLimit = 0.1,
                rearSuspensionLowerLimit = -0.1,
        headlightOffsets = {
            { x = -0.8, y = 2.5, z = 0.33, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.5, z = 0.33, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 1.13, y = -3.42, z = 0.3 },
				{ x = -1.13, y = -3.42, z = 0.3 }
            },
        cloneOffsets = { x = -0.51, y = -0.15, z = 0.4, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	ironstang = {
        type = "car",
		soundType = "mustang",
        objectModel = "ninetystang",
        frontWheelModel = "ninetystangfrontwheel",
        rearWheelModel = "ninetystangrearwheel",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.3,
        attachOffsets = {-0.01, 0.8, 0.0, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.00, y = 1.7, z = -0.38 },  
            { x = -1.00, y = 1.7, z = -0.38 }  
        },
		frontDistanceToGrnd = 0.42,
                frontSuspensionUpperLimit = -0.3,
                frontSuspensionLowerLimit = -0.6,
        rearWheelOffsets = {
            { x = 1.00, y = -1.45, z = -0.36 },  
            { x = -1.00, y = -1.45, z = -0.36 }  
        },
		rearDistanceToGrnd = 0.45,
                rearSuspensionUpperLimit = -0.3,
                rearSuspensionLowerLimit = -0.6,
        headlightOffsets = {
            { x = -0.8, y = 2.6, z = 0.0, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.6, z = 0.0, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 0.7, y = -2.5, z = 0.0 },
				{ x = -0.7, y = -2.5, z = 0.0 }
            },
        cloneOffsets = { x = -0.40, y = -0.14, z = -0.05, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	iron65stang = {
        type = "car",
		soundType = "mustang",
        objectModel = "ironstang",
        frontWheelModel = "ninetystangfrontwheel",
        rearWheelModel = "ninetystangfrontwheel",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.3,
        attachOffsets = {-0.01, 0.8, -0.1, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.92, y = 1.7, z = -0.3 },  
            { x = -0.92, y = 1.7, z = -0.3 }  
        },
		frontDistanceToGrnd = 0.40,
                frontSuspensionUpperLimit = -0.2,
                frontSuspensionLowerLimit = -0.4,
        rearWheelOffsets = {
            { x = 0.92, y = -1.55, z = -0.3 },  
            { x = -0.92, y = -1.55, z = -0.3 }  
        },
		rearDistanceToGrnd = 0.41,
                rearSuspensionUpperLimit = -0.2,
                rearSuspensionLowerLimit = -0.4,
        headlightOffsets = {
            { x = -0.8, y = 2.6, z = 0.0, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.6, z = 0.0, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 0.5, y = -2.6, z = -0.0 },
				{ x = -0.5, y = -2.6, z = -0.0 }
            },
        cloneOffsets = { x = -0.44, y = -0.42, z = 0.13, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	irontruck = {
        type = "car",
		soundType = "oldtruck",
        objectModel = "irontruck",
        frontWheelModel = "f1930wheel",
        rearWheelModel = "f1930wheel",
		AltTopSpeed = 70.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 0.8, 0.2, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.85, y = 1.63, z = -0.6 },  
            { x = -0.85, y = 1.63, z = -0.6 }  
        },
		
		frontDistanceToGrnd = 0.40,
                frontSuspensionUpperLimit = -0.3,
                frontSuspensionLowerLimit = -0.8,
        rearWheelOffsets = {
            { x = 0.85, y = -1.43, z = -0.6 },  
            { x = -0.85, y = -1.43, z = -0.6 }  
        },
		rearDistanceToGrnd = 0.41,
                rearSuspensionUpperLimit = -0.3,
                rearSuspensionLowerLimit = -0.8,
        headlightOffsets = {
            { x = -0.8, y = 2.6, z = 0.25, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.6, z = 0.25, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		
        cloneOffsets = { x = -0.3, y = -0.5, z = 0.25, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	ironbigtruck = {
        type = "car",
		soundType = "bigtruck",
        objectModel = "bigtruck",
        frontWheelModel = "irontruckliftedwheel",
        rearWheelModel = "irontruckliftedwheel",
		AltTopSpeed = 70.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 0.8, 0.3, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.30, y = 2.5, z = -0.4 },  
            { x = -1.30, y = 2.5, z = -0.4 }  
        },
		frontDistanceToGrnd = 0.70,
                frontSuspensionUpperLimit = -0.3,
                frontSuspensionLowerLimit = -0.7,
        rearWheelOffsets = {
            { x = 1.30, y = -2.0, z = -0.4 },  
            { x = -1.30, y = -2.0, z = -0.4 }  
        },
		rearDistanceToGrnd = 0.71,
                rearSuspensionUpperLimit = -0.3,
                rearSuspensionLowerLimit = -0.7,
        headlightOffsets = {
            { x = -0.8, y = 2.6, z = 0.25, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.6, z = 0.25, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 1.6, y = -0.7, z = 0.0 }
            },
        cloneOffsets = { x = -0.58, y = 0.7, z = 0.95, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	policesuv = {
        type = "car",
		soundType = "sport",
        objectModel = "policesuv",
        frontWheelModel = "policesuvwheel",
        rearWheelModel = "policesuvwheel",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.3,
        attachOffsets = {-0.01, 0.911, -0.09, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.00, y = 1.8, z = -0.25 },  
            { x = -1.00, y = 1.8, z = -0.25 }  
        },
		frontDistanceToGrnd = 0.46,
                frontSuspensionUpperLimit = -0.2,
                frontSuspensionLowerLimit = -0.5,
        rearWheelOffsets = {
            { x = 1.00, y = -1.73, z = -0.25 },  
            { x = -1.00, y = -1.73, z = -0.25 }  
        },
		rearDistanceToGrnd = 0.47,
                rearSuspensionUpperLimit = -0.2,
                rearSuspensionLowerLimit = -0.5,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 0.7, y = -3.0, z = -0.1 },
				{ x = -0.7, y = -3.0, z = -0.1 }
            },
        cloneOffsets = { x = -0.48, y = -0.1, z = 0.4, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	muscle = {
        type = "car",
		soundType = "camaro",
        objectModel = "muscle",
        frontWheelModel = "musclewheel",
        rearWheelModel = "musclewheel",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, -0.62, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.99, y = 1.9, z = 0.23 },  
            { x = -0.99, y = 1.9, z = 0.23 }  
        },
		frontDistanceToGrnd = 0.41,
                frontSuspensionUpperLimit = 0.3,
                frontSuspensionLowerLimit = 0.1,
        rearWheelOffsets = {
            { x = 0.99, y = -1.53, z = 0.25 },  
            { x = -0.99, y = -1.53, z = 0.25 }  
        },
		rearDistanceToGrnd = 0.44,
                rearSuspensionUpperLimit = 0.3,
                rearSuspensionLowerLimit = 0.1,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 0.75, y = -2.55, z = 0.4 },
				{ x = -0.75, y = -2.55, z = 0.4 }
            },
        cloneOffsets = { x = -0.48, y = -0.10, z = 0.6, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	hellcat = {
        type = "car",
		soundType = "hellcat",
        objectModel = "hellcat",
        frontWheelModel = "hellcatwheel",
        rearWheelModel = "hellcatwheel",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.3,
        attachOffsets = {-0.01, 1.0, -0.0, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.99, y = 1.85, z = -0.4 },  
            { x = -0.99, y = 1.85, z = -0.4 }  
        },
		
		frontDistanceToGrnd = 0.40,
                frontSuspensionUpperLimit = -0.35,
                frontSuspensionLowerLimit = -0.5,
        rearWheelOffsets = {
            { x = 0.99, y = -1.73, z = -0.4 },  
            { x = -0.99, y = -1.73, z = -0.4 }  
        },
		rearDistanceToGrnd = 0.41,
                rearSuspensionUpperLimit = -0.35,
                rearSuspensionLowerLimit = -0.5,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 0.6, y = -2.9, z = 0.2 },
				{ x = -0.6, y = -2.9, z = 0.2 }
            },
        cloneOffsets = { x = -0.48, y = -0.32, z = 0.11, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	cyberhorse = {
        type = "car",
		soundType = "electric",
        objectModel = "cyberhorse",
        frontWheelModel = "cyberhorsewheel",
        rearWheelModel = "cyberhorsewheel",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.3,
        attachOffsets = {-0.01, 1.0, -0.37, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.2, y = 2.6, z = 0.15 },  
            { x = -1.35, y = 2.6, z = 0.15 }  
        },
		frontDistanceToGrnd = 0.53,
                frontSuspensionUpperLimit = 0.3,
                frontSuspensionLowerLimit = -0.3,
        rearWheelOffsets = {
            { x = 1.2, y = -2.4, z = 0.15 },  
            { x = -1.35, y = -2.4, z = 0.15 }  
        },
		rearDistanceToGrnd = 0.56,
                rearSuspensionUpperLimit = 0.3,
                rearSuspensionLowerLimit = -0.3,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
        cloneOffsets = { x = -0.65, y = 0.4, z = 0.9, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	ironhorse = {
        type = "car",
		soundType = "oldtruck",
        objectModel = "f1930",
        frontWheelModel = "f1930wheel",
        rearWheelModel = "f1930wheel",
		AltTopSpeed = 100.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, 0.33, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.95, y = 1.8, z = -0.65 },  
            { x = -0.95, y = 1.8, z = -0.65 }  
        },
		frontDistanceToGrnd = 0.48,
                frontSuspensionUpperLimit = -0.5,
                frontSuspensionLowerLimit = -0.8,
        rearWheelOffsets = {
            { x = 0.95, y = -1.69, z = -0.65 },  
            { x = -0.95, y = -1.69, z = -0.65 }  
        },
		rearDistanceToGrnd = 0.49,
                rearSuspensionUpperLimit = -0.5,
                rearSuspensionLowerLimit = -0.8,
        headlightOffsets = {
            { x = -0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
        cloneOffsets = { x = -0.35, y = -0.3, z = 0.2, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	ironprime = {
        type = "car",
		soundType = "lancer",
        objectModel = "ironprime",
        frontWheelModel = "ironrancherwheel",
        rearWheelModel = "ironrancherwheel",
		AltTopSpeed = 100.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, 0.15, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.00, y = 1.8, z = -0.5 },  
            { x = -1.00, y = 1.8, z = -0.5 }  
        },
		frontDistanceToGrnd = 0.45,
                frontSuspensionUpperLimit = -0.3,
                frontSuspensionLowerLimit = -0.7,
        rearWheelOffsets = {
            { x = 1.00, y = -2.1, z = -0.5 },  
            { x = -1.00, y = -2.1, z = -0.5 }  
        },
		rearDistanceToGrnd = 0.46,
                rearSuspensionUpperLimit = -0.3,
                rearSuspensionLowerLimit = -0.7,
        headlightOffsets = {
            { x = -0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
        cloneOffsets = { x = -0.41, y = 0.27, z = 0.33, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	ironrancher = {
        type = "car",
		soundType = "oldtruck",
        objectModel = "ironrancher",
        frontWheelModel = "ironrancherwheel",
        rearWheelModel = "ironrancherwheel",
		AltTopSpeed = 100.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, 0.1, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.05, y = 2.5, z = -0.4 },  
            { x = -1.05, y = 2.5, z = -0.4 }  
        },
		frontDistanceToGrnd = 0.49,
                frontSuspensionUpperLimit = -0.3,
                frontSuspensionLowerLimit = -0.7,
        rearWheelOffsets = {
            { x = 1.05, y = -1.85, z = -0.38 },  
            { x = -1.05, y = -1.85, z = -0.38 }  
        },
		rearDistanceToGrnd = 0.53,
                rearSuspensionUpperLimit = -0.3,
                rearSuspensionLowerLimit = -0.7,
        headlightOffsets = {
            { x = -0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },
        exhaustOffsets = {
                { x = 0.9, y = -3.4, z = -0.1 },
				{ x = -0.9, y = -3.4, z = -0.1 }
            },		
        cloneOffsets = { x = -0.5, y = 0.55, z = 0.45, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	ironsuv = {
        type = "car",
		soundType = "truck",
        objectModel = "ironsuv",
        frontWheelModel = "ironsuvwheel",
        rearWheelModel = "ironsuvwheel",
		AltTopSpeed = 100.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, 0.1, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.07, y = 1.9, z = -0.38 },  
            { x = -1.10, y = 1.9, z = -0.38 }  
        },
		frontDistanceToGrnd = 0.52,
                frontSuspensionUpperLimit = -0.2,
                frontSuspensionLowerLimit = -0.6,
        rearWheelOffsets = {
            { x = 1.07, y = -1.30, z = -0.36 },  
            { x = -1.10, y = -1.30, z = -0.36 }  
        },
		rearDistanceToGrnd = 0.55,
                rearSuspensionUpperLimit = -0.2,
                rearSuspensionLowerLimit = -0.6,
        headlightOffsets = {
            { x = -0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },
		exhaustOffsets = {                
				{ x = -1.2, y = -2.2, z = -0.1 }
            },		
        cloneOffsets = { x = -0.52, y = 0.0, z = 0.50, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	vapidfordor = {
        type = "car",
		soundType = "oldtruck",
        objectModel = "vapidfordor",
        frontWheelModel = "f1930wheel",
        rearWheelModel = "f1930wheel",
		AltTopSpeed = 100.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, 0.3, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.85, y = 1.65, z = -0.63 },  
            { x = -0.85, y = 1.65, z = -0.63 }  
        },
		frontDistanceToGrnd = 0.47,
                frontSuspensionUpperLimit = -0.53,
                frontSuspensionLowerLimit = -0.75,
        rearWheelOffsets = {
            { x = 0.85, y = -1.45, z = -0.63 },  
            { x = -0.85, y = -1.45, z = -0.63 }  
        },
		rearDistanceToGrnd = 0.48,
                rearSuspensionUpperLimit = -0.6,
                rearSuspensionLowerLimit = -0.75,
        headlightOffsets = {
            { x = -0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
        cloneOffsets = { x = -0.25, y = -0.44, z = 0.13, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	vapidtudor = {
        type = "car",
		soundType = "oldtruck",
        objectModel = "vapidtudor",
        frontWheelModel = "f1930wheel",
        rearWheelModel = "f1930wheel",
		AltTopSpeed = 100.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 0.75, 0.25, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.80, y = 1.75, z = -0.6 },  
            { x = -0.80, y = 1.755, z = -0.6 }  
        },
		frontDistanceToGrnd = 0.45,
                frontSuspensionUpperLimit = -0.53,
                frontSuspensionLowerLimit = -0.75,
        rearWheelOffsets = {
            { x = 0.80, y = -1.54, z = -0.6 },  
            { x = -0.82, y = -1.54, z = -0.6 }  
        },
		rearDistanceToGrnd = 0.46,
                rearSuspensionUpperLimit = -0.6,
                rearSuspensionLowerLimit = -0.75,
        headlightOffsets = {
            { x = -0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.5, y = 1.9, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
        cloneOffsets = { x = -0.30, y = -0.45, z = 0.15, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	gtr = {
        type = "car",
		soundType = "sport",
        objectModel = "irongtr",
        frontWheelModel = "irongtrwheel",
        rearWheelModel = "irongtrwheel",
		AltTopSpeed = 150.0,
		AltAccelMultiplier = 0.4,
        attachOffsets = {-0.01, 1.0, -0.38, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.985, y = 1.7, z = -0.0 },  
            { x = -0.985, y = 1.7, z = -0.0 }  
        },
		frontDistanceToGrnd = 0.42,
                frontSuspensionUpperLimit = 0.1,
                frontSuspensionLowerLimit = -0.1,
        rearWheelOffsets = {
            { x = 0.985, y = -1.56, z = -0.0 },  
            { x = -0.985, y = -1.56, z = -0.0 }  
        },
		rearDistanceToGrnd = 0.43,
                rearSuspensionUpperLimit = 0.1,
                rearSuspensionLowerLimit = -0.1,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 0.6, y = -2.5, z = 0.2 },
				{ x = -0.6, y = -2.5, z = 0.2 }
            },
        cloneOffsets = { x = -0.48, y = -0.3, z = 0.35, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	malibu = {
        type = "car",
		soundType = "sport",
        objectModel = "ironmalibu",
        frontWheelModel = "ironmalibuwheel",
        rearWheelModel = "ironmalibuwheel",
		AltTopSpeed = 80.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, -0.0, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.00, y = 1.73, z = -0.38 },  
            { x = -1.00, y = 1.73, z = -0.38 }  
        },
		frontDistanceToGrnd = 0.42,
                frontSuspensionUpperLimit = -0.3,
                frontSuspensionLowerLimit = -0.6,
        rearWheelOffsets = {
            { x = 1.00, y = -1.62, z = -0.36 },  
            { x = -1.00, y = -1.62, z = -0.36 }  
        },
		rearDistanceToGrnd = 0.45,
                rearSuspensionUpperLimit = -0.3,
                rearSuspensionLowerLimit = -0.6,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 0.85, y = -2.6, z = -0.1 }
            },
        cloneOffsets = { x = -0.48, y = 0.13, z = 0.1, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	lambo = {
        type = "car",
		soundType = "lambo",
        objectModel = "ironlambo",
        frontWheelModel = "ironlambowheel",
        rearWheelModel = "ironlambowheel",
		AltTopSpeed = 180.0,
		AltAccelMultiplier = 0.4,
        attachOffsets = {-0.01, 1.0, -0.15, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.02, y = 1.635, z = -0.23 },  
            { x = -1.02, y = 1.635, z = -0.23 }  
        },
		frontDistanceToGrnd = 0.42,
                frontSuspensionUpperLimit = -0.15,
                frontSuspensionLowerLimit = -0.3,
        rearWheelOffsets = {
            { x = 1.02, y = -1.58, z = -0.23 },  
            { x = -1.02, y = -1.58, z = -0.23 }  
        },
		rearDistanceToGrnd = 0.43,
                rearSuspensionUpperLimit = -0.15,
                rearSuspensionLowerLimit = -0.3,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {                
				{ x = -0.0, y = -2.65, z = 0.0 }
            },
        cloneOffsets = { x = -0.44, y = -0.1, z = -0.1, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	classic = {
        type = "car",
		soundType = "oldtruck",
        objectModel = "classic",
        frontWheelModel = "classicfront",
        rearWheelModel = "classicrear",
		AltTopSpeed = 80.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, -0.35, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.76, y = 0.75, z = 0.1 },  
            { x = -0.81, y = 0.75, z = 0.1 }  
        },
		frontDistanceToGrnd = 0.55,
                frontSuspensionUpperLimit = 0.2,
                frontSuspensionLowerLimit = -0.1,
        rearWheelOffsets = {
            { x = 0.90, y = -1.0, z = 0.3 },  
            { x = -0.92, y = -1.0, z = 0.3 }  
        },
		rearDistanceToGrnd = 0.76,
                rearSuspensionUpperLimit = 0.4,
                rearSuspensionLowerLimit = 0.0,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
        cloneOffsets = { x = -0.23, y = 0.1, z = 1.15, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	classic2 = {
        type = "car",
		soundType = "oldtruck",
        objectModel = "classic2",
        frontWheelModel = "f1930wheel",
        rearWheelModel = "f1930wheel",
		AltTopSpeed = 80.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, 0.05, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 0.90, y = 1.5, z = -0.38 },  
            { x = -0.90, y = 1.5, z = -0.38 }  
        },
		frontDistanceToGrnd = 0.47,
                frontSuspensionUpperLimit = -0.2,
                frontSuspensionLowerLimit = -0.6,
        rearWheelOffsets = {
            { x = 0.90, y = -1.35, z = -0.36 },  
            { x = -0.90, y = -1.35, z = -0.36 }  
        },
		rearDistanceToGrnd = 0.50,
                rearSuspensionUpperLimit = -0.2,
                rearSuspensionLowerLimit = -0.6,
        headlightOffsets = {
            { x = -0.5, y = 2.0, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.5, y = 2.0, z = 0.05, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
        cloneOffsets = { x = -0.25, y = -0.65, z = 0.50, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	sandrail = {
        type = "car",
		soundType = "sport",
        objectModel = "sandrail",
        frontWheelModel = "sandrailwheel",
        rearWheelModel = "sandrailwheel",
		AltTopSpeed = 80.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.01, 1.0, 0.3, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = 1.35, y = 1.75, z = -0.65 },  
            { x = -1.35, y = 1.75, z = -0.65 }  
        },
		frontDistanceToGrnd = 0.45,
                frontSuspensionUpperLimit = -0.4,
                frontSuspensionLowerLimit = -0.8,
        rearWheelOffsets = {
            { x = 1.35, y = -1.7, z = -0.65 },  
            { x = -1.35, y = -1.7, z = -0.65 }  
        },
		rearDistanceToGrnd = 0.46,
                rearSuspensionUpperLimit = -0.4,
                rearSuspensionLowerLimit = -0.8,
        headlightOffsets = {
            { x = -0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 },
            { x = 0.8, y = 2.2, z = -0.03, rx = -0.0, ry = 0.0, rz = 0 }
        },
		brakelightOffsets = {
            { x = -0.2, y = -3.0, z = -2.2, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 }
        },	
		exhaustOffsets = {
                { x = 0.43, y = -2.0, z = 0.4 },
				{ x = -0.43, y = -2.0, z = 0.4 }
            },
        cloneOffsets = { x = -0.45, y = -0.5, z = -0.10, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	policebike = {
        type = "bike",
		soundType = "chopper",
        objectModel = "policebike",
        frontWheelModel = "policebikefrontwheel",
        rearWheelModel = "policebikerearwheel",
		AltTopSpeed = 80.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.1, 1.85, -0.2, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = -0.021, y = 1.05, z = -0.2 }  
        },
		frontDistanceToGrnd = 0.39,
                frontSuspensionUpperLimit = -0.15,
                frontSuspensionLowerLimit = -0.25,
        rearWheelOffsets = {
            { x = 0.0, y = -0.99, z = -0.25 } 
        },
		rearDistanceToGrnd = 0.36,
                rearSuspensionUpperLimit = -0.15,
                rearSuspensionLowerLimit = -0.3,
        headlightOffsets = {
            { x = -0.1, y = 0.40, z = 0.55, rx = -0.0, ry = 0.0, rz = 0 },
        },
		brakelightOffsets = {
		{ x = -0.0, y = -0.0, z = -0.0, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 },    
		},
		exhaustOffsets = {
                { x = -0.22, y = -1.3, z = -0.1 },
				{ x = 0.22, y = -1.3, z = -0.1 }				
            },
        cloneOffsets = { x = -0.0, y = -0.2, z = 0.3, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	micahcycle = {
        type = "bike",
		soundType = "moped",
        objectModel = "micahcycle",
        frontWheelModel = "micahcyclewheel",
        rearWheelModel = "micahcyclewheel",
		AltTopSpeed = 40.0,
		AltAccelMultiplier = 0.2,
        attachOffsets = {-0.1, 1.85, -0.15, 0.0, 0.0, 0.0},  
        frontWheelOffsets = {
            { x = -0.0, y = 0.8, z = -0.41 }  
        },
		frontDistanceToGrnd = 0.24,
                frontSuspensionUpperLimit = -0.35,
                frontSuspensionLowerLimit = -0.5,
        rearWheelOffsets = {
            { x = 0.01, y = -0.71, z = -0.41 } 
        },
		rearDistanceToGrnd = 0.24,
                rearSuspensionUpperLimit = -0.35,
                rearSuspensionLowerLimit = -0.5,
        headlightOffsets = {
            { x = -0.1, y = 0.40, z = 0.55, rx = -0.0, ry = 0.0, rz = 0 },
        },
		brakelightOffsets = {
		{ x = -0.0, y = -0.0, z = -0.0, rx = -40.0, ry = 0.0, rz = (90.0 + 90) % 360 },    
		},
		exhaustOffsets = {
                { x = 0.6, y = -0.65, z = 0.0 }				
            },
        cloneOffsets = { x = -0.0, y = -0.3, z = 0.3, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	xwing = {
        type = "jet",
		soundType = "xwing",
        objectModel = "xwing",
		weaponType = "xwing",
        attachOffsets = {-0.0, -3.0, -0.0, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = 0.1, y = 1.8, z = 1.1, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {8.0, 12.0, 15.0}
		
    },
	a10 = {
        type = "jet",
		soundType = "jet",
        objectModel = "aten",
		weaponType = "a10",
        attachOffsets = {-0.0, -3.0, -0.0, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = 0.0, y = 4.1, z = 1.1, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	biplane = {
        type = "plane",
		soundType = "plane",
        objectModel = "biplane",
		weapontype = "none",
		propellerModel = "biplaneprop",
		propellerOffsets = {x = 0.0, y = 2.6, z = 1.1},
        attachOffsets = {-0.0, 1.2, 1.0, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = -0.0, y = -0.65, z = 0.5, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	biplane2 = {
        type = "plane",
		soundType = "plane",
        objectModel = "biplane2",
		weapontype = "none",
		propellerModel = "biplaneprop",
		propellerOffsets = {x = 0.0, y = 3.5, z = 1.1},
        attachOffsets = {-0.0, 0.3, 1.0, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = -0.0, y = -0.0, z = 0.1, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	triplane = {
        type = "plane",
		soundType = "plane",
        objectModel = "triplane",
		weapontype = "none",
		propellerModel = "triplaneprop",
		propellerOffsets = {x = 0.0, y = 3.2, z = 1.0},
        attachOffsets = {-0.0, 1.5, 0.7, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = -0.0, y = -1.0, z = 0.5, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {8.0, 12.0, 15.0}
		
    },
	heli = {
        type = "heli",
		soundType = "heli",
        objectModel = "heli",
		weapontype = "heli",
		topbladeModel = "helitopblade",
		rearbladeModel = "helirearblade",
		topbladeOffsets = {x = 0.0, y = 2.05, z = 3.2},
		rearbladeOffsets = {x = 0.3, y = -7.9, z = 3.25},
        attachOffsets = {-0.0, 2.0, 0.35, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = -0.61, y = 2.6, z = 0.6, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {8.0, 12.0, 15.0}
		
    },
	heli2 = {
        type = "heli",
		soundType = "heli",
        objectModel = "heli2",
		weapontype = "",
		topbladeModel = "heli2topblade",
		rearbladeModel = "heli2rearblade",
		topbladeOffsets = {x = 0.0, y = 2.5, z = 2.15},
		rearbladeOffsets = {x = -0.3, y = -4.95, z = 1.8},
        attachOffsets = {-0.0, 2.5, 0.35, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = -0.5, y = 1.6, z = 0.3, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	bigboat = {
        type = "boat",
		soundType = "speedboat",
        objectModel = "bigboat",
        attachOffsets = {-0.01, 0.0, -0.4, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = 1.6, y = 1.9, z = 2.9, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	lamboboat = {
        type = "boat",
		soundType = "speedboat",
        objectModel = "lamboboat",
        attachOffsets = {-0.01, 0.0, -0.4, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = 1.6, y = 1.9, z = 2.9, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	biggerboat = {
        type = "boat",
		soundType = "speedboat",
        objectModel = "biggerboat",
        attachOffsets = {-0.01, 0.0, -0.4, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = 1.8, y = 2.0, z = 3.0, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {13.0, 16.0, 20.0}
		
    },
	speedboat = {
        type = "boat",
		soundType = "speedboat",
        objectModel = "speedboat",
        attachOffsets = {-0.01, -0.2, -0.4, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = -0.75, y = 1.3, z = 1.0, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	jetski = {
        type = "boat",
		soundType = "jetski",
        objectModel = "jetski",
        attachOffsets = {-0.01, 0.0, -0.4, 0.0, 0.0, 0.0},  
        cloneOffsets = { x = -0.0, y = -0.35, z = 1.0, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	irontank = {
        type = "tank",
		soundType = "bigtruck",
		objectModel = "irontank",
        tanktopModel = "irontanktop",
        attachOffsets = {-0.01, 0.0, 0.15, 0.0, 0.0, 0.0},  
        tanktopOffsets = { x = -0.0, y = -0.0, z = 0.15, rx = 0.0, ry = 0.0, rz = 0.0 },
		cloneOffsets = { x = -0.0, y = -1.5, z = 0.65, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {5.0, 8.0, 12.0}
		
    },
	osprey = {
        type = "osprey",
		soundType = "heli",
		objectModel = "osprey",
        bladeModel = "ospreyblade",
		doorModel = "ospreydoor",
		leftthrusterModel = "ospreyleftthruster",
		rightthrusterModel = "ospreyrightthruster",
        attachOffsets = {-0.2, -1.8, 1.7, 0.0, 0.0, 0.0},
		leftbladeOffsets = {x = 0.0, y = -0.05, z = 1.9},
		rightbladeOffsets = {x = -0.0, y = -0.05, z = 1.9},
		doorattachOffsets = {-0.2, -5.3, 0.42, 0.0, 0.0, 0.0},  
		leftthrusterattachOffsets = {x = -8.55, y = 0.3, z = 4.23},  
        rightthrusterattachOffsets = {x = 8.3, y = 0.3, z = 4.28},  
		cloneOffsets = { x = -0.7, y = 5.9, z = 0.15, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {10.0, 15.0, 20.0}
		
    },
	cargobob = {
        type = "cargobob",
		soundType = "heli",
		objectModel = "cargobob",
        bladeModel = "helitopblade",
		doorModel = "cargobobdoor",		
        attachOffsets = {-0.2, -1.0, 1.1, 0.0, 0.0, 0.0},
		frontbladeOffsets = {x = -0.3, y = 3.9, z = 5.1},
		rearbladeOffsets = {x = -0.1, y = -7.5, z = 5.6},
		doorattachOffsets = {-0.2, -5.65, 0.05, 15.0, 0.0, 0.0},  
		cloneOffsets = { x = -0.7, y = 6.5, z = 0.45, rx = 0.0, ry = 0.0, rz = 0.0 },
		ThirdPersonCamDistances = {8.0, 12.0, 18.0}
		
    },
    -- Add more vehicle configurations here
}
