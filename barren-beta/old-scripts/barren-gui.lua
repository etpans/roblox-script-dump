-- Instances:
local Barren = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local SideFrame = Instance.new("Frame")
local MainScriptFrame = Instance.new("Frame")
local LevelHackButton = Instance.new("TextButton")
local MainTitle = Instance.new("TextLabel")
local MetalKitButton = Instance.new("TextButton")
local DBKitButton = Instance.new("TextButton")
local FarmingKitButton = Instance.new("TextButton")
local CrateButton = Instance.new("TextButton")
local BlockESPButton = Instance.new("TextButton")
local BlockName = Instance.new("TextBox")
local Line = Instance.new("Frame")
local HealToggleButton = Instance.new("TextButton")
local HealToggleKey = Instance.new("TextBox")
local CraftHackButton = Instance.new("TextButton")
local ItemName = Instance.new("TextBox")
local HealSlotName = Instance.new("TextBox")
local CloseButton = Instance.new("TextButton")
local Title = Instance.new("TextLabel")
local OpenOptionButton = Instance.new("TextButton")
local Credit = Instance.new("TextLabel")
local CloseOptionButton = Instance.new("TextButton")
local HomeFrame = Instance.new("Frame")
local HomeText1 = Instance.new("TextLabel")
local HomeText2 = Instance.new("TextLabel")
local NothingButton = Instance.new("TextButton")
local Title_2 = Instance.new("TextLabel")
local Line_2 = Instance.new("Frame")
local MiscScriptFrame = Instance.new("Frame")
local InfiniteJumpButton = Instance.new("TextButton")
local HBEButton = Instance.new("TextButton")
local RejoinToggleKey = Instance.new("TextBox")
local FullbrightButton = Instance.new("TextButton")
local JumpHeight = Instance.new("TextBox")
local Line_3 = Instance.new("Frame")
local MiscTitle = Instance.new("TextLabel")
local AdminAlertButton = Instance.new("TextButton")
local RejoinButton = Instance.new("TextButton")
local HBESize = Instance.new("TextBox")
local ExtraScriptFrame = Instance.new("Frame")
local ZenonButton = Instance.new("TextButton")
local InfiniteYieldButton = Instance.new("TextButton")
local Line_4 = Instance.new("Frame")
local ExtraTitle = Instance.new("TextLabel")
local MainSettingFrame = Instance.new("Frame")
local SettingFrame = Instance.new("Frame")
local HomeButton = Instance.new("TextButton")
local MainScriptButton = Instance.new("TextButton")
local MiscButton = Instance.new("TextButton")
local ExtraButton = Instance.new("TextButton")
local SettingButton = Instance.new("TextButton")
local Title_3 = Instance.new("TextLabel")
local OpenFrame = Instance.new("Frame")
local OpenButton = Instance.new("TextButton")

--Properties:
Barren.Name = "Barren"
Barren.Parent = game.CoreGui
Barren.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = Barren
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Position = UDim2.new(0.263505012, 0, 0.218095332, 0)
MainFrame.Size = UDim2.new(0, 550, 0, 40)
MainFrame.ZIndex = 2
MainFrame.Draggable = true

SideFrame.Name = "SideFrame"
SideFrame.Parent = MainFrame
SideFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
SideFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
SideFrame.Position = UDim2.new(-0.000444779842, 0, 0.99828577, 0)
SideFrame.Size = UDim2.new(0, 40, 0, 264)

MainScriptFrame.Name = "MainScriptFrame"
MainScriptFrame.Parent = MainFrame
MainScriptFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
MainScriptFrame.BackgroundTransparency = 0.150
MainScriptFrame.BorderColor3 = Color3.fromRGB(21, 21, 21)
MainScriptFrame.Position = UDim2.new(0.0722824931, 0, 1, 0)
MainScriptFrame.Size = UDim2.new(0, 510, 0, 264)
MainScriptFrame.Visible = false

LevelHackButton.Name = "LevelHackButton"
LevelHackButton.Parent = MainScriptFrame
LevelHackButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
LevelHackButton.BackgroundTransparency = 0.200
LevelHackButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
LevelHackButton.Position = UDim2.new(0.276470602, 0, 0.185606077, 0)
LevelHackButton.Size = UDim2.new(0, 100, 0, 50)
LevelHackButton.Font = Enum.Font.SciFi
LevelHackButton.Text = "Level Hack"
LevelHackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LevelHackButton.TextSize = 16.000
LevelHackButton.MouseButton1Down:connect(function()
game.Players.LocalPlayer.stats.other.Level.Value = 40
end)

