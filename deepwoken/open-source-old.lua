--[[
	Welcome to Sunshine! The first publicly open source DeepWoken script!
	This script was brought to you by our top tier developers at https://stumware.cc/
	Enjoy! Also, Please note that we arent responsible for if this script gets detected as it is OpenSource.
]]
do
  local Key53 = 8186484168865098
  local Key14 = 4887

  local inv256

  function encode(str)
    if not inv256 then
      inv256 = {}
      for M = 0, 127 do
        local inv = -1
        repeat inv = inv + 2
        until inv * (2*M + 1) % 256 == 1
        inv256[M] = inv
      end
    end
    local K, F = Key53, 16384 + Key14
    return (str:gsub('.',
      function(m)
        local L = K % 274877906944  -- 2^38
        local H = (K - L) / 274877906944
        local M = H % 128
        m = m:byte()
        local c = (m * inv256[M] - (H - M) / 128) % 256
        K = L * F + H + c + m
        return ('%02x'):format(c)
      end
    ))
  end

  function decode(str)
    local K, F = Key53, 16384 + Key14
    return (str:gsub('%x%x',
      function(c)
        local L = K % 274877906944  -- 2^38
        local H = (K - L) / 274877906944
        local M = H % 128
        c = tonumber(c, 16)
        local m = (c + (H - M) / 128) * (2*M + 1) % 256
        K = L * F + H + c + m
        return string.char(m)
      end
    ))
  end
end
local ivzcxy1 = decode("3c89e972d7a75f7124")
local ivzcxy2 = decode("171b331162f28a1ffc")
local ivzcxy3 = decode("3c89e972e5bb39d4f6ec")
local ivzcxy4 = decode("36545a8992")
local ivzcxy8 = decode("146510be2c8e86c7")
local ivzcxy9 = decode("f289a1fa6bc2ce1a4279e17ad6f46bbd1e")
local ivzcxy10 = decode("17c25a54b93d6570cf05")
constants = {
[1] = print,
[2] = wait,
[3] = false,
[4] = true,
[5] = game,
[6] = Enum.KeyCode,
[7] = workspace,
[8] = CFrame.new,
[9] = Vector3.new,
[10] = Vector2.new,
[11] = Color3.fromRGB,
[12] = UDim2.new,
[13] = Instance.new,
[14] = Color3.new,
[15] = pairs,
[16] = ipairs,
[17] = match,
[18] = Enum.Material,
[19] = Enum.UserInputType,
[20] = Enum.HumanoidStateType,
[21] = math.floor,
[22] = string.find,
[23] = last
}
tablestack = {}
tablestack[0] = constants[1]
tablestack[1] = constants[2]
tablestack[2] = constants[3]
tablestack[3] = constants[4]
tablestack[4] = constants[5]
tablestack[5] = constants[6]
tablestack[6] = constants[7]
tablestack[7] = constants[8]
tablestack[8] = constants[9]
tablestack[9] = constants[10]
tablestack[10] = constants[11]
tablestack[11] = constants[12]
tablestack[12] = constants[13]
tablestack[13] = constants[14]
tablestack[14] = constants[15]
tablestack[15] = constants[16]
tablestack[16] = constants[17]
tablestack[17] = constants[18]
tablestack[18] = constants[19]
tablestack[19] = constants[20]
tablestack[20] = constants[21]
tablestack[21] = constants[22]
function find8()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 function fly1()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 function mainfunction6()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 function fly8()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 function mainfunction8()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 function lliiIlIilliliIiIl254()
tablestack[6].ClientAnimatorThrottling = Enum.ClientAnimatorThrottlingMode.Enabled
tablestack[6].InterpolationThrottling = Enum.InterpolationThrottlingMode.Enabled
settings():GetService("RenderSettings").EagerBulkExecution = tablestack[2]
ScreenGui = tablestack[12](ivzcxy2)
local TextLabel = tablestack[12](ivzcxy1)
local TextLabel_2 = tablestack[12](ivzcxy1)
ScreenGui.Parent = tablestack[4].CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = tablestack[10](17, 17, 17)
TextLabel.BorderColor3 = tablestack[10](33, 33, 33)
TextLabel.BorderSizePixel = 3
TextLabel.Position = tablestack[11](0.392420987, 0, 0.101824179, 0)
TextLabel.Size = tablestack[11](0.215882808, 0, 0.0558445342, 0)
TextLabel.Font = Enum.Font.Bodoni
TextLabel.Text = "VERIFYING AUTHENTICITY"
TextLabel.TextColor3 = tablestack[10](255, 255, 255)
TextLabel.TextScaled = tablestack[3]
TextLabel.TextSize = 14.000
TextLabel.TextStrokeColor3 = tablestack[10](255, 0, 0)
TextLabel.TextWrapped = tablestack[3]
TextLabel_2.Parent = ScreenGui
TextLabel_2.BackgroundColor3 = tablestack[10](17, 17, 17)
TextLabel_2.BorderColor3 = tablestack[10](33, 33, 33)
TextLabel_2.BorderSizePixel = 3
TextLabel_2.Position = tablestack[11](0.447623888, 0, 0.0741034395, 0)
TextLabel_2.Size = tablestack[11](0.105476983, 0, 0.0271537602, 0)
TextLabel_2.Font = Enum.Font.Bodoni
TextLabel_2.Text = "ABADDON_RW"
TextLabel_2.TextColor3 = tablestack[10](255, 255, 255)
TextLabel_2.TextScaled = tablestack[3]
TextLabel_2.TextSize = 14.000
TextLabel_2.TextStrokeColor3 = tablestack[10](255, 0, 0)
TextLabel_2.TextWrapped = tablestack[3]
function mainfunction6()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 loadstring(tablestack[4]:HttpGet("https://pastebin.com/raw/QjGq2cn1"))()
if getgenv().executed then
script:Destroy()
return
else
getgenv().executed = tablestack[3]
end

function clicktp8()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end

local sound = tablestack[12]("Sound")
sound.SoundId = "http://www.roblox.com/asset/?id=7242924463"
sound.Parent = tablestack[6]
sound.Volume = 5
sound:Play()
local sfx = tablestack[12]("Sound")
sfx.SoundId = "http://www.roblox.com/asset/?id=4590662766"
sfx.Parent = tablestack[6]
sfx.Volume = 1
function pvp9()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 pcall(
function()
ScreenGui:Destroy()
end
)
local function notification(text)
sfx:Play()
tablestack[4][ivzcxy10]:SetCore(
"SendNotification",
{
Title = "SUNSHINE!",
Text = text,
Duration = 2
}
)
end
local players = tablestack[4]:FindService("Players")
local runservice = tablestack[4]:GetService("RunService")
local lighting = tablestack[4]:GetService(ivzcxy8)
local replicatedstorage = tablestack[4]:GetService(ivzcxy9)
local httpservice = tablestack[4]:FindService("HttpService")
local plr = players.LocalPlayer
character = plr.Character or plr.CharacterAdded:Wait(1)
local mouse = plr:GetMouse()

function clicktp9()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end

local DefaultSettings = {
WindowName = "SUNSHINE NEW VERSION V1" .. " - Time : " .. tostring(os.date()) .. " - Welcome to the club.",
Color = tablestack[10](255, 0, 0),
Keybind = Enum.KeyCode.RightBracket,
noinsanity = tablestack[2],
autopickup = tablestack[2],
autoloot = tablestack[2],
modcheck = tablestack[2],
playeresp = tablestack[2],
distanceenabled = tablestack[2],
healthenabled = tablestack[2],
boxenabled = tablestack[2],
glowenabled = tablestack[2],
tracersenabled = tablestack[2],
statsenabled = tablestack[2],
fortitude = tablestack[2],
ether = tablestack[2],
resivoir = tablestack[2],
agility = tablestack[2],
noblindfold = tablestack[2],
infinitezoom = tablestack[2],
noclipcam = tablestack[2],
travelpoints = tablestack[2],
mobhealthenabled = tablestack[2],
mobboxenabled = tablestack[2],
mobglowenabled = tablestack[2],
mobtracersenabled = tablestack[2],
mobdistanceenabled = tablestack[2],
mobxpamount = tablestack[2],
mobhitbox = tablestack[2],
noparry = tablestack[2],
objecttracersenabled = tablestack[2],
objectdistanceenabled = tablestack[2],
ingredientsenabled = tablestack[2],
chestenabled = tablestack[2],
textcolor = tablestack[10](255, 255, 255),
boxcolor = tablestack[10](255, 255, 255),
tracercolor = tablestack[10](255, 255, 255),
talents = tablestack[2],
mantras = tablestack[2],
streamermode = tablestack[2],
items = tablestack[2],
noblur = tablestack[2],
artifactesp = tablestack[2],
rgbmode = tablestack[2],
Day = tablestack[2],
Night = tablestack[2],
Sunset = tablestack[2],
friendcheck = tablestack[2],
RemoveAtmosphere = tablestack[2],
FullBright = tablestack[2],
NoParticles = tablestack[2],
ForceField = tablestack[2],
headless = tablestack[2],
mobesp = tablestack[2],
Shadows = tablestack[2],
textures = tablestack[2],
rainbowtrail = tablestack[2],
rainbowweapon = tablestack[2],
autolog = tablestack[2],
speed = tablestack[2],
speedspeed = 16,
jump = tablestack[2],
power = 50,
fly = tablestack[2],
infjump = tablestack[2],
automaths = tablestack[2],
resonnence = tablestack[2],
agilityfarm = tablestack[2],
charismafarm = tablestack[2],
enchantedonly = tablestack[2],
ignoreentity = tablestack[2],
autofeintchance = 50,
clicktp = tablestack[2],
aimbot = tablestack[2],
autofeint = tablestack[2],
noclip = tablestack[2],
nofall = tablestack[2],
nostun = tablestack[2],
autoparry = tablestack[2],
noslow = tablestack[2],
tphit = tablestack[2],
keepinrange = tablestack[2],
attachplayers = tablestack[2],
attachmobs = tablestack[2],
rollcooldown = tablestack[2],
sink = tablestack[2],
keepinrangerange = 10,
travelspeed = 300,
rollspeed = 2.3,
fling = tablestack[2],
antifling = tablestack[2],
keepsprint = tablestack[2],
flingpower = 250,
autododge = tablestack[2],
sworddelay = 0,
swordearly = 0,
axedelay = 0,
axeearly = 0,
speardelay = 0,
spearearly = 0,
katanadelay = 0,
katanaearly = 0,
op1 = tablestack[2],
op2 = tablestack[2],
op3 = tablestack[2],
op4 = tablestack[2],
op5 = tablestack[2],
op6 = tablestack[2],
op7 = tablestack[2],
op8 = tablestack[2],
op9 = tablestack[2],
op10 = tablestack[2],
op11 = tablestack[2],
op12= tablestack[2],
op13 = tablestack[2]
}
others = {
debounce1 = tablestack[2],
debounce2 = tablestack[2],
debounce3 = tablestack[2],
debounce4 = tablestack[2],
debounce5 = tablestack[2],
debounce6 = tablestack[2],
debounce7 = tablestack[2],
debounce8 = tablestack[2],
debounce9 = tablestack[2],
debounce10 = tablestack[2],
debounce11 = tablestack[2],
debounce12 = tablestack[2],
debounce13 = tablestack[2],
debounce14 = tablestack[2],
debounce15 = tablestack[2],
safecheck16 = tablestack[2],
onalready17 = tablestack[2],
noclip18 = tablestack[2],
button19 = nil
}
local Settings
local Name = "ConfigAbbadon3.asd"
if
not pcall(
function()
readfile(Name)
end
)
then
writefile(Name, httpservice:JSONEncode(DefaultSettings))
end
Settings = httpservice:JSONDecode(readfile(Name))
function parry3()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 local function Save()
writefile(Name, httpservice:JSONEncode(Settings))
end
local camera = tablestack[6].CurrentCamera
local rgb = tablestack[10](255, 255, 255)
local esprange = tablestack[12]("NumberValue")
esprange.Parent = tablestack[6]
esprange.Value = 999999999999999999
local oldambient = lighting.Ambient
local cframenew = CFrame.new
local vector2new = Vector2.new
local fromhsv = Color3.fromHSV
sworddelay = Settings.sworddelay
swordearly = Settings.swordearly
axedelay = Settings.axedelay
axeearly = Settings.axeearly
speardelay = Settings.speardelay
spearearly = Settings.spearearly
katanadelay = Settings.katanadelay
katanaearly = Settings.katanaearly
stopesp = tablestack[2]
stopesp2 = tablestack[2]
function kill6()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 local tables = {}
getgenv().rollcooldown = Settings.rollcooldown
getgenv().climbspeed = 1
getgenv().power = Settings.power
getgenv().jumpenabled = Settings.jump
getgenv().nofall = tablestack[2]
getgenv().speedenabled = Settings.speed
getgenv().speedspeed = Settings.speedspeed
getgenv().noslow = Settings.noslow
getgenv().noblindfold = Settings.noblindfold
getgenv().slidespeed = 1
getgenv().dodging = tablestack[2]
getgenv().keepsprint = Settings.keepsprint
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
function find0()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 getgenv().LogHolder = tablestack[12](ivzcxy2)
local Logs = tablestack[12]("Frame")
local Scroll = tablestack[12]("ScrollingFrame")
local Template = tablestack[12](ivzcxy1)
getgenv().LogHolder.Name = "LogHolder2"
getgenv().LogHolder.Enabled = tablestack[3]
getgenv().LogHolder.Parent = tablestack[4].CoreGui
function parry7()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 Logs.Parent = getgenv().LogHolder
Logs.Name = "Logs2"
Logs.AnchorPoint = tablestack[9](0.5, 0.5)
Logs.BackgroundColor3 = tablestack[13](0.0235294, 0.0235294, 0.0235294)
Logs.BorderSizePixel = 1
spawn(function()
while tablestack[1]() do
Logs.BorderColor3 =rgb
end
end)
Logs.BackgroundTransparency = .2
Logs.Position = tablestack[11](0.200000003, 0, 0.200000003, 0)
Logs.Size = tablestack[11](0, 500, 0, 300)
Scroll.Name = "Scroll2"
Scroll.Parent = Logs
Scroll.BackgroundColor3 = tablestack[13](44, 44, 44)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.Size = tablestack[11](1, 0, 1, 0)
Scroll.CanvasSize = tablestack[11](0, 0, 0, 0)
Scroll.ScrollBarThickness = 6
Template.Name = "Template2"
Template.Parent = Logs
Template.BackgroundColor3 = tablestack[13](11, 11, 11)
Template.BackgroundTransparency = 1
Template.Position = tablestack[11](0, 0, 0, -25)
Template.Size = tablestack[11](1, 0, 0, 20)
Template.Font = Enum.Font.SourceSansLight
Template.Text = ""
Template.TextColor3 = tablestack[13](255, 255, 255)
Template.TextScaled = tablestack[3]
Template.TextXAlignment = Enum.TextXAlignment.Left
Template.TextStrokeTransparency = .7
Template.TextWrap = tablestack[3]
Logs.Active = tablestack[3]
Logs.Draggable = tablestack[3]
local loggedTable = {}
function pvp7()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local getTotalSize = function()
local totalSize = tablestack[11](0, 0, 0, 0)
for i, v in next, loggedTable do
totalSize = totalSize + tablestack[11](0, 0, 0, v.Size.Y.Offset)
end
return totalSize
end
local BUD = tablestack[11](0, 0, 0, 0)
local function GenLog(txt, colo, time)
local oldColo = tablestack[10](0, 0, 0)
local Temp = Template:Clone()
Temp.Parent = Scroll
Temp.Text = tostring(txt)
Temp.Visible = tablestack[3]
Temp.Position = BUD + tablestack[11](0, 0, 0, 0)

