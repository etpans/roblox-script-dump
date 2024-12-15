for i,v in pairs(game.Workspace:GetDescendants()) do
if v.Name == "Military Crate" then
for a,b in pairs(v:GetChildren()) do
if b.Name == "Main" then
local c = Instance.new("BoxHandleAdornment", b)
c.Name = "a"
c.Adornee = b
c.AlwaysOnTop = true
c.ZIndex = 0
c.Size = b.Size
c.Transparency = 0.3
c.Color = BrickColor.new("Lime green")
end
end
end
end