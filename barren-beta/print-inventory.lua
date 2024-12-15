local Player = "Name Here"

print(("\n"):rep(5))
for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name:match(Player) then
        print("Printing " ..v.Name.. "'s Inventory:")
        local inv = v.stats.inventory:GetChildren()
        for i, v in pairs(inv) do
            local children = #v:GetChildren() > 0
            if v.ClassName == "Folder" and children then
                print(v.Amount.Value, v.ItemId.Value)
            end
        end
    end
end
