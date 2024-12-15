local rpls = game:GetService("ReplicatedStorage")
local remote = rpls.Remotes

local function craft(item)
    remote.CraftItem:InvokeServer(item)
    wait(.55)
end

craft(rpls.ItemData["Dark Double Barrel"])
craft(rpls.ItemData["Assault Rifle"])
craft(rpls.ItemData["Hunting Rifle"])
craft(rpls.ItemData["Skull Metal Helmet"])
craft(rpls.ItemData["Roadsign Chestplate"])
craft(rpls.ItemData["Metal Leg Pads"])
craft(rpls.ItemData["Red T-Shirt"])
craft(rpls.ItemData["Red Mask"])
craft(rpls.ItemData["Bone Boots"])
craft(rpls.ItemData["Brown Parka"])
craft(rpls.ItemData["Ice Pick"])
craft(rpls.ItemData["Police Shield"])