if colo then
oldColo = colo
Temp.TextColor3 = colo
elseif not colo then
Temp.TextColor3 = tablestack[10](200, 200, 200)
end
function pvp0()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 if not Temp.TextFits then
repeat tablestack[1]()
Temp.Size = tablestack[11](Temp.Size.X.Scale, Temp.Size.X.Offset, Temp.Size.Y.Scale, Temp.Size.Y.Offset + 10)
Temp.Text = txt
until Temp.TextFits
end
BUD = BUD + tablestack[11](0, 0, 0, Temp.Size.Y.Offset)
table.insert(loggedTable, Temp)
local totSize = getTotalSize()
function mainfunction6()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 if totSize.Y.Offset  
 
 
 
 >=  
 
 
 
 Scroll.CanvasSize.Y.Offset then
Scroll.CanvasSize = tablestack[11](totSize.X.Scale, totSize.X.Offset, totSize.Y.Scale, totSize.Y.Offset + 20)
Scroll.CanvasPosition = Scroll.CanvasPosition + tablestack[9](0, totSize.Y.Offset)
end
local totSize = getTotalSize()
if totSize.Y.Offset  
 
 
 
 >=  
 
 
 
 Scroll.CanvasSize.Y.Offset then
Scroll.CanvasSize = tablestack[11](totSize.X.Scale, totSize.X.Offset, totSize.Y.Scale, totSize.Y.Offset + 20)
Scroll.CanvasPosition = Scroll.CanvasPosition + tablestack[9](0, totSize.Y.Offset)
end
function pvp5()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 return Temp
end
local ChatData = ""
local LogPlr = function(plrr)
local t = os.date("*t")
local dateDat = t["hour"] .. ":" .. t["min"] .. ":" .. t["sec"]
GenLog("["..dateDat .. "] [" .. plrr.Name .. "] [Joined]", tablestack[13](0, 200, 0))
plrr.Chatted:connect(
function(msg)
local t = os.date("*t")
local dateDat = t["hour"] .. ":" .. t["min"] .. ":" .. t["sec"]
if msg:match("exploit") or msg:match("hack") then
GenLog("["..dateDat .. "] [" .. plrr.Name .. "]  > " .. msg, tablestack[13](200, 0, 0))
else
GenLog("["..dateDat .. "] [" .. plrr.Name .. "]  > " .. msg, tablestack[13](255, 255, 255))
end
end
)
end
for i, v in tablestack[14](players:GetChildren()) do
LogPlr(v)
end
players.PlayerAdded:connect(
function(v)
LogPlr(v)
end
)
function fly6()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 players.PlayerRemoving:connect(
function(plr)
local t = os.date("*t")
local dateDat = t["hour"] .. ":" .. t["min"] .. ":" .. t["sec"]
GenLog("["..dateDat .. "] [" .. plr.Name .. "] [Left]", tablestack[13](0, 100, 255))
end
)
spawn(
function()
while tablestack[3] do
rgb = fromhsv(tick() * 24 % 255 / 255, 1, 1)
tablestack[1]()
end
end
)
function Action(Object, Function)
if Object ~= nil then
Function(Object)
end
end
local Library = loadstring(tablestack[4]:HttpGet("https://pastebin.com/raw/1H58g3C5"))()
local Window = Library:CreateWindow(DefaultSettings, tablestack[4]:GetService("CoreGui"))
local Tab0 = Window:CreateTab("Settings")
local Section0 = Tab0:CreateSection("Menu")
local Section1 = Tab0:CreateSection("Misc")
--
function fly5()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local function checkmodsall()
pcall(
function()
for i, player in tablestack[14](players:GetChildren()) do
if player:IsInGroup(5212858) then
tablestack[4][ivzcxy10]:SetCore(
"SendNotification",
{
Title = "MOD / SNITCH DETECTED!",
Text = "Player : " .. player.Name,
Duration = 100
}
)
end
end
end
)
end
local function checkmod(player)
if player:IsInGroup(5212858) then
tablestack[4][ivzcxy10]:SetCore(
"SendNotification",
{
Title = "MOD / SNITCH DETECTED!",
Text = "Player : " .. player.Name,
Duration = 100
}
)
end
end
function autolog6()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 local function unclip()
pcall(
function()
plr.Character.Head.CanCollide = tablestack[3]
plr.Character.Torso.CanCollide = tablestack[3]
plr.Character["Left Leg"].CanCollide = tablestack[2]
plr.Character["Right Leg"].CanCollide = tablestack[2]
others[18] = tablestack[2]
end
)
end
others[19] =
Section1:CreateButton(
"Hop Server",
function()
tablestack[4]:GetService(ivzcxy10):SetCore("PromptBlockPlayer", players:GetChildren()[2])
tablestack[1](5)
tablestack[4]:GetService("TeleportService"):Teleport(4111023553, plr)
end
)
others[19] =
Section1:CreateButton(
"Respawn",
function()
character:Destroy()
end
)
others[19] =
Section1:CreateButton(
"Remove Damage Bricks",
function()
tablestack[6].Terrain.Water:Destroy()
end
)
others[19] =
Section1:CreateToggle(
"No Insanity Effect",
Settings.noinsanity,
function(State)
Settings.noinsanity = State
plr.PlayerGui.OverlayGui.Enabled = not State
Save()
end
)
others[19] =
Section1:CreateToggle(
"Streamer Mode",
Settings.streamermode,
function(State)
Settings.streamermode = State
if State then 
    plr:SetAttribute("Hidden", "Hidden")
    plr.PlayerGui.BackpackGui.JournalFrame.CharacterName.Text = "->stumware.cc<-"
end
Save()
end
)
others[19] =
Section1:CreateToggle(
"Mod Detector",
Settings.modcheck,
function(State)
Settings.modcheck = State
if State then
checkmodsall()
end
Save()
end
)
others[19] =
Section1:CreateToggle(
"Auto Pickup (Needed For Chest Farm)",
Settings.autopickup,
function(State)
Settings.autopickup = State
Save()
end
)
others[19] =
Section1:CreateToggle(
"Auto Loot (Needed For Chest Farm)",
Settings.autoloot,
function(State)
Settings.autoloot = State
Save()
end
)
others[19] =
Section1:CreateToggle(
"Fast Log",
Settings.autolog,
function(State)
Settings.autolog = State
end
)
others[19]:CreateKeybind(
"F12",
function(Key)
plr:Kick("LOGGED")
end
)
others[19] =
Section0:CreateToggle(
"UI Toggle",
nil,
function(State)
Window:Toggle(State)
getgenv().LogHolder.Enabled = State
end
)
local Button1 =
Section0:CreateButton(
"PANIC BUTTON",
function()
Settings = DefaultSettings
end
)
others[19]:CreateKeybind(
tostring(DefaultSettings.Keybind):gsub("Enum.KeyCode.", ""),
function(Key)
DefaultSettings.Keybind = Enum.KeyCode[Key]
end
)
local Colorpicker3 =
Section0:CreateColorpicker(
"UI Color",
function(Color)
Window:ChangeColor(Color)
end
)
Colorpicker3:UpdateColor(DefaultSettings.Color)
local Dropdown3 =
Section0:CreateDropdown(
"Image",
{"Default", "Hearts", "Abstract", "Hexagon", "Circles", "Lace With Flowers", "Floral"},
function(Name)
if Name  
 
 
 
 ==  
 
 
 
 "Default" then
Window:SetBackground("2151741365")
elseif Name  
 
 
 
 ==  
 
 
 
 "Hearts" then
Window:SetBackground("6073763717")
elseif Name  
 
 
 
 ==  
 
 
 
 "Abstract" then
Window:SetBackground("6073743871")
elseif Name  
 
 
 
 ==  
 
 
 
 "Hexagon" then
Window:SetBackground("6073628839")
elseif Name  
 
 
 
 ==  
 
 
 
 "Circles" then
Window:SetBackground("6071579801")
elseif Name  
 
 
 
 ==  
 
 
 
 "Lace With Flowers" then
Window:SetBackground("6071575925")
elseif Name  
 
 
 
 ==  
 
 
 
 "Floral" then
Window:SetBackground("5553946656")
end
end
)
Dropdown3:SetOption("Default")
local Colorpicker4 =
Section0:CreateColorpicker(
"Color",
function(Color)
Window:SetBackgroundColor(Color)
end
)
Colorpicker4:UpdateColor(tablestack[13](1, 1, 1))
local Slider3 =
Section0:CreateSlider(
"Transparency",
0,
1,
nil,
tablestack[2],
function(Value)
Window:SetBackgroundTransparency(Value)
end
)
Slider3:SetValue(0)
local Slider4 =
Section0:CreateSlider(
"Tile Scale",
0,
1,
nil,
tablestack[2],
function(Value)
Window:SetTileScale(Value)
end
)
Slider4:SetValue(0.5)
function find3()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local function GetMag(object, distance)
local check = tablestack[2]
function parry3()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 pcall(
function()
Action(
plr.Character,
function(self)
Action(
self.HumanoidRootPart,
function(self)
if plr.Character and (object.Position - self.Position).magnitude < distance then
check = tablestack[3]
else
check = tablestack[2]
end
end
)
end
)
end
)
return check
end
function leave7()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 function upperfirst(str)
return (str:lower():gsub("^%l", string.upper))
end
local worldToViewportPoint = camera.worldToViewportPoint
local function Esp(enemy)
    do
        stopesp = tablestack[2]
local Box = Drawing.new("Square")
Box.Visible = tablestack[2]
Box.Color = tablestack[13](1, 1, 1)
Box.Thickness = 1
Box.Transparency = 1
local HealthBar = Drawing.new("Square")
HealthBar.Thickness = 1
HealthBar.Filled = tablestack[2]
HealthBar.Transparency = 1

