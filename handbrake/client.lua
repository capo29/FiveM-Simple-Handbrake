local bhv = "P"
local brake = 1
local rVal = 189
local gVal = 12
local bVal = 15

function ShowInfo(text)
	BeginTextCommandThefeedPost("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandThefeedPostTicker(false, false)
end

Citizen.CreateThread(function()

    while true do

        Citizen.Wait(5)

        if IsControlJustPressed(1, 76) then

            TriggerEvent('handbrakeToggle')

        end

    end

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        spd = GetEntitySpeed(veh) * 2.236936
        if brake == 1 then
            SetVehicleHandbrake(veh, true)
        elseif brake == 0 then
            SetVehicleHandbrake(veh, false)
        end
    end
end)

RegisterNetEvent('handbrakeToggle')
AddEventHandler('handbrakeToggle', function()

    if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
        if brake == 0 then

            if spd < 6.0 then
                brake = 1
                bhv = "P"
                rVal = 189
                gVal = 12
                bVal = 15
                TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'park', 0.09)
                
            else
                ShowInfo("~r~Slow down ~s~to enable handbrake.")
            end

        elseif brake == 1 then

            brake = 0
            bhv = "D"
            rVal = 255
            gVal = 255
            bVal = 255
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'drive', 0.09)

        end
    end

end)

-- Roll when in drive and out of vehicle
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) ~= PlayerPedId() then
            if brake == 0 then
                SetVehicleHandbrake(GetPlayersLastVehicle(), false)
                SetVehicleBrake(GetPlayersLastVehicle(), false)
                SetVehicleForwardSpeed(GetPlayersLastVehicle(), 1.0)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then

            DrawText2(0.6460, 1.4154, 1.0,1.0,0.6, bhv, rVal, gVal, bVal, 255)
        
        end
    end
end)

function DrawText2(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
