writefile("Codes.txt", "")
for i, v in pairs(game:GetService("Players").LocalPlayer.Data.CodesUsed:GetChildren()) do
    if v.ClassName == "BoolValue" then
        appendfile("Codes.txt", tostring(v.Name).."\n")
    end
end
