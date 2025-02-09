# RedM Addon Vehicles

This mod can add land, sea, and air vehicles to your RedM VORP or Freeroam server. Example trainers included to help you get started on your own vehicle additions.

While most of the pieces are here, synchronization and handling may not be as polished. This mod is not reccommended for populated servers. 

## Features

The mod features the following vehicles:

- **Cars**
- **Motorbikes**
- **Prop planes**
- **Jets**
- **Helicopters**
- **Osprey (with VTOL capabilities)**
- **Cargobob**
- **Tanks**
- **Boats**

## Configurations

The included config file allows you to edit the following vehicle properties:

- Seat positions
- Sound type
- Wheel positions
- Suspension limits
- Exhaust positions
- Weapon types
- Land vehicle top speed and acceleration

## Adding New Vehicles

If you'd like to add new vehicles to your server, the process is relatively simple. I have a tutorial available to guide you through creating your own vehicle using Blender. You can watch the tutorial here:  
[Blender Vehicle Tutorial](https://www.youtube.com/watch?v=sfuh_mFBspM)

## Instructions

To use the example vehicles, you'll need to get the **LML stream folder** from the single-player mod and put the contents into the RedM resource stream folder. You can find the mod here:  
[RDR2 Mod on Nexus](https://www.nexusmods.com/reddeadredemption2/mods/5285)

A trainer is not required to use the mod, as you can spawn using command: /balboni [name of veh in config] 
For instance, to spawn the helicopter a player can type /balboni heli

### Alt Handling
The config includes an option for **AltHandling**. Regular handling was initially intended for use with [RedM Drivable Coach4](https://github.com/Elder0ne/RedM_drivable-coach4), but due to issues with streaming meta files, it remained a client-installed mod.

### Popdensity Resource
The included **Popdensity** resource is only useful for those who want Alt Handling for specific users. It is a workaround for crash that occurs when a client has their own meta files for the Coach4 (listed above) and another client does not. You will need to create a new table in a database for this to function properly. It is not expected to be used by many.

### For VORP Servers
For VORP users, ensure to install the provided SQL and **dealership**. The dealership is essentially a Lua rewrite of **Vorp-stables** that I managed to get working quickly. There is still much to be done, and it has not been fully tested.

The inlcuded VORP trainer reads the ironhorses table and fills the Garage with things the player purchases from the dealership. When an owned vehicle is selected, it spawns it on the player.  

You will find coordinates and prices for dealerships in the dealership resource config. There are a couple in St Denis, one in Blackwater and one in Valentine. They are displayed with a wagon wheel blip on the map and offer previews of different buyable vehicles at an NPC shop. Not all vehicles have been added to the config so majority are still missing from these menus. 

## Controls

### VORP Trainer
- **Open Menu**: `F6`

### Freeroam Trainer
- **Open Menu**: `L`

### Cars, Bikes, and Boats
- **Movement**: `WASD`
- **Enter Vehicle**: `E`
- **Toggle Engine**: `Left Alt`

### Helicopters
- **Ascend**: `Shift`
- **Movement**: `WASD`
- **Toggle Roll/Yaw Mode**: `Hold Spacebar`
- **Fire Weapons**: `Left Click`

### Cargobob
- **Open/Close Door**: `Left Click`

### Osprey
- **Open/Close Door**: `Left Click`
- **Switch between VTOL and Normal Flight**: `Right Click`

### Tank
- **Movement**: Same as car controls
- **Fire Cannon**: `Spacebar`

### Planes
- **Accelerate**: `Hold Shift`
- **Movement**: `WASD`
- **Toggle Roll/Yaw Mode**: `Spacebar`

## Example Content from YouTube Creators

- [Example 1](https://www.youtube.com/watch?v=bmFQ2Ab-waw)
- [Example 2](https://www.youtube.com/watch?v=APxuYndRX0A)
- [Example 3](https://www.youtube.com/watch?v=T0OLsuH2ujA)
- [Example 4](https://www.youtube.com/watch?v=bB_WhSFJsdA)

## Credits

I would not have been able to do this without the help I received from the following people:

- **Drao (Luman Studio)** – Shared knowledge for car wheel rotation
- **RicX (zelbeus)** – Shared knowledge and created an open-source rendition for cars in RedM via props
- **Mooreiche** – Shared config for meta files to make Coach4 drivable
- **Halen84** – Menu was made using NativeMenuBase
