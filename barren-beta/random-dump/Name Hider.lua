--////////////////////////////////////////////////////////////////////////////
--Made by Pans#1714
--Questions & Suggestions: Join the Discord Server! discord.gg/H9Qq5Zn
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

--This script will change your level, tabs, and name.

--Change these varibles to change our level, tabs, and name.
--Rejoin the game to revert changes
local LVL = 69
local TAB = 69
local NAME = "Pans"

while wait() do
game.Players.LocalPlayer.PlayerGui.MainGui.Top.Leaderboard.Main.YOURNAME.Main.NameLabel.Text = NAME
game.Players.LocalPlayer.stats.other.Level.Value = LVL
game.Players.LocalPlayer.stats.other.Tabs.Value = TAB
end