local breakbar = Drawing.new("Square")
breakbar.Thickness = 1
breakbar.Filled = tablestack[2]
breakbar.Transparency = 1
breakbar.Color = tablestack[13](1, 1, 200)
local name = Drawing.new("Text")
name.Color = DefaultSettings.textcolor
name.Outline = tablestack[3]
name.Center = tablestack[3]
name.Visible = tablestack[3]
name.Size = 17
function parry2()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 local glow = tablestack[12]("PointLight")
glow.Brightness = 0
glow.Range = 5
function fly1()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local line = Drawing.new("Line")
line.Thickness = 0
local enemychar = enemy.Character
local enemyhumanoid = enemychar.Humanoid
local RootPart = enemychar.HumanoidRootPart
local Head = enemychar.Head
local talentcount = 0
local mantracount = 0
local itemcount = 0
for i, thing in tablestack[14](enemy.Backpack:GetChildren()) do
if tablestack[21](thing.Name, "Talent") then
talentcount = talentcount + 1
elseif tablestack[21](thing.Name, "Mantra") then
mantracount = mantracount + 1
elseif thing:IsA("Tool") then
itemcount = itemcount + 1
end
end
glow.Parent = enemychar.HumanoidRootPart
--
    spawn(function()
while tablestack[3] do
runservice.RenderStepped:Wait()
if
enemy and Settings.playeresp and enemychar:FindFirstChild("Humanoid") and
enemyhumanoid.Health > 0 and character:FindFirstChild("HumanoidRootPart") and
not stopesp
then
if Settings.tracersenabled then
line.Thickness = 1
end
local pos, vis = camera:WorldToViewportPoint(RootPart.Position)
local distance = tablestack[20]((RootPart.Position - camera.CFrame.p).magnitude)
local pos2 =
camera:WorldToViewportPoint(RootPart.Position + tablestack[8](0, 3 + distance / 13, 0))
local pos3 = camera:WorldToViewportPoint(character.HumanoidRootPart.Position)
function autolog7()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 --
if vis and enemychar:FindFirstChild("Head") then
local final = ""
final = final.."<" .. enemy.Name .. ">\n"
if Settings.healthenabled then
final = final.." [".. tablestack[20](enemyhumanoid.Health).. "/".. tablestack[20](enemyhumanoid.MaxHealth).."]"
end
if Settings.distanceenabled then
final = final .. " [" .. distance .. "]"
end
final = final.."\n"
if Settings.talents then
final = final .. " [" .. talentcount .. "]"
end
if Settings.mantras then
final = final .. " [" .. mantracount .. "]"
end
if Settings.items then
final = final .. " [" .. itemcount .. "]"
end
final = final.."\n"
if Settings.agility then
final = final .. "Agi - " .. enemychar.Agility.Value .. "  "
end
if Settings.fortitude then
final = final .. "Fort - " .. tablestack[20]((enemyhumanoid.MaxHealth - 100) / 6) .. "  "
end
if Settings.resivoir then
final = final .. "Res - " .. tablestack[20](enemychar.Reservoir.Value) .. "  "
end
if Settings.ether then
final = final .. "Eth - " .. tablestack[20](enemychar.Ether.Value)
end
--
name.Text = final
name.Position = vector2new(pos2.x, pos2.y)
--
function kill5()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 if Settings.glowenabled then
glow.Brightness = 5
else
glow.Brightness = 0
end
function parry3()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 if Settings.rgbmode and enemyhumanoid.Health  
 
 
 
 >=  
 
 
 
 20 then
name.Color = rgb
Box.Color = rgb
line.Color = rgb
elseif enemyhumanoid.Health  
 
 
 
 >=  
 
 
 
 20 then
name.Color = DefaultSettings.textcolor
Box.Color = DefaultSettings.boxcolor
line.Color = DefaultSettings.tracercolor
elseif enemyhumanoid.Health < 20 then
Box.Color = tablestack[10](255, 0, 0)
line.Color = tablestack[10](255, 0, 0)
end
local HeadPosition = worldToViewportPoint(camera, Head.Position + tablestack[8](0, 2, 0))
local LegPosition = worldToViewportPoint(camera, RootPart.Position - tablestack[8](0, 2, 0))
line.From = vector2new(pos3.x, pos3.y)
line.To = vector2new(pos.x, pos.y)
Box.Size = tablestack[9](2500 / pos.Z, HeadPosition.Y - LegPosition.Y)
Box.Position = tablestack[9](pos.X - Box.Size.X / 2, pos.Y - Box.Size.Y / 2)
HealthBar.Size =
tablestack[9](
2,
(HeadPosition.Y - LegPosition.Y) /
(enemyhumanoid.MaxHealth /
math.clamp(enemyhumanoid.Health, 0, enemyhumanoid.MaxHealth))
)
breakbar.Size =
tablestack[9](
2,
(HeadPosition.Y - LegPosition.Y) /
(15 /
math.clamp(enemychar.BreakMeter.Value, 0, 15))
)

HealthBar.Position =
tablestack[9](Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))

breakbar.Position =
tablestack[9](HealthBar.Position.X - 6, HealthBar.Position.Y + (1 / breakbar.Size.Y))

HealthBar.Color =
tablestack[10](
255 - 255 / (enemyhumanoid.MaxHealth / enemyhumanoid.Health),
255 / (enemyhumanoid.MaxHealth / enemyhumanoid.Health),
0
)
if Settings.boxenabled then
Box.Visible = tablestack[3]
HealthBar.Visible = tablestack[3]
breakbar.Visible = tablestack[3]
elseif breakbar.Visible then
Box.Visible = tablestack[2]
HealthBar.Visible = tablestack[2]
breakbar.Visible = tablestack[2]
end
name.Visible = tablestack[3]
if Settings.tracersenabled and line.Visible  
 
 
 
 ==  
 
 
 
 tablestack[2] then
line.Visible = tablestack[3]
end
else -- not visible
name.Visible = tablestack[2]
Box.Visible = tablestack[2]
HealthBar.Visible = tablestack[2]
breakbar.Visible = tablestack[2]
if Settings.tracersenabled and line.Visible  
 
 
 
 ==  
 
 
 
 tablestack[3] then
line.Visible = tablestack[2]
end
end
else -- player left / doesn't exist
name.Visible = tablestack[2]
name:Remove()
Box.Visible = tablestack[2]
Box:Remove()
line.Visible = tablestack[2]
line:Remove()
HealthBar.Visible = tablestack[2]
HealthBar:Remove()
breakbar.Visible = tablestack[2]
breakbar:Remove()
break
end
end

end)
end
end
function parry2()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local function addesp()
for i, player in tablestack[14](players:GetChildren()) do
if
player.Character and player.Character:FindFirstChild("HumanoidRootPart") and
player.Character:FindFirstChild("Humanoid") and
player ~= plr and
GetMag(player.Character.HumanoidRootPart, esprange.Value)
then
    pcall(function()
    Esp(player)
end)
end
end
end
local function Esp2(brick)
local name = Drawing.new("Text")
name.Color = DefaultSettings.textcolor
name.Outline = tablestack[3]
name.Center = tablestack[3]
name.Visible = tablestack[3]
--
local function Update()
local temp
temp =
runservice.RenderStepped:Connect(
function()
runservice.RenderStepped:Wait()
if Settings.travelpoints and character and character:FindFirstChild("HumanoidRootPart") then
local distance = tablestack[20]((brick.Position - camera.CFrame.p).magnitude)
local pos, vis = camera:WorldToViewportPoint(brick.Position)
local pos2 = camera:WorldToViewportPoint(brick.Position + tablestack[8](0, 3 + distance / 13, 0))
local pos3 = camera:WorldToViewportPoint(character.HumanoidRootPart.Position)
name.Visible = vis
if vis then
local final = "=[" .. brick.Name .. "]="
final = final .. "\n" .. distance
function parry7()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 --
name.Text = final
name.Position = vector2new(pos2.x, pos2.y)
name.Size = 23
function kill9()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 if Settings.rgbmode then
name.Color = rgb
else
name.Color = DefaultSettings.textcolor
end
end
else -- player left / doesn't exist
name.Visible = tablestack[2]
name:Remove()
temp:Disconnect()
end
end
)
end
coroutine.wrap(Update)()
end
function autolog1()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 local function addesp2()
for i, brick in tablestack[14](tablestack[6].WarpPoints:GetChildren()) do
Esp2(brick)
end
end
local Tab1 = Window:CreateTab("Visuals")
local Section1 = Tab1:CreateSection("Player Visuals")
local Section2 = Tab1:CreateSection("World")
local Section3 = Tab1:CreateSection("Local Player")
others[19] =
Section2:CreateToggle(
"Main World Locations",
Settings.travelpoints,
function(State)
Settings.travelpoints = State
if State then addesp2() end
Save()
end
)
others[19]:AddToolTip("forces day timing")
others[19] =
Section2:CreateToggle(
"Day Mode",
Settings.Day,
function(State)
Settings.Day = State
if State then lighting.ClockTime = 12 end
Save()
end
)
others[19]:AddToolTip("forces day timing")
others[19] =
Section2:CreateToggle(
"Night Mode",
Settings.Night,
function(State)
Settings.Night = State
if State then lighting.ClockTime = 0 end
Save()
end
)
others[19]:AddToolTip("forces night timing")
others[19] =
Section2:CreateToggle(
"Sunset Mode",
Settings.Sunset,
function(State)
Settings.Sunset = State
if State then lighting.ClockTime = 6.3 end
Save()
end
)
others[19]:AddToolTip("forces sunset timing")
others[19] =
Section2:CreateToggle(
"Remove Atmosphere (FPS)",
Settings.RemoveAtmosphere,
function(State)
Settings.RemoveAtmosphere = State
if State and lighting:FindFirstChild("Atmosphere") then
lighting:FindFirstChild("Atmosphere").Parent = replicatedstorage
end
Save()
end
)
others[19]:AddToolTip("removes realistic fog")
others[19] =
Section2:CreateToggle(
"No Blur",
Settings.noblur,
function(State)
Settings.noblur = State
Save()
end
)
others[19]:AddToolTip("removes realistic fog")
others[19] =
Section2:CreateToggle(
"No Shadows (FPS)",
Settings.Shadows,
function(State)
Settings.Shadows = State
lighting.GlobalShadows = not State
Save()
end
)
others[19]:AddToolTip("disables global shadows")
others[19] =
Section2:CreateToggle(
"No Particles (FPS)",
Settings.NoParticles,
function(State)
Settings.NoParticles = State
if not State then
return
end
for i, thing in tablestack[14](tablestack[6]:GetDescendants()) do
if thing:IsA("ParticleEmitter") then
thing.Enabled = tablestack[2]
end
end
Save()
end
)
others[19]:AddToolTip("disables particles for fps")
others[19] =
Section2:CreateToggle(
"Full Bright",
Settings.FullBright,
function(State)
Settings.FullBright = State
if State then
lighting.Ambient = tablestack[10](255, 255, 255)
lighting.Brightness = 10
else
lighting.Ambient = oldambient
lighting.Brightness = 5
end
Save()
end
)
others[19]:AddToolTip("makes the world bright")
local Toggle1 =
Section2:CreateToggle(
"Remove Textures (FPS + PING)",
Settings.FullBright,
function(State)
Settings.textures = State
if State then
pcall(
function()
tablestack[6].SkinnedSea:Destroy()
for i, thing in tablestack[14](tablestack[6]:GetDescendants()) do
if thing:IsA("Texture") or thing:IsA("Decal") then
thing:Destroy()
end
end
end
)
end
Save()
end
)
Toggle1:AddToolTip("removes textures so your wifi doesn't need to download any")
function kill4()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 others[19] =
Section1:CreateToggle(
"Player Esp",
Settings.playeresp,
function(State)
Settings.playeresp = State
if Settings.playeresp then
addesp()
end
Save()
end
)
others[19]:AddToolTip("enabled player esp")
function pvp6()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 others[19] =
Section1:CreateToggle(
"Player Distance",
Settings.distanceenabled,
function(State)
Settings.distanceenabled = State
Save()
end
)
others[19]:AddToolTip("shows player distance from you")
others[19] =
Section1:CreateToggle(
"Player Health",
Settings.healthenabled,
function(State)
Settings.healthenabled = State
Save()
end
)
others[19]:AddToolTip("shows player health")
others[19] =
Section1:CreateToggle(
"Talent Count",
Settings.talents,
function(State)
Settings.talents = State
Save()
end
)
others[19]:AddToolTip("shows how many talents this kid has")
others[19] =
Section1:CreateToggle(
"Mantra Count",
Settings.mantras,
function(State)
Settings.mantras = State
Save()
end
)
others[19]:AddToolTip("shows how many mantras this kid has")
others[19] =
Section1:CreateToggle(
"Items Count",
Settings.items,
function(State)
Settings.items = State
Save()
end
)
others[19]:AddToolTip("shows how many items this kid has")
others[19] =
Section1:CreateToggle(
"Player Box Health Bar",
Settings.boxenabled,
function(State)
Settings.boxenabled = State
Save()
end
)
others[19]:AddToolTip("shows size of player as a box")
others[19] =
Section1:CreateToggle(
"Player Tracers",
Settings.playeresp,
function(State)
local set = tablestack[2]
Settings.tracersenabled = State
if Settings.playeresp then
Settings.playeresp = tablestack[2]
set = tablestack[3]
end
tablestack[1]()
if set then
Settings.playeresp = tablestack[3]
end
addesp()
Save()
end
)
others[19]:AddToolTip("draws line to player")
others[19] =
Section1:CreateToggle(
"Player Glow",
Settings.glowenabled,
function(State)
Settings.glowenabled = State
Save()
end
)
others[19]:AddToolTip("makes a glow so you can see them in the dark")
others[19] =
Section1:CreateToggle(
"Player Fortitude",
Settings.fortitude,
function(State)
Settings.fortitude = State
Save()
end
)
others[19]:AddToolTip("shows specific stat")
function fly3()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 others[19] =
Section1:CreateToggle(
"Player Agility",
Settings.agility,
function(State)
Settings.agility = State
Save()
end
)
others[19]:AddToolTip("shows specific stat")
others[19] =
Section1:CreateToggle(
"Player Resivoir",
Settings.resivoir,
function(State)
Settings.resivoir = State
Save()
end
)
others[19]:AddToolTip("shows specific stat")
others[19] =
Section1:CreateToggle(
"Player Ether",
Settings.ether,
function(State)
Settings.ether = State
Save()
end
)
others[19]:AddToolTip("shows specific stat")
local Toggle1 =
Section1:CreateToggle(
"RGB Mode",
Settings.rgbmode,
function(State)
Settings.rgbmode = State
Save()
end
)
Toggle1:AddToolTip("makes everything rainbow like a gay")
local Colorpicker =
Section1:CreateColorpicker(
"Text Color\n(Name,Distance,Health)",
function(Color)
DefaultSettings.textcolor = Color
end
)
Colorpicker:AddToolTip("Text Color")
Colorpicker:UpdateColor(DefaultSettings.boxcolor)
local Colorpicker =
Section1:CreateColorpicker(
"Box Color\n(Player Box)",
function(Color)
DefaultSettings.boxcolor = Color
end
)
Colorpicker:AddToolTip("Box Color")
Colorpicker:UpdateColor(DefaultSettings.tracercolor)
function kill7()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 local Colorpicker =
Section1:CreateColorpicker(
"Tracers Color\n(Player Tracers)",
function(Color)
DefaultSettings.tracercolor = Color
end
)
Colorpicker:AddToolTip("Tracers Color")
Colorpicker:UpdateColor(DefaultSettings.tracercolor)
local function ghostme()
if Settings.ForceField then
for i, thing in tablestack[14](character:GetChildren()) do
tablestack[1](.01)
if thing:IsA("BasePart") then
thing.Material = tablestack[17].ForceField
end
end
else
for i, thing in tablestack[14](character:GetChildren()) do
tablestack[1](.01)
if thing:IsA("BasePart") then
thing.Material = tablestack[17].Plastic
end
end
end
end
others[19] =
Section3:CreateToggle(
"Player Ghost",
Settings.ForceField,
function(State)
Settings.ForceField = State
ghostme()
Save()
end
)
others[19]:AddToolTip("makes you look like a ghost")
others[19] =
Section3:CreateToggle(
"Headless (Server)",
Settings.headless,
function(State)
Settings.headless = State
if Settings.headless then
local Char = plr.Character
Char.Head.Mesh.Parent = tablestack[4].CoreGui
Char.Head:ClearAllChildren()
Char.Torso.Parent = tablestack[4].CoreGui
tablestack[4].CoreGui.Mesh.Parent = Char.Head
tablestack[4].CoreGui.Torso.Parent = Char
Char.Torso.Parent = lighting
Char.Head.Parent = lighting
lighting.Head.Parent = Char
lighting.Torso.Parent = Char
end
Save()
end
)
others[19] =
Section3:CreateToggle(
"Rainbow Weapon",
Settings.rainbowweapon,
function(State)
Settings.rainbowweapon = State
Save()
end
)
others[19]:AddToolTip("makes you look like a ghost")
others[19]:AddToolTip("removes your head (server sided)")
others[19] =
Section3:CreateToggle(
"Rainbow Trail Weapon",
Settings.rainbowtrail,
function(State)
Settings.rainbowtrail = State
Save()
end
)
others[19]:AddToolTip("makes your weapon trail look like a gay")
others[19] =
Section3:CreateToggle(
"Anti - Blindfold",
Settings.noblindfold,
function(State)
Settings.noblindfold = State
getgenv().noblindfold = State
Save()
end
)
others[19]:AddToolTip("wear blindfold without going blind")
if Settings.infinitezoom and plr.CameraMaxZoomDistance  
 
 
 
 ==  
 
 
 
 20 then
