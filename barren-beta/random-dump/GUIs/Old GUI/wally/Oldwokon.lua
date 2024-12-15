local library = loadstring(game:HttpGet("https://pastebin.com/raw/FTdYYNX3",true))() 


--Combat Section:
local Combat = library:CreateWindow('Combat')
Combat:Section('Gun Modifications')
local Gunmod = Combat:Button('Gun Mod All', function()
    print("Gun Modded")
end)
Combat:Section('Gun Modifications 2')
Combat:Dropdown('Hotbar Slots', {
    location = _G;
    flag = "Slot";
    list = {"Slot 1";"Slot 2";"Slot 3";"Slot 4";"Slot 5";"Slot 6";}
}, function(new)
    print(_G.Slot)
end)
local Gunmodslot = Combat:Button("Mod Slot", function()
    print("Gun Modded Slot")
end)
Combat:Section('Healing')
Combat:Dropdown('Bandage Type', {
    location = _G;
    flag = "Bandage";
    list = {"Cloth Bandage";"Linen Bandage";"Herbal Bandage";}
}, function(new)
    print(_G.Bandage)
end)
local Autoheal = Combat:Toggle('Auto Heal', {flag = "Autoheal"})
spawn(
    function()
        while wait(1) do
            if Combat.flags.Autoheal then
                print("Auto Heal Activated")
            end
        end
    end
)
local Toggleheal = Combat:Toggle('Toggle Heal', {flag = "Toggleheal"})
Combat:Bind('Toggle Heal Bind', {
    flag = "Healbind";
    kbonly = true;
    default = Enum.KeyCode.G;
}, function()
    if Combat.flags.Toggleheal then
        print("Key pressed")
    end
end)
Combat:Section('Hitbox')
local Togglehitbox = Combat:Toggle('Toggle Hitboxes', {flag = "Togglehitbox"})
spawn(
    function()
        while wait(1) do
            if Combat.flags.Toggleheadhitbox then
                print("Hitbox Activated")
            end
        end
    end
)
local Toggleheadhitbox = Combat:Toggle('Toggle Head Hitboxes', {flag = "Toggleheadhitbox"})
spawn(
    function()
        while wait(1) do
            if Combat.flags.Toggleheadhitbox then
                print("Head Hitbox Activated")
            end
        end
    end
)
--Movement Section:
local Movement = library:CreateWindow('Movement')
Movement:Section('Movement')
local Jumppower = Movement:Slider("Jump Power",
{
    precise = false,
    default = 35,
    min = 20,
    max = 50,
    flag = "jumppower"
},
function()
  game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(Movement.flags.jumppower)
end)
local Toggleinfjump = Movement:Toggle('Infinte Jump', {flag = "Toggleinfjump"})
spawn(
    function()
        while wait(1) do
            if Movement.flags.Toggleinfjump then
                print("Inf jump Activated")
            end
        end
    end
)
Movement:Section('More Coming Soon...')
--Miscellaneous Section:
local Misc = library:CreateWindow('Misc')
Misc:Section('Crafting')
local Levelhack = Misc:Toggle('Level Hack', {flag = "Leveltoggle"})
spawn(
    function()
        while wait(1) do
            if Misc.flags.Leveltoggle then
                print("Level hack Activated")
            end
        end
    end
)
local Craft = Misc:Button('Craft Item', function()
    print("Item crafted")
end)
Misc:SearchBox('Items (e.g Metal Chestplate)', {
  location = _G;
   flag = "Items";
   list = {"Metal Chestplate";}
}, function(new)
   print(_G.Items)
end)
--Miscellaneous 2 Section:
local Misc2 = library:CreateWindow('Misc 2')

--Settings Section:
local Settings = library:CreateWindow('Settings')

--Credits Section:
local Credits = library:CreateWindow('Credits')

Settings:Section('GUI Settings:')
 
local Destroy = Settings:Button("Destroy GUI", function()
game:GetService("CoreGui").ScreenGui:Destroy()
end)



Credits:Section('Credits:')
Credits:Section('Pans#1714')
Credits:Section('Discord: g3jHeWW')