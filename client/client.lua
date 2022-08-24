local QBCore = exports['qb-core']:GetCoreObject()
local isDead = false
local deadAnimDict = "dead"
local deadAnim = "dead_a"

function SetDisplay(bool)
    SendNUIMessage({
        type = "show",
        status = bool,
        time = GlobalState.Timer,
    })

    SendNUIMessage({action = 'starttimer', value = GlobalState.Timer})

    SendNUIMessage({action = 'showbutton'})
end

RegisterNetEvent('hospital:client:Revive', function()
    if isDead then
        SetDisplay(false, false)
        isDead = false 
    end
end)

RegisterNetEvent('hospital:client:SendToBed', function(id, data, isRevive)
    print(isDead)
    if isDead then
        SetDisplay(false, false)
        isDead = false 
    end
end)

RegisterNetEvent('ch-deathui:client:onDeath')
AddEventHandler('ch-deathui:client:onDeath', function(dead)
    if not isDead and dead then
        SetDisplay(true, true)
        isDead = dead
    
        Citizen.CreateThread(function()
            Citizen.Wait(GlobalState.Timer * 60 * 1000)
            if isDead then
                TriggerServerEvent('hospital:server:RespawnAtHospital')
            end
        end)
    end
end)
