Zones = {
    drawDistance = 10.0,

    Markers = {
        ["home"] = {
            isRestricted = false,
            interactionDistance = 0.45,
            action = function()
                if not RageUI.Visible(RMenu:Get("pz_lspd",'main')) then
                    DisplayHelpTextThisFrame("ACTION", false)
                end
                if IsControlJustPressed(0, 51) then
                    RageUI.Visible(RMenu:Get("pz_lspd",'main'), not RageUI.Visible(RMenu:Get("pz_lspd",'main')))
                end
            end,
        },
    },
}
