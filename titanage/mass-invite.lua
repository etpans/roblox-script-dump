local plrs = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")
local lplr = game:GetService("Players").LocalPlayer

for i, v in pairs(plrs:GetPlayers()) do
    if v.Name ~= lplr.Name and v.Data:FindFirstChild("Squad").Value == "" then
        rs.Remotes.Squad:FireServer("Invite", tostring(v))
    end
end
