ESX = nil

local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('lspd_dispatch:sendAlert')
AddEventHandler('lspd_dispatch:sendAlert', function(data)
    if PlayerData.job and PlayerData.job.name == RB.Dispatch.PoliceJob then
        ESX.ShowNotification(_U('dispatch_alert', data.message))

        local blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
        SetBlipSprite(blip, RB.Dispatch.BlipSprite)
        SetBlipColour(blip, RB.Dispatch.BlipColor)
        SetBlipScale(blip, 1.0)
        SetBlipAsShortRange(blip, false)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(_U('dispatch_title'))
        EndTextCommandSetBlipName(blip)

        Citizen.Wait(RB.Dispatch.BlipTime * 1000)
        RemoveBlip(blip)
    end
end)

function SendDispatchAlert(message)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    TriggerServerEvent('lspd_dispatch:sendAlert', {
        message = message,
        coords = { x = coords.x, y = coords.y, z = coords.z }
    })
end