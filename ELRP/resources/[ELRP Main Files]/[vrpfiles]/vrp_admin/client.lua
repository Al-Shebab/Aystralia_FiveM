--[[RageUI Stuff]]
players = {}

selectedPlayer = {}

players = {}
RMenu.Add("vrpadmin", "main", RageUI.CreateMenu(cfg.langs[cfg.lang].title, cfg.langs[cfg.lang].subtitle))
RMenu.Add("vrpadmin", "subMenu", RageUI.CreateSubMenu(RMenu:Get("vrpadmin", "main")))
RMenu.Add("vrpadmin","tpmenu",RageUI.CreateSubMenu(RMenu:Get("vrpadmin","subMenu")))
selectedPlayer = {}

RageUI.CreateWhile(
    1.0,
    RMenu:Get("vrpadmin", "main"),
    nil,
    function()
        RageUI.IsVisible(
            RMenu:Get("vrpadmin", "main"),
            true,
            true,
            true,
            function()
                for k, v in pairs(players) do
                    RageUI.Button(
                        "[" .. v[2] .. "] " .. v[1],
                        "Name: " .. v[1] .. " User ID: " .. v[3] .. " Server ID: " .. v[2],
                        {RightLabel = ">>>"},
                        true,
                        function(Hovered, Active, Selected)
                            if Selected then
                                RMenu:Get("vrpadmin", "subMenu"):SetTitle(v[1])
                                RMenu:Get("vrpadmin", "subMenu"):SetSubtitle(
                                    "Name: " .. v[1] .. " User ID: " .. v[3] .. " Server ID: " .. v[2]
                                )
                                selectedPlayer = players[k]
                            end
                        end,
                        RMenu:Get("vrpadmin", "subMenu")
                    )
                end
            end,
            function()
            end
        )

        RageUI.IsVisible(
            RMenu:Get("vrpadmin", "subMenu"),
            true,
            true,
            true,
            function()
                if cfg.buttonsEnabled["ban"][1] and buttons["ban"] then
                    banPlayerBtn(selectedPlayer)
                end
                if cfg.buttonsEnabled["kick"][1] and buttons["kick"] then
                    kickPlayerBtn(selectedPlayer)
                end
                if cfg.buttonsEnabled["revive"][1] and buttons["revive"] then
                    revPlayerBtn(selectedPlayer)
                end
                if cfg.buttonsEnabled["FREEZE"][1] and buttons["FREEZE"] then
                    frPlayerBtn(selectedPlayer)
                end
                if cfg.buttonsEnabled["TP2"][1] and buttons["TP2"] then
                    tp2PlayerBtn(selectedPlayer)
                    
                end
                if cfg.buttonsEnabled["TP2ME"][1] and buttons["TP2ME"] then
                    tp2meBtn(selectedPlayer)
                end
                RageUI.Button("Teleport Menu","Teleport the Player to places",{RightLabel= ">>>" },true,function(Hovered,Active,Selected)
                end,RMenu:Get("vrpadmin","tpmenu"))
            end,
            function()
            end
        )
    end
)

RageUI.CreateWhile(1.0, RMenu:Get('vrpadmin', 'main'), key, function()
    RageUI.IsVisible(RMenu:Get('vrpadmin', 'tpmenu'), true,true, true, function()
        if cfg.buttonsEnabled["TP2PLACE"][1] and buttons["TP2PLACE"] then
            tp2Island(selectedPlayer)
            tp2Legion(selectedPlayer)
        end
    end,function()
    end)
end)



RegisterNetEvent("TBRP:SendPlayersInfo")
AddEventHandler(
    "TBRP:SendPlayersInfo",
    function(players_table, btns)
        players = players_table
        buttons = btns
        RageUI.Visible(RMenu:Get("vrpadmin", "main"), not RageUI.Visible(RMenu:Get("vrpadmin", "main")))
    end
)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if IsControlJustPressed(1, cfg.key) then
                TriggerServerEvent("TBRP:GetPlayerInformation")
            end
        end
    end
)
isFrozen = false
RegisterNetEvent("TBRP:FREEZE")
AddEventHandler(
    "TBRP:FREEZE",
    function()
        isFrozen = not isFrozen
        FreezePlayer()
    end
)

function FreezePlayer() 
    FreezeEntityPosition(PlayerPedId(-1), not isFrozen)
end

---[[Get Message Functions]]

function getKickUserMsg(id)
    AddTextEntry("FMMC_MPM_NA", cfg.langs[cfg.lang].kickPlayerPrompt)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Kick Message:", "", "", "", "", 30)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
        local result = GetOnscreenKeyboardResult()
        if result then
            TriggerServerEvent("TBRP:KickPlayer", id, result)
        end
    end
    return false
end

function getBanUserMsg(id)
    AddTextEntry("FMMC_MPM_NA", cfg.langs[cfg.lang].banPlayerPrompt)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Ban Message:", "", "", "", "", 30)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
        local result = GetOnscreenKeyboardResult()
        if result then
            TriggerServerEvent("TBRP:BanPlayer", id, result)
        end
    end
    return false