plr.CameraMaxZoomDistance = 100
elseif plr.CameraMaxZoomDistance ~= 20 then
plr.CameraMaxZoomDistance = 20
end
others[19] =
Section3:CreateToggle(
"Infinite Zoom",
Settings.infinitezoom,
function(State)
Settings.infinitezoom = State
if Settings.infinitezoom and plr.CameraMaxZoomDistance  
 
 
 
 ==  
 
 
 
 20 then
plr.CameraMaxZoomDistance = 100
elseif plr.CameraMaxZoomDistance ~= 20 then
plr.CameraMaxZoomDistance = 20
end
Save()
end
)
others[19]:AddToolTip("zoom to the moon like my hairline")
function parry0()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local function EspMobs(enemy)
    do
        stopesp2 = tablestack[2]
local name = Drawing.new("Text")
name.Color = DefaultSettings.textcolor
name.Outline = tablestack[3]
name.Center = tablestack[3]
name.Visible = tablestack[3]
name.Size = 17
local glow = tablestack[12]("PointLight")
glow.Brightness = 0
glow.Range = 5
local line = Drawing.new("Line")
line.Thickness = 0

local Box = Drawing.new("Square")
Box.Visible = tablestack[2]
Box.Color = tablestack[13](1, 1, 1)
Box.Thickness = 1
Box.Transparency = 1
function pvp7()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 local HealthBar = Drawing.new("Square")
HealthBar.Thickness = 2
HealthBar.Filled = tablestack[2]
HealthBar.Transparency = 1

local breakbar = Drawing.new("Square")
breakbar.Thickness = 2
breakbar.Filled = tablestack[2]
breakbar.Transparency = 1
breakbar.Color = tablestack[13](1, 1, 200)
local nameedit = upperfirst(string.gsub(enemy.Name, "%d+", ""):gsub("[^%w%s_]+", ""))
local enemychar = enemy
local enemyhumanoid = enemychar.Humanoid
local RootPart = enemychar.HumanoidRootPart
local Head = enemychar.Head
function kill6()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 glow.Parent = enemychar.HumanoidRootPart
function leave2()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 if Settings.mobhitbox and enemychar:FindFirstChild("Hitboxes") then
for i, thing in tablestack[14](enemychar.Hitboxes:GetChildren()) do
if thing.Value ~= nil then
thing.Value.Visible = tablestack[3]
end
end
end
--
spawn(function()
while tablestack[3] do
    runservice.RenderStepped:Wait()
if
Settings.mobesp and enemy ~= nil and enemy:FindFirstChildOfClass("Humanoid") ~= nil and
enemy:FindFirstChild("HumanoidRootPart") and
enemy.Humanoid.Health > 0 and character:FindFirstChild("HumanoidRootPart") and not stopesp2
then
local distance = tablestack[20]((enemychar.HumanoidRootPart.Position - camera.CFrame.p).magnitude)
local pos, vis = camera:WorldToViewportPoint(enemychar.HumanoidRootPart.Position)
local pos2 =
camera:WorldToViewportPoint(
enemychar.HumanoidRootPart.Position + tablestack[8](0, 3 + distance / 13, 0)
)
local pos3 = camera:WorldToViewportPoint(character.HumanoidRootPart.Position)
--
function kill4()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 if vis then
local final = "<" .. nameedit .. ">"
if Settings.mobhealthenabled then
final = final.." [".. tablestack[20](enemyhumanoid.Health).. "/".. tablestack[20](enemyhumanoid.MaxHealth).."]"
end
if Settings.mobdistanceenabled then
final = final .. " [" .. distance .. "]"
end
if Settings.mobxpamount and enemychar:FindFirstChild("ExpMP") then
final = final .. "\n XP: " .. tostring(enemychar.ExpMP.Value)
end
--
name.Text = final
name.Position = vector2new(pos2.x, pos2.y)
function autolog3()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 --
if Settings.mobglowenabled then
glow.Brightness = 5
else
glow.Brightness = 0
end
function fly5()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 if Settings.mobtracersenabled then
line.From = vector2new(pos3.x, pos3.y)
line.To = vector2new(pos.x, pos.y)
end

if Settings.rgbmode and enemyhumanoid.Health  
 
 
 
 >=  
 
 
 
 20 then
name.Color = rgb
Box.Color = rgb
line.Color = rgb
elseif enemyhumanoid.Health  
 
 
 
 >=  
 
 
 
 20 then
name.Color = DefaultSettings.textcolor
Box.Color = DefaultSettings.boxcolor
line.Color = DefaultSettings.tracercolor
elseif enemyhumanoid.Health < 20 then
Box.Color = tablestack[10](255, 0, 0)
line.Color = tablestack[10](255, 0, 0)
end
local HeadPosition = worldToViewportPoint(camera, Head.Position + tablestack[8](0, 2, 0))
local LegPosition = worldToViewportPoint(camera, RootPart.Position - tablestack[8](0, 2, 0))
line.From = vector2new(pos3.x, pos3.y)
line.To = vector2new(pos.x, pos.y)
Box.Size = tablestack[9](2500 / pos.Z, HeadPosition.Y - LegPosition.Y)
Box.Position = tablestack[9](pos.X - Box.Size.X / 2, pos.Y - Box.Size.Y / 2)
function autolog5()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 HealthBar.Size =
tablestack[9](
2,
(HeadPosition.Y - LegPosition.Y) /
(enemyhumanoid.MaxHealth /
math.clamp(enemyhumanoid.Health, 0, enemyhumanoid.MaxHealth))
)
breakbar.Size =
tablestack[9](
2,
(HeadPosition.Y - LegPosition.Y) /
(15 /
math.clamp(enemychar.BreakMeter.Value, 0, 15))
)

HealthBar.Position =
tablestack[9](Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))

breakbar.Position =
tablestack[9](HealthBar.Position.X - 6, HealthBar.Position.Y + (1 / breakbar.Size.Y))

HealthBar.Color =
tablestack[10](
255 - 255 / (enemyhumanoid.MaxHealth / enemyhumanoid.Health),
255 / (enemyhumanoid.MaxHealth / enemyhumanoid.Health),
0
)
--

name.Visible = tablestack[3]
HealthBar.Visible = tablestack[3]
    breakbar.Visible = tablestack[3]
    Box.Visible = tablestack[3]
if Settings.mobtracersenabled then
line.Visible = tablestack[3]
end
else -- not visible
name.Visible = tablestack[2]
HealthBar.Visible = tablestack[2]
    breakbar.Visible = tablestack[2]
    Box.Visible = tablestack[2]
if Settings.mobtracersenabled then
line.Visible = tablestack[2]
end
end
else -- mob left / doesn't exist
name.Visible = tablestack[2]
name:Remove()
line.Visible = tablestack[2]
line:Remove()
    HealthBar.Visible = tablestack[2]
    breakbar.Visible = tablestack[2]
    Box.Visible = tablestack[2]
    HealthBar:Remove()
    breakbar:Remove()
    Box:Remove()
break
end
end

end)
end
end
function find8()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 local function AddMobEsp()
for i, mob in tablestack[14](tablestack[6].Live:GetChildren()) do
if
mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and
not players:FindFirstChild(mob.Name) and
GetMag(mob.HumanoidRootPart, esprange.Value)
then
pcall(
function()
EspMobs(mob)
end
)
end
end
end
function leave5()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local Section3 = Tab1:CreateSection("Mobs")
others[19] =
Section3:CreateToggle(
"Mob ESP",
Settings.mobesp,
function(State)
Settings.mobesp = State
if State then
AddMobEsp()
end
Save()
end
)
others[19]:AddToolTip("enable mob esp")
others[19] =
Section3:CreateToggle(
"Mob Health",
Settings.mobhealthenabled,
function(State)
Settings.mobhealthenabled = State
Save()
end
)
others[19]:AddToolTip("shows mob health")
others[19] =
Section3:CreateToggle(
"Mob HitBox",
Settings.mobhitbox,
function(State)
Settings.mobhitbox = State
Save()
end
)
others[19]:AddToolTip("shows the hitboxes")
others[19] =
Section3:CreateToggle(
"Mob EXP Amount",
Settings.mobxpamount,
function(State)
Settings.mobxpamount = State
Save()
end
)
others[19]:AddToolTip("shows how much exp the mob gives")
others[19] =
Section3:CreateToggle(
"Mob Distance",
Settings.mobdistanceenabled,
function(State)
Settings.mobdistanceenabled = State
Save()
end
)
others[19]:AddToolTip("shows mob distance from u")
others[19] =
Section3:CreateToggle(
"Mob Tracers",
Settings.mobtracersenabled,
function(State)
Settings.mobtracersenabled = State
Save()
end
)
others[19]:AddToolTip("draws line from you to mob")
others[19] =
Section3:CreateToggle(
"Mob Glow",
Settings.mobglowenabled,
function(State)
Settings.mobglowenabled = State
Save()
end
)
others[19]:AddToolTip("glows mob so u can see them in dark")
local function ObjectESP(enemy, namez)
local name = Drawing.new("Text")
name.Color = DefaultSettings.textcolor
name.Outline = tablestack[3]
name.Center = tablestack[3]
name.Visible = tablestack[3]
local line = Drawing.new("Line")
line.Thickness = 0
line.Color = tablestack[10](255, 0, 0)
function leave7()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local enemychar = enemy
function pvp4()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 --
spawn(function()
while tablestack[3] do
runservice.RenderStepped:Wait()
pcall(
function()
if
Settings.chestenabled or
Settings.artifactesp and enemychar ~= nil and enemychar.Transparency  
 
 
 
 ==  
 
 
 
 0
then
if Settings.objecttracersenabled then
line.Thickness = 1
end
function clicktp9()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local distance = tablestack[20]((enemychar.Position - camera.CFrame.p).magnitude)
local pos, vis = camera:WorldToViewportPoint(enemychar.Position)
local pos2 =
camera:WorldToViewportPoint(
enemychar.Position + tablestack[8](0, 1 + distance / 14, 0)
)
local pos3 = camera:WorldToViewportPoint(character.HumanoidRootPart.Position)
local final = "<" .. namez .. ">\n"
if Settings.objectdistanceenabled then
final = final .. " [" .. distance .. "]"
end
final = final .. " [OBJECT]"
--
name.Text = final
name.Position = vector2new(pos2.x, pos2.y)
name.Size = 17
--
if Settings.rgbmode then
name.Color = rgb
line.Color = rgb
else
name.Color = DefaultSettings.textcolor
line.Color = DefaultSettings.tracercolor
end
if Settings.objecttracersenabled then
line.From = vector2new(pos3.x, pos3.y)
line.To = vector2new(pos.x, pos.y)
end
--
if vis then
name.Visible = tablestack[3]
if Settings.objecttracersenabled then
line.Visible = tablestack[3]
end
else -- not visible
name.Visible = tablestack[2]
if Settings.objecttracersenabled then
line.Visible = tablestack[2]
end
end
else -- mob left / doesn't exist
name.Visible = tablestack[2]
name:Remove()
if Settings.objecttracersenabled then
line.Visible = tablestack[2]
line:Remove()
end
temp:Disconnect()
end
end
)
end
end)
end
local function IngredientsESP(enemy, namez)
local name = Drawing.new("Text")
name.Color = DefaultSettings.textcolor
name.Outline = tablestack[3]
name.Center = tablestack[3]
name.Visible = tablestack[3]
function fly9()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 local glow = tablestack[12]("PointLight")
glow.Brightness = 0
glow.Range = 5
local line = Drawing.new("Line")
line.Thickness = 0
line.Color = tablestack[10](255, 0, 0)
local enemychar = enemy
glow.Parent = enemychar
--
function kill4()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 local function Update()
local temp
temp =
runservice.RenderStepped:Connect(
function()
tablestack[1](.05)
if Settings.ingredientsenabled and enemy ~= nil and GetMag(enemy, 500) then
local add = 0
if Settings.objecttracersenabled then
line.Thickness = 1
end
if Settings.objectdistanceenabled then
add = add + 1
end
function kill0()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local distance = tablestack[20]((enemychar.Position - camera.CFrame.p).magnitude)
local pos, vis = camera:WorldToViewportPoint(enemychar.Position)
local pos2 =
camera:WorldToViewportPoint(enemychar.Position + tablestack[8](0, 1 + add + distance / 14, 0))
local pos3 = camera:WorldToViewportPoint(character.HumanoidRootPart.Position)
local final = "<" .. namez .. ">"
if Settings.objectdistanceenabled then
final = final .. " [" .. distance .. "]"
end
final = final .. " [OBJECT]"
--
name.Text = final
name.Position = vector2new(pos2.x, pos2.y)
name.Size = 17
--
if Settings.mobglowenabled then
glow.Brightness = 5
else
glow.Brightness = 0
end
if Settings.rgbmode then
name.Color = rgb
line.Color = rgb
else
name.Color = DefaultSettings.textcolor
line.Color = DefaultSettings.tracercolor
end
if Settings.objecttracersenabled then
line.From = vector2new(pos3.x, pos3.y)
line.To = vector2new(pos.x, pos.y)
end
--
if vis then
name.Visible = tablestack[3]
if Settings.objecttracersenabled then
line.Visible = tablestack[3]
end
else -- not visible
name.Visible = tablestack[2]
if Settings.objecttracersenabled then
line.Visible = tablestack[2]
end
end
else -- mob left / doesn't exist
name.Visible = tablestack[2]
name:Remove()
line.Visible = tablestack[2]
line:Remove()
temp:Disconnect()
end
end
)
end
coroutine.wrap(Update)()
end
function clicktp8()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 local function AddChestESP()
for i, child in tablestack[14](tablestack[6].Thrown:GetChildren()) do
if child.Name  
 
 
 
 ==  
 
 
 
 "Model" and child:FindFirstChild("Lid") then
