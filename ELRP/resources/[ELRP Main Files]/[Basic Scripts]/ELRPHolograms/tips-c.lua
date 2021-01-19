RegisterCommand("help", function()
    notify("~g~Discord: ~n~https://discord.gg/dxBYUcz")
    notify("~r~TeamSpeak: ~n~ts.el-rp.uk")
    notify("~p~Admin: ~n~If you want to make report ~n~join TeamSpeak ~n~Waiting for Support")


 end, false)
 
 function msg(text)
     TriggerEvent("chatMessage", "[EasyTips]", {255,0,0}, text)
 end

 --<MCustomM>