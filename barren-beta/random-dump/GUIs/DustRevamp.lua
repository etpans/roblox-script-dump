--Dust Project Made By Pans#1714--

--Window--
local Lib               = loadstring(game:HttpGet("https://pastebin.com/raw/A14KLcDc"))()
local Win               = Lib.new(true, "Dust Project | Press 'BackSlash' to hide this menu", UDim2.new(0, 615, 0, 340))
--Categories--
local MalCategory       = Win:Category("-| Malicious |-")
local VisCategory       = Win:Category("-| Visual |-")
local RaiCategory       = Win:Category("-| Raid |-")
local MisCategory       = Win:Category("-| Misc |-")
local InfCategory       = Win:Category("-| Information |-")
local CreCategory       = Win:Category("-| Credits |-")
--Sectors--
local MalSector1        = MalCategory:Sector("Aimbot Settings")
local MalSector2        = MalCategory:Sector("Aimbot Whitelist")
local MalSector3        = MalCategory:Sector("ESP Settings")
local MalSector4        = MalCategory:Sector("ESP Whitelist")
local VisSector1        = VisCategory:Sector("Crate ESP")
local VisSector2        = VisCategory:Sector("Farming ESP")
local VisSector3        = VisCategory:Sector("Other ESP")
local RaiSector1        = RaiCategory:Sector("Raid Tool")
local RaiSector2        = RaiCategory:Sector("Raid ESP")
local MisSector1        = MisCategory:Sector("Misc Scripts")
local InfSector1        = InfCategory:Sector("Malicious Information")
local InfSector2        = InfCategory:Sector("Visual Information")
local InfSector3        = InfCategory:Sector("Raid Information")
local InfSector4        = InfCategory:Sector("Misc Information")
local CreSector1        = CreCategory:Sector("Main Credits")
local CreSector2        = CreCategory:Sector("Script Credits")
local CreSector3        = CreCategory:Sector("Other Credits")
--Main--

--Malicious--
local MalCategory       = Window:Category("-| Malicious |-")
local MalAim            = MalCategory:Sector("Aimbot")
local MalAimList        = MalCategory:Sector("Aimbot Whitelist")
local MalEsp            = MalCategory:Sector("ESP")

--Malicious Aimbot--
MalAim:Cheat("Checkbox", "Aimbot Toggle",
    function(AimToggle)
    end
)
MalAim:Cheat("Keybind", "Aimbot Aim Keybind",
    function(AimKey)
    end
)
MalAim:Cheat("Keybind", "Aimbot Toggle Keybind",
    function(AimToggleKey)
    end
)

--Malicious Aimbot Whitelist--
MalAimList:Cheat("Checkbox", "Whitelist Toggle",
    function("ListToggle")
    end
)
MalAimList:Cheat("Dropdown", "Player Whitelist",
    function(PlayerList)
    end,{
        options = {
            "Players",
        }
    }
)
MalAimList:Cheat("Button", "Add Player",
    function(AddPlayer)
    end,{
        text = "Add Player!",
    }
)

--[[Aimbot
 - Toggle/Togglekey
 - Aimkey
 - Whitelist
    ESP
 - Name
 - Heath
 - Distance
 - Chams
--]]
--Malicious Main--

--Visuals Category--
local VisualsCategory = Window:Category("Visuals")
--Visuals Sector--
local VisualsCrate = VisualsCategory:Sector("Crate ESP")
local VisualsFarming = VisualsCategory:Sector("Farming Tool")
--[[Crate ESP
 - Military Crate 
 - Elite Crate
 - Regular Crate
 - Med Crate
 - Barrels
 - Airdrop
 - Food Crate
    Farming Tool
 - Stone
 - Metal Ore
 - Sulfur Ore
 - Cloth
 - Tree
 - Mushroom
 - Deer
    Other ESP
 - Trap ESP
 - Sleeper ESP
 - Bag ESP
--]]

--Raid Category--
local RaidCategory = Window:Category("Raid")
--Raid Sectors--
local RaidTool = RaidCategory:Sector("Raiding Tool")
local RaidESP = RaidCategory:Sector("Raid ESP")
--[[Raid Tool
 - Toolcuboards/Med-Armoured TC/Armoured TC
 - Walls/Half Walls
 - Roofs/Triangular Roofs/Foundations/Triangular Foundations
 - Sheet Metal/Armoured/Wooden/Shop Fronts/Ladder Hatches
 - Funaces/Boxes/Ladders/Campfires/Sleepingbags
 - Tranparnecy 0.7
    Raid ESP
 - Large Crates
 - Small Crates
 - Toolcuboards/Med-Armoured TC/Armoured TC
 - Furnaces
 - Repair Bench
--]]

--Misc Category--
local MiscCategory = Window:Category("Misc")
--Misc Sectors--
local MiscMain = MiscCategory:Sector("Misc")
local MiscOther = MiscCategory:Sector("Misc Scripts")
--[[Misc
 - Anti Drown
 - Chat Spy
 - Inf Jump
 - Inf Yield
 - Fullbright
--]]
--Information Category--
local InformationCategory = Window:Category("Information")
--Information Sectors--
local InformationMalicous = InformationCategory:Sector("Malicous Information")
local InformationVisuals = InformationCategory:Sector("Visuals Information")
local InformationRaid = InformationCategory:Sector("Raid Information")
local InformationMisc = InformationCategory:Sector("Misc Information")
--Information Main--

--Credits Category--
local CreditsCategory = Window:Category("Credits")
--Credits Sectors--
local CreditsMain = CreditsCategory:Sector("Credits")
local CreditsScripts = CreditsCategory:Sector("Script Credits")
--Credits Main--
CreditsMain:Cheat("Label", " - By Pans#1714")
CreditsMain:Cheat("Label", " - Ui Library by detourious#1153")
CreditsScripts:Cheat("Label", " - ")