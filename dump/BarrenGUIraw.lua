-- Gui Made by Pan#1714. Please no leak.
-- Version: 1

-- Instances:

local Main = Instance.new("ScreenGui")
local OpenFrameA = Instance.new("Frame")
local OpenA = Instance.new("TextButton")
local MainFrame = Instance.new("Frame")
local Bright = Instance.new("TextButton")
local Block = Instance.new("TextButton")
local Hitbox = Instance.new("TextButton")
local InfJump = Instance.new("TextButton")
local BlockCustom = Instance.new("TextButton")
local Yield = Instance.new("TextButton")
local FrameA = Instance.new("Frame")
local TitleA = Instance.new("TextLabel")
local FrameB = Instance.new("Frame")
local Credit = Instance.new("TextLabel")
local CloseA = Instance.new("TextButton")
local BlockName = Instance.new("TextBox")
local JumpHeight = Instance.new("TextBox")
local Info = Instance.new("Frame")
local FrameC = Instance.new("Frame")
local TitleB = Instance.new("TextLabel")
local FrameD = Instance.new("Frame")
local CloseB = Instance.new("TextButton")
local Information = Instance.new("TextLabel")
local OpenFrameB = Instance.new("Frame")
local OpenB = Instance.new("TextButton")

--Properties:

Main.Name = "Main"
Main.Parent = game.CoreGui
Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

OpenFrameA.Name = "OpenFrameA"
OpenFrameA.Parent = Main
OpenFrameA.BackgroundColor3 = Color3.fromRGB(44, 0, 204)
OpenFrameA.BackgroundTransparency = 0.200
OpenFrameA.BorderColor3 = Color3.fromRGB(44, 0, 204)
OpenFrameA.BorderSizePixel = 0
OpenFrameA.Position = UDim2.new(0, 0, 0.516835034, 0)
OpenFrameA.Size = UDim2.new(0, 85, 0, 40)
OpenFrameA.Visible = false

OpenA.Name = "OpenA"
OpenA.Parent = OpenFrameA
OpenA.BackgroundColor3 = Color3.fromRGB(0, 73, 221)
OpenA.BorderColor3 = Color3.fromRGB(0, 73, 221)
OpenA.BorderSizePixel = 0
OpenA.Position = UDim2.new(0.0514113829, 0, 0.0985689759, 0)
OpenA.Size = UDim2.new(0, 76, 0, 32)
OpenA.Font = Enum.Font.Cartoon
OpenA.Text = "Open"
OpenA.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenA.TextSize = 25.000
OpenA.MouseButton1Down:connect(function()
MainFrame.Visible = true
OpenFrameA.Visible = false
end)

MainFrame.Name = "MainFrame"
MainFrame.Parent = Main
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.228509218, 0, 0.264309764, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 251)
MainFrame.Draggable = true

Bright.Name = "Bright"
Bright.Parent = MainFrame
Bright.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Bright.BorderColor3 = Color3.fromRGB(0, 85, 255)
Bright.BorderSizePixel = 0
Bright.Position = UDim2.new(0.090000011, 0, 0.196787506, 0)
Bright.Size = UDim2.new(0, 100, 0, 50)
Bright.Font = Enum.Font.Cartoon
Bright.Text = "Fullbright"
Bright.TextColor3 = Color3.fromRGB(255, 255, 255)
Bright.TextSize = 17.000
Bright.MouseButton1Down:connect(function()
local s = Instance.new("PointLight", game.Players.LocalPlayer.Character.Head)
s.Brightness = .3
s.Range = 100

game.Lighting.Changed:connect(function()
game.Lighting.TimeOfDay = "14:00:00"
game.Lighting.FogEnd = 9999
game.Lighting.Brightness = 2
game.Lighting.ColorCorrection.Brightness = 0.1
game.Lighting.ColorCorrection.Saturation = 0.1
game.Lighting.Bloom.Intensity = 0.1
end)
end)

Block.Name = "Block"
Block.Parent = MainFrame
Block.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Block.BorderColor3 = Color3.fromRGB(0, 85, 255)
Block.BorderSizePixel = 0
Block.Position = UDim2.new(0.400000006, 0, 0.196787506, 0)
Block.Size = UDim2.new(0, 100, 0, 50)
Block.Font = Enum.Font.Cartoon
Block.Text = "Air/Mil Crate ESP"
Block.TextColor3 = Color3.fromRGB(255, 255, 255)
Block.TextSize = 17.000
Block.TextWrapped = true
Block.MouseButton1Down:connect(function()
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
        	name.TextSize = 20
        	name.TextStrokeTransparency = .5
    end
end
end)

