CreateThread(function() 
   if Config.TargetPurchase then exports[Config.TargetScript]:AddTargetModel(Config.GasPumpModels, { 
      options = { 
          { 
             type = Config.TargetType, 
             event = Config.TargetBoatTrigger, 
             icon =  Config.TargetIcon, label = Config.TargetBoatTranslation ..Config.GasCanPriceBoat 
          }, 
          { 
             type = Config.TargetType, 
             event = Config.TargetVehicleTrigger, 
             icon =  Config.TargetIcon, label = Config.TargetVehicleTranslation ..Config.GasCanPriceVehicle 
          } 
      }, 
      distance = 2.5 
      }) 
   end 
end)