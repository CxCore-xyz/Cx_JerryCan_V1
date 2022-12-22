local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state['isLoggedIn']
local fueling = false
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        isLoggedIn = true
        fueling = false
        TriggerServerEvent('remove:can:prop')
end)
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
        isLoggedIn = false
        fueling = false
        TriggerServerEvent('remove:can:prop')
end)
RegisterNetEvent('CxC-Bakelis:client:UseJerrycan')
AddEventHandler('CxC-Bakelis:client:UseJerrycan', function()
    local src = source
    local ped = GetPlayerPed(-1)
    local boat = IsPedInAnyVehicle(ped)
    local curVehD = QBCore.Functions.GetClosestVehicle()
    local PlayerCoords = GetEntityCoords(ped)
    local vehicleCoords = GetEntityCoords(curVehD)
    local distanceToVehicle =  #(PlayerCoords - vehicleCoords)
    if distanceToVehicle > Config.BoatFillDistance then
        QBCore.Functions.Notify(Lang:t("error.toofaraway_boat"),"error")
        TriggerServerEvent('debug:server:side:forth')
        return
    end
    if boat then
        QBCore.Functions.Notify(Lang:t("info.invehicle_boat"), 'error')
        TriggerServerEvent('debug:server:side:fifth')
    else
        local curVeh = QBCore.Functions.GetClosestVehicle()
        TaskTurnPedToFaceEntity(ped, curVeh, 1000)
        Wait(1000)
        TriggerServerEvent('give:can:prop')
        Wait(500)
        TriggerEvent('CxC:JerryCan:Animation:Trigger')
        fueling = true
        QBCore.Functions.Progressbar("reful_boat", Lang:t("info.progress_bar_boat"), Config.BoatFillTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            exports[Config.FuelScript]:SetFuel(curVeh, Config.BoatFillAmount)
            QBCore.Functions.Notify(Lang:t("success.boat_success"), 'success')
            TriggerServerEvent('CxC-Bakelis:server:RemoveItem', Config.BoatCanItem, 1)
            TriggerServerEvent('CxC:show')
            TriggerServerEvent('debug:server:side:third')
            TriggerServerEvent('remove:can:prop')
        end, function() -- Cancel
            TriggerServerEvent('remove:can:prop')
            TriggerServerEvent('debug:server:side:second')
            fueling = false
            QBCore.Functions.Notify(Lang:t("error.canceled"), 'error')
        end)
    end
end)
RegisterNetEvent('CxC-Bakelis:client:UseJerrycanCar')
AddEventHandler('CxC-Bakelis:client:UseJerrycanCar', function()
    local src = source
    local ped = GetPlayerPed(-1)
    local vehicle = IsPedInAnyVehicle(ped)
    local curVehD = QBCore.Functions.GetClosestVehicle()
    local PlayerCoords = GetEntityCoords(ped)
    local vehicleCoords = GetEntityCoords(curVehD)
    local distanceToVehicle =  #(PlayerCoords - vehicleCoords)
    if distanceToVehicle > Config.VehicleFillDitance then
        QBCore.Functions.Notify(Lang:t("error.toofaraway_vehicle"),"error")
        TriggerServerEvent('debug:server:side:forth')
        return
    end
    if vehicle then
        QBCore.Functions.Notify(Lang:t("info.invehicle_vehicle"), 'error')
        TriggerServerEvent('debug:server:side:fifth')
    else
        local curVeh = QBCore.Functions.GetClosestVehicle()
        TaskTurnPedToFaceEntity(ped, curVeh, 1000)
        Wait(1000)
        TriggerServerEvent('give:can:prop')
        Wait(500)
        TriggerEvent('CxC:JerryCan:Animation:Trigger')
        fueling = true
        QBCore.Functions.Progressbar("reful_vehicle", Lang:t("info.progress_bar_vehicle"), Config.VehicleFillTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            exports[Config.FuelScript]:SetFuel(curVeh, Config.VehicleFillAmount)
            QBCore.Functions.Notify(Lang:t("success.veh_success"), 'success')
            TriggerServerEvent('CxC-Bakelis:server:RemoveItem', Config.VehicleCanItem, 1)
            TriggerServerEvent('CxC:show')
            TriggerServerEvent('debug:server:side:third')
            TriggerServerEvent('remove:can:prop')
        end, function() -- Cancel
            TriggerServerEvent('remove:can:prop')
            TriggerServerEvent('debug:server:side:second')
            fueling = false
            QBCore.Functions.Notify(Lang:t("error.canceled"), 'error')
        end)
    end
end)