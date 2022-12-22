Config = Config or {}

--Authentication
Config.ScriptAuthentication = true -- Server will not work with this function set to false this is for security reasons
Config.ScriptLicense = "FREE-USE" -- Don't touch this, this is free use licensekey
Config.ScriptAuthor = "CxCCore.xyz" -- Don't touch this or the script won't work
Config.ScriptDiscord = "Dsc.gg/CxCCore" -- Don't touch this or the script won't work

--Fuel script settings
Config.FuelScript = "LegacyFuel" -- Your server fuel script name / uses export['scriptname']:setfuel()

--Distance checking settings
Config.BoatFillDistance = 2.5 -- Recommended 2.5 or above no lower
Config.VehicleFillDitance = 2.5 -- Recommended 2.5 or above no lower

--Fill time settings
Config.BoatFillTime = 15000 -- 15Seconds
Config.VehicleFillTime = 20000 -- 20Seconds

--Boat jerrycan settings
Config.BoatCanItem = "jerry_can" -- Item name for boats jerrycan
Config.BoatFillAmount = 100 -- Fill amount from 0 to 100 for boat jerrycan

--Vehicle jerrycan settings
Config.VehicleCanItem = "jerry_canv" -- Item name for vehicles jerrycan
Config.VehicleFillAmount = 100 -- Fill amount from 0 to 100 for vehicle jerrycan

--JerryCan props
Config.BackProps = true -- If you don't want on back prop make it false
Config.JerryCanProp = "weapon_petrolcan" -- An item wich the ped will hold when the animation starts

--Target settings for gas station purchasing
Config.TargetPurchase = true -- Don't need it? Make it false
Config.TargetScript = "qb-target" -- Your target script name
Config.TargetType = "server" -- Client or server
Config.TargetIcon = "fas fa-gas-pump" -- Icon for target
Config.TargetBoatTrigger = "CxC:Purchase:JerryCan:Server:Boat" -- Trigger for purchasing boat gas can
Config.TargetVehicleTrigger = "CxC:Purchase:JerryCan:Server:Vehicle" -- Trigger for purchasing vehicle gas can
Config.TargetBoatTranslation = "Purchase Boat Gas Can For $"
Config.TargetVehicleTranslation = "Purchase Vehicle Gas Can For $"
Config.GasPumpModels = { -- Models for the target
    "prop_gas_pump_1d",
    "prop_gas_pump_1a",
    "prop_gas_pump_1b",
    "prop_gas_pump_1c",
    "prop_vintage_pump",
    "prop_gas_pump_old2",
    "prop_gas_pump_old3"
}

--Purchasing gas can in gas station settingss
Config.GasCanAmountVehicle = 1 -- Amount wich will be given for vehicle gas can
Config.GasCanAmountBoat = 1 -- Amount wich will be given for boat gas can
Config.GasPaymentType = "cash" -- Cash or bank
Config.GasCanPriceBoat = 200 -- Price for jerry can at gas station for boats
Config.GasCanPriceVehicle = 100 -- Price for jerry can at gas station for vehicles

--Debug settings
Config.Debug = false -- Set true if you want console debug
