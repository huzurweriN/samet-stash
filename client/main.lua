RegisterNetEvent('vorp:SelectedCharacter')
AddEventHandler('vorp:SelectedCharacter', function(charid)
    Wait(7000)
    TriggerServerEvent('samet:kisiseldepo', charid)
end)

RegisterCommand("<", function()
   TriggerServerEvent('samet:kisiselenvanter')
end)


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    SetTextFontForCurrentCommand(15) 
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DisplayText(str, x, y)
end
    Citizen.CreateThread(function()   
        if Config.Yazikullan == true then 
        while true do 
            Citizen.Wait(1)
            local coords = GetEntityCoords(PlayerPedId())
            for k,v in pairs(Config.Kordinat) do
                if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.coords[1], v.coords[2], v.coords[3], false) < 2.0  then
                DrawTxt(Config.Ac['text'], 0.50, 0.95, 0.7, 0.5, true, 223, 44, 53, 255, true)
                if IsControlJustPressed(0, Config.Ac['key']) then
                    ExecuteCommand(""..Config.Komut.."")                
                end    
            end
        end
    end
        end
    end)