MainTitle.Name = "MainTitle"
MainTitle.Parent = MainScriptFrame
MainTitle.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
MainTitle.BackgroundTransparency = 1.000
MainTitle.BorderColor3 = Color3.fromRGB(21, 21, 21)
MainTitle.Position = UDim2.new(0.0285775233, 0, 0.0280304737, 0)
MainTitle.Size = UDim2.new(0, 113, 0, 30)
MainTitle.Font = Enum.Font.SourceSans
MainTitle.Text = "Main Scripts"
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.TextSize = 26.000
MainTitle.TextWrapped = true
MainTitle.TextXAlignment = Enum.TextXAlignment.Left
MainTitle.TextYAlignment = Enum.TextYAlignment.Top

MetalKitButton.Name = "MetalKitButton"
MetalKitButton.Parent = MainScriptFrame
MetalKitButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
MetalKitButton.BackgroundTransparency = 0.200
MetalKitButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
MetalKitButton.Position = UDim2.new(0.0431372561, 0, 0.185606062, 0)
MetalKitButton.Size = UDim2.new(0, 100, 0, 50)
MetalKitButton.Font = Enum.Font.SciFi
MetalKitButton.Text = "Metal Kit"
MetalKitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MetalKitButton.TextSize = 16.000
MetalKitButton.MouseButton1Down:connect(function()
spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Assault Rifle"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Double Barrel"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Hunting Rifle"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Riot Shield"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Metal Chestplate"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Metal Helmet"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Metal Leg Pads"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Red Mask"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["White T-Shirt"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Bone Boots"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)
end)

DBKitButton.Name = "DBKitButton"
DBKitButton.Parent = MainScriptFrame
DBKitButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
DBKitButton.BackgroundTransparency = 0.200
DBKitButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
DBKitButton.Position = UDim2.new(0.0431373268, 0, 0.708333373, 0)
DBKitButton.Size = UDim2.new(0, 100, 0, 50)
DBKitButton.Font = Enum.Font.SciFi
DBKitButton.Text = "DB Kit"
DBKitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DBKitButton.TextSize = 16.000
DBKitButton.MouseButton1Down:connect(function()
spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Double Barrel"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Bed Roll"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Bone Boots"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)
end)

FarmingKitButton.Name = "FarmingKitButton"
FarmingKitButton.Parent = MainScriptFrame
FarmingKitButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
FarmingKitButton.BackgroundTransparency = 0.200
FarmingKitButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
FarmingKitButton.Position = UDim2.new(0.0431372076, 0, 0.443181783, 0)
FarmingKitButton.Size = UDim2.new(0, 100, 0, 50)
FarmingKitButton.Font = Enum.Font.SciFi
FarmingKitButton.Text = "Farming Kit"
FarmingKitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmingKitButton.TextSize = 16.000
FarmingKitButton.MouseButton1Down:connect(function()
spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Ice Pick"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Modern Axe"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Balaclava"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

spawn(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData["Bone Boots"],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)
end)

CrateButton.Name = "CrateButton"
CrateButton.Parent = MainScriptFrame
CrateButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
CrateButton.BackgroundTransparency = 0.200
CrateButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
CrateButton.Position = UDim2.new(0.515686214, 0, 0.185606077, 0)
CrateButton.Size = UDim2.new(0, 100, 0, 50)
CrateButton.Font = Enum.Font.SciFi
CrateButton.Text = "Airdrop/Military Crate ESP"
CrateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CrateButton.TextSize = 15.000
CrateButton.TextWrapped = true
CrateButton.MouseButton1Down:connect(function()
Important = {Players = game:GetService("Players"), Workspace = game:GetService("Workspace"), CoreGui = game:GetService("CoreGui")}
local enabledesp = false

local searchFor = "Military Crate"

for i,v in pairs(game.Workspace.Harvestables:GetChildren()) do
	if v.Name == searchFor or v.Name == "Airdrop Crate" then
    print(v)
	local bb = Instance.new("BillboardGui", game.CoreGui)
		bb.Name = "I"
        	bb.Adornee = v
        	bb.ExtentsOffset = Vector3.new(0, 1, 0)
        	bb.AlwaysOnTop = true
        	bb.Size = UDim2.new(0, 5, 0, 5)
        	bb.StudsOffset = Vector3.new(0, 3, 0)


        	local displayframe = Instance.new("Frame", bb)
        	displayframe.ZIndex = 10
        	displayframe.BackgroundTransparency = 1
        	displayframe.Size = UDim2.new(1,0,1,0)
        
        	local name = Instance.new("TextLabel", displayframe)
        	name.Name = "Name"
       	 	name.ZIndex = 10
        	name.Text = v.Name
        	name.Visible = true
        	name.TextColor3 = Color3.new(0,255,0)
        	name.BackgroundTransparency = 1
        	name.Size = UDim2.new(1,0,10,0)
        	name.Font = Enum.Font.SourceSansLight
        	name.TextSize = 14
        	name.TextStrokeTransparency = .5
    end
end
end)

BlockESPButton.Name = "BlockESPButton"
BlockESPButton.Parent = MainScriptFrame
BlockESPButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
BlockESPButton.BackgroundTransparency = 0.200
BlockESPButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
BlockESPButton.Position = UDim2.new(0.515686154, 0, 0.450757533, 0)
BlockESPButton.Size = UDim2.new(0, 100, 0, 50)
BlockESPButton.Font = Enum.Font.SciFi
BlockESPButton.Text = "Block ESP"
BlockESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BlockESPButton.TextSize = 16.000
BlockESPButton.MouseButton1Down:connect(function()
Important = {Players = game:GetService("Players"), Workspace = game:GetService("Workspace"), CoreGui = game:GetService("CoreGui")}
local enabledesp = false

local searchFor = BlockName.Text

for i,v in pairs(game.Workspace.Harvestables:GetChildren()) do
	if v.Name == searchFor then
    print(v)
	local bb = Instance.new("BillboardGui", game.CoreGui)
		bb.Name = "I"
        	bb.Adornee = v
        	bb.ExtentsOffset = Vector3.new(0, 1, 0)
        	bb.AlwaysOnTop = true
        	bb.Size = UDim2.new(0, 5, 0, 5)
        	bb.StudsOffset = Vector3.new(0, 3, 0)


        	local displayframe = Instance.new("Frame", bb)
        	displayframe.ZIndex = 10
        	displayframe.BackgroundTransparency = 1
        	displayframe.Size = UDim2.new(1,0,1,0)
        
        	local name = Instance.new("TextLabel", displayframe)
        	name.Name = "Name"
       	 	name.ZIndex = 10
        	name.Text = v.Name
        	name.Visible = true
        	name.TextColor3 = Color3.new(0,255,0)
        	name.BackgroundTransparency = 1
        	name.Size = UDim2.new(1,0,10,0)
        	name.Font = Enum.Font.SourceSansLight
        	name.TextSize = 14
        	name.TextStrokeTransparency = .5
    end
end
end)

BlockName.Name = "BlockName"
BlockName.Parent = MainScriptFrame
BlockName.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
BlockName.BorderColor3 = Color3.fromRGB(12, 12, 12)
BlockName.Position = UDim2.new(0.515686274, 0, 0.708333373, 0)
BlockName.Size = UDim2.new(0, 100, 0, 50)
BlockName.Font = Enum.Font.SourceSans
BlockName.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
BlockName.PlaceholderText = "Block Name"
BlockName.Text = ""
BlockName.TextColor3 = Color3.fromRGB(255, 255, 255)
BlockName.TextSize = 15.000
BlockName.TextWrapped = true

Line.Name = "Line"
Line.Parent = MainScriptFrame
Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line.Position = UDim2.new(0.0254901964, 0, 0.141666815, 0)
Line.Size = UDim2.new(0, 118, 0, 1)

HealToggleButton.Name = "HealToggleButton"
HealToggleButton.Parent = MainScriptFrame
HealToggleButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
HealToggleButton.BackgroundTransparency = 0.200
HealToggleButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
HealToggleButton.Position = UDim2.new(0.760784268, 0, 0.185606018, 0)
HealToggleButton.Size = UDim2.new(0, 100, 0, 50)
HealToggleButton.Font = Enum.Font.SciFi
HealToggleButton.Text = "Heal Toggle"
HealToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HealToggleButton.TextSize = 16.000
HealToggleButton.MouseButton1Down:connect(function()
game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
if key == HealToggleKey.Text then
local args = {
    [1] = game:GetService("Players").LocalPlayer.stats.inventory[HealSlotName.Text],
}
game:GetService("ReplicatedStorage").Remotes.Use:InvokeServer(unpack(args))

local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData.Bandage,
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
end
end)
end)

