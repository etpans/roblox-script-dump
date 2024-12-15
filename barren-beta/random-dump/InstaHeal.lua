--////////////////////////////////////////////////////////////////////////////
--Made by Pans#1714
--Questions & Suggestions: Join the Discord Server! discord.gg/H9Qq5Zn
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

--This script will automatically heal you when you bleed
--Make sure all hotbar slots are occupied excluding the 6th slot (Bandage slot)

--Change the this value to toggle the script
_G.Heal = true
--Change the this value to the type of Bandage you want (Linen Bandage, etc)
local Bandage = "Bandage"

while _G.Heal do
wait(0.55)
for i, v in pairs(game.Players.LocalPlayer.PlayerGui.MainGui.Stats:GetDescendants()) do
if v.Name == "Bleed" then
local A1 = game:GetService("Players").LocalPlayer.stats.inventory.slot06
game:GetService("ReplicatedStorage").Remotes.Use:InvokeServer(A1)
local A1 = game:GetService("ReplicatedStorage").ItemData[Bandage]
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(A1)
end
end
end