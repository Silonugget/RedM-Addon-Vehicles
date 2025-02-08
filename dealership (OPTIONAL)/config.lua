Config = {
    -- turn on if you need to hot restart the plugin
    DevMode = true,
    Lang = Langs.En,
    StaticData = Data,
    MaxHorses = 25,
    MaxCarts = 15,
    StableSlots = 3,

    DisableBuyOption = false,
    JobRequired = false, 


    -- Should everyone Access the inventories of the horses/carts 
    -- //TODO To fully implement, let anyone open the inventory, not just the owner
    ShareInv = {
        horse = true,
        cart = true
    },
    -- Should the horse or cart inventory ignore items stack limit
    StackInvIgnore = {
      horse = true,
      cart = true
    },

    Stables = { 
	{
        Name = "St Denis Car Dealership",
        BlipIcon = -1989306548,
        EnterStable = {2441.28, -1311.70, 45.69, 2.0},
        StableNPC = {2441.3, -1311.46, 44.65, 165.69},
        SpawnHorse = {2449.19, -1318.561, 45.23, 160.28},
        CamHorse = {2454.492, -1319.561, 47.433, -16.0, 0.0, 70.0},
        CamHorseGear = {2454.492, -1319.561, 45.433, -16.0, 0.0, 6.0},
        SpawnCart = {2449.19, -1318.561, 45.23, 160.28},
        CamCart = {2454.492, -1319.561, 47.433, -16.0, 0.0, 70.0},
        horses = {
          
		      
			  lancer = 18000,
			  g37 = 8000,
			  ironmalibu = 8000,			  			  			  
			  ironsport = 50000,			  
			  hellcat = 89000,
			  ironroadster = 95000,
			  policesuv = 32000,
			  irongtr = 92000,
			  ironlambo = 200000
			  


      },
        carts = {
  jetski = 5000,
        }
    },
	{
        Name = "St Denis Heli Pad",
        BlipIcon = -1989306548,
        EnterStable = {2674.80, -822.21, 41.69, 3.0},
        StableNPC = {2674.80, -822.21, 41.53, 25.69},
        SpawnHorse = {2672.47, -799.09, 42.69, 0.0},
        CamHorse = {2669.08, -780.87, 44.69, -172.0, 180.0, 0.0},
        CamHorseGear = {2454.492, -1319.561, 45.433, -16.0, 0.0, 6.0},
        SpawnCart = {2449.19, -1318.561, 45.23, 160.28},
        CamCart = {2454.492, -1319.561, 47.433, -16.0, 0.0, 70.0},
        horses = {
          
		      
			  heli = 18000,
			  polheli = 8000,
			  cargobob = 8000,			  			  			  
			  heli2 = 50000,			  
			  
			  


      },
        carts = {
  jetski = 5000,
        }
    },
	
	
	    {
      Name = "Valentine Motor Vehicles Dealership",
      BlipIcon = -1989306548,
      EnterStable = { -250.07, 700.52, 112.59, 2.0 },
      StableNPC = { -250.07, 700.52, 112.3, 37.93 },
      SpawnHorse = { -259.22, 708.53, 113.51, 100.09 },
      CamHorse = { -258.88, 700.41, 116.1, 350.83 },
      CamHorseGear = { -260.59, -704.96, 120.5, 90.09 },
      SpawnCart = { -259.22, 708.53, 113.51, 100.09 },
      CamCart = { -258.88, 700.41, 116.1, 350.83 },
	          horses = {
          
		      
			  f15078 = 3000,
			  sandrail = 28500,
			  muscle = 11900,			  
			  micahcycle = 10500,
			  vapidfordor = 1000,
			  vapidtudor = 1500, 
			  classic = 2000,
			  classic2 = 2000,
			  irontruck = 1000,
			  policebike = 25000,
			  ironimpala = 18000,
			  ironcharger = 25000,
			  ironstang = 40000,
              		
			  
			 
			  
			  


      },
        carts = {
  jetski = 5000,
  
        }
    },
	
	    {
      Name = "Blackwater Customs",
      BlipIcon = 1989306548,
      EnterStable = { -877.45, -1368.36, 42.53, 2.0 },
      StableNPC = { -878.55, -1368.36, 42.53, 266.28 },
      SpawnHorse = { -872.58, -1366.57, 42.53, 270.35 },
      CamHorse = { -869.7852, -1361.103, 45.26991, -17.11994, 0.0, 161.4039 },
      CamHorseGear = { -862.6163, -1362.927, 45.58158, -40.96593, 0.0, 71.8129 },
      SpawnCart = { -872.58, -1366.57, 42.53, 270.35 },
      CamCart = { -869.7852, -1361.103, 45.26991, -17.11994, 0.0, 161.4039 },
	  horses = {
          
		      
			  cyberhorse = 10000,		
			  irontrucklifted = 22000,
			  
			  ironmobile = 20000,
			  ironmobile2 = 15000,
			  
			  
			  ninetystang = 40000,
			  ironcamaro = 35000,
			  ironfranklin = 5000,
			  irontrevor = 1000,
			  ironmichael = 1000
			  


      },
        carts = {
  jetski = 5000,
  
        }
	  
	  
    },
	
	{
      Name = "Emerald Airfield",
      BlipIcon = 1989306548,
      EnterStable = { 1402.09, 263.94, 88.55, 3.0 },
      StableNPC = { 1402.09, 263.94, 88.55, 169.01 },
      SpawnHorse = { 1396.41, 227.85, 91.31, 0.0 },
      CamHorse = { 1393.52, 210.03, 93.55, -8.43, 0.0, 0.47822 },
      CamHorseGear = { -5517.651, -3041.113, -0.50949, -33.14523, 0.0, 55.47822 },
      SpawnCart = { -5520.65, -3044.3, -3.39, 270.83 },
      CamCart = { 1396.41, 227.85, 91.31, 0.0 },
	  
	  horses = {
	  
	  aten = 100000,
	  fireplane = 10000,
	  biplane = 200,
	  biplane2 = 200,
	  triplane = 300,
	  xwing = 5000,
	  osprey = 1000000
	  }
    }
	
    }  }
