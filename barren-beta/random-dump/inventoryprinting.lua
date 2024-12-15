local Player = "1kbpi"

local plr = game:GetService("Players")

print(("\n"):rep(15))
print("Printing " ..Player.. "'s Inventory:")
for i, v in pairs(plr:GetChildren()) do
    if v.Name == Player then
        for i, v in pairs(v.stats.inventory:GetDescendants()) do
            if v.Name == "Amount" then
                print("")
                print(v.Value)
            elseif v.Name == "ItemId" then
                print(v.Value)
            end
        end
    end
end