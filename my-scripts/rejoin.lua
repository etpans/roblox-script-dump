local tps = game:GetService("TeleportService")
local plrs = game:GetService("Players")
local sgui = game:GetService("StarterGui")
local lplr = plrs.LocalPlayer

if #plrs:GetPlayers() <= 1 then
    lplr:Kick("\nRejoining...")
    tps:TeleportToPlaceInstance(game.PlaceId,lplr)
    wait()
else
    tps:TeleportToPlaceInstance(game.PlaceId,game.JobId,lplr)
end