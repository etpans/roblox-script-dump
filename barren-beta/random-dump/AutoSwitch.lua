while wait(2) do
local A1 = "12"
local A2 = "33"
local Workspace = game.Workspace[game.Players.LocalPlayer.Name].Humanoid
while wait(4) do
if Workspace.Temperature.Value >= 45 and Workspace.ColdDamageResistance.Value >= 10 then
game:GetService("ReplicatedStorage").Remotes.SwapSlots:InvokeServer(A1,A2)
elseif Workspace.Temperature.Value <= 10 and Workspace.ColdDamageResistance.Value <= 0 then
game:GetService("ReplicatedStorage").Remotes.SwapSlots:InvokeServer(A1,A2)
end
end
end