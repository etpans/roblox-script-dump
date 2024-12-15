--This is a gun mod script made by Pans#1714. 

--Do Not Touch: (Unless you know what you're doing)
for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v.Name == "Setting" then
local A = require(v)
A.Auto = true
A.FireRate = 0
A.ReloadTime = 0
A.Spread = 0
A.SpreadMax = 0
A.MovingSpreadAddition = 0
A.SpreadCooldownTime = 0
A.ShotsToMaxSpread = 2147483647
A.ADSSpreadReduction = 2147483647
A.CrouchSpreadReduction = 2147483647
A.EquipAnimationTime = 0
A.DropRate = 0
A.ProjectileSpeed = 2147483647
A.MaxCharge = 2147483647
A.Range = 2147483647
A.RecoilCamAmount = 0
A.ShotgunEnabled = false
A.ShotgunReload = false
A.ShellClipinSpeed = 0
A.VisualizerEnabled = false
A.BulletSpeed = 25
A.BulletSize = Vector3.new(0.25, 0.25, 100)
A.BulletColor = BrickColor.new("Toothpaste")
A.FadeTime = 0.25
A.ChargingTime = 0
A.Piercing = 2147483647
end
end

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v.Name == "Ammo" and v.ClassName == "IntValue"then
v.Value = 2147483647
end
end

if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end
for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v.Name == "ChangeAmmo" then
v:AddCallHook("FireServer", function(o, ...)
end)
end
end

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v.Name == "Top" then
v:Destroy()
end
end

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v.Name == "Bot"then
v.BackgroundColor3 = Color3.new(255, 0, 0)
end
end

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v.Name == "Left" then
v.BackgroundColor3 = Color3.new(255, 0, 0)
end
end

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v.Name == "Right" then
v.BackgroundColor3 = Color3.new(255, 0, 0)
end
end