ObjectESP(child.Lid, "Chest")
end
end
end
local function AddBagESP()
for i, child in tablestack[14](tablestack[6].Thrown:GetChildren()) do
if child.Name  
 
 
 
 ==  
 
 
 
 "BagDrop" then
ObjectESP(child, "Bag")
end
end
end
local function AddIngredientsESP()
for i, child in tablestack[14](tablestack[6].Ingredients:GetChildren()) do
if
child:IsA("BasePart") and
pcall(
function()
GetMag(child, 500)
end
)
then
IngredientsESP(child, child.Name)
end
end
end
local function AddArtifacts()
for i, child in tablestack[14](tablestack[6]:GetDescendants()) do
if child:IsA("BasePart") and child.Size  
 
 
 
 ==  
 
 
 
 tablestack[8](8.1583251953125, 3.3399312496185, 7.9473361968994) then
ObjectESP(child, "<--{[ARTIFACT]}-->")
end
end
end
local Section3 = Tab1:CreateSection("Objects")
others[19] =
Section3:CreateToggle(
"Chest ESP",
Settings.chestenabled,
function(State)
Settings.chestenabled = State
if State then
AddChestESP()
end
Save()
end
)
others[19] =
Section3:CreateToggle(
"Bag ESP",
Settings.chestenabled,
function(State)
Settings.chestenabled = State
if State then
AddBagESP()
end
Save()
end
)
others[19]:AddToolTip("shows esp for bags (player drops)")
others[19] =
Section3:CreateToggle(
"Ingredients ESP",
Settings.ingredientsenabled,
function(State)
Settings.ingredientsenabled = State
if State then
AddIngredientsESP()
end
Save()
end
)
others[19]:AddToolTip("shows esp for ingredients (shrooms, fruit, gobletto etc)")
others[19] =
Section3:CreateToggle(
"Artifact ESP",
Settings.artifactesp,
function(State)
Settings.artifactesp = State
if State then
AddArtifacts()
end
Save()
end
)
others[19]:AddToolTip("shows esp for artifacts")
others[19] =
Section3:CreateToggle(
"Artifact Spawn Notifier",
Settings.artifactesp,
function(State)
Settings.artifactesp = State
if State then
AddArtifacts()
end
Save()
end
)
others[19]:AddToolTip("notification if artifact spawns")
others[19] =
Section3:CreateToggle(
"Object Distance",
Settings.objectdistanceenabled,
function(State)
Settings.objectdistanceenabled = State
if State then
AddChestESP()
end
Save()
end
)
others[19]:AddToolTip("shows distance to the object")
others[19] =
Section3:CreateToggle(
"Object Tracers",
Settings.objecttracersenabled,
function(State)
Settings.objecttracersenabled = State
if State then
AddChestESP()
end
Save()
end
)
others[19]:AddToolTip("draws line from you to chest")
local Tab = Window:CreateTab("Combat")
local Section3 = Tab:CreateSection("PvP")
others[19] =
Section3:CreateToggle(
"No Stun/Slow",
Settings.noslow,
function(State)
Settings.noslow = State
getgenv().noslow = State
Save()
end
)
others[19]:AddToolTip("basically like no stun but it involves other stuff")
others[19] =
Section3:CreateToggle(
"Auto Feint Parry",
Settings.autofeint,
function(State)
Settings.autofeint = State
Save()
end
)
others[19]:AddToolTip("you probably just bought the script for this... didn't you?")
others[19] =
Section3:CreateSlider(
"Feint Chance",
0,
100,
nil,
tablestack[2],
function(Value)
Settings.autofeintchance = Value
end
)
others[19]:AddToolTip("chance that you will do a feint attack")
others[19] =
Section3:CreateToggle(
"Auto Dodge",
Settings.autododge,
function(State)
Settings.autododge = State
Save()
end
)
others[19]:AddToolTip("auto dodges when someone attacks or is about to attack")
others[19] =
Section3:CreateToggle(
"Teleport Behind On Hit",
Settings.tphit,
function(State)
Settings.tphit = State
Save()
end
)
others[19]:AddToolTip("teleports you to the enemy when you hit them for infinite combos")
others[19] =
Section3:CreateToggle(
"Keep At Range",
Settings.keepinrange,
function(State)
Settings.keepinrange = State
Save()
end
)
others[19]:AddToolTip("rolls away if enemy is in a certain range (this is good for axes / spears)")
function kill1()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 others[19] =
Section3:CreateSlider(
"Range",
1,
20,
nil,
tablestack[2],
function(Value)
Settings.keepinrangerange = Value
end
)
others[19]:AddToolTip("distance to stay away from")
others[19]:SetValue(Settings.keepinrangerange)
function leave7()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 Section3 = Tab:CreateSection("Parry")
function pvp4()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 others[19] =
Section3:CreateToggle(
"Auto Parry",
Settings.autoparry,
function(State)
Settings.autoparry = State
Save()
end
)
others[19]:AddToolTip("you probably just bought the script for this... didn't you?")
others[19] =
Section3:CreateToggle(
"Ignore Friends",
Settings.friendcheck,
function(State)
Settings.friendcheck = State
Save()
end
)
others[19]:AddToolTip("don't parry your friends?")
others[19] =
Section3:CreateSlider(
"Sword Parry Add Delay",
0,
.5,
nil,
tablestack[2],
function(Value)
sworddelay = Value
Settings.sworddelay = tonumber(Value)
Save()
end
)
others[19]:AddToolTip("make your parry Parry later (recommended to leave it alone)")
others[19]:SetValue(tonumber(sworddelay))
others[19] =
Section3:CreateSlider(
"Sword Parry Remove Delay",
0,
.5,
nil,
tablestack[2],
function(Value)
swordearly = Value
Settings.swordearly = tonumber(Value)
Save()
end
)
others[19]:AddToolTip("make your parry Parry ealier (recommended to leave it alone)")
others[19]:SetValue(tonumber(swordearly))
others[19] =
Section3:CreateSlider(
"Axe Parry Add Delay",
0,
.5,
nil,
tablestack[2],
function(Value)
axedelay = Value
Settings.axedelay = tonumber(Value)
Save()
end
)
others[19]:AddToolTip("make your parry Parry later (recommended to leave it alone)")
others[19]:SetValue(tonumber(axedelay))
others[19] =
Section3:CreateSlider(
"Axe Parry Remove Delay",
0,
.5,
nil,
tablestack[2],
function(Value)
axeearly = Value
Settings.axeearly = Value
Save()
end
)
others[19]:AddToolTip("make your parry Parry ealier (recommended to leave it alone)")
others[19]:SetValue(tonumber(axeearly))
others[19] =
Section3:CreateSlider(
"Spear Parry Add Delay",
0,
.5,
nil,
tablestack[2],
function(Value)
speardelay = Value
Settings.speardelay = Value
Save()
end
)
others[19]:AddToolTip("make your parry Parry later (recommended to leave it alone)")
others[19]:SetValue(tonumber(speardelay))
function autolog7()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 others[19] =
Section3:CreateSlider(
"Spear Parry Remove Delay",
0,
.5,
nil,
tablestack[2],
function(Value)
spearearly = Value
Settings.spearearly = Value
Save()
end
)
others[19]:AddToolTip("make your parry Parry ealier (recommended to leave it alone)")
others[19]:SetValue(tonumber(spearearly))
Section3 = Tab:CreateSection("Rage")
others[19] =
Section3:CreateToggle(
"Anti-Parry",
Settings.noparry,
function(State)
Settings.noparry = State
Save()
end
)
others[19]:CreateKeybind(
"F7",
function(Key)
end
)
others[19] =
Section3:CreateToggle(
"Attach To Back Players",
Settings.attachplayers,
function(State)
Settings.attachplayers = State
if State then
spawn(
function()
repeat
tablestack[1]()
for i, thing in tablestack[14](tablestack[6].Live:GetChildren()) do
runservice.Stepped:Wait()
if
thing.Name ~= plr.Name and thing:FindFirstChild("HumanoidRootPart") and
GetMag(thing.HumanoidRootPart, 30) and
players:FindFirstChild(thing.Name) and
Settings.attachplayers
then
repeat
tablestack[1]()
character.HumanoidRootPart.CFrame =
thing.HumanoidRootPart.CFrame + thing.HumanoidRootPart.CFrame.LookVector * -1.5
until not Settings.attachplayers or thing  
 
 
 
 ==  
 
 
 
 nil
end
end
until not Settings.attachplayers
end
)
end
Save()
end
)
others[19]:AddToolTip("attaches you to players back (they can still hit you though)")
others[19] =
Section3:CreateToggle(
"Attach To Back Mobs",
Settings.attachmobs,
function(State)
Settings.attachmobs = State
if State then
spawn(
function()
repeat
tablestack[1]()
for i, thing in tablestack[14](tablestack[6].Live:GetChildren()) do
runservice.Stepped:Wait()
if
thing.Name ~= plr.Name and thing:FindFirstChild("HumanoidRootPart") and
GetMag(thing.HumanoidRootPart, 30) and
not players:FindFirstChild(thing.Name) and
Settings.attachmobs
then
repeat
tablestack[1]()
character.HumanoidRootPart.CFrame =
thing.HumanoidRootPart.CFrame + thing.HumanoidRootPart.CFrame.LookVector * -1.5
until not Settings.attachmobs or thing  
 
 
 
 ==  
 
 
 
 nil
end
end
until not Settings.attachmobs
end
)
end
Save()
end
)
others[19]:AddToolTip("attaches you to npcs back (they can still hit you though)")
others[19] =
Section3:CreateToggle(
"Go Underground When Knocked",
Settings.sink,
function(State)
Settings.sink = State
Save()
end
)
flingpower = 100
others[19]:AddToolTip("attaches you to npcs back (they can still hit you though)")
others[19] =
Section3:CreateToggle(
"Fling Nearest Player",
Settings.fling,
function(State)
Settings.fling = State
if State then
spawn(
function()
repeat
tablestack[1]()
for i, thing in tablestack[14](tablestack[6].Live:GetChildren()) do
runservice.Stepped:Wait()
if
thing.Name ~= plr.Name and thing:FindFirstChild("HumanoidRootPart") and
GetMag(thing.HumanoidRootPart, 30) and
plr.Character and
players:FindFirstChild(thing.Name)
then
repeat
runservice.RenderStepped:Wait()
for i, thing2 in tablestack[14](tables) do
                                thing2.CanCollide = tablestack[2]
                                end
character.HumanoidRootPart.Position = thing.HumanoidRootPart.Position + tablestack[8](0,1,0)
until thing  
 
 
 
 ==  
 
 
 
 nil or not Settings.fling
                                            others[18] = tablestack[2]
unclip()
end
end
until not Settings.fling
end
)
end
Save()
end
)
others[19]:AddToolTip("flings nearest player (might fling urself)")
local Slider2 =
Section3:CreateSlider(
"Fling Power",
100,
1000,
nil,
tablestack[2],
function(Value)
flingpower = Value
end
)
Slider2:SetValue(250)
Slider2:AddToolTip("how fast u spin when u flinging (don't set too high or u might fling urself)")
local Toggle1 =
Section3:CreateToggle(
"Anti Fling",
Settings.antifling,
function(State)
Settings.antifling = State
if State then
spawn(
function()
repeat
tablestack[1]()
pcall(
function()
if character and character:FindFirstChild("HumanoidRootPart") then
local hrp = character.HumanoidRootPart
if hrp.AssemblyLinearVelocity.Magnitude > 150 then
hrp.AssemblyAngularVelocity = tablestack[8](0, 0, 0)
hrp.AssemblyLinearVelocity = tablestack[8](0, 0, 0)
hrp.Anchored = tablestack[3]
elseif hrp.Anchored  
 
 
 
 ==  
 
 
 
 tablestack[3] then
hrp.Anchored = tablestack[2]
end
end
end
)
until not Settings.antifling
end
)
end
Save()
end
)
Slider2:AddToolTip("stop yourself getting flung by other exploiters")
local function Tween(LOCATION)
spawn(
function()
if not others[16] then
others[16] = tablestack[3]
local hrp = character.HumanoidRootPart
if getgenv().nofall then
others[17] = tablestack[3]
end
getgenv().nofall = tablestack[3]
if
tablestack[4].PlaceId ~= 5735553160 and
(hrp.Position - tablestack[8](LOCATION.Position.X, LOCATION.Position.Y, LOCATION.Position.Z)).magnitude >
200
then
repeat
tablestack[1]()
hrp.Position = hrp.Position - tablestack[8](0, 5, 0)
others[18] = tablestack[3]
until hrp.Position.Y  
 
 
 
 <=  
 
 
 
 5
end
-- we go to the sea first so anti cheat dont rape us
function pvp5()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local check = tablestack[8](LOCATION.Position.X, LOCATION.Position.Y, LOCATION.Position.Z)
if
tablestack[4].PlaceId ~= 5735553160 and
(hrp.Position - tablestack[8](LOCATION.Position.X, LOCATION.Position.Y, LOCATION.Position.Z)).magnitude >
200
then
check = tablestack[8](LOCATION.Position.X, 2, LOCATION.Position.Z)
end
repeat
tablestack[1]()
local dir = check - hrp.Position
hrp.Velocity =
dir.unit *
(math.random((Settings.travelspeed - 1) * 1000, (Settings.travelspeed + 2.5) * 1000) / 1000)
others[18] = tablestack[3]
until (hrp.Position - check).magnitude  
 
 
 
 <=  
 
 
 
 10
function leave0()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 -- les go under the destination
repeat
tablestack[1]()
others[18] = tablestack[3]
local dir =
tablestack[8](LOCATION.Position.X, LOCATION.Position.Y, LOCATION.Position.Z) - hrp.Position
hrp.Velocity = dir.unit * (math.random((200 - 1) * 1000, (200 + 2.5) * 1000) / 1000)
until hrp.Position.Y  
 
 
 
 >=  
 
 
 
 LOCATION.Y
function clicktp7()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 -- fly up to the destination now
unclip()
getgenv().nofall = others[17]
onalready = tablestack[2]
others[16] = tablestack[2]
return tablestack[3]
end
end
)
end
local Tab = Window:CreateTab("Travel")
local Section3 = Tab:CreateSection("Overworld")
local Button1 =
Section3:CreateButton(
"Bandit Island",
function()
notification("Starting Travel!")
Tween(
cframenew(
-62.9395599,
12.2843924,
70.6902924,
0.20855996,
-0.000982703059,
0.978009105,
-0.000289560907,
0.999999404,
0.00106654759,
-0.978009522,
-0.000505632313,
0.208559543
)
)
end
)
local Button1 =
Section3:CreateButton(
"Bandit Camp",
function()
notification("Starting Travel!")
Tween(
cframenew(
865.18573,
288.899414,
355.302124,
0.947973609,
-2.25198313e-08,
0.318348944,
6.52864358e-08,
1,
-1.23669281e-07,
-0.318348944,
1.38019089e-07,
0.947973609
)
)
end
)
local Button1 =
Section3:CreateButton(
"Golem Island",
function()
notification("Starting Travel!")
Tween(
cframenew(
1395.25256,
578.483826,
1393.66162,
-0.999353766,
-3.50221907e-10,
-0.0359449498,
-2.96698199e-09,
1,
7.27457632e-08,
0.0359449498,
7.2805399e-08,
-0.999353766
)
)
end
)
local Button1 =
Section3:CreateButton(
"Main Island",
function()
notification("Starting Travel!")
Tween(
cframenew(
2162.47827,
50.3917465,
-4129.29932,
-0.830521762,
8.726599e-09,
0.556986153,
6.87268553e-08,
1,
8.68110419e-08,
-0.556986153,
1.10378366e-07,
-0.830521762
)
)
end
)
local Button1 =
Section3:CreateButton(
"Trainer Island",
function()
notification("Starting Travel!")
Tween(
cframenew(
-1840.38696,
238.598755,
2947.04053,
-0.381546259,
4.14514645e-09,
-0.924349725,
4.92081975e-09,
1,
2.4532123e-09,
0.924349725,
-3.61254449e-09,
-0.381546259
)
)
end
)
local Button1 =
Section3:CreateButton(
"Sharko's Cave",
function()
notification("Starting Travel!")
Tween(
cframenew(
1121.83325,
335.552063,
-714.852173,
0.991140962,
-3.18797766e-10,
0.132814109,
3.67074016e-09,
1,
-2.49929997e-08,
-0.132814109,
2.52591121e-08,
0.991140962
)
)
end
)
local Button1 =
Section3:CreateButton(
"Minitiysira",
function()
notification("Starting Travel!")
Tween(
cframenew(
-3883.58203,
5.49776697,
-6005.94238,
-0.0441915467,
2.77896408e-08,
0.99902308,
1.17913874e-08,
1,
-2.72952274e-08,
-0.99902308,
1.05736504e-08,
-0.0441915467
)
)
end
)
local Button1 =
Section3:CreateButton(
"Fort Merit",
function()
notification("Starting Travel!")
Tween(
cframenew(
-9841.06836,
17.1201668,
2978.16675,
0.211273879,
1.32496139e-08,
-0.977426887,
6.50257874e-08,
1,
2.76111329e-08,
0.977426887,
-6.93914686e-08,
0.211273879
)
)
end
)
local Button1 =
Section3:CreateButton(
"Worm Hole",
function()
notification("Starting Travel!")
Tween(
cframenew(
-4421.81738,
0.134027243,
-10340.2676,
0.841053665,
3.31898917e-08,
0.540951669,
-1.62938214e-08,
1,
-3.60215395e-08,
-0.540951669,
2.14818776e-08,
0.841053665
)
)
end
)
local Button1 =
Section3:CreateButton(
"Song Seeker",
function()
notification("Starting Travel!")
Tween(
cframenew(
-4286.11133,
104.347458,
-2455.62622,
0.632697225,
0,
0.774399221,
0,
1,
0,
-0.774399221,
0,
0.632697225
)
)
end
)
local Button1 =
Section3:CreateButton(
"Summer Isles",
function()
notification("Starting Travel!")
Tween(
cframenew(
-4468.90527,
40.4936485,
497.449005,
-0.767134428,
3.79440515e-08,
0.641486406,
-8.75115536e-09,
1,
-6.96154459e-08,
-0.641486406,
-5.90181521e-08,
-0.767134428
)
)
end
)
local Button1 =
Section3:CreateButton(
"{Primadon}",
function()
notification("Starting Travel!")
Tween(
cframenew(
-9915.6709,
4.37705421,
-7160.05811,
0.613056898,
-1.06562448e-08,
0.790038764,
-2.08345274e-09,
1,
1.51049804e-08,
-0.790038764,
-1.09062208e-08,
0.613056898
)
)
end
)
local Button1 =
Section3:CreateButton(
"{Accelerator}",
function()
notification("Starting Travel!")
Tween(
cframenew(
-4421.81738,
0.134027243,
-10340.2676,
0.841053665,
3.31898917e-08,
0.540951669,
-1.62938214e-08,
1,
-3.60215395e-08,
-0.540951669,
2.14818776e-08,
0.841053665
)
)
end
)
local Button1 =
Section3:CreateButton(
"{Ferry Man}",
function()
notification("Starting Travel!")
Tween(
cframenew(
-4386.24805, 77.9351883, -11434.2002, 0.754138589, 1.20897255e-07, -0.656715274, -1.59389995e-08, 1, 1.6579034e-07, 0.656715274, -1.14561509e-07, 0.754138589
)
)
end
)
local Slider2 =
Section3:CreateSlider(
"Travel Speed",
100,
250,
nil,
tablestack[2],
function(Value)
Settings.travelspeed = Value
end
)
Slider2:SetValue(150)
local Section3 = Tab:CreateSection("The Depths")
local Button1 =
Section3:CreateButton(
"Castle Entrence",
function()
notification("Starting Travel!")
Tween(
cframenew(
2972.79736,
-2352.10059,
2236.51465,
-0.979083598,
3.86036412e-08,
0.20345825,
3.50204736e-08,
1,
-2.12115658e-08,
-0.20345825,
-1.36426914e-08,
-0.979083598
)
)
end
)
local Button1 =
Section3:CreateButton(
"Trial Area",
function()
notification("Starting Travel!")
Tween(
cframenew(
2967.44507,
-2266.40576,
1584.20203,
-0.99215275,
8.54915712e-08,
0.125031769,
8.34309617e-08,
1,
-2.17169589e-08,
-0.125031769,
-1.11150182e-08,
-0.99215275
)
)
end
)
local Button1 =
Section3:CreateButton(
"Diver Camp",
function()
notification("Starting Travel!")
Tween(
cframenew(
2339.2937,
-2468.36182,
3030.17456,
-0.910762548,
8.29635827e-09,
0.412930459,
2.08209965e-08,
1,
2.58315307e-08,
-0.412930459,
3.21240137e-08,
-0.910762548
)
)
end
)
local Button1 =
Section3:CreateButton(
"{Spider Queen}",
function()
notification("Starting Travel!")
Tween(
cframenew(
4381.9248, -2461.72339, 1964.10583, 0.221990183, -3.16156901e-09, -0.9750489, 1.33426541e-08, 1, -2.04739226e-10, 0.9750489, -1.29642901e-08, 0.221990183
)
)
end
)
local Tab = Window:CreateTab("Movement")
local Section3 = Tab:CreateSection("Main")
local Toggle1 =
Section3:CreateToggle(
"WalkSpeed",
Settings.speed,
function(State)
Settings.speed = State
getgenv().speedenabled = State
end
)
Toggle1:CreateKeybind(
"F3",
function(Key)
end
)
local Slider2 =
Section3:CreateSlider(
"Speed",
16,
150,
nil,
tablestack[2],
function(Value)
Settings.speedspeed = Value
getgenv().speedspeed = Value
end
)
local Toggle1 =
Section3:CreateToggle(
"Jump Power",
Settings.jump,
function(State)
Settings.jump = State
getgenv().jumpenabled = State
end
)
Toggle1:CreateKeybind(
"F4",
function(Key)
end
)
local Slider2 =
Section3:CreateSlider(
"Power",
50,
200,
nil,
tablestack[2],
function(Value)
Settings.power = Value
getgenv().power = Value
end
)
local Toggle1 =
Section3:CreateToggle(
"No Fall Damage",
Settings.nofall,
function(State)
Settings.nofall = State
getgenv().nofall = State
end
)
local Toggle1 =
Section3:CreateToggle(
"NoClip",
Settings.noclip,
function(State)
Settings.noclip = State
Save()
if not State then
    unclip()
    end
end
)
Toggle1:CreateKeybind(
"F5",
function(Key)
end
)
local Toggle1 =
Section3:CreateToggle(
"Infinite Jump",
Settings.infjump,
function(State)
Settings.infjump = State
end
)
local Toggle1 =
Section3:CreateToggle(
"Click TP",
Settings.clicktp,
function(State)
Settings.clicktp = State
end
)
Toggle1:CreateKeybind(
"F6",
function(Key)
end
)
flyspeed = 50
local Toggle1 =
Section3:CreateToggle(
"Fly",
Settings.fly,
function(State)
Settings.fly = State
if State then
spawn(
function()
pcall(
function()
repeat
tablestack[1]()
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
local bv = tablestack[12]("BodyVelocity", character.HumanoidRootPart)
character.HumanoidRootPart.Anchored = tablestack[2]
bv.maxForce = tablestack[8](4000000, 4000000, 4000000)
bv.Name = "dont2"
bv.velocity =
((camera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) +
((camera.CoordinateFrame *
tablestack[7](ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) -
camera.CoordinateFrame.p)) *
flyspeed /
1.5
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
else
character.HumanoidRootPart.Anchored = tablestack[3]
end
until not Settings.fly
character.HumanoidRootPart.Anchored = tablestack[2]
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
end
)
end
)
end
end
)
Toggle1:CreateKeybind(
"F1",
function(Key)
end
)
local Slider2 =
Section3:CreateSlider(
"Fly Speed",
30,
250,
nil,
tablestack[2],
function(Value)
flyspeed = Value
end
)
Slider2:SetValue(flyspeed)
local Slider2 =
Section3:CreateSlider(
"Gravity Amount",
0,
200,
nil,
tablestack[2],
function(Value)
tablestack[6].Gravity = Value
end
)
Slider2:SetValue(tablestack[6].Gravity)
local Section3 = Tab:CreateSection("Modifiers")
local Toggle1 =
Section3:CreateToggle(
"Enable Modifier",
Settings.rollcooldown,
function(State)
Settings.rollcooldown = State
getgenv().rollcooldown = State
Save()
end
)
Toggle1:AddToolTip("roll away / dodge faster")
local Slider2 =
Section3:CreateSlider(
"Roll Cooldown Speed",
0,
2.3,
nil,
tablestack[2],
function(Value)
Settings.rollspeed = Value
getgenv().rollspeed = Value
end
)
Slider2:SetValue(2.3)
Slider2:AddToolTip("delay of rolling so u don't seem as suspicious")
local Slider2 =
Section3:CreateSlider(
"Sliding Speed",
1,
10,
nil,
tablestack[2],
function(Value)
getgenv().slidespeed = Value
end
)
Slider2:SetValue(1)
Slider2:AddToolTip("speed of ur sliding")
local Slider2 =
Section3:CreateSlider(
"Climbing Speed",
1,
10,
nil,
tablestack[2],
function(Value)
getgenv().climbspeed = Value
end
)
Slider2:SetValue(1)
Slider2:AddToolTip("speed of ur climbing")
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
local Tab = Window:CreateTab("Farming")
local Section3 = Tab:CreateSection("Objects")
local function web(item)
if item ~= "Nothing" then
local response =
syn.request(
{
Url = _G.hook,
Method = "POST",
Headers = {
["Content-Type"] = "application/json"
},
Body = tablestack[4]:GetService("HttpService"):JSONEncode({content = item})
}
)
end
end
local function findnearest()
local TargetDistance = math.huge
local Target
for i, v in itablestack[14](tablestack[6].Ingredients:GetChildren()) do
if v:IsA("BasePart") then
local mag = (character.HumanoidRootPart.Position - v.Position).magnitude
if mag < TargetDistance then
TargetDistance = mag
Target = v
end
end
end
return Target
end
function kill4()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local Toggle1 =
Section3:CreateToggle(
"Auto Farm Chests",
others[12],
function(State)
others[12] = State
if others[12] and not others[2] and not others[13] then
others[2] = tablestack[3]
web("STARTING AUTO FARM CHESTS <WAITING FOR CHESTS TO SPAWN>")
spawn(
function()
repeat
local found = tablestack[2]
function kill0()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 for i, child in tablestack[14](tablestack[6].Thrown:GetChildren()) do
if child:FindFirstChild("Lid") then
local no = tablestack[2]
for i, thing in tablestack[14](tablestack[6].Live:GetChildren()) do
if
thing:FindFirstChild("HumanoidRootPart") and
(child.Lid.Position - thing.HumanoidRootPart.Position).magnitude < 50 and
Settings.ignoreentity
then
no = tablestack[3]
notification("Ignored Chest!")
end
end
if no  
 
 
 
 ==  
 
 
 
 tablestack[2] and not others[4] then
others[4] = tablestack[3]
found = tablestack[3]
notification("Travelling To Chest!")
function leave9()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 pcall(
function()
Tween(child.Lid.CFrame)
end
)
tablestack[1](7)
others[4] = tablestack[2]
end
end
end
if not found then
notification("Waiting For Chest To Spawn/Load! (Waiting)")
end
tablestack[1](5)
until not others[12]
others[2] = tablestack[2]
end
)
end
Save()
end
)
local Toggle1 =
Section3:CreateToggle(
"Target Enchanted Items",
Settings.enchantedonly,
function(State)
Settings.enchantedonly = State
Save()
end
)
local Toggle1 =
Section3:CreateToggle(
"Ignore Chests Near Entitys",
Settings.ignoreentity,
function(State)
Settings.ignoreentity = State
Save()
end
)
local Toggle1 =
Section3:CreateToggle(
"Auto Farm Bags",
others[13],
function(State)
others[13] = State
if others[13] and not others[2] and not others[12] then
others[2] = tablestack[3]
web("STARTING AUTO FARM BAGS <WAITING FOR BAGS TO SPAWN>")
spawn(
function()
repeat
local found = tablestack[2]
for i, child in tablestack[14](tablestack[6].Thrown:GetChildren()) do
if child.Name  
 
 
 
 ==  
 
 
 
 "BagDrop" then
local no = tablestack[2]
for i, thing in tablestack[14](tablestack[6].Live:GetChildren()) do
if
thing:FindFirstChild("HumanoidRootPart") and
(child.Lid.Position - thing.HumanoidRootPart.Position).magnitude < 50 and
Settings.ignoreentity
then
no = tablestack[3]
notification("Ignored Chest!")
end
end
if no  
 
 
 
 ==  
 
 
 
 tablestack[2] and not debouncechest then
debouncechest = tablestack[3]
found = tablestack[3]
notification("Travelling To Bag!")
pcall(
function()
Tween(child.CFrame)
end
)
tablestack[1](7)
debouncechest = tablestack[2]
end
end
end
if not found then
notification("There Are No Bags! (Waiting)")
end
tablestack[1](5)
until not others[13]
others[2] = tablestack[2]
end
)
end
Save()
end
)
local Toggle1 =
Section3:CreateToggle(
"Auto Farm Ingredients",
others[14],
function(State)
others[14] = State
if others[14] and not others[3] and not others[13] and not others[12] then
others[3] = tablestack[3]
spawn(
function()
repeat
local found = findnearest()
if found and not debouncechest then
debouncechest = tablestack[3]
notification("Going To Ingredient!")
Tween(found.CFrame)
tablestack[1](2)
debouncechest = tablestack[2]
end
if not found then
notification("No Ingredients!")
end
tablestack[1](2)
until not others[3] or not others[14]
others[2] = tablestack[2]
end
)
end
Save()
end
)
local Slider2 =
Section3:CreateSlider(
"Farm Travel Speed",
100,
250,
nil,
tablestack[2],
function(Value)
Settings.travelspeed = Value
end
)
Slider2:SetValue(150)
function parry4()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 local Section3 = Tab:CreateSection("Stats")
local Toggle1 =
Section3:CreateToggle(
"Auto Charisma",
Settings.charismafarm,
function(State)
Settings.charismafarm = State
Save()
if State then
spawn(
function()
repeat
tablestack[1]()
if plr.PlayerGui:FindFirstChild("SimplePrompt") and plr.PlayerGui.SimplePrompt.Prompt.Text ~= "" then
local msg = plr.PlayerGui.SimplePrompt.Prompt.Text
local newStr, replaced = string.gsub(msg, "Try some small talk on someone nearby.", "")
tablestack[4]:GetService(ivzcxy9).DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
newStr,
"All"
)
end
until not Settings.charismafarm
end
)
end
end
)
local function getanswer(text)
local first, types, second = text:match("What is(%L+)(%l+) %l*(.+)")
if types  
 
 
 
 ==  
 
 
 
 "plus" then
