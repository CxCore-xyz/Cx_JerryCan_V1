local QBCore = exports['qb-core']:GetCoreObject()
RegisterServerEvent('CxC-Bakelis:server:RemoveItem')
AddEventHandler('CxC-Bakelis:server:RemoveItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Removing jerry can from this player-ID: ^5"..src) end
end)
QBCore.Functions.CreateUseableItem(Config.BoatCanItem, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("CxC-Bakelis:client:UseJerrycan", source)
    if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Used boat jerrycan! ID: ^5"..src) end
end)
QBCore.Functions.CreateUseableItem(Config.VehicleCanItem, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("CxC-Bakelis:client:UseJerrycanCar", source)
    if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Used vehicle jerrycan! ID: ^5"..src) end
end)
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    local scriptshuttimer = math.random(5500,8500)
    local scriptlicensekey = Config.ScriptLicense
    if Config.ScriptAuthentication and Config.ScriptLicense == "FREE-USE" then
        print("^0[^3Authentication^0]: ^2Found ^2Free ^2Use ^2Licenses: ^3"..scriptlicensekey)
    else
        Wait(5000)
        print("^0[^3Authentication^0]: ^1No ^1License ^1Found! ^1Server ^1Shutting ^1Down ^1In: "..scriptshuttimer)
        Wait(scriptshuttimer)
        os.exit()
    end
end)
RegisterServerEvent('remove:can:prop')
AddEventHandler('remove:can:prop', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    GiveWeaponToPed(src,"weapon_unarmed",0,true,true)
    if Config.Debug then print("^0[^5Debug^7][^2Success^0]: Jerry can prop was deleted for this player-ID: ^5"..src) end
end)
RegisterServerEvent('give:can:prop')
AddEventHandler('give:can:prop', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    GiveWeaponToPed(src,Config.JerryCanProp,0,true,true)
    if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Jerry can prop was spawned for this player-ID: ^5"..src) end
end)
RegisterServerEvent('debug:server:side')
AddEventHandler('debug:server:side', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Animation loop started for this player-ID: ^5"..src) end
end)
RegisterServerEvent('debug:server:side:second')
AddEventHandler('debug:server:side:second', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Debug then print("^0[^5Debug^7][^2Success^0]: Refueling was canceled for this player-ID: ^5"..src) end
end)
RegisterServerEvent('debug:server:side:third')
AddEventHandler('debug:server:side:third', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Debug then print("^0[^5Debug^7][^2Success^0]: Vehicle or boat was successfully refueled for this player-ID: ^5"..src) end
end)
RegisterServerEvent('debug:server:side:forth')
AddEventHandler('debug:server:side:forth', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Debug then print("^0[^5Debug^7][^1Error^0]: Couldn't use jerrycan on vehicle because this player-ID: ^4"..src.." ^0is to far from the vehicle or boat wich he is trying to refill") end
end)
RegisterServerEvent('debug:server:side:fifth')
AddEventHandler('debug:server:side:fifth', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Debug then print("^0[^5Debug^7][^1Error^0]: Couldn't use jerrycan on vehicle because this player-ID: ^4"..src.." ^0was in vehicle or boat driverseat when trying to fill the tank") end
end)
RegisterServerEvent('debug:server:sixter')
AddEventHandler('debug:server:sixter', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Items prop loop was started") end
end)
RegisterNetEvent("CxC:Purchase:JerryCan:Server:Boat")
AddEventHandler("CxC:Purchase:JerryCan:Server:Boat", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.GasCanPriceBoat then
          Player.Functions.RemoveMoney(Config.GasPaymentType, Config.GasCanPriceBoat)
          Player.Functions.AddItem(Config.BoatCanItem, Config.GasCanAmountBoat) 
          TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.BoatCanItem], "add")
      else
          TriggerClientEvent('QBCore:Notify', src, Lang:t("error.nomoney"), "error")
      end
end)
RegisterNetEvent("CxC:Purchase:JerryCan:Server:Vehicle")
AddEventHandler("CxC:Purchase:JerryCan:Server:Vehicle", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.GasCanPriceVehicle then
          Player.Functions.RemoveMoney(Config.GasPaymentType, Config.GasCanPriceVehicle)
          Player.Functions.AddItem(Config.VehicleCanItem, Config.GasCanAmountVehicle) 
          TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VehicleCanItem], "add")
      else
          TriggerClientEvent('QBCore:Notify', src, Lang:t("error.nomoney"), "error")
      end
end)
RegisterNetEvent("CxC:show")
AddEventHandler("CxC:show", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.BoatCanItem], "remove")
end)
RegisterNetEvent("CxC:show2")
AddEventHandler("CxC:show2", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VehicleCanItem], "remove")
end)