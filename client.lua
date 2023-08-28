-- الاماكن المسموحة فيها للسرقة
-- تعني انه متاح للسرقة ولم يتم سرقته من أحد False الـ
status1 = false
status2 = false
status3 = false
status4 = false
status5 = false
status6 = false
status7 = false
status8 = false
status9 = false
status10 = false
status11 = false
status12 = false
status13 = false
status14 = false
status15 = false
status16 = false
status17 = false
status18 = false
status19 = false
status20 = false
status21 = false
status22 = false
status23 = false
status24 = false
status25 = false

-- قيد السرقة
robbing = false
-- السرقة التالية
nextrobbing = true
-- في حال تم الغاء السرقة
cancelled = false
-- التحقق
check = true

-- عداد
counter = 0


-- احداثيات اماكن السرقة
coords3d = {
    {coordx = -626.29382324219, coordy = -239.09187316895, coordz = 38.794811248779 },
    {coordx = -625.21459960938, coordy = -238.34736633301, coordz = 39.223617553711 },   
    {coordx = -627.29907226563, coordy = -234.87519836426, coordz = 38.966594696045 },        
    {coordx = -626.46722412109, coordy = -233.53826904297, coordz = 39.223575592041 },        
    {coordx = -626.10083007813, coordy = -234.11917114258, coordz = 39.218456268311 },       
    {coordx = -627.44964599609, coordy = -234.31884765625, coordz = 38.862445831299 },        
    {coordx = -622.44360351563, coordy = -229.92840576172, coordz = 38.057010650635 },        
    {coordx = -624.39660644531, coordy = -224.11256408691, coordz = 38.057052612305 },        
    {coordx = -625.56530761719, coordy = -223.91967773438, coordz = 38.057052612305 },      
    {coordx = -626.81958007813, coordy = -224.28707885742, coordz = 38.057060241699 },       
    {coordx = -627.46771240234, coordy = -225.21870422363, coordz = 38.057060241699 },       
    {coordx = -627.53582763672, coordy = -226.63664245605, coordz = 38.057037353516 },      
    {coordx = -619.77795410156, coordy = -237.37419128418, coordz = 38.057048797607 },        
    {coordx = -618.57702636719, coordy = -237.54234313965, coordz = 38.057048797607 },        
    {coordx = -617.32000732422, coordy = -237.18495178223, coordz = 38.057048797607 },    
    {coordx = -616.51922607422, coordy = -236.22741699219, coordz = 38.057048797607 },        
    {coordx = -616.59136962891, coordy = -234.95397949219, coordz = 38.057048797607 },        
    {coordx = -625.42498779297, coordy = -227.33630371094, coordz = 39.223571777344 },        
    {coordx = -624.21508789063, coordy = -226.62153625488, coordz = 39.218448638916 },        
    {coordx = -619.8193359375,  coordy = -226.34170532227, coordz = 39.223571777344  },   
    {coordx = -619.23901367188, coordy = -227.3199005127, coordz = 39.243709564209  },       
    {coordx = -617.91809082031, coordy = -229.13171386719, coordz = 39.223617553711 },        
    {coordx = -617.11437988281, coordy = -230.2271270752, coordz = 39.243701934814  },       
    {coordx = -618.77655029297, coordy = -234.12934875488, coordz = 39.223613739014 },        
    {coordx = -619.76385498047, coordy = -234.82135009766, coordz = 39.223579406738 },
}


-- سكربت لـ استدعاء الايقونات
Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        if not HasStreamedTextureDictLoaded("D1") then
            RequestStreamedTextureDict("D1", true)
            while not HasStreamedTextureDictLoaded("D1") do
                Wait(1)
            end
        end
    end