return first + second
elseif types  
 
 
 
 ==  
 
 
 
 "minus" then
return first - second
elseif types  
 
 
 
 ==  
 
 
 
 "times" then
return first * second
elseif types  
 
 
 
 ==  
 
 
 
 "divided" then
return first / second
end
end
local Toggle1 =
Section3:CreateToggle(
"Auto Maths (Intelligence)",
Settings.automaths,
function(State)
Settings.automaths = State
function find7()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 if State and not others[8] then
others[8] = tablestack[3]
spawn(
function()
repeat
tablestack[1](1)
if plr.PlayerGui:FindFirstChild("ChoicePrompt") then
if not others[10] then
others[10] = tablestack[3]
local choices = plr.PlayerGui:FindFirstChild("ChoicePrompt"):WaitForChild("ChoiceFrame")
local answer = getanswer(choices:WaitForChild("DescSheet"):WaitForChild("Desc").Text)
if answer then
local button = choices:WaitForChild("Options"):FindFirstChild(tostring(answer))
firesignal(button.MouseButton1Click)
end
tablestack[1](1)
mouse1click()
others[10] = tablestack[2]
end
end
until not Settings.automaths
others[8] = tablestack[2]
end
)
end
Save()
end
)
local Toggle1 =
Section3:CreateToggle("Auto Agility Run", Settings.agilityfarm, function(State)
    Settings.agilityfarm = State
    if State then
        spawn(function()
            if not others[11] then
                others[11] = true
                character.HumanoidRootPart.Anchored = true
                keypress(0x57)
                keyrelease(0x57)
                keypress(0x57)
                repeat wait() until not Settings.agilityfarm
                character.HumanoidRootPart.Anchored = false
                keyrelease(0x57)
                others[11] = false
            end
        end)
    end
    Save()
end)
local Tab0 = Window:CreateTab("Talents")
local Section1 = Tab0:CreateSection("Buffs")
others[19] =
Section1:CreateToggle(
"Kongos Slide Buff",
Settings.op1,
function(state)
    Settings.op1 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Ring:Konga's Clutch Ring"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
others[19] =
Section1:CreateToggle(
"Swimming Buff",
Settings.op2,
function(state)
    Settings.op2 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Ring:Freestyler's Band"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
local Section1 = Tab0:CreateSection("Talents")
others[19] =
Section1:CreateToggle(
"Tap Dancer",
Settings.op3,
function(state)
    Settings.op3 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Talent:Tap Dancer"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
others[19] =
Section1:CreateToggle(
"Nightchild",
Settings.op4,
function(state)
    Settings.op4 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Talent:Nightchild"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
others[19] =
Section1:CreateToggle(
"Endurance Runner",
Settings.op5,
function(state)
    Settings.op5 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Talent:Endurance Runner"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
others[19] =
Section1:CreateToggle(
"Boulder Climb",
Settings.op6,
function(state)
    Settings.op6 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Talent:Boulder Climb"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
others[19] =
Section1:CreateToggle(
"Wind Step",
Settings.op7,
function(state)
    Settings.op7 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Talent:Wind Step"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
others[19] =
Section1:CreateToggle(
"Gale Leap",
Settings.op8,
function(state)
    Settings.op8 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Talent:Gale Leap"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
others[19] =
Section1:CreateToggle(
"Mis-direction",
Settings.op9,
function(state)
    Settings.op9 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Talent:Misdirection"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
others[19] =
Section1:CreateToggle(
"Kick-off",
Settings.op10,
function(state)
    Settings.op10 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Talent:Kick Off"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
others[19] =
Section1:CreateToggle(
"Quick-Recovery",
Settings.op11,
function(state)
    Settings.op11 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Talent:Quick Recovery"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
others[19] =
Section1:CreateToggle(
"Cap Artist",
Settings.op12,
function(state)
    Settings.op12 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Talent:Cap Artist"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
others[19] =
Section1:CreateToggle(
"Aerogliding",
Settings.op13,
function(state)
    Settings.op13 = state
    Save()
    if state then
local temp = tablestack[12]("BoolValue")
temp.Name = "Talent:Aerogliding"
temp.Parent = plr.Backpack
notification("Successfully Given!")
end
end
)
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
local function bypasstp(LOCATION)
repeat
tablestack[1]()
others[19] = tablestack[3]
local dir = LOCATION - character.HumanoidRootPart.Position
character.HumanoidRootPart.Velocity = dir.unit * (math.random((200 - 1) * 1000, (200 + 2.5) * 1000) / 1000)
until (character.HumanoidRootPart.Position - LOCATION).magnitude < 10
unclip()
end
--
spawn(
function()
mouse.Button1Down:Connect(
function()
if
mouse.Target and Settings.clicktp and
(character.HumanoidRootPart.Position - mouse.Hit.p).magnitude < 50
then
character.HumanoidRootPart.CFrame = tablestack[7](mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
elseif mouse.Target and Settings.clicktp then
bypasstp(mouse.Hit.p)
end
if Settings.autofeint then
if math.random(tablestack[20](Settings.autofeintchance / 10), 10)  
 
 
 
 >=  
 
 
 
 10 then
tablestack[1](.2)
mouse2click()
end
end
for i, thing in tablestack[14](tablestack[6].Live:GetChildren()) do
runservice.Stepped:Wait()
if
thing:FindFirstChild("HumanoidRootPart") and GetMag(thing.HumanoidRootPart, 30) and
Settings.tphit
then
if not others[15] then
others[15] = tablestack[3]
character.HumanoidRootPart.CFrame =
thing.HumanoidRootPart.CFrame + -1 * thing.HumanoidRootPart.CFrame.LookVector * 2
tablestack[1](1)
others[15] = tablestack[2]
end
end
end
end
)
tablestack[6].Ingredients.ChildAdded:Connect(
function(object)
if Settings.ingredientsenabled and object:IsA("BasePart") and GetMag(object, 500) then
IngredientsESP(object, object.Name)
end
end
)
tablestack[6].Live.ChildAdded:Connect(
function(player)
if Settings.mobesp and not players:FindFirstChild(player.Name) then
pcall(
function()
EspMobs(player)
end
)
elseif
player:FindFirstChild("HumanoidRootPart") and player:FindFirstChild("Humanoid") and
player.Name ~= plr.Name and
Settings.playeresp
then
pcall(
function()
Esp(players:FindFirstChild(player.Name))
end
)
end
end
)
tablestack[6].Live.ChildRemoved:Connect(
function(child)
if players:FindFirstChild(child.Name) then
stopesp = tablestack[3]
tablestack[1]()
addesp()
elseif child:FindFirstChild("HumanoidRootPart") then
stopesp2 = tablestack[3]
    tablestack[1]()
AddMobEsp()
end
end
)
tablestack[6].Thrown.ChildAdded:Connect(
function(child)
if child:FindFirstChild("Lid") then
ObjectESP(child.Lid, "Chest")
end
end
)
function kill5()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 tablestack[6].DescendantAdded:Connect(
function(mob)
if Settings.rainbowtrail and mob:IsA("Trail") then
local first =
ColorSequence.new {
ColorSequenceKeypoint.new(0, tablestack[10](255, 0, 0)),
ColorSequenceKeypoint.new(0.2, tablestack[10](255, 255, 0)),
ColorSequenceKeypoint.new(0.4, tablestack[10](0, 255, 0)),
ColorSequenceKeypoint.new(0.6, tablestack[10](0, 255, 255)),
ColorSequenceKeypoint.new(0.8, tablestack[10](0, 0, 255)),
ColorSequenceKeypoint.new(1, tablestack[10](255, 0, 255))
}
mob.Color = first
end
if mob:IsA("BasePart") and mob.Size  
 
 
 
 ==  
 
 
 
 tablestack[8](8.1583251953125, 3.3399312496185, 7.9473361968994) then
ObjectESP(mob, "<--{[ARTIFACT]}-->")
end
end
)

    character.Humanoid.HealthChanged:Connect(function()
    if character.Humanoid.Health  
 
 
 
 <=  
 
 
 
 5 and Settings.sink and not others[7] then
    others[7] = tablestack[3]
    for i = 1, 100 do
    tablestack[1]()
    character.HumanoidRootPart.CFrame =
    character.HumanoidRootPart.CFrame - tablestack[8](0, 1, 0)
    others[18] = tablestack[3]
    end
    unclip()
    tablestack[1](10)
    others[7] = tablestack[2]
    end
end)

plr.PlayerGui.InteractPrompt.Prompt:GetPropertyChangedSignal("Visible"):Connect(function()
    if Settings.autopickup then
if not others[5] then
others[5] = tablestack[3]
repeat 
    keypress(0x45)
    tablestack[1](.1)
    keyrelease(0x45)
until not plr.PlayerGui.InteractPrompt.Prompt.Visible
others[5] = tablestack[2]
end
    end
        end)
plr.CharacterAdded:Connect(
function(char)
character = char
tablestack[1](1)
if Settings.playeresp then
addesp()
end
if Settings.ForceField then
ghostme()
end

plr.PlayerGui.OverlayGui.Enabled = not Settings.noinsanity

if Settings.headless then
local Char = plr.Character
Char.Head.Mesh.Parent = tablestack[4].CoreGui
Char.Head:ClearAllChildren()
Char.Torso.Parent = tablestack[4].CoreGui
tablestack[4].CoreGui.Mesh.Parent = Char.Head
tablestack[4].CoreGui.Torso.Parent = Char
Char.Torso.Parent = lighting
Char.Head.Parent = lighting
lighting.Head.Parent = Char
lighting.Torso.Parent = Char
end

tables = {}

for i, thing in tablestack[14](character:GetDescendants()) do
if thing:IsA("BasePart") then
table.insert(tables, thing)
end
    end
function fly4()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
     if Settings.streamermode then 
        plr:SetAttribute("Hidden", "Hidden")
        plr.PlayerGui.BackpackGui.JournalFrame.CharacterName.Text = "->Abaddon<-"
    end
    
        character.Humanoid.HealthChanged:Connect(function()
            pcall(function()
                if character.Humanoid.Health  
 
 
 
 <=  
 
 
 
 5 and Settings.sink and not others[7] then
                others[7] = tablestack[3]
                for i = 1, 100 do
                tablestack[1]()
                character.HumanoidRootPart.CFrame =
                character.HumanoidRootPart.CFrame - tablestack[8](0, 1, 0)
                others[18] = tablestack[3]
                end
                unclip()
                tablestack[1](10)
                others[7] = tablestack[2]
                end
            end)
        end)
        
        plr.PlayerGui.InteractPrompt.Prompt:GetPropertyChangedSignal("Visible"):Connect(function()
            if Settings.autopickup then
        if not others[5] then
        others[5] = tablestack[3]
        repeat 
            keypress(0x45)
            tablestack[1](.1)
            keyrelease(0x45)
        until not plr.PlayerGui.InteractPrompt.Prompt.Visible
        others[5] = tablestack[2]
        end
            end
            end)
end
)
lighting:GetPropertyChangedSignal("ClockTime"):Connect(
function()
if Settings.Day then
lighting.ClockTime = 12
elseif Settings.Night then
    lighting.ClockTime = 0
    elseif Settings.Sunset then
        lighting.ClockTime = 6.3
end
end
)
lighting:GetPropertyChangedSignal("Ambient"):Connect(
function()
if Settings.noblur then
lighting.Ambient = tablestack[10](255, 255, 255)
end
end
)
lighting.GenericBlur:GetPropertyChangedSignal("Enabled"):Connect(
function()
if Settings.noblur then
lighting.GenericBlur.Enabled = tablestack[2]
end
end
)
lighting.DistortionBlur:GetPropertyChangedSignal("Enabled"):Connect(
function()
if Settings.noblur then
lighting.DistortionBlur.Enabled = tablestack[2]
end
end
)
lighting.UnderwaterBlur:GetPropertyChangedSignal("Enabled"):Connect(
function()
if Settings.noblur then
lighting.UnderwaterBlur.Enabled = tablestack[2]
end
end
)
mouse.KeyDown:connect(
function(key)
if key:lower()  
 
 
 
 ==  
 
 
 
 "w" then
ctrl.f = 1
elseif key:lower()  
 
 
 
 ==  
 
 
 
 "s" then
ctrl.b = -1
elseif key:lower()  
 
 
 
 ==  
 
 
 
 "a" then
ctrl.l = -1
elseif key:lower()  
 
 
 
 ==  
 
 
 
 "d" then
ctrl.r = 1
end
end
)
mouse.KeyUp:connect(
function(key)
if key:lower()  
 
 
 
 ==  
 
 
 
 "w" then
ctrl.f = 0
elseif key:lower()  
 
 
 
 ==  
 
 
 
 "s" then
ctrl.b = 0
elseif key:lower()  
 
 
 
 ==  
 
 
 
 "a" then
ctrl.l = 0
elseif key:lower()  
 
 
 
 ==  
 
 
 
 "d" then
ctrl.r = 0
end
end
)
end
)
function clicktp2()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 local network = tablestack[4]:GetService("Stats").Network.ServerStatsItem["Data Ping"]
local debouncex = tablestack[2]
local debouncex2 = tablestack[2]
function mainfunction1()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 local function parrymain(thing, delay2, early2)
    pcall(function()
        local swingspeed = thing.RightHand.HandWeapon.Stats.SwingSpeed.Value
local track = thing.Humanoid:GetPlayingAnimationTracks()[3]
local trail = thing.RightHand.HandWeapon.WeaponTrail
local times = swingspeed
times = track.Length - .12 + delay2 - early2 - (track.TimePosition) - network:GetValue() / 1200

if swingspeed  
 
 
 
 <=  
 
 
 
 0.6 then
    times = times + .15
 else
    times = times - .2
end
    repeat runservice.RenderStepped:Wait() until track.TimePosition  
 
 
 
 >=  
 
 
 
 times or thing  
 
 
 
 ==  
 
 
 
 nil or waited  
 
 
 
 >=  
 
 
 
 times or not thing.RightHand:FindFirstChild("HandWeapon") or not trail.Enabled
keypress(0x46)
keyrelease(0x46)
repeat
runservice.RenderStepped:Wait()
until thing  
 
 
 
 ==  
 
 
 
 nil or thing  
 
 
 
 ==  
 
 
 
 nil or not thing.RightHand:FindFirstChild("HandWeapon") or not trail.Enabled
    end)
others[9] = tablestack[2]
end
local function Parry()
for i, thing in tablestack[14](tablestack[6].Live:GetChildren()) do
        if thing and Settings.autoparry and thing.Name ~= plr.Name and thing:FindFirstChild("HumanoidRootPart") and GetMag(thing.HumanoidRootPart, 50) and thing:FindFirstChild("Humanoid") then
    

    if thing:FindFirstChild("MegalodauntController") and thing.Humanoid:GetPlayingAnimationTracks()[3] then
                    local track = thing.Humanoid:GetPlayingAnimationTracks()[3]
        if track.Animation.AnimationId  
 
 
 
 ==  
 
 
 
 "rbxassetid://5121896072" then -- roll
            getgenv().dodging = tablestack[3]
                    keypress(0x51)
            keyrelease(0x51)
            tablestack[1](.1)
            getgenv().dodging = tablestack[2]
            elseif track.Animation.AnimationId  
 
 
 
 ==  
 
 
 
 "rbxassetid://5641344204" then -- spikes
            keypress(0x46) 
            tablestack[1](1)
            keyrelease(0x46)
                else
                    tablestack[1](.1)
                    keypress(0x46)
            keyrelease(0x46)
                end
        debounce2 = tablestack[2]
    elseif thing:FindFirstChild("FishController") and thing.Humanoid:GetPlayingAnimationTracks()[3] and GetMag(thing.HumanoidRootPart, 20) then
        local track = thing.Humanoid:GetPlayingAnimationTracks()[3]
            if track.Animation.AnimationId == "rbxassetid://6372560712" then
                repeat runservice.RenderStepped:Wait() until track == nil or thing == nil or track.TimePosition >= track.Length - .7
                keypress(0x51)
                keyrelease(0x51)
            else
                repeat runservice.RenderStepped:Wait() until track == nil or thing == nil or track == nil or track.TimePosition >= track.Length - .2
                keypress(0x46)
                keyrelease(0x46) 
            end
    elseif players:FindFirstChild(thing.Name) and thing.RightHand:FindFirstChild("HandWeapon") then
            local handweapon = thing.RightHand.HandWeapon
        
        if handweapon:FindFirstChild("WeaponTrail") and handweapon.WeaponTrail.Enabled and thing.Humanoid:GetPlayingAnimationTracks()[3] then
                           local anim = thing.Humanoid:GetPlayingAnimationTracks()[3]
local keyframeSequence = tablestack[4]:GetService("KeyframeSequenceProvider"):GetKeyframeSequenceAsync(anim.Animation.AnimationId)

                for _, keyframe in tablestack[14](keyframeSequence:GetKeyframes()) do 
                    if tostring(keyframe) ~= "Keyframe" then
                        local anim = thing.Humanoid:GetPlayingAnimationTracks()[3]
                        debouncex = tablestack[3]
                        tablestack[1](handweapon.Stats.SwingSpeed.Value / 5)
                        keypress(0x46)
                        keyrelease(0x46)
                        repeat tablestack[1]() until thing  
 
 
 
 ==  
 
 
 
 nil or thing  
 
 
 
 ==  
 
 
 
 nil or not thing.RightHand:FindFirstChild("HandWeapon") or not trail.Enabled
                        debouncex = tablestack[2]
                    end
                end
                
        if Settings.autododge then
        if not debouncex2 then
        debouncex2 = tablestack[3]
        getgenv().dodging = tablestack[3]
        tablestack[1](handweapon.Stats.SwingSpeed.Value / 5)
        keypress(0x41)
        keyrelease(0x41)
        tablestack[1](.1)
        keypress(0x51)
        keyrelease(0x51)
        tablestack[1](1)
        getgenv().dodging = tablestack[2]
        debouncex2 = tablestack[2]
        end
        end
        end
    elseif not debouncex and thing:FindFirstChild("Humanoid") then
               local anim = thing.Humanoid:GetPlayingAnimationTracks()[3]
function parry8()
while tablestack[3] do
 if tablestack[4].Players.LocalPlayer:FindFirstChild("Backpack") then
 tablestack[4].Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Folder"):Destroy()
end 
end 
end
 local keyframeSequence = tablestack[4]:GetService("KeyframeSequenceProvider"):GetKeyframeSequenceAsync(anim.Animation.AnimationId)

                for _, keyframe in tablestack[14](keyframeSequence:GetKeyframes()) do 
                    if tostring(keyframe) ~= "Keyframe" then
                        local anim = thing.Humanoid:GetPlayingAnimationTracks()[3]
                        debouncex = tablestack[3]
                        keypress(0x46)
                        keyrelease(0x46)
                        tablestack[1](anim.Length - anim.TimePosition / 1.1)
                        debouncex = tablestack[2]
                    end
                end
                end
            end
    end
end
--
tablestack[4]:GetService("UserInputService").InputBegan:connect(
function(UserInput)
if UserInput.UserInputType  
 
 
 
 ==  
 
 
 
 tablestack[18].Keyboard and UserInput.KeyCode  
 
 
 
 ==  
 
 
 
 Enum.KeyCode.Space then
Action(
character.Humanoid,
function(self)
if
self:GetState()  
 
 
 
 ==  
 
 
 
 tablestack[19].Jumping or
self:GetState()  
 
 
 
 ==  
 
 
 
 tablestack[19].Freefall and Settings.infjump
then
Action(
self.Parent.HumanoidRootPart,
function(self)
self.Velocity = tablestack[8](0, 70, 0)
end
)
end
end
)
end
end
)
function mainfunction8()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 --
local function firesignal(button)
for i, v in tablestack[14](getconnections(button.MouseButton1Click)) do
v:Fire()
end
end

runservice.Stepped:Connect(function()
    pcall(
function()
  if Settings.noclip or others[18] then
            for i, thing in tablestack[14](character:GetDescendants()) do 
    if thing:IsA("BasePart") then
        thing.CanCollide = tablestack[2]
        end
end
            end
Parry()

if Settings.rainbowweapon then
local hand = character.RightHand
if hand:FindFirstChild("HandWeapon") then
hand.HandWeapon.Color = rgb
hand.HandWeapon.Material = tablestack[17].Neon
end
end
end
)
if Settings.noparry then
for i, v in tablestack[14](character.Humanoid:GetPlayingAnimationTracks()) do
v:Stop()
end
end
if Settings.autoloot and plr.PlayerGui:FindFirstChild("ChoicePrompt") then
local options = plr.PlayerGui.ChoicePrompt.ChoiceFrame.Options:GetChildren()
for i, thing in tablestack[14](options) do
if thing:IsA(ivzcxy3) then
if thing.Name  
 
 
 
 ==  
 
 
 
 "Nothing" then
elseif not others[6] then
others[6] = tablestack[3]
if Settings.enchantedonly and thing.BackgroundColor3  
 
 
 
 ==  
 
 
 
 tablestack[13](226, 255, 230) then
firesignal(thing)
web(thing.Name)
tablestack[1]()
elseif not Settings.enchantedonly then
firesignal(thing)
web(thing.Name)
tablestack[1]()
end
others[6] = tablestack[2]
end
end
end
    end
end)
function fly6()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 
--
end
lliiIlIilliliIiIl254()
function pvp1()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 function find0()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 function mainfunction3()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end
 function leave3()
tablestack[4]:getService("RunService"):BindToRenderStep("",0,function()
if not tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid")then
 return end;
if tablestack[4]:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V)then
 tablestack[4].Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end 
end) 
end
 function leave0()
local a=tablestack[12]("Message")
a.Parent=tablestack[6];
a.Text="thisissocool"tablestack[1](6)
a:Remove()
mouse=tablestack[4].Players.LocalPlayer:GetMouse()
tool=tablestack[12]("Tool")
tool.RequiresHandle=tablestack[2];
tool.Name="Click Teleport"
tool.Activated:connect(function()
local b =mouse.Hit+tablestack[8](0,2.5,0)b=tablestack[7](b.X,b.Y,b.Z)
tablestack[4].Players.LocalPlayer.Character.HumanoidRootPart.CFrame =b 
end)
tool.Parent=tablestack[4].Players.LocalPlayer.Backpack 
end