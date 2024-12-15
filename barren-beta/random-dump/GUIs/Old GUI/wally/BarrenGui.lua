--UI Libaray Made by Wally
local library = loadstring(game:HttpGet("https://pastebin.com/raw/FTdYYNX3",true))() 
--Combat Section:
local Combat = library:CreateWindow("Combat")
----Combat Gun Mod Section:
Combat:Section("Gun Mods")
local Gunmodall = Combat:Button("Gun Mod All",function()
    while true do wait() 
        if Combat.flags.Infammotoggle then
            if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end
            for _,a in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
                if a.Name == "Ammo" and a.ClassName == "IntValue" then
                    a.Value = 2147483647
                elseif a.Name == "ChangeAmmo" then
                    a:AddCallHook("FireServer",function(o,...)
                    end)
                end
            end
        end
        if Combat.flags.Norecoilspreadtoggle then
            for _,b in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
                if b.Name == "Setting" then
                    local Module = require(b)
                    Module.Spread = 0
                    Module.SpreadMax = 0
                    Module.MovingSpreadAddition = 0
                    Module.SpreadCooldownTime = 0
                    Module.ShotsToMaxSpread = 2147483647
                    Module.ADSSpreadReduction = 2147483647
                    Module.CrouchSpreadReduction = 2147483647
                end
            end
        end
        if Combat.flags.Fireratetoggle then
            for _,c in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
                if c.Name == "Setting" then
                    local Module = require(c)
                    Module.FireRate = 0
                end
            end
        end
        if Combat.flags.Automatictoggle then
            for _,d in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
                if d.Name == "Setting" then
                    local Module = require(d)
                    Module.Auto = true
                end
            end
        end
    end
end)
local Gunmodslot = Combat:Button("Gun Mod Slot",function()
    while true do wait()
        if _G.Hotbarslots == "Slot 1" then
            if Combat.flags.Infammotoggle then
                if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end
                for _,a in pairs(game:GetService("Players").LocalPlayer.Backpack.Tool01.GunScript_Server:GetChildren()) do
                    if a.Name == "Ammo" and a.ClassName == "IntValue" then
                        a.Value = 2147483647
                    elseif a.Name == "ChangeAmmo" then
                        a:AddCallHook("FireServer",function(o,...)
                        end)
                    end
                end
            end
            if Combat.flags.Norecoilspreadtoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool01.Setting)
                Module.Spread = 0
                Module.SpreadMax = 0
                Module.MovingSpreadAddition = 0
                Module.SpreadCooldownTime = 0
                Module.ShotsToMaxSpread = 2147483647
                Module.ADSSpreadReduction = 2147483647
                Module.CrouchSpreadReduction = 2147483647
            end
            if Combat.flags.Fireratetoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool01.Setting)
                Module.FireRate = 0
            end
            if Combat.flags.Automatictoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool01.Setting)
                Module.Auto = true
            end
        end
        if _G.Hotbarslots == "Slot 2" then
            if Combat.flags.Infammotoggle then
                if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end
                for _,a in pairs(game:GetService("Players").LocalPlayer.Backpack.Tool02.GunScript_Server:GetChildren()) do
                    if a.Name == "Ammo" and a.ClassName == "IntValue" then
                        a.Value = 2147483647
                    elseif a.Name == "ChangeAmmo" then
                        a:AddCallHook("FireServer",function(o,...)
                        end)
                    end
                end
            end
            if Combat.flags.Norecoilspreadtoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool02.Setting)
                Module.Spread = 0
                Module.SpreadMax = 0
                Module.MovingSpreadAddition = 0
                Module.SpreadCooldownTime = 0
                Module.ShotsToMaxSpread = 2147483647
                Module.ADSSpreadReduction = 2147483647
                Module.CrouchSpreadReduction = 2147483647
            end
            if Combat.flags.Fireratetoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool02.Setting)
                Module.FireRate = 0
            end
            if Combat.flags.Automatictoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool02.Setting)
                Module.Auto = true
            end
        end
        if _G.Hotbarslots == "Slot 3" then
            if Combat.flags.Infammotoggle then
                if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end
                for _,a in pairs(game:GetService("Players").LocalPlayer.Backpack.Tool03.GunScript_Server:GetChildren()) do
                    if a.Name == "Ammo" and a.ClassName == "IntValue" then
                        a.Value = 2147483647
                    elseif a.Name == "ChangeAmmo" then
                        a:AddCallHook("FireServer",function(o,...)
                        end)
                    end
                end
            end
            if Combat.flags.Norecoilspreadtoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool03.Setting)
                Module.Spread = 0
                Module.SpreadMax = 0
                Module.MovingSpreadAddition = 0
                Module.SpreadCooldownTime = 0
                Module.ShotsToMaxSpread = 2147483647
                Module.ADSSpreadReduction = 2147483647
                Module.CrouchSpreadReduction = 2147483647
            end
            if Combat.flags.Fireratetoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool03.Setting)
                Module.FireRate = 0
            end
            if Combat.flags.Automatictoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool03.Setting)
                Module.Auto = true
            end
        end
        if _G.Hotbarslots == "Slot 4" then
            if Combat.flags.Infammotoggle then
                if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end
                for _,a in pairs(game:GetService("Players").LocalPlayer.Backpack.Tool04.GunScript_Server:GetChildren()) do
                    if a.Name == "Ammo" and a.ClassName == "IntValue" then
                        a.Value = 2147483647
                    elseif a.Name == "ChangeAmmo" then
                        a:AddCallHook("FireServer",function(o,...)
                        end)
                    end
                end
            end
            if Combat.flags.Norecoilspreadtoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool04.Setting)
                Module.Spread = 0
                Module.SpreadMax = 0
                Module.MovingSpreadAddition = 0
                Module.SpreadCooldownTime = 0
                Module.ShotsToMaxSpread = 2147483647
                Module.ADSSpreadReduction = 2147483647
                Module.CrouchSpreadReduction = 2147483647
            end
            if Combat.flags.Fireratetoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool04.Setting)
                Module.FireRate = 0
            end
            if Combat.flags.Automatictoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool04.Setting)
                Module.Auto = true
            end
        end
        if _G.Hotbarslots == "Slot 5" then
            if Combat.flags.Infammotoggle then
                if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end
                for _,a in pairs(game:GetService("Players").LocalPlayer.Backpack.Tool05.GunScript_Server:GetChildren()) do
                    if a.Name == "Ammo" and a.ClassName == "IntValue" then
                        a.Value = 2147483647
                    elseif a.Name == "ChangeAmmo" then
                        a:AddCallHook("FireServer",function(o,...)
                        end)
                    end
                end
            end
            if Combat.flags.Norecoilspreadtoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool05.Setting)
                Module.Spread = 0
                Module.SpreadMax = 0
                Module.MovingSpreadAddition = 0
                Module.SpreadCooldownTime = 0
                Module.ShotsToMaxSpread = 2147483647
                Module.ADSSpreadReduction = 2147483647
                Module.CrouchSpreadReduction = 2147483647
            end
            if Combat.flags.Fireratetoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool05.Setting)
                Module.FireRate = 0
            end
            if Combat.flags.Automatictoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool05.Setting)
                Module.Auto = true
            end
        end
        if _G.Hotbarslots == "Slot 6" then
            if Combat.flags.Infammotoggle then
                if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end
                for _,a in pairs(game:GetService("Players").LocalPlayer.Backpack.Tool06.GunScript_Server:GetChildren()) do
                    if a.Name == "Ammo" and a.ClassName == "IntValue" then
                        a.Value = 2147483647
                    elseif a.Name == "ChangeAmmo" then
                        a:AddCallHook("FireServer",function(o,...)
                        end)
                    end
                end
            end
            if Combat.flags.Norecoilspreadtoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool06.Setting)
                Module.Spread = 0
                Module.SpreadMax = 0
                Module.MovingSpreadAddition = 0
                Module.SpreadCooldownTime = 0
                Module.ShotsToMaxSpread = 2147483647
                Module.ADSSpreadReduction = 2147483647
                Module.CrouchSpreadReduction = 2147483647
            end
            if Combat.flags.Fireratetoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool06.Setting)
                Module.FireRate = 0
            end
            if Combat.flags.Automatictoggle then
                local Module = require(game:GetService("Players").LocalPlayer.Backpack.Tool06.Setting)
                Module.Auto = true
            end
        end
    end
