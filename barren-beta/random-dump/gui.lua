local lib = loadstring(game:HttpGet("https://pastebin.com/raw/Y2a93n47"))()
local win = lib.new(true, "Barren GUI | Press 'BackSlash' to hide this menu")
win.ShowCursor(Color3.fromRGB(255, 255, 255))


local malcategory = win:Category("Malicious")
local viscategory = win:Category("Visual")


--craft
local cracategory = win:Category("Craft")
local rpls = game:GetService("ReplicatedStorage")
local remote = rpls.Remotes

function craft(item)
    remote.CraftItem:InvokeServer(item)
    wait(.55)
end
-- weapons ammo clocthes healing tools placeable items
local weasec = cracategory:Sector("Weapons")
weasec:Cheat("Dropdown", "Weapon List", function(NewWeapon)
    getgenv().craftweapon = NewWeapon
end, {options = {"Light Machine Gun", "Hunting Rifle", "Assault Rifle", "Aprico Shotgun", "Rustic Aprico Shotgun", "Semi Automatic Rifle", "C4", "SMG", "Semiauto Pistol", "Combat Knife", "Claymore", "Katana", "Double Barrel", "Dark Double Barrel", "Satchel Charge", "Riot Shield", "Police Shield", "Knife on a Stick", "Shaolin Spade", "Crowbar", "Crossbow", "Revolever", "Bone Knife", "Potent Blowgun", "Nail Gun", "Bone Club", "Stone Spear", "Wooden Spear", "Wooden Club", "Baseball Bat", "Rock", "Bow", "Blowgun"}, default = "Select Weapon!"})
weasec:Cheat("Button", "", function()
    craft(game:GetService("ReplicatedStorage").ItemData[craftweapon])
end,{text = "Craft Weapon!"})

local ammsec = cracategory:Sector("Ammo")
ammsec:Cheat("Dropdown", "Ammo List", function(NewAmmo)
    getgenv().craftammo = NewAmmo
end, {options = {"Shotgun Shell", "Medium Bullet", "Light Bullet", "Heavy Bullet", "Nail", "Blowdart", "Arrow"}, default = "Select Ammo!"})
ammsec:Cheat("Button", "", function()
    craft(game:GetService("ReplicatedStorage").ItemData[craftammo])
end,{text = "Craft Ammo!"})

local closec = cracategory:Sector("Clothes")
closec:Cheat("Dropdown", "Clothes List", function(NewClothe)
    getgenv().craftclothe = NewClothe
end, {options = {"Metal Leg Pads", "Metal Helmet", "Skull Metal Helmet", "Metal Chestplate", "Roadsign Chestplate", "Night Vision Glasses", "Optical Scanner", "Rimless Glasses", "Bucket Helmet", "Weewoo Bucket", "Navy Parka", "Brown Parka", "Fireman Equipment", "Green Parka", "White T-Shirt",  }, default = "Select Clothes!"})

closec:Cheat("Dropdown", "Shirt List", function(NewShirt)
    getgenv().craftshirt = NewShirt
end, {options = {"White T-Shirt", "Disappointment T-Shirt", "Black Dab T-Shirt", "Black Skull T-Shirt", "Black T-Shirt", "Death God T-Shirt", "Flames T-Shirt", "Ghillie T-Shirt", "Green T-Shirt", "Orange T-Shirt", "Red Dab T-Shirt", "Red T-Shirt", "Target T-Shirt", "White Dab T-Shirt", "White Skull T-Shirt"}, default = "Select Shirt!"})

closec:Cheat("Button", "", function()
    craft(game:GetService("ReplicatedStorage").ItemData[craftclothe])
end,{text = "Craft Clothes!"})
closec:Cheat("Button", "", function()
    if craftshirt == "Disappointment T-Shirt" then
        craftshirt = "Bigger Disappointment T-Shirt"
    end
    craft(game:GetService("ReplicatedStorage").ItemData[craftshirt])
end,{text = "Craft Shirt!"})

local helsec = cracategory:Sector("Healing")
helsec:Cheat("Dropdown", "Healing List", function(NewHeal)
    getgenv().craftheal = NewHeal
end, {options = {"Stim Pack", "Antidote", "Bandage", "Herbal Bandage", "Raw Pumpkin Pie", "Linen Bandage"}, default = "Select Healing!"})
helsec:Cheat("Button", "", function()
    craft(game:GetService("ReplicatedStorage").ItemData[craftheal])
end,{text = "Craft Healing!"})

local toosec = cracategory:Sector("Tools")
toosec:Cheat("Dropdown", "Tools List", function(NewTool)
    getgenv().crafttool = NewTool
end, {options = {"Supply Drop Flare", "Modern Axe", "Ice Pick", "Sledge Hammer", "Cyber Hammer", "Binoculars", "Pickaxe", "Hatchet", "Trumpet", "Guitar", "Spyglass", "Flashlight", "Wrench", "Wooden Hatchet", "Torch", "Candle", "Stone Pickaxe", "Stone Hatchet", "Hammer"}, default = "Select Tool!"})
toosec:Cheat("Button", "", function()
    craft(crafttool)
end,{text = "Craft Tool!"})

local plasec = cracategory:Sector("Placables")
plasec:Cheat("Dropdown", "Placeable List", function(NewPlace)
    getgenv().craftplace = NewPlace
end, {options = {"Metal Wall", "Metal Tower", "Metal Gate", "Sieving Machine", "Sawmill", "Stone Wall", "Stone Tower", "Stone Gate", "Tall Large Billboard", "Large Wood Crate", "Large Billboard", "Tent", "Large Sign", "Furnace", "Tiki Torch", "Wooden Barricade", "Bed Roll", "Wooden Wall", "Wooden Gate", "Small Wood Crate", "Small Planter Box", "Lookout", "Fish Trap", "Clan Flag", "Campfire"}, default = "Select Placeable!"})
plasec:Cheat("Button", "", function()
    craft(craftplace)
end,{text = "Craft Placeable!"})

local itesec = cracategory:Sector("Items")
itesec:Cheat("Dropdown", "Item List", function(NewItem)
    getgenv().craftitem = NewItem
end, {options = {"Semiauto Mechanism", "Automatic Mechanism", "Gunpowder", "Cloth", "Rope", "Linen", "Leaf Weave",}, default = "Select Item!"})
itesec:Cheat("Button", "", function()
    craft(craftitem)
end,{text = "Craft Item!"})




local miscategory = win:Category("Misc")
local setcategory = win:Category("Settings")


--credits
local crecategory = win:Category("Credits")
local cresec = crecategory:Sector("Credits")
cresec:Cheat("Button", " Scripts made by Pans#1714", function()
    setclipboard("Pans#1714")
end,{text = "Set to Clipboard!"})
cresec:Cheat("Button", " UI Library made by detorious#1153", function()
    setclipboard("detorious#1153")
end,{text = "Set to Clipboard!"})