ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('lspd_dispatch:sendAlert')
AddEventHandler('lspd_dispatch:sendAlert', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == RB.Dispatch.PoliceJob then
        TriggerClientEvent('lspd_dispatch:sendAlert', -1, data)
    end
end)