end)
Combat:Dropdown("Hotbar Slots",{location = _G;flag = "Hotbarslots";list = {"Slot 1";"Slot 2";"Slot 3";"Slot 4";"Slot 5";"Slot 6"}},function()
end)
Combat:Section("Gun Mod Settings")
local Infammotoggle = Combat:Toggle("Inf Ammo",{flag = "Infammotoggle"},function()
end)
local Norecoilspreadtoggle = Combat:Toggle("No Recoil/Spread",{flag = "Norecoilspreadtoggle"},function()
end)
local Fireratetoggle = Combat:Toggle("Fast Fire Rate",{flag = "Fireratetoggle"},function()
end)
local Automatictoggle = Combat:Toggle("Automatic",{flag = "Automatictoggle"},function()
end)
----Combat Healing Section:
Combat:Section("Healing")
local Healtoggle = Combat:Toggle("Heal Toggle",{flag = "Healtoggle"},function()
end)
Combat:Bind("Heal Toggle Bind",{flag = "Healtogglebind";kbonly = true;default = Enum.KeyCode.G;},function()
end)
local Autoheal = Combat:Toggle("Auto Heal",{flag = "Autoheal"},function()
--[[    while Combat.flags.Autoheal do wait(.55)
        local Slot = game:GetService("Players").LocalPlayer.stats.inventory.slot06
        local Bandage = game:GetService("ReplicatedStorage").ItemData[_G.Bandage]
        for _,a in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Stats.Frame:GetChildren()) do
            if a.Name == "Bleed" then
                game:GetService("ReplicatedStorage").Remotes.Use:InvokeServer(Slot)
                game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(Bandage)
            end
        end
    end
end)
FIX THIS SECTION
]]
Combat:Dropdown("Bandages",{location = _G;flag = "Bandage";list = {"Bandage";"Linen Bandage";"Herbal Bandage"}},function()
end)
----Combat Hitbox Section:
Combat:Section("Hitboxes")
local Torsohitbox = Combat:Slider("Torso Hitbox",{precise = false;default = 2;min = 2;max = 10;flag = "Torsohitboxsize"},function()
end)
local Headhitbox = Combat:Slider("Head Hitbox",{precise = false;default = 2;min = 2;max = 10;flag = "Headhitboxsize"},function()
end)
--Movement Section:
local Movement = library:CreateWindow("Movement")
Movement:Section("Movement")
----Infinite Jump Section:
local Infjump = Movement:Button("Infinite Jump",function()
end)
local Infjumppower = Movement:Slider("Jump Power",{precise = false;default = 25;min = 25;max = 50;flag = "Infjumppower"})
Movement:Section("More Coming Soon!")
--Miscellaneous Section:
local Misc = library:CreateWindow("Misc")
----Crafting Section:
Misc:Section("Crafting")
local Levelhack = Misc:Button("Level Hack",function()
end)
local Crafthack = Misc:Button("Craft",function()
end)
Misc:SearchBox("Items (E.g. Metal Chestplate)",{location = _G;flag = "Items";list = {"Metal Chestplate";}},function()
end)
Misc:Section("Automatic")
local Autoharvest = Misc:Toggle("Auto Harvest",{flag = "Autoharvesttoggle"},function()
end)
local Autoswitch = Misc:Toggle("Auto Switch",{flag = "Autoswitchtoggle"},function()
end)
local Autoscrap = Misc:Toggle("Auto Scrap",{flag = "Autoscraptoggle"},function()
end)
local Antiafk = Misc:Toggle("Anti AFK",{flag = "Antiafktoggle"},function()
end)
Misc:Section("Other")
local InfiniteYield = Misc:Button("Infinite Yield (Admin)",function()
end)
local Owlhub = Misc:Button("Owl Hub (Aimbot)",function()
end)
local Adminalert = Misc:Toggle("Admin Alert",{flag = "Adminalerttoggle"},function()
end)
local Chatspy = Misc:Toggle("Chat Spy",{flag = "Chatspytoggle"},function()
end)
--Miscellaneous 2 Section:
local Visual = library:CreateWindow("Visual")
Visual:Section("Visual")
local Mapesp = Visual:Button("Map ESP",function()
end)
local Fullbright = Visual:Toggle('Fullbright',{flag = "Fullbrighttoggle"},function()
end)
local Airmilcrateesp = Visual:Toggle("Air/Mil Crate ESP",{flag = "Airmilcrateesptoggle"},function()
end)
local Oreesp = Visual:Toggle("Ore ESP",{flag = "Oreesptoggle"},function()
end)
local Crateesp = Visual:Toggle("Large/Small Crate ESP",{flag = "Crateesptoggle"},function()
end)
local Flagesp = Visual:Toggle("Clan flag ESP",{flag = "Clanflagesp"},function()
end)
--Settings Section:
local Settings = library:CreateWindow("Settings")
Settings:Section("Settings")
Settings:Bind("Hide Gui Bind",{flag = "Hideguibind";konly = true;default = Enum.KeyCode.P;},function()
end)
local DestroyGui = Settings:Button("Destroy Gui",function()
    game.CoreGui.ScreenGui:Destroy()
end)
--Credits Section:
local Credits = library:CreateWindow("Credits")
Credits:Section("Made By: Pans#1714")
Credits:Section("Discord Server: M9eJepY")
local Copycode = Credits:Button("Click to Copy Code",function()
    setclipboard("https://discord.gg/M9eJepY")
end)