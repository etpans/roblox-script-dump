for i, v in pairs(game:GetService("Workspace").Harvestables:GetChildren()) do
    if v.Name == "Pine Tree" then
        for i, v in pairs(v:GetChildren()) do
            if v.Name == "Leaves" then
                v:Destroy()
            end
        end
    end
end