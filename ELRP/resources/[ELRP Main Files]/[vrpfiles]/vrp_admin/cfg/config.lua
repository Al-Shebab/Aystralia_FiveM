cfg = {}

cfg.key = 166

cfg.perm = "admin.menu"
cfg.IgnoreButtonPerms = true

cfg.admins_cant_ban_admins = false

cfg.lang = "en"

--[[
    en = English
    fr = French
    ger = German
    es = Spanish
    pt = Portuguese
    it = Italian
    de = Deutsch 


]]

--[[ {enabled -- true or false}, permission required ]]
cfg.buttonsEnabled = {             
    ["ban"] = {true, "player.ban"},
    ["kick"] = {true, "player.kick"},
    ["revive"] = {true, "player.revive"},
    ["TP2"] = {true, "player.tpto"},
    ["TP2ME"] = {true, "player.tpto"},
    ["FREEZE"] = {true, "player.freeze"},
    ["TP2PLACE"] = {true, "player.tptoplace"}
    --[[
        FREEZE = Freeze Player
        ban = ban player
        kick = kick player
        revive = Revive Player,
        TP2 = Teleport to Player,
        TP2ME = Teleport player to me

    ]]

}

cfg.langs = {
    ["en"] = {
        title = "VRP Admin",
        subtitle = "Admin Menu",
        banPlayer = "Ban Player",
        banPlayerDesc = "Drop the ban hammer!",
        banPlayerPrompt = "Ban Message:",
        kickPlayer = "Kick Player",
        kickPlayerDesc = "Give em' a quick boot!",
        kickPlayerPrompt = "Kick Message:",
        revPlayer = "Revive Player",
        revPlayerDesc = "Get em' up quick",
        freezePlayer = "Freeze Player",
        freezePlayerDesc = "Stop em' dead in their tracks",
        tp2Player = "Teleport to player",
        tp2PlayerDesc = "It does what it says",
        tp2me = "Teleport Player to me",
        tp2meDesc = "Also does what it says.",
        tp2Island = "Teleport Player to Admin Island",
        tp2IslandDesc = "Teleports Player to Admin Island"

    },
    ["fr"] = {
        title = "VRP Administration",
        subtitle = "Menu Administration",
        banPlayer = "Bannir le joueur",
        banPlayerDesc = "Lachez le marteau d'interdiction",
        banPlayerPrompt = "Message du bannissement :",
        kickPlayer = "Expulser le joueur",
        kickPlayerDesc = "Aidez le à partir rapidement !",
        kickPlayerPrompt = "Message d'expulsion :",
        revPlayer = "Réanimer le joueur",
        revPlayerDesc = "Aidez le joueur à vivre.",
        freezePlayer = "Figer le joueur",
        freezePlayerDesc = "Stopper toutes actions du joueur",
        tp2Player = "Se téléporter sur le joueur",
        tp2PlayerDesc = "Vous téléporte sur le joueur",
        tp2me = "Téléporter le joueur sur soi",
        tp2meDesc = "Amène le joueur sur votre position."
    },
    ["ger"] = {
        title = "VRP-Verwaltung",
        subtitle = "Verwaltungsmenü",
        banPlayer = "Den Spieler sperren",
        banPlayerDesc = "Lass den Sperrhammer fallen",
        banPlayerPrompt = "Nachricht verbieten:",
        kickPlayer = "Spieler rausschmeißen",
        kickPlayerDesc = "Helfen Sie ihm, schnell wegzukommen!",
        kickPlayerPrompt = "Räumungsmeldung:",
        revPlayer = "Spieler wiederbeleben",
        revPlayerDesc = "Dem Spieler live helfen",
        freezePlayer = "Den Spieler einfrieren",
        freezePlayerDesc = "Alle Spieleraktionen stoppen",
        tp2Player = "Zum Spieler teleportieren",
        tp2PlayerDesc = "Sie teleportieren zum Spieler",
        tp2me = "Teleportieren Sie den Spieler zu sich selbst",
        tp2meDesc = "Bringen Sie den Spieler zu Ihrer Position"
    },
    ["es"] = {
        title= "VRP Admin",
        subtitle = "Menú de Administración",
        banPlayer = "Prohibir al jugador",
        banPlayerDesc = "¡Suelta el martillo de la prohibición!",
        banPlayerPrompt = "Mensaje de prohibición:",
        kickPlayer = "Jugador de patadas",
        kickPlayerDesc = "¡Dales una patada rápida!",
        kickPlayerPrompt = "Mensaje de patada:",
        revPlayer = "Revivir al jugador",
        revPlayerDesc = "Levántenlos rápido.",
        freezePlayer = "Congelar el reproductor",
        freezePlayerDesc = "Deténgalos muertos en su camino",
        tp2Player = "Teletransportar al jugador",
        tp2PlayerDesc = "Hace lo que dice",
        tp2me = "Teletransportar al jugador a mí",
        tp2meDesc = "También hace lo que dice"

    },
    ["pt"] = {
        title = "VRP Admin",
        subtitle = "Menu Admin",
        banPlayer = "Proibição de jogar",
        banPlayerDesc = "Largue o martelo de proibição!",
        banPlayerPrompt = "Mensagem de proibição:",
        kickPlayer = "Jogador de pontapés",
        kickPlayerDesc = "Dêem-lhes uma bota rápida!",
        kickPlayerPrompt = "Mensagem de Pontapé:",
        revPlayer = "Reanimar o jogador",
        revPlayerDesc = "Levantem-se rapidamente",
        freezePlayer = "Jogo de Congelar",
        freezePlayerDesc = "Parem-nos' mortos no seu caminho",
        tp2Player = "Teletransporte para o jogador",
        tp2PlayerDesc = "Ele faz o que diz",
        tp2me = "Teleportador para mim",
        tp2meDesc = "Faz também o que está escrito"

    },
    ["it"] = {
        title = "VRP Admin",
        subtitle = "Admin Menu",
        banPlayer = "Ban Giocatore",
        banPlayerDesc = "Getta il martello del ban!",
        banPlayerPrompt = "Messaggio di divieto:",
        kickPlayer = "Calciatore",
        kickPlayerDesc = "Dagli un avvio veloce!",
        kickPlayerPrompt = "Messaggio di calcio:",
        revPlayer = "Ravviva il giocatore",
        revPlayerDesc = "Alzati in fretta",
        freezePlayer = "Ferma il giocatore",
        freezePlayerDesc = "Fermateli, che muoiano sulle loro tracce",
        tp2Player = "Teletrasporto al giocatore",
        tp2PlayerDesc = "Fa quello che dice",
        tp2me = "Teletrasporta giocatore a me",
        tp2meDesc = "Fa anche quello che dice"

    },
    ["de"] = {
        title = "VRP-beheerder",
        subtitle = "Admin Menu",
        banPlayer = "Ban Speler",
        banPlayerDesc = "Laat de bandhamer vallen!",
        banPlayerPrompt = "Ban Bericht:",
        kickPlayer = "Kick Player",
        kickPlayerDesc = "Geef ze een snelle start!",
        kickPlayerPrompt = "Kick Bericht:",
        revPlayer = "Herleef de speler",
        revPlayerDesc = "Haal ze snel op.",
        freezePlayer = "Vriesspeler",
        freezePlayerDesc = "Stop em' dood in hun sporen",
        tp2Player = "Teleport naar speler",
        tp2PlayerDesc = "Het doet wat het zegt",
        tp2me = "Teleporteren van de speler naar mij",
        tp2meDesc = "Doet ook wat er staat."

    }








}

return cfg
