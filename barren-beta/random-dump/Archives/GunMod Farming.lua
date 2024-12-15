-- Made by Pans

-- Infinite Ammo
if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end
game.Players.LocalPlayer.Backpack.Tool01["GunScript_Server"].Ammo.Value = 2147483647
game.Players.LocalPlayer.Backpack.Tool01["GunScript_Server"].ChangeAmmo:AddCallHook("FireServer", function(o, ...)
end)

-- Gun Mod
local A = game.Players.LocalPlayer.Backpack.Tool01.Setting

require(A).Auto = false
require(A).FireRate = 0
require(A).ReloadTime = 0
require(A).Spread = 0
require(A).SpreadMax = 0
require(A).MovingSpreadAddition = 0
require(A).SpreadCooldownTime = 0
require(A).ShotsToMaxSpread = 2147483647
require(A).ADSSpreadReduction = 2147483647
require(A).CrouchSpreadReduction = 2147483647
require(A).HeadshotDamageMultiplier = 100
require(A).ArmDamageMultiplier = 100
require(A).TorosoDamageMultiplier = 100
require(A).LegDamageMultiplier = 100
require(A).EquipAnimationTime = 0
require(A).DropRate = 0
require(A).ProjectileSpeed = 2147483647
require(A).MaxCharge = 2147483647
require(A).Range = 2147483647
require(A).RecoilCamAmount = 0
require(A).ShotgunEnabled = true
require(A).BulletPerShot = 30
require(A).ShotgunReload = false
require(A).ShellClipinSpeed = 0
require(A).FieldOfView = 10
require(A).MouseSensitive = 0.07
require(A).CameraShakingEnabled = true
require(A).Intensity = 2147483647
require(A).VisualizerEnabled = false
require(A).ChargingTime = 0
require(A).Piercing = 2147483647