Hitbox.Name = "Hitbox"
Hitbox.Parent = MainFrame
Hitbox.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Hitbox.BorderColor3 = Color3.fromRGB(0, 85, 255)
Hitbox.BorderSizePixel = 0
Hitbox.Position = UDim2.new(0.708000004, 0, 0.196787506, 0)
Hitbox.Size = UDim2.new(0, 100, 0, 50)
Hitbox.Font = Enum.Font.Cartoon
Hitbox.Text = "Hitbox Extender"
Hitbox.TextColor3 = Color3.fromRGB(255, 255, 255)
Hitbox.TextSize = 17.000
Hitbox.TextWrapped = true
Hitbox.MouseButton1Down:connect(function()
_G.HeadSize = 10
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

InfJump.Name = "InfJump"
InfJump.Parent = MainFrame
InfJump.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
InfJump.BorderColor3 = Color3.fromRGB(0, 85, 255)
InfJump.BorderSizePixel = 0
InfJump.Position = UDim2.new(0.0880000144, 0, 0.468280703, 0)
InfJump.Size = UDim2.new(0, 100, 0, 50)
InfJump.Font = Enum.Font.Cartoon
InfJump.Text = "Infinite Jump"
InfJump.TextColor3 = Color3.fromRGB(255, 255, 255)
InfJump.TextSize = 17.000
InfJump.TextWrapped = true
InfJump.MouseButton1Down:connect(function()
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpTall = JumpHeight.Text;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpTall, 0);
                end)
            end
        end)
    end
end)
end)

BlockCustom.Name = "BlockCustom"
BlockCustom.Parent = MainFrame
BlockCustom.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
BlockCustom.BorderColor3 = Color3.fromRGB(0, 85, 255)
BlockCustom.BorderSizePixel = 0
BlockCustom.Position = UDim2.new(0.398000002, 0, 0.468280703, 0)
BlockCustom.Size = UDim2.new(0, 100, 0, 50)
BlockCustom.Font = Enum.Font.Cartoon
BlockCustom.Text = "Block ESP"
BlockCustom.TextColor3 = Color3.fromRGB(255, 255, 255)
BlockCustom.TextSize = 17.000
BlockCustom.TextWrapped = true
BlockCustom.MouseButton1Down:connect(function()
Important = {Players = game:GetService("Players"), Workspace = game:GetService("Workspace"), CoreGui = game:GetService("CoreGui")}
local enabledesp = false

for i,v in pairs(game.Workspace.Harvestables:GetChildren()) do
	if v.Name == BlockName.Text then
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
        	name.TextSize = 10
        	name.TextStrokeTransparency = .5
    end
end
end)

Yield.Name = "Yield"
Yield.Parent = MainFrame
Yield.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Yield.BorderColor3 = Color3.fromRGB(0, 85, 255)
Yield.BorderSizePixel = 0
Yield.Position = UDim2.new(0.70600003, 0, 0.468280703, 0)
Yield.Size = UDim2.new(0, 100, 0, 50)
Yield.Font = Enum.Font.Cartoon
Yield.Text = "Infinite Yield"
Yield.TextColor3 = Color3.fromRGB(255, 255, 255)
Yield.TextSize = 17.000
Yield.MouseButton1Down:connect(function()
loadstring(game:HttpGet(('https://pastebin.com/raw/tzTXmYf2'),true))()
end)

FrameA.Name = "FrameA"
FrameA.Parent = MainFrame
FrameA.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
FrameA.BorderColor3 = Color3.fromRGB(0, 85, 255)
FrameA.BorderSizePixel = 0
FrameA.Position = UDim2.new(0, 0, -0.000468671322, 0)
FrameA.Size = UDim2.new(0, 500, 0, 30)

TitleA.Name = "TitleA"
TitleA.Parent = FrameA
TitleA.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
TitleA.BorderColor3 = Color3.fromRGB(0, 85, 255)
TitleA.BorderSizePixel = 0
TitleA.Position = UDim2.new(0.29400003, 0, 0, 0)
TitleA.Size = UDim2.new(0, 200, 0, 30)
TitleA.Font = Enum.Font.Cartoon
TitleA.Text = "Barren GUI"
TitleA.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleA.TextSize = 20.000

FrameB.Name = "FrameB"
FrameB.Parent = MainFrame
FrameB.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
FrameB.BorderColor3 = Color3.fromRGB(0, 85, 255)
FrameB.BorderSizePixel = 0
FrameB.Position = UDim2.new(0, 0, 1, 0)
FrameB.Size = UDim2.new(0, 500, 0, 30)

Credit.Name = "Credit"
Credit.Parent = FrameB
Credit.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Credit.BorderColor3 = Color3.fromRGB(0, 85, 255)
Credit.BorderSizePixel = 0
Credit.Position = UDim2.new(0.296000004, 0, 0, 0)
Credit.Size = UDim2.new(0, 200, 0, 30)
Credit.Font = Enum.Font.Cartoon
Credit.Text = "Made by Pan#1714"
Credit.TextColor3 = Color3.fromRGB(255, 255, 255)
Credit.TextSize = 20.000

CloseA.Name = "CloseA"
CloseA.Parent = MainFrame
CloseA.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
CloseA.BorderColor3 = Color3.fromRGB(0, 85, 255)
CloseA.BorderSizePixel = 0
CloseA.Position = UDim2.new(0.940000057, 0, -0.000757157803, 0)
CloseA.Size = UDim2.new(0, 30, 0, 30)
CloseA.Font = Enum.Font.Cartoon
CloseA.Text = "X"
CloseA.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseA.TextSize = 25.000
CloseA.MouseButton1Down:connect(function()
OpenFrameA.Visible = true
MainFrame.Visible = false
end)