HealToggleKey.Name = "HealToggleKey"
HealToggleKey.Parent = MainScriptFrame
HealToggleKey.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
HealToggleKey.BorderColor3 = Color3.fromRGB(12, 12, 12)
HealToggleKey.Position = UDim2.new(0.758823574, 0, 0.708333254, 0)
HealToggleKey.Size = UDim2.new(0, 100, 0, 50)
HealToggleKey.Font = Enum.Font.SourceSans
HealToggleKey.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
HealToggleKey.PlaceholderText = "Toggle Key"
HealToggleKey.Text = ""
HealToggleKey.TextColor3 = Color3.fromRGB(255, 255, 255)
HealToggleKey.TextSize = 15.000
HealToggleKey.TextWrapped = true

CraftHackButton.Name = "CraftHackButton"
CraftHackButton.Parent = MainScriptFrame
CraftHackButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
CraftHackButton.BackgroundTransparency = 0.200
CraftHackButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
CraftHackButton.Position = UDim2.new(0.276470542, 0, 0.450757533, 0)
CraftHackButton.Size = UDim2.new(0, 100, 0, 50)
CraftHackButton.Font = Enum.Font.SciFi
CraftHackButton.Text = "Craft Anthing"
CraftHackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CraftHackButton.TextSize = 16.000
CraftHackButton.MouseButton1Down:connect(function()
local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData[ItemName.Text],
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
Event:FireServer(args)
end)

