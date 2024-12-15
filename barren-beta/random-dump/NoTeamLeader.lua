--////////////////////////////////////////////////////////////////////////////
--Made by Pans#1714
--Questions & Suggestions: Join the Discord Server! discord.gg/H9Qq5Zn
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

--This script will make a clan without you being the leader

--Change this to the Clan Colour (Clan must be empty)
local Clan = "Brown"

local A1 = game:GetService("Teams")[Clan]
local A2 = game:GetService("Players")[game.Players.LocalPlayer.Name]

game:GetService("ReplicatedStorage").Remotes.ClanForm:InvokeServer(A1)
game:GetService("ReplicatedStorage").Remotes.ClanInvite:FireServer(A2)
wait(1)
game:GetService("ReplicatedStorage").Remotes.ClanLeave:FireServer()
game:GetService("ReplicatedStorage").Remotes.ClanJoin:FireServer(A1)