local GetServiceModule = require(game:GetService("ReplicatedStorage").GetService)
syn_context_set(2) 
local DataService = GetServiceModule("DataServiceClient")
syn_context_set(7)

while wait() do
    for i, v in pairs(game:GetService("Workspace").Dispensers:GetChildren()) do
        if game:GetService("Workspace"):GetServerTimeNow() - (DataService:Get(v.Name .. "_D")) > 300 then
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Dispenser", v.Name)
        end
    end
end