ItemName.Name = "ItemName"
ItemName.Parent = MainScriptFrame
ItemName.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
ItemName.BorderColor3 = Color3.fromRGB(12, 12, 12)
ItemName.Position = UDim2.new(0.276470661, 0, 0.708333254, 0)
ItemName.Size = UDim2.new(0, 100, 0, 50)
ItemName.Font = Enum.Font.SourceSans
ItemName.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
ItemName.PlaceholderText = "Item Name"
ItemName.Text = ""
ItemName.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemName.TextSize = 15.000
ItemName.TextWrapped = true

HealSlotName.Name = "HealSlotName"
HealSlotName.Parent = MainScriptFrame
HealSlotName.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
HealSlotName.BorderColor3 = Color3.fromRGB(12, 12, 12)
HealSlotName.Position = UDim2.new(0.760784388, 0, 0.450757533, 0)
HealSlotName.Size = UDim2.new(0, 100, 0, 50)
HealSlotName.Font = Enum.Font.SourceSans
HealSlotName.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
HealSlotName.PlaceholderText = "Bandage Slot Number (slot06)"
HealSlotName.Text = ""
HealSlotName.TextColor3 = Color3.fromRGB(255, 255, 255)
HealSlotName.TextSize = 15.000
HealSlotName.TextWrapped = true

CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
CloseButton.BorderColor3 = Color3.fromRGB(21, 21, 21)
CloseButton.Position = UDim2.new(0.938181818, 0, 0.142857149, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.SciFi
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20.000
CloseButton.MouseButton1Down:connect(function()
OpenFrame.Visible = true
MainFrame.Visible = false
end)

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
Title.BorderColor3 = Color3.fromRGB(21, 21, 21)
Title.Position = UDim2.new(0.0145454537, 0, 0.0500000007, 0)
Title.Size = UDim2.new(0, 200, 0, 35)
Title.Font = Enum.Font.SciFi
Title.Text = "Barren GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 26.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

OpenOptionButton.Name = "OpenOptionButton"
OpenOptionButton.Parent = MainFrame
OpenOptionButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
OpenOptionButton.BorderColor3 = Color3.fromRGB(21, 21, 21)
OpenOptionButton.Position = UDim2.new(0.783636391, 0, 0.142857149, 0)
OpenOptionButton.Size = UDim2.new(0, 85, 0, 25)
OpenOptionButton.Font = Enum.Font.SciFi
OpenOptionButton.Text = "Options"
OpenOptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenOptionButton.TextSize = 18.000
OpenOptionButton.MouseButton1Down:connect(function()
MainSettingFrame.Visible = true
CloseOptionButton.Visible = true
OpenOptionButton.Visible = false
end)

Credit.Name = "Credit"
Credit.Parent = MainFrame
Credit.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
Credit.BackgroundTransparency = 1.000
Credit.BorderColor3 = Color3.fromRGB(21, 21, 21)
Credit.Position = UDim2.new(0.783636391, 0, 7.23571491, 0)
Credit.Size = UDim2.new(0, 119, 0, 14)
Credit.ZIndex = 2
Credit.Font = Enum.Font.SourceSans
Credit.Text = "Made By Pans#1714"
Credit.TextColor3 = Color3.fromRGB(255, 255, 255)
Credit.TextSize = 14.000

CloseOptionButton.Name = "CloseOptionButton"
CloseOptionButton.Parent = MainFrame
CloseOptionButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
CloseOptionButton.BorderColor3 = Color3.fromRGB(21, 21, 21)
CloseOptionButton.Position = UDim2.new(0.783636391, 0, 0.142857149, 0)
CloseOptionButton.Size = UDim2.new(0, 85, 0, 25)
CloseOptionButton.Visible = false
CloseOptionButton.Font = Enum.Font.SciFi
CloseOptionButton.Text = "Close"
CloseOptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseOptionButton.TextSize = 18.000
CloseOptionButton.MouseButton1Down:connect(function()
OpenOptionButton.Visible = true
CloseOptionButton.Visible = false
MainSettingFrame.Visible = false
end)

HomeFrame.Name = "HomeFrame"
HomeFrame.Parent = MainFrame
HomeFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
HomeFrame.BackgroundTransparency = 0.150
HomeFrame.BorderColor3 = Color3.fromRGB(21, 21, 21)
HomeFrame.Position = UDim2.new(0.0722824931, 0, 1, 0)
HomeFrame.Size = UDim2.new(0, 510, 0, 264)

HomeText1.Name = "HomeText1"
HomeText1.Parent = HomeFrame
HomeText1.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
HomeText1.BackgroundTransparency = 1.000
HomeText1.BorderColor3 = Color3.fromRGB(21, 21, 21)
HomeText1.Position = UDim2.new(0.0372050181, 0, 0.208333343, 0)
HomeText1.Size = UDim2.new(0, 464, 0, 71)
HomeText1.Font = Enum.Font.SourceSans
HomeText1.Text = "This GUI was made Pans#1714, AKA Pans. I do not take credit for some of the scripts used in this GUI and credit to the respectful owners."
HomeText1.TextColor3 = Color3.fromRGB(255, 255, 255)
HomeText1.TextSize = 20.000
HomeText1.TextWrapped = true
HomeText1.TextXAlignment = Enum.TextXAlignment.Left
HomeText1.TextYAlignment = Enum.TextYAlignment.Top

HomeText2.Name = "HomeText2"
HomeText2.Parent = HomeFrame
HomeText2.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
HomeText2.BackgroundTransparency = 1.000
HomeText2.BorderColor3 = Color3.fromRGB(21, 21, 21)
HomeText2.Position = UDim2.new(0.0372050181, 0, 0.534090877, 0)
HomeText2.Size = UDim2.new(0, 464, 0, 36)
HomeText2.Font = Enum.Font.SourceSans
HomeText2.Text = "Why did I do this to myself. REEEEEEEEE"
HomeText2.TextColor3 = Color3.fromRGB(255, 255, 255)
HomeText2.TextSize = 20.000
HomeText2.TextWrapped = true
HomeText2.TextXAlignment = Enum.TextXAlignment.Left
HomeText2.TextYAlignment = Enum.TextYAlignment.Top

NothingButton.Name = "NothingButton"
NothingButton.Parent = HomeFrame
NothingButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
NothingButton.BorderColor3 = Color3.fromRGB(21, 21, 21)
NothingButton.Position = UDim2.new(0.0372549035, 0, 0.708333313, 0)
NothingButton.Size = UDim2.new(0, 100, 0, 50)
NothingButton.Font = Enum.Font.SciFi
NothingButton.Text = "Nothing"
NothingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NothingButton.TextSize = 14.000

Title_2.Name = "Title"
Title_2.Parent = HomeFrame
Title_2.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(21, 21, 21)
Title_2.Position = UDim2.new(0.0372049958, 0, 0.0303030312, 0)
Title_2.Size = UDim2.new(0, 75, 0, 30)
Title_2.Font = Enum.Font.SourceSans
Title_2.Text = "Home"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextScaled = true
Title_2.TextSize = 26.000
Title_2.TextWrapped = true
Title_2.TextXAlignment = Enum.TextXAlignment.Left
Title_2.TextYAlignment = Enum.TextYAlignment.Top

Line_2.Name = "Line"
Line_2.Parent = HomeFrame
Line_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line_2.Position = UDim2.new(0.0313725509, 0, 0.13787894, 0)
Line_2.Size = UDim2.new(0, 80, 0, 1)

MiscScriptFrame.Name = "MiscScriptFrame"
MiscScriptFrame.Parent = MainFrame
MiscScriptFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
MiscScriptFrame.BackgroundTransparency = 0.150
MiscScriptFrame.BorderColor3 = Color3.fromRGB(21, 21, 21)
MiscScriptFrame.Position = UDim2.new(0.0722824931, 0, 1, 0)
MiscScriptFrame.Size = UDim2.new(0, 510, 0, 264)
MiscScriptFrame.Visible = false

InfiniteJumpButton.Name = "InfiniteJumpButton"
InfiniteJumpButton.Parent = MiscScriptFrame
InfiniteJumpButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
InfiniteJumpButton.BackgroundTransparency = 0.200
InfiniteJumpButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
InfiniteJumpButton.Position = UDim2.new(0.0431372523, 0, 0.219696999, 0)
InfiniteJumpButton.Size = UDim2.new(0, 100, 0, 50)
InfiniteJumpButton.Font = Enum.Font.SciFi
InfiniteJumpButton.Text = "Infinite Jump"
InfiniteJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteJumpButton.TextSize = 16.000
InfiniteJumpButton.MouseButton1Down:connect(function()
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = JumpHeight.Text;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
end)

HBEButton.Name = "HBEButton"
HBEButton.Parent = MiscScriptFrame
HBEButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
HBEButton.BackgroundTransparency = 0.200
HBEButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
HBEButton.Position = UDim2.new(0.278431296, 0, 0.219696969, 0)
HBEButton.Size = UDim2.new(0, 100, 0, 50)
HBEButton.Font = Enum.Font.SciFi
HBEButton.Text = "Hit Box Extender"
HBEButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HBEButton.TextSize = 15.000
HBEButton.TextWrapped = true
HBEButton.MouseButton1Down:connect(function()
_G.HeadSize = HBESize.Text
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
end)

RejoinToggleKey.Name = "RejoinToggleKey"
RejoinToggleKey.Parent = MiscScriptFrame
RejoinToggleKey.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
RejoinToggleKey.BorderColor3 = Color3.fromRGB(12, 12, 12)
RejoinToggleKey.Position = UDim2.new(0.521568656, 0, 0.481060624, 0)
RejoinToggleKey.Size = UDim2.new(0, 100, 0, 50)
RejoinToggleKey.Font = Enum.Font.SourceSans
RejoinToggleKey.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
RejoinToggleKey.PlaceholderText = "Toggle Key"
RejoinToggleKey.Text = ""
RejoinToggleKey.TextColor3 = Color3.fromRGB(255, 255, 255)
RejoinToggleKey.TextSize = 15.000
RejoinToggleKey.TextWrapped = true

FullbrightButton.Name = "FullbrightButton"
FullbrightButton.Parent = MiscScriptFrame
FullbrightButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
FullbrightButton.BackgroundTransparency = 0.200
FullbrightButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
FullbrightButton.Position = UDim2.new(0.760784268, 0, 0.219696939, 0)
FullbrightButton.Size = UDim2.new(0, 100, 0, 50)
FullbrightButton.Font = Enum.Font.SciFi
FullbrightButton.Text = "Fullbright"
FullbrightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FullbrightButton.TextSize = 16.000
FullbrightButton.MouseButton1Down:connect(function()
local s = Instance.new("PointLight", game.Players.LocalPlayer.Character.Head)
s.Brightness = .3
s.Range = 100

game.Lighting.Changed:connect(function()
game.Lighting.TimeOfDay = "14:00:00"
game.Lighting.FogEnd = 1000000
game.Lighting.Brightness = 2
game.Lighting.ColorCorrection.Brightness = 0.1
game.Lighting.ColorCorrection.Saturation = 0.1
game.Lighting.Bloom.Intensity = 0.1
end)
end)

JumpHeight.Name = "JumpHeight"
JumpHeight.Parent = MiscScriptFrame
JumpHeight.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
JumpHeight.BorderColor3 = Color3.fromRGB(12, 12, 12)
JumpHeight.Position = UDim2.new(0.0411765426, 0, 0.48484841, 0)
JumpHeight.Size = UDim2.new(0, 100, 0, 50)
JumpHeight.Font = Enum.Font.SourceSans
JumpHeight.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
JumpHeight.PlaceholderText = "Item Name"
JumpHeight.Text = ""
JumpHeight.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpHeight.TextSize = 15.000
JumpHeight.TextWrapped = true

Line_3.Name = "Line"
Line_3.Parent = MiscScriptFrame
Line_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line_3.Position = UDim2.new(0.0254901964, 0, 0.141666815, 0)
Line_3.Size = UDim2.new(0, 118, 0, 1)

MiscTitle.Name = "MiscTitle"
MiscTitle.Parent = MiscScriptFrame
MiscTitle.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
MiscTitle.BackgroundTransparency = 1.000
MiscTitle.BorderColor3 = Color3.fromRGB(21, 21, 21)
MiscTitle.Position = UDim2.new(0.0403422303, 0, 0.0280304737, 0)
MiscTitle.Size = UDim2.new(0, 113, 0, 30)
MiscTitle.Font = Enum.Font.SourceSans
MiscTitle.Text = "Misc Scripts"
MiscTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscTitle.TextSize = 26.000
MiscTitle.TextWrapped = true
MiscTitle.TextXAlignment = Enum.TextXAlignment.Left
MiscTitle.TextYAlignment = Enum.TextYAlignment.Top

AdminAlertButton.Name = "AdminAlertButton"
AdminAlertButton.Parent = MiscScriptFrame
AdminAlertButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
AdminAlertButton.BackgroundTransparency = 0.200
AdminAlertButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
AdminAlertButton.Position = UDim2.new(0.760784268, 0, 0.48484844, 0)
AdminAlertButton.Size = UDim2.new(0, 100, 0, 50)
AdminAlertButton.Font = Enum.Font.SciFi
AdminAlertButton.Text = "Admin Alert"
AdminAlertButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AdminAlertButton.TextSize = 16.000
AdminAlertButton.MouseButton1Down:connect(function()
local annoying = {"Otuoto", "Otuomi", "Cryptenx", "Goldengolems123", "Bulldog7896", "anthonys2023", "Cryptenx_2", "Cryptenx_ALT", "lycyrus", "firsttobebear", "Indomin0", "moneyfu"}

game.Players.PlayerAdded:Connect(function(plr)
for i, v in pairs(annoying) do
if plr.Name == v then
while wait() do
game.StarterGui:SetCore("SendNotification", {
Title = "ADMIN ALERT";
Text = "A ADMIN HAS JOINED RUN";
Duration = 5;
})
end
end
end
end)
end)

RejoinButton.Name = "RejoinButton"
RejoinButton.Parent = MiscScriptFrame
RejoinButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
RejoinButton.BackgroundTransparency = 0.200
RejoinButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
RejoinButton.Position = UDim2.new(0.521568596, 0, 0.219696939, 0)
RejoinButton.Size = UDim2.new(0, 100, 0, 50)
RejoinButton.Font = Enum.Font.SciFi
RejoinButton.Text = "Rejoin"
RejoinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RejoinButton.TextSize = 16.000
RejoinButton.MouseButton1Down:connect(function()
game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
if key == RejoinToggleKey.Text then
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
 
ts:Teleport(game.PlaceId, p)
end
end)
end)

