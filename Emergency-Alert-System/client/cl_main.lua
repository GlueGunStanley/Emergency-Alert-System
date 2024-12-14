RegisterNetEvent('cl:EAS:TriggerOnAll')
AddEventHandler('cl:EAS:TriggerOnAll', function(type)
    local ped = PlayerPedId()
    if not Config.Settings.onfoot and IsPedOnFoot(ped) then return end
    local veh = GetVehiclePedIsIn(ped, false)
    if not Config.Settings.onbycycle and IsPedOnAnyBike(ped) and GetVehicleClass(veh) == 13 then return end
    SetVehicleRadioEnabled(veh, false)




    SetVehicleRadioEnabled(veh, true)
    TriggerServerEvent('sv:EAS:Callback')
end)














