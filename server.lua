local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_jewelryrobberry")

vRPbm = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_basic_menu")
BMclient = Tunnel.getInterface("vRP_basic_menu","vRP_basic_menu")
vRPbsC = Tunnel.getInterface("vRP_barbershop","vRP_basic_menu")
Tunnel.bindInterface("vrp_basic_menu",vRPbm)



IsRobbing = false
RemCan = false


local rewardjew = math.random(3,13)
local rewardmoney = math.random(525,5974)
local moneygive = math.random(5120,7421)

RegisterServerEvent("jewelryrobberry:serverstart")
AddEventHandler("jewelryrobberry:serverstart", function()
    user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local cops = vRP.getUsersByGroup({"police"})
    if vRP.hasGroup({user_id,"police"}) then
        vRPclient.notify(player,{"~r~Cops can't rob banks."})
    else
        if #cops >= 0 and vRP.hasPermission({user_id,"robb"}) and IsRobbing == false then
            IsRobbing = true
            TriggerClientEvent("jewelryrobberry:start", source)
        else
            vRPclient.notify(player,{"~r~There Is Cooldown, Remaining : " .. RemM .. " Min " .. RemS .. " Sec"})
        end
    end
end)

RegisterServerEvent('jewelryrobberry:servercanceled')
AddEventHandler('jewelryrobberry:servercanceled', function()
    RemCan = true
    SetTimeout(1000, function()
        TriggerClientEvent('chatMessage', -1, "[ALARM]", {255, 0, 0}, "محل المجوهرات الأن أصبح متاح للسرقة")
        IsRobbing = true
    end)
end)

-- 900000

RegisterServerEvent('jewelryrobberry:serverchecksucess')
AddEventHandler('jewelryrobberry:serverchecksucess', function()
        SetTimeout(10000, function()
            IsRobbing = false
        end)
end)

-- 2700000

RegisterServerEvent('jewelryrobberry:remtime')
AddEventHandler('jewelryrobberry:remtime', function()
    RemM = 15
    repeat
        Citizen.Wait(0)
        --RemM = RemM - 1
    until RemM <= 0
    RemM = 0
end)

RegisterServerEvent('jewelryrobberry:remtimeS')
AddEventHandler('jewelryrobberry:remtimeS', function()
    
    RemS = 60
    RemM = 15
    repeat
        Citizen.Wait(1000)
        RemS = RemS - 1
    until RemS <= 0
    RemS = 0
end)




RegisterServerEvent('jewelryrobberry:sucess')
AddEventHandler('jewelryrobberry:sucess', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,"jewelry",rewardjew,true})
    end
end)

RegisterServerEvent('jewelryrobberry:sucessRW1')
AddEventHandler('jewelryrobberry:sucessRW1', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,"jewelry",1,true})
    end
end)

RegisterServerEvent('jewelryrobberry:sucessMO')
AddEventHandler('jewelryrobberry:sucessMO', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,"dirty_money",rewardmoney,true})
    end
end)

RegisterServerEvent('jewelryrobberry:allarmpolice')
AddEventHandler('jewelryrobberry:allarmpolice', function()
    local user_id = vRP.getUserId({source})
    local player = vRP:getUserSource({user_id})
    if(user_id)then
        vRP.sendServiceAlert({nil, "police",-630.17553710938,-236.52540588379,38.0570602416992-0.95,"Robbery in progress at the jewelry store!"})
    end
end)