HBESize.Name = "HBESize"
HBESize.Parent = MiscScriptFrame
HBESize.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
HBESize.BorderColor3 = Color3.fromRGB(12, 12, 12)
HBESize.Position = UDim2.new(0.276470602, 0, 0.484848499, 0)
HBESize.Size = UDim2.new(0, 100, 0, 50)
HBESize.Font = Enum.Font.SourceSans
HBESize.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
HBESize.PlaceholderText = "Block Name"
HBESize.Text = ""
HBESize.TextColor3 = Color3.fromRGB(255, 255, 255)
HBESize.TextSize = 15.000
HBESize.TextWrapped = true

ExtraScriptFrame.Name = "ExtraScriptFrame"
ExtraScriptFrame.Parent = MainFrame
ExtraScriptFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
ExtraScriptFrame.BackgroundTransparency = 0.150
ExtraScriptFrame.BorderColor3 = Color3.fromRGB(21, 21, 21)
ExtraScriptFrame.Position = UDim2.new(0.0722824931, 0, 1, 0)
ExtraScriptFrame.Size = UDim2.new(0, 510, 0, 264)
ExtraScriptFrame.Visible = false

ZenonButton.Name = "ZenonButton"
ZenonButton.Parent = ExtraScriptFrame
ZenonButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
ZenonButton.BackgroundTransparency = 0.200
ZenonButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
ZenonButton.Position = UDim2.new(0.0431372523, 0, 0.219696999, 0)
ZenonButton.Size = UDim2.new(0, 100, 0, 50)
ZenonButton.Font = Enum.Font.SciFi
ZenonButton.Text = "Zenon V3"
ZenonButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ZenonButton.TextSize = 16.000
ZenonButton.MouseButton1Down:connect(function()
loadstring(game:HttpGet("https://pastebin.com/raw/61vdJN2e", true))()
end)

