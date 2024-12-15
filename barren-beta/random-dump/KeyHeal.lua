game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
if key == 'g' then
local args = {
    [1] = game:GetService("Players).LocalPlayer.stats.inventory["slot 06"],
}
game:GetService("ReplicatedStorage").Remotes.Use:InvokeServer(unpack(args))

local args = {
    [1] = game:GetService("ReplicatedStorage").ItemData.Bandage,
}
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(unpack(args))
end
end