BlockName.Name = "BlockName"
BlockName.Parent = MainFrame
BlockName.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
BlockName.BorderColor3 = Color3.fromRGB(0, 85, 255)
BlockName.BorderSizePixel = 0
BlockName.Position = UDim2.new(0.400000006, 0, 0.744298816, 0)
BlockName.Size = UDim2.new(0, 100, 0, 50)
BlockName.Font = Enum.Font.Cartoon
BlockName.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
BlockName.PlaceholderText = "Exact Block Name"
BlockName.Text = ""
BlockName.TextColor3 = Color3.fromRGB(255, 255, 255)
BlockName.TextSize = 16.000
BlockName.TextWrapped = true

JumpHeight.Name = "JumpHeight"
JumpHeight.Parent = MainFrame
JumpHeight.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
JumpHeight.BorderSizePixel = 0
JumpHeight.Position = UDim2.new(0.088000007, 0, 0.744298816, 0)
JumpHeight.Size = UDim2.new(0, 100, 0, 50)
JumpHeight.Font = Enum.Font.Cartoon
JumpHeight.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
JumpHeight.PlaceholderText = "Jump Height"
JumpHeight.Text = ""
JumpHeight.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpHeight.TextSize = 16.000
JumpHeight.TextWrapped = true

Info.Name = "Info"
Info.Parent = MainFrame
Info.Active = true
Info.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Info.BorderColor3 = Color3.fromRGB(0, 0, 0)
Info.BorderSizePixel = 0
Info.Position = UDim2.new(1.03325343, 0, -0.00262251496, 0)
Info.Size = UDim2.new(0, 150, 0, 252)
Info.Visible = false
Info.Draggable = true

FrameC.Name = "FrameC"
FrameC.Parent = Info
FrameC.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
FrameC.BorderColor3 = Color3.fromRGB(0, 85, 255)
FrameC.BorderSizePixel = 0
FrameC.Size = UDim2.new(0, 150, 0, 150)

TitleB.Name = "TitleB"
TitleB.Parent = FrameC
TitleB.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
TitleB.BorderSizePixel = 0
TitleB.Size = UDim2.new(0, 150, 0, 30)
TitleB.Font = Enum.Font.Cartoon
TitleB.Text = "Infomation"
TitleB.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleB.TextSize = 20.000

FrameD.Name = "FrameD"
FrameD.Parent = Info
FrameD.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
FrameD.BorderColor3 = Color3.fromRGB(0, 85, 255)
FrameD.BorderSizePixel = 0
FrameD.Position = UDim2.new(0, 0, 0.996031761, 0)
FrameD.Size = UDim2.new(0, 150, 0, 30)

CloseB.Name = "CloseB"
CloseB.Parent = Info
CloseB.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
CloseB.BorderColor3 = Color3.fromRGB(0, 85, 255)
CloseB.BorderSizePixel = 0
CloseB.Position = UDim2.new(0.793333769, 0, 0, 0)
CloseB.Size = UDim2.new(0, 30, 0, 30)
CloseB.Font = Enum.Font.Cartoon
CloseB.Text = "X"
CloseB.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseB.TextSize = 25.000
CloseB.MouseButton1Down:connect(function()
OpenFrameB.Visible = true
Info.Visible = false
end)

Information.Name = "Information"
Information.Parent = Info
Information.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Information.BorderSizePixel = 0
Information.Position = UDim2.new(0, 0, 0.121193051, 0)
Information.Size = UDim2.new(0, 150, 0, 220)
Information.Font = Enum.Font.Cartoon
Information.Text = "This Gui is made by Pan#1714. I do not take any credit for any of the scripts used in this Gui. For Jump Height, the recommend height is 50. For the Block ESP,  put the exact name for the block. E.g Ore Rich Rock. For Infinite Yield, the best commands that work is noclip, xray and float. Float being the most obvious."
Information.TextColor3 = Color3.fromRGB(255, 255, 255)
Information.TextSize = 14.000
Information.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Information.TextWrapped = true

OpenFrameB.Name = "OpenFrameB"
OpenFrameB.Parent = MainFrame
OpenFrameB.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
OpenFrameB.BorderColor3 = Color3.fromRGB(0, 85, 255)
OpenFrameB.BorderSizePixel = 0
OpenFrameB.Position = UDim2.new(0.84800005, 0, 0, 0)
OpenFrameB.Size = UDim2.new(0, 30, 0, 30)

OpenB.Name = "OpenB"
OpenB.Parent = OpenFrameB
OpenB.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
OpenB.BorderColor3 = Color3.fromRGB(0, 85, 255)
OpenB.BorderSizePixel = 0
OpenB.Position = UDim2.new(-0.0206663609, 0, -0.0064675808, 0)
OpenB.Size = UDim2.new(0, 30, 0, 30)
OpenB.Font = Enum.Font.Cartoon
OpenB.Text = "≡"
OpenB.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenB.TextSize = 25.000
OpenB.MouseButton1Down:connect(function()
Info.Visible = true
OpenFrameB.Visible = false
end)