InfiniteYieldButton.Name = "InfiniteYieldButton"
InfiniteYieldButton.Parent = ExtraScriptFrame
InfiniteYieldButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
InfiniteYieldButton.BackgroundTransparency = 0.200
InfiniteYieldButton.BorderColor3 = Color3.fromRGB(12, 12, 12)
InfiniteYieldButton.Position = UDim2.new(0.296078503, 0, 0.219696969, 0)
InfiniteYieldButton.Size = UDim2.new(0, 100, 0, 50)
InfiniteYieldButton.Font = Enum.Font.SciFi
InfiniteYieldButton.Text = "Infinite Yield"
InfiniteYieldButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteYieldButton.TextSize = 16.000
InfiniteYieldButton.MouseButton1Down:connect(function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

Line_4.Name = "Line"
Line_4.Parent = ExtraScriptFrame
Line_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line_4.Position = UDim2.new(0.0254901964, 0, 0.141666815, 0)
Line_4.Size = UDim2.new(0, 118, 0, 1)

ExtraTitle.Name = "ExtraTitle"
ExtraTitle.Parent = ExtraScriptFrame
ExtraTitle.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
ExtraTitle.BackgroundTransparency = 1.000
ExtraTitle.BorderColor3 = Color3.fromRGB(21, 21, 21)
ExtraTitle.Position = UDim2.new(0.0285775252, 0, 0.0318183526, 0)
ExtraTitle.Size = UDim2.new(0, 113, 0, 30)
ExtraTitle.Font = Enum.Font.SourceSans
ExtraTitle.Text = "Extra Scripts"
ExtraTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ExtraTitle.TextSize = 26.000
ExtraTitle.TextWrapped = true
ExtraTitle.TextXAlignment = Enum.TextXAlignment.Left
ExtraTitle.TextYAlignment = Enum.TextYAlignment.Top

MainSettingFrame.Name = "MainSettingFrame"
MainSettingFrame.Parent = MainFrame
MainScriptFrame.Active = true
MainSettingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainSettingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainSettingFrame.Position = UDim2.new(-0.289090902, 0, 3.7252903e-09, 0)
MainSettingFrame.Size = UDim2.new(0, 150, 0, 40)
MainSettingFrame.Visible = false
MainSettingFrame.Draggable = true

SettingFrame.Name = "SettingFrame"
SettingFrame.Parent = MainSettingFrame
SettingFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
SettingFrame.BackgroundTransparency = 0.040
SettingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingFrame.Position = UDim2.new(-0.00100402837, 0, 0.995473087, 0)
SettingFrame.Size = UDim2.new(0, 150, 0, 265)
SettingFrame.ZIndex = 2

HomeButton.Name = "HomeButton"
HomeButton.Parent = SettingFrame
HomeButton.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
HomeButton.BorderColor3 = Color3.fromRGB(11, 11, 11)
HomeButton.Position = UDim2.new(0.0753830969, 0, 0.0418250933, 0)
HomeButton.Size = UDim2.new(0, 126, 0, 35)
HomeButton.Font = Enum.Font.SciFi
HomeButton.Text = "Home"
HomeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HomeButton.TextSize = 16.000
HomeButton.MouseButton1Down:connect(function()
HomeFrame.Visible = true
MainScriptFrame.Visible = false
MiscScriptFrame.Visible = false
ExtraScriptFrame.Visible = false
end)

MainScriptButton.Name = "MainScriptButton"
MainScriptButton.Parent = SettingFrame
MainScriptButton.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
MainScriptButton.BorderColor3 = Color3.fromRGB(11, 11, 11)
MainScriptButton.Position = UDim2.new(0.0753830969, 0, 0.243346006, 0)
MainScriptButton.Size = UDim2.new(0, 126, 0, 35)
MainScriptButton.Font = Enum.Font.SciFi
MainScriptButton.Text = "Main Scripts"
MainScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainScriptButton.TextSize = 16.000
MainScriptButton.MouseButton1Down:connect(function()
MainScriptFrame.Visible = true
HomeFrame.Visible = false
MiscScriptFrame.Visible = false
ExtraScriptFrame.Visible = false
end)

MiscButton.Name = "MiscButton"
MiscButton.Parent = SettingFrame
MiscButton.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
MiscButton.BorderColor3 = Color3.fromRGB(11, 11, 11)
MiscButton.Position = UDim2.new(0.0753830969, 0, 0.433460087, 0)
MiscButton.Size = UDim2.new(0, 126, 0, 35)
MiscButton.Font = Enum.Font.SciFi
MiscButton.Text = "Misc Scripts"
MiscButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscButton.TextSize = 16.000
MiscButton.MouseButton1Down:connect(function()
MiscScriptFrame.Visible = true
HomeFrame.Visible = false
MainScriptFrame.Visible = false
ExtraScriptFrame.Visible = false
end)

ExtraButton.Name = "ExtraButton"
ExtraButton.Parent = SettingFrame
ExtraButton.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
ExtraButton.BorderColor3 = Color3.fromRGB(11, 11, 11)
ExtraButton.Position = UDim2.new(0.0753830969, 0, 0.627376378, 0)
ExtraButton.Size = UDim2.new(0, 126, 0, 35)
ExtraButton.Font = Enum.Font.SciFi
ExtraButton.Text = "Extra Scripts"
ExtraButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExtraButton.TextSize = 16.000
ExtraButton.MouseButton1Down:connect(function()
ExtraScriptFrame.Visible = true
HomeFrame.Visible = false
MainScriptFrame.Visible = false
MiscScriptFrame.Visible = false
end)

SettingButton.Name = "SettingButton"
SettingButton.Parent = SettingFrame
SettingButton.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
SettingButton.BorderColor3 = Color3.fromRGB(11, 11, 11)
SettingButton.Position = UDim2.new(0.0753830969, 0, 0.809885919, 0)
SettingButton.Size = UDim2.new(0, 126, 0, 35)
SettingButton.Font = Enum.Font.SciFi
SettingButton.Text = "Coming Soon..."
SettingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingButton.TextSize = 16.000

Title_3.Name = "Title"
Title_3.Parent = MainSettingFrame
Title_3.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
Title_3.BorderColor3 = Color3.fromRGB(21, 21, 21)
Title_3.Position = UDim2.new(-0.00100402837, 0, 0.0500000007, 0)
Title_3.Size = UDim2.new(0, 150, 0, 35)
Title_3.Font = Enum.Font.SciFi
Title_3.Text = "Settings"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 26.000
Title_3.TextWrapped = true

OpenFrame.Name = "OpenFrame"
OpenFrame.Parent = Barren
OpenFrame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
OpenFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
OpenFrame.Position = UDim2.new(0.00485044485, 0, 0.657554984, 0)
OpenFrame.Size = UDim2.new(0, 85, 0, 35)
OpenFrame.Visible = false

OpenButton.Name = "OpenButton"
OpenButton.Parent = OpenFrame
OpenButton.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
OpenButton.BorderColor3 = Color3.fromRGB(27, 27, 27)
OpenButton.Position = UDim2.new(0.0511363186, 0, 0.142424285, 0)
OpenButton.Size = UDim2.new(0, 75, 0, 25)
OpenButton.Font = Enum.Font.SourceSansBold
OpenButton.Text = "Open"
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.TextSize = 20.000
OpenButton.MouseButton1Down:connect(function()
MainFrame.Visible = true
OpenFrame.Visible = false
end)

