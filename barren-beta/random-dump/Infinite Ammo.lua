-- Made by Pans
if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end
for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v.Name == "ChangeAmmo" then
v:AddCallHook("FireServer", function(o, ...)
end)

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v.Name == "Ammo" and v.ClassName == "IntValue"then
v.Value = 2147483647
