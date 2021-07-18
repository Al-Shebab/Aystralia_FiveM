Thanks for downloading the script!
For support and further updates you can join my Discord: https://discord.gg/UyAu2jABzE

Installation:
1.) Put the script in your ressources folder
2.) Replace your skinchanger with my modified version
3.) Add 'start myCharCreator' to your server.cfg

Pay attention that esx_skin and NativeUIReloaded are running.
Check whether you have the right NativeUILua_Reloaded version (#downloads channel on my Discord)

Installation:
If you don't use myMultichar:
Go to esx_skin/client/main.lua and replace (about line 260)
	TriggerEvent('skinchanger:loadSkin', {sex = 0}, OpenSaveableMenu)
with
	TriggerEvent('myCreator:openMenu')

Also change this event in the client.lua of your register script (f.e. esx_identity)

If you use myMultichar, just set Config.useMyCharCreator to true