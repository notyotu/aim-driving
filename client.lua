-- Función para convertir km/h a m/s
local function kmhToMs(kmh)
    return kmh / 3.6
end

local function canAim(speed, maxSpeed)
    return speed <= maxSpeed
end

Citizen.CreateThread(function()
    -- Convertir las velocidades configuradas a m/s
    local driverMaxSpeedMs = kmhToMs(Config.DriverMaxAimingSpeedKMH)
    local passengerMaxSpeedMs = kmhToMs(Config.PassengerMaxAimingSpeedKMH)

    while true do
        local playerPed = PlayerPedId()
        local inVehicle = IsPedInAnyVehicle(playerPed, false)

        if inVehicle then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle)
            local isDriver = (GetPedInVehicleSeat(vehicle, -1) == playerPed)

            if isDriver then
                if not canAim(speed, driverMaxSpeedMs) then
                    DisableControlAction(0, 25, true) -- Disable aiming
                    DisableControlAction(0, 68, true) -- Disable aiming
                    DisableControlAction(0, 91, true) -- Disable aiming
                    DisableControlAction(0, 115, true) -- Disable aiming
                    DisableControlAction(0, 142, true) -- Disable aiming
                    DisableControlAction(0, 263, true) -- Disable aiming
                    DisableControlAction(0, 264, true) -- Disable aiming
                end
            else
                if not canAim(speed, passengerMaxSpeedMs) then
                    DisableControlAction(0, 25, true) -- Disable aiming
                    DisableControlAction(0, 68, true) -- Disable aiming
                    DisableControlAction(0, 91, true) -- Disable aiming
                    DisableControlAction(0, 115, true) -- Disable aiming
                    DisableControlAction(0, 142, true) -- Disable aiming
                    DisableControlAction(0, 263, true) -- Disable aiming
                    DisableControlAction(0, 264, true) -- Disable aiming
                end
            end
        end

        Citizen.Wait(0) -- Esto asegura que el script se ejecute constantemente
    end
end)


