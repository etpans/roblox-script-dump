--Made by Pans
--Infinite Ammo
if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end
game.Players.LocalPlayer.Backpack.Tool02["GunScript_Server"].Ammo.Value = 2147483647
game.Players.LocalPlayer.Backpack.Tool02["GunScript_Server"].ChangeAmmo:AddCallHook("FireServer", function(o, ...)
end)

--Gun Mod
local A = game.Players.LocalPlayer.Backpack.Tool02.Setting

require(A).Auto = true
require(A).FireRate = 0
require(A).ReloadTime = 0
require(A).Spread = 0
require(A).SpreadMax = 0
require(A).MovingSpreadAddition = 0
require(A).SpreadCooldownTime = 0
require(A).ShotsToMaxSpread = 2147483647
require(A).ADSSpreadReduction = 2147483647
require(A).CrouchSpreadReduction = 2147483647
require(A).EquipAnimationTime = 0
require(A).DropRate = 0
require(A).ProjectileSpeed = 2147483647
require(A).MaxCharge = 2147483647
require(A).Range = 2147483647
require(A).RecoilCamAmount = 0
require(A).ShotgunEnabled = false
require(A).BulletPerShot = 1
require(A).ShotgunReload = false
require(A).ShellClipinSpeed = 0
require(A).VisualizerEnabled = true
require(A).BulletSpeed = 25
require(A).BulletSize = Vector3.new(0.25, 0.25, 100)
require(A).BulletColor = BrickColor.new("Toothpaste")
require(A).FadeTime = 0.25
require(A).ChargingTime = 0
require(A).Piercing = 2147483647

--Custom Crosshair
game.Players.LocalPlayer.Backpack.Tool02["GunScript_Local"].GunGUI.Reticle.Bot.BackgroundColor3 = Color3.new(255, 0, 0)
game.Players.LocalPlayer.Backpack.Tool02["GunScript_Local"].GunGUI.Reticle.Left.BackgroundColor3 = Color3.new(255, 0, 0)
game.Players.LocalPlayer.Backpack.Tool02["GunScript_Local"].GunGUI.Reticle.Right.BackgroundColor3 = Color3.new(255, 0, 0) 
game.Players.LocalPlayer.Backpack.Tool02["GunScript_Local"].GunGUI.Reticle.Top:Destroy()