end)


Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        -- استدعاء اللاعب
        local player = GetPlayerPed(-1)
        -- استدعاء احداثيات اللاعب بالاحداثيات الثلاثية
        local playerLoc = GetEntityCoords(player)
        if robbing == false then
            if nextrobbing == true then
                -- احداثيات ايقونة بدء المهمة
                DrawMarker(27, -631.1552734375,-229.40916442871,38.057052612305-0.95, 0, 0, 0, 0, 0, 0, 1.401, 1.401, 1.401, 255, 0, 0, 200, 0, 0, 0, 1)
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -631.1552734375,-229.40916442871,38.057052612305-0.95, 2) then
                    help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺳ ﺀﺪﺒﻟ E ﻂﻐﺿﺍ")
                    if IsControlJustReleased(1, 38) then
                        -- اذا تم بدء المهمة سيتم تشغيل دالة (فانكشن) بـ ملف السيرفر
                        TriggerServerEvent("jewelryrobberry:serverstart")
                    end
                end
            end
        end
    end
end)


-- RegisterNetEvent('jewelryrobberry:remtimec')
-- AddEventHandler('jewelryrobberry:remtimec', function()

--     Rem = 60
-- end)
-- عند التحقق من جهة السيرفر سيتم تشغيل هذا الدالة (الفانكشن) لبدء المهمة في جهة اللاعب (الكلاينت)
RegisterNetEvent('jewelryrobberry:start')
AddEventHandler('jewelryrobberry:start', function()
    notifypicture_message("CHAR_DETONATEPHONE",2,"<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺳ",false,"<FONT FACE = 'A9eelsh'>".."~r~!!ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺴﺑ ﻢﻗ")
    notifypicture_message("CHAR_DETONATEPHONE",2,"<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺳ",false,"<FONT FACE = 'A9eelsh'>".."~r~!!ﺔﻴﻧﺎﺛ 30 ﻚﻳﺪﻟ")
    -- notifypicture_message("<FONT FACE = 'A9eelsh'>".."CHAR_DETONATEPHONE",2,"ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺳ",false,"~r~!!ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺴﺑ ﻢﻗ ﺕﺃﺪﺑ ﺔﻗﺮﺴﻟﺍ")
    -- notifypicture_message("<FONT FACE = 'A9eelsh'>".."CHAR_DETONATEPHONE",2,"ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺳ",false,"~r~!!ﺔﻃﺮﺸﻟﺍ ﻡﻭﺪﻗ ﻞﺒﻗ ﺔﻴﻧﺎﺛ 03 ﻚﻳﺪﻟ")
    --notify_message
    robbing = true
    nextrobbing = false
    if cancelled == false then
        SetTimeout(30000, function()
            if cancelled == false then
                notifypicture_message("CHAR_DETONATEPHONE",1,"<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺳ",false,"<FONT FACE = 'A9eelsh'>".."~r~!ﺱﺮﺠﻟﺍ ﻕﻼﻃﺍ ﻢﺗ ﺪﻘﻟ")
                TriggerServerEvent('InteractSound_SV:PlayOnSource', 'allarm', 0.1)
                --TriggerServerEvent('jewelryrobberry:allarmpolice')
                notifypicture_message("CHAR_CALL911",1,"<FONT FACE = 'A9eelsh'>".."ﺔﻃﺮﺸﻟﺍ ﺰﻛﺮﻣ",false,"<FONT FACE = 'A9eelsh'>".."~r~ﺕﺍﺮﻫﻮﺠﻣ ﺔﻗﺮﺳ ﺔﻴﻠﻤﻋ ﺪﺟﻮﺗ")
            end
        end)
    elseif cancelled == true then
        notifypicture_message("CHAR_CALL911",1,"<FONT FACE = 'A9eelsh'>".."ﺔﻃﺮﺸﻟﺍ ﺰﻛﺮﻣ",false,"<FONT FACE = 'A9eelsh'>".."~r~ﺕﺍﺮﻫﻮﺠﻣ ﺔﻗﺮﺳ ﺔﻴﻠﻤﻋ ﺪﺟﻮﺗ")
    end
    SetTimeout(3600000, function()
        robbing = false
        nextrobbing = true
        cancelled = false
    end)
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if robbing == true then
            if nextrobbing == false then
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -632.86700439453,-238.65907287598,38.07377243042-0.95, 2.5) then
                    notifypicture_message("CHAR_DETONATEPHONE",1,"<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺳ",false,"<FONT FACE = 'A9eelsh'>".."~r~!(ﺔﻘﻄﻨﻤﻟﺍ ﺩﻭﺪﺣ) ﺔﻗﺮﺴﻟﺍ ﺀﺎﻐﻟﺍ ﻢﺗ ﺪﻘﻟ")
                    cancelled = true
                    robbing = false
                    if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -630.17553710938,-236.52540588379,38.0570602416992-0.95, 3) then
                        if cancelled == true then
                            help_message("<FONT FACE = 'A9eelsh'>".."~r~ﺔﻘﻴﻗﺩ 15 ﺪﻌﺑ ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺳ")
                        end
                    end
                    TriggerEvent('chatMessage', "[ALARM]", {255, 0, 0}, "يالنووووب")
                    TriggerServerEvent("jewelryrobberry:servercanceled")
                    TriggerServerEvent("jewelryrobberry:remtime")
                    TriggerServerEvent("jewelryrobberry:remtimeS")
                    SetTimeout(10000, function()
                        robbing = false
                        nextrobbing = true
                        cancelled = false
                    end)
                end
            end
        end
    end
