--////////////////////////////////////////////////////////////////////////////
--Made by Pans#1714
--Questions & Suggestions: Join the Discord Server! discord.gg/H9Qq5Zn
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

--This script will remove your crosshair for all your guns

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v.Name == "Reticle" then
v:Destroy()
end
end