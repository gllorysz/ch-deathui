local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('hospital:server:SetLaststandStatus', function(isDead)
	local src = source
	TriggerClientEvent('ch-deathui:client:onDeath', src, isDead)
end)
