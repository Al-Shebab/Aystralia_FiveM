RegisterCommand("myid", function(source)
    chatMessage(GetPlayerServerId(source))



end)

function chatMessage(msg)
    TriggerEvent("chatMessage", "[ELRP Staff Bot #1]:", {255,20,239}, msg)

end

--<MCustomM>