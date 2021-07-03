Config = {}

Config.Marker = {
    color = {r = 0, g = 0, b = 255},
    size = {x = 1.0, y = 1.0, z = 1.0},
    type = 1
}

Config.VehicleLicensesOnly = false -- this includes ["dmv", "drive", "drive_bike", "drive_truck", "drive...."] anything with drive..

Config.Locations = {
    LSPD = vector3(442.03, -978.3, 29.69),
    SSPD = vector3(0,0,0) -- example for adding more location
}

Config.Discord = {
    WebhookUserName = "MB LICENSE MANAGER",
    Webhook = "",
    ServerName = "MasBagus Roleplay"
}

Language = {
    ['success_add'] = "Successfully Created License",
    ['success_revoke'] = "Successfully revoked License",
    ['add_license'] = 'You just got a %s!',
    ['remove_license'] = 'Your %s was removed!',
    ['no_access'] = "You don't have access to open it!",
    ['open_menu_help'] = "Press ~INPUT_CONTEXT~ to open License Manager"
}