end)
-- 900000
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if robbing == true then
        if status1 == false then
            DrawMarker(9, coords3d[1].coordx, coords3d[1].coordy, coords3d[1].coordz - 0.75   , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status2 == false then
            DrawMarker(9, coords3d[2].coordx, coords3d[2].coordy - 0.01, coords3d[2].coordz - 1.15  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status3 == false then
            DrawMarker(9, coords3d[3].coordx + 0.02, coords3d[3].coordy + 0.02, coords3d[3].coordz - 0.9  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status4 == false then
            DrawMarker(9, coords3d[4].coordx + 0.02, coords3d[4].coordy + 0.02, coords3d[4].coordz - 1.2  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status5 == false then
            DrawMarker(9, coords3d[5].coordx + 0.02, coords3d[5].coordy + 0.02, coords3d[5].coordz - 1.2  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status6 == false then
            DrawMarker(9, coords3d[6].coordx + 0.02, coords3d[6].coordy + 0.02, coords3d[6].coordz - 0.8  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status7 == false then
            DrawMarker(9, coords3d[7].coordx + 0.02, coords3d[7].coordy + 0.02, coords3d[7].coordz - 1.2  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status8 == false then
            DrawMarker(9, coords3d[8].coordx + 0.02, coords3d[8].coordy + 0.02, coords3d[8].coordz + 0.5  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status9 == false then
            DrawMarker(9, coords3d[9].coordx + 0.02, coords3d[9].coordy + 0.02, coords3d[9].coordz + 0.5  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status10 == false then
            DrawMarker(9, coords3d[10].coordx + 0.02, coords3d[10].coordy + 0.02, coords3d[10].coordz + 0.5  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status11 == false then
            DrawMarker(9, coords3d[11].coordx + 0.02, coords3d[11].coordy + 0.02, coords3d[11].coordz + 0.5  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status12 == false then
            DrawMarker(9, coords3d[12].coordx + 0.02, coords3d[12].coordy + 0.2, coords3d[12].coordz + 0.5  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status13 == false then
            DrawMarker(9, coords3d[13].coordx + 0.02, coords3d[13].coordy + 0.02, coords3d[13].coordz + 0.5  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status14 == false then
            DrawMarker(9, coords3d[14].coordx + 0.02, coords3d[14].coordy + 0.02, coords3d[14].coordz + 0.5  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status15 == false then
            DrawMarker(9, coords3d[15].coordx + 0.02, coords3d[15].coordy + 0.02, coords3d[15].coordz + 0.5  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status16 == false then
            DrawMarker(9, coords3d[16].coordx + 0.02, coords3d[16].coordy + 0.02, coords3d[16].coordz + 0.5  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status17 == false then
            DrawMarker(9, coords3d[17].coordx + 0.02, coords3d[17].coordy + 0.02, coords3d[17].coordz + 0.5  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status18 == false then
            DrawMarker(9, coords3d[18].coordx + 0.02, coords3d[18].coordy + 0.02, coords3d[18].coordz - 1.2  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status19 == false then
            DrawMarker(9, coords3d[19].coordx + 0.02, coords3d[19].coordy + 0.02, coords3d[19].coordz - 1.2  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status20 == false then
            DrawMarker(9, coords3d[20].coordx + 0.02, coords3d[20].coordy + 0.02, coords3d[20].coordz - 1.2  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status21 == false then
            DrawMarker(9, coords3d[21].coordx + 0.02, coords3d[21].coordy + 0.02, coords3d[21].coordz - 1.2  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status22 == false then
            DrawMarker(9, coords3d[22].coordx + 0.02, coords3d[22].coordy + 0.02, coords3d[22].coordz - 1.2  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status23 == false then
            DrawMarker(9, coords3d[23].coordx + 0.02, coords3d[23].coordy + 0.02, coords3d[23].coordz - 1.2  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status24 == false then
            DrawMarker(9, coords3d[24].coordx + 0.02, coords3d[24].coordy + 0.02, coords3d[24].coordz - 1.2  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        if status25 == false then
            DrawMarker(9, coords3d[25].coordx + 0.02, coords3d[25].coordy + 0.02, coords3d[25].coordz - 1.2  , 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 255,false, false, 2, true, "D1", "d1", false)
        end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

            if robbing == true then
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -626.39184570313,-239.2056427002,39.243705749512-1.40, 1) then
                    if status1 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status1 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -625.21459960938,-238.34736633301,39.223617553711-1.35, 1) then
                    if status2 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status2 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -627.29907226563,-234.87519836426,38.966594696045-1.15, 1) then
                    if status3 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status3 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -626.46722412109,-233.53826904297,39.223575592041-1.40, 1) then
                    if status4 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status4 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -626.10083007813,-234.11917114258,39.218456268311-1.40, 1) then
                    if status5 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status5 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -627.44964599609,-234.31884765625,38.862445831299-1.05, 1) then
                    if status6 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status6 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -622.44360351563,-229.92840576172,38.057010650635-0.95, 1) then
                    if status7 == false then
                        help_message("Press ~INPUT_CONTEXT~ to get money")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessMO')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status7 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -624.39660644531,-224.11256408691,38.057052612305-0.95, 1) then
                    if status8 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status8 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -625.56530761719,-223.91967773438,38.057052612305-0.95, 1) then
                    if status9 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status9 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -626.81958007813,-224.28707885742,38.057060241699-0.95, 1) then
                    if status10 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status10 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -627.46771240234,-225.21870422363,38.057060241699-0.95, 1) then
                    if status11 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status11 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -627.53582763672,-226.63664245605,38.057037353516-0.95, 1) then
                    if status12 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status12 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -619.77795410156,-237.37419128418,38.057048797607-0.95, 1) then
                    if status13 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status13 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -618.57702636719,-237.54234313965,38.057048797607-0.95, 1) then
                    if status14 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status14 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -617.32000732422,-237.18495178223,38.057048797607-0.95, 1) then
                    if status15 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status15 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -616.51922607422,-236.22741699219,38.057048797607-0.95, 1) then
                    if status16 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status16 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -616.59136962891,-234.95397949219,38.057048797607-0.95, 1) then
                    if status17 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucessRW1')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status17 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -625.42498779297,-227.33630371094,39.223571777344-1.40, 1) then
                    if status18 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status18 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -624.21508789063,-226.62153625488,39.218448638916-1.40, 1) then
                    if status19 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status19 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -619.8193359375,-226.34170532227,39.223571777344-1.40, 1) then
                    if status20 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status20 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -619.23901367188,-227.3199005127,39.243709564209-1.40, 1) then
                    if status21 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status21 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -617.91809082031,-229.13171386719,39.223617553711-1.40, 1) then
                    if status22 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status22 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -617.11437988281,-230.2271270752,39.243701934814-1.40, 1) then
                    if status23 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status23 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -618.77655029297,-234.12934875488,39.223613739014-1.40, 1) then
                    if status24 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status24 = true
                            counter = counter + 1
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -619.76385498047,-234.82135009766,39.223579406738-1.40, 1) then
                    if status25 == false then
                        help_message("<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺬﺧﻷ E ﻂﻐﺿﺍ")
                        if IsControlJustReleased(1, 38) then
                            TriggerServerEvent('jewelryrobberry:sucess')
                            loadAnimDict( "missheist_jewel" ) 
						    TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, 5000, 2, 0, false, false, false) 
                            status25 = true
                            counter = counter + 1
                        end
                    end
                end
            end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        if counter >= 3 then -- status1 == true and status2 == true and status3 == true and status4 == true and status5 == true and status6 == true and status7 == true and status8 == true and status8 == true and status9 == true and status10 == true and status11 == true and status12 == true and status13 == true and status14 == true and status15 == true and status16 == true and status17 == true and status18 == true and status19 == true and status20 == true and status21 == true and status22 == true and status23 == true and status24 == true and status25 == true then
            if check == true then
                notifypicture_message("CHAR_DETONATEPHONE",2,"<FONT FACE = 'A9eelsh'>".."ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺳ",false,"<FONT FACE = 'A9eelsh'>".."~r~!!ﻲﺷ ﻞﻛ ﺖﻗﺮﺳ ﺪﻘﻟ")
                check = false
                cancelled = true
                robbing = false
                counter = 0
                falsefunction()
                TriggerServerEvent("jewelryrobberry:serverchecksucess")
            end
            if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -630.17553710938,-236.52540588379,38.0570602416992-0.95, 3) then
              help_message("~r~You can only do the next robbery at the jewelry store after 60 minutes from the previous one!") 
            end
            SetTimeout(2700000, function()
                robbing = false
                nextrobbing = true
                cancelled = false
                check = true
                TriggerServerEvent("jewelryrobberry:serverchecksucess")
            end)
        end
        -- if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, -630.17553710938,-236.52540588379,38.0570602416992-0.95, 3) then
        --     if cancelled == true then
        --         help_message("<FONT FACE = 'A9eelsh'>".."~r~ﺔﻘﻴﻗﺩ 15 ﺪﻌﺑ ﺕﺍﺮﻫﻮﺠﻤﻟﺍ ﺔﻗﺮﺳ")
        --     end
        -- end
    end
end)

Citizen.CreateThread(function()
    blip = AddBlipForCoord(-622.24560546875,-230.86483764648,38.057060241699)
    SetBlipSprite(blip, 617)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 18)
    SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Vangelico (Jewelry)")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    blip = AddBlipForCoord(-631.1552734375,-229.40916442871,38.057052612305)
    SetBlipSprite(blip, 276)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 0)
    SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Robbery jewelry")
    EndTextCommandSetBlipName(blip)
end)


function position_verf(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function help_message(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function notify_message(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

function notifypicture_message(icon, type, sender, title, text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    SetNotificationMessage(icon, icon, true, type, sender, title, text)
    DrawNotification(false, true)
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 




function falsefunction()
    status1 = false
    status2 = false
    status3 = false
    status4 = false
    status5 = false
    status6 = false
    status7 = false
    status8 = false
    status9 = false
    status10 = false
    status11 = false
    status12 = false
    status13 = false
    status14 = false
    status15 = false
    status16 = false
    status17 = false
    status18 = false
    status19 = false
    status20 = false
    status21 = false
    status22 = false
    status23 = false
    status24 = false
    status25 = false
end



-- thx for Dynamic_eG#**** for making this function
function Draw3DText(x,y,z,textInput,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov   
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
end



RegisterFontFile('A9eelsh')
fontId = RegisterFontId('A9eelsh')
SetTextFont(fontId)

-- if status1 == false then
--     DrawMarker(28, coords3d[1].coordx,coords3d[1].coordy,coords3d[1].coordz -1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status2 == false then
--     DrawMarker(28, -625.21459960938,-238.34736633301,39.223617553711-1.35, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status3 == false then
--     DrawMarker(20, -627.29907226563,-234.87519836426,38.966594696045-1.15, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status4 == false then
--     DrawMarker(20, -626.46722412109,-233.53826904297,39.223575592041-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status5 == false then
--     DrawMarker(6, -626.10083007813,-234.11917114258,39.218456268311-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status6 == false then
--     DrawMarker(6, -627.44964599609,-234.31884765625,38.862445831299-1.05, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status7 == false then
--     DrawMarker(31, -622.44360351563,-229.92840576172,38.057010650635-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status8 == false then
--     DrawMarker(3, -624.39660644531,-224.11256408691,38.057052612305-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status9 == false then
--     DrawMarker(1, -625.56530761719,-223.91967773438,38.057052612305-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status10 == false then
--     DrawMarker(1, -626.81958007813,-224.28707885742,38.057060241699-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status11 == false then
--     DrawMarker(1, -627.46771240234,-225.21870422363,38.057060241699-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status12 == false then
--     DrawMarker(1, -627.53582763672,-226.63664245605,38.057037353516-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status13 == false then
--     DrawMarker(1, -619.77795410156,-237.37419128418,38.057048797607-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status14 == false then
--     DrawMarker(1, -618.57702636719,-237.54234313965,38.057048797607-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status15 == false then
--     DrawMarker(1, -617.32000732422,-237.18495178223,38.057048797607-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status16 == false then
--     DrawMarker(1, -616.51922607422,-236.22741699219,38.057048797607-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status17 == false then
--     DrawMarker(1, -616.59136962891,-234.95397949219,38.057048797607-0.95, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status18 == false then
--     DrawMarker(1, -625.42498779297,-227.33630371094,39.223571777344-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status19 == false then
--     DrawMarker(1, -624.21508789063,-226.62153625488,39.218448638916-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status20 == false then
--     DrawMarker(1, -619.8193359375,-226.34170532227,39.223571777344-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status21 == false then
--     DrawMarker(1, -619.23901367188,-227.3199005127,39.243709564209-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status22 == false then
--     DrawMarker(1, -617.91809082031,-229.13171386719,39.223617553711-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status23 == false then
--     DrawMarker(1, -617.11437988281,-230.2271270752,39.243701934814-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status24 == false then
--     DrawMarker(1, -618.77655029297,-234.12934875488,39.223613739014-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end
-- if status25 == false then
--     DrawMarker(1, -619.76385498047,-234.82135009766,39.223579406738-1.40, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
-- end



-- Developed And Enhanced By : Fibonacci#****
-- Thx for : 𒆜☠Black Death☠𒆜#**** for helping me with developing this project
-- The Original Script Coded By : Dracke#****
-- Githup of The Original Script : https://github.com/Dracke39/FiveM-Resources/tree/master/vrp_jewelryrobberry
-- Thx For Testing The Script With Me : 𒆜☠Black Death☠𒆜#**** , Sleman#**** , Anas#**** , d7uom1#**** , Mish3al#**** , ! Ibrahim#****
