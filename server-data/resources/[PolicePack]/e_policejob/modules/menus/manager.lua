local plainteCooldown = false
local rdvCooldown = false

function initializeMenus()
    RMenu.Add("pz_lspd", 'main', RageUI.CreateMenu("Home","Home of the police"))
    Citizen.Wait(1)
    RageUI.CloseAll()
    Citizen.CreateThread(function()
        while true do
            RageUI.IsVisible(RMenu:Get("pz_lspd",'main'),true,true,true,function()
                local dist = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),Zones.Markers["home"].location, false)
                if dist > 1.5 then RageUI.Visible(RMenu:Get("pz_lspd",'main'), false) end
                RageUI.Button("File Complaint "," Allows you to file a complaint online.", {RightLabel = "→→"}, not plainteCooldown, function(_,_,s)
                    if s then
                        RageUI.Visible(RMenu:Get("pz_lspd",'main'), false)
                        DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 5000)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                            Wait(0);
                        end
                        if (GetOnscreenKeyboardResult()) then
                            local result = GetOnscreenKeyboardResult()
                            TriggerServerEvent("pz_lspd:plainte", result)
                            PlaySoundFrontend(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", 0)
                            ESX.ShowAdvancedNotification('~b~Police Station', '~g~Success', "Your complaint has been sent correctly and will be dealt with as soon as possible.", 'CHAR_CHAT_CALL', 2, true, false, 60)
                            plainteCooldown = true
                            Citizen.SetTimeout((1000*60)*2, function()
                                plainteCooldown = false
                            end)
                        end
                    end
                end)

            --[[    RageUI.Button("Request an appointment", "Allows you to send an appointment request online.", {RightLabel = "→→"}, not rdvCooldown, function(_,_,s)
                    if s then
                        RageUI.Visible(RMenu:Get("pz_lspd",'main'), false)
                        TriggerServerEvent("pz_lspd:rdv")
                        PlaySoundFrontend(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", 0)
                        ESX.ShowAdvancedNotification('~b~Police Station', '~g~Succès', "Your appointment request has been taken into account, you will receive an invitation shortly.", 'CHAR_CHAT_CALL', 2, true, false, 60)
                        rdvCooldown = true
                        Citizen.SetTimeout((1000*60)*30, function()
                            rdvCooldown = false
                        end)
                    end
                end)

         --[[

       RageUI.Button("Obtain my criminal record "," Allows you to obtain a duplicate of your criminal record.", {RightLabel = "→→"}, true, function(_,_,s)
                    if s then
                        RageUI.Visible(RMenu:Get("pz_lspd",'main'), false)
                    end
                end) ]]

                
            end, function()    
            end, 1)
            Citizen.Wait(0)
        end
    end)
end