end

---[[Buttons]]

function banPlayerBtn(player)
    RageUI.Button(
        cfg.langs[cfg.lang].banPlayer,
        cfg.langs[cfg.lang].banPlayerDesc,
        {
            LeftBadge = nil,
            RightBadge = nil,
            RightLabel = nil
        },
        true,
        function(Hovered, Active, Selected)
            if Selected then
                getBanUserMsg(player[2])
            end
        end
    )
end

function kickPlayerBtn(player)
    RageUI.Button(
        cfg.langs[cfg.lang].kickPlayer,
        cfg.langs[cfg.lang].kickPlayerDesc,
        {
            LeftBadge = nil,
            RightBadge = nil,
            RightLabel = nil
        },
        true,
        function(Hovered, Active, Selected)
            if Selected then
                getKickUserMsg(player[2])
            end
        end
    )
end
function revPlayerBtn(player)
    RageUI.Button(
        cfg.langs[cfg.lang].revPlayer,
        cfg.langs[cfg.lang].revPlayerDesc,
        {
            LeftBadge = nil,
            RightBadge = nil,
            RightLabel = nil
        },
        true,
        function(Hovered, Active, Selected)
            if Selected then
                TriggerServerEvent("TBRP:REVIVE", player[2])
            end
            if Hovered then
            -- My action the button is hovered by the mouse
            end
            if Active then
            -- My action the button is hightlighted
            end
        end
    )
end
function tp2PlayerBtn(player)
    RageUI.Button(
        cfg.langs[cfg.lang].tp2Player,
        cfg.langs[cfg.lang].tp2PlayerDesc,
        {
            LeftBadge = nil,
            RightBadge = nil,
            RightLabel = nil
        },
        true,
        function(Hovered, Active, Selected)
            if Selected then
                TriggerServerEvent("TBRP:TP2PLAYER", player[2])
            end
        end
    )
end
function tp2meBtn(player)
    RageUI.Button(
        cfg.langs[cfg.lang].tp2me,
        cfg.langs[cfg.lang].tp2meDesc,
        {
            LeftBadge = nil,
            RightBadge = nil,
            RightLabel = nil
        },
        true,
        function(Hovered, Active, Selected)
            if Selected then
                TriggerServerEvent("TBRP:TP2ME", player[2], GetEntityCoords(PlayerPedId(-1)))
            end
        end
    )
end
function frPlayerBtn(player)
    RageUI.Button(
        cfg.langs[cfg.lang].freezePlayer,
        cfg.langs[cfg.lang].freezePlayerDesc,
        {},
        true,
        function(Hovered, Active, Selected)
            if Selected then
                TriggerServerEvent("TBRP:FREEZEPLAYER", player[2])
            end
        end
    )
end


function tp2Island(player)
    RageUI.Button(
        cfg.langs[cfg.lang].tp2Island,
        cfg.langs[cfg.lang].tp2IslandDesc,
        {
            LeftBadge = nil,
            RightBadge = nil,
            RightLabel = nil
        },
        true,
        function(Hovered, Active, Selected)
            if Selected then
                TriggerServerEvent("TBRP:TP2ISLAND", player[2])
            end
        end
    )
end

function tp2Legion(player)
    RageUI.Button(
        "Teleport Player To Legion",
        "Teleports the player to Legion Square",
        {
            LeftBadge = nil,
            RightBadge = nil,
            RightLabel = nil
        },
        true,
        function(Hovered, Active, Selected)
            if Selected then
                TriggerServerEvent("TBRP:TP2LEGION", player[2])
            end
        end
    )
end
--[[TODO: SPECTATE]]
-- function spectatePlayerBtn(player)

--     local playerIdx = GetPlayerFromServerId(player[2])
--     local ped = GetPlayerPed(playerIdx)
--     RageUI.Button("Spectate Player" , "Make sure they aint doing bad stuff" , {

--     }, true, function(Hovered, Active, Selected)
--         if Selected then

--             spectatePlayer(ped)
--         end

-- end)

-- end
-- isSpectating = false

-- function spectatePlayer(targetPed)
-- 	local playerPed = PlayerPedId() -- yourself
-- 	enable = true

-- 	if targetPed == playerPed then enable = false end

-- 	if(enable)then
-- 		--local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))
-- 		NetworkSetInSpectatorMode(true, targetPed)
-- 		SetEntityInvincible(GetPlayerPed(-1), true)
--         SetEntityVisible(GetPlayerPed(-1), false, 0)
--         isSpectating = true
-- 	else
-- 		--local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))
-- 		NetworkSetInSpectatorMode(false, targetPed)
--         SetEntityInvincible(GetPlayerPed(-1), false)
--         SetEntityVisible(GetPlayerPed(-1), true, 0)
--         isSpectating = false
-- 	end
-- end
