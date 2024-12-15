local lib = loadstring(game:HttpGet("https://gist.githubusercontent.com/2kbyte/62cb8cf7d9dbcd2e38e63f26f6da6fe9/raw/675be37944a85b54406ce27611d4b27e2828a99d/kavo-ui-v2.lua"))()
local window = lib.new("<b>Titanage GUI</b> | Press 'Backslash' to hide")



local main_category = window:Category("Main")
local auto_section = main_category:Section("Automatic")
local auto_join = auto_section:Cheat("toggle", "Auto Join PVE", "Automatically joins the PVE gamemode on execute.", function(enabled)
    if enabled then
        
    else

    end
end)

local auto_quest = auto_section:Cheat("toggle", "Auto Quest", "Automatically acquires a quest.", function(enabled)
    if enabled then
        
    else

    end
end)

local anti_death = auto_section:Cheat("toggle", "Anti-Death", "Bypasses reset on death; may take a few seconds.", function(enabled)
    if enabled then
        
    else

    end
end)

local main_section = main_category:Section("Main")
local fullbright = main_section:Cheat("toggle", "Fullbright", "Removes lighting effects and improves visibility.", function(enabled)
    if enabled then
        
    else

    end
end)


local esp_category = window:Category("ESP")
local esp_section = esp_category:Section("ESP")
local unnamed_esp = esp_section:Cheat("button", "Unammed ESP", "Player ESP made by ic3w0lf22.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
end)
local titan_esp = esp_section:Cheat("toggle", "Titan ESP", "Displays the position of all the titans.", function(enabled)
    if enabled then
        
    else

    end
end)
local supply_esp = esp_section:Cheat("toggle", "Supply Station ESP", "Displays the position of all the supply stations", function(enabled)
    if enabled then

    else

    end
end)

local settings_category = window:Category("Settings")
local settings_section = setting_category:Section("GUI Settings")

local settings_label = settings_section:Cheat("label", "Your choices auto-save and will load when executed.")