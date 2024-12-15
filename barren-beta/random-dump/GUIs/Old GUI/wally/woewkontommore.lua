for __,v in pairs(game.Workspace.Harvestables:GetChildren()) do
if v.Name == "Airdrop Crate" then
local a = Instance.new("BillboardGui",v)
a.Name = "A"
a.StudsOffset = Vector3.new(0, 500, 0)
a.AlwaysOnTop = true
a.Size = UDim2.new(0, 5, 0, 5)
local b = Instance.new("Frame",a)
b.Size = UDim2.new(1,0, 1,0)
b.BackgroundTransparency = 1
b.BorderSizePixel = 0
local c = Instance.new("TextLabel",b)
c.Text = "V"
c.TextColor3 = Color3.new(0,255,255)
c.BackgroundTransparency = 1
c.Size = UDim2.new(1,0,10,0)
c.TextSize = 30
end
end

for __,v in pairs(game.Workspace.Harvestables:GetChildren()) do
if v.Name == "Airdrop Crate" then
for __,w in pairs(v:GetChildren()) do
if w.Name == "Main" then
local a = Instance.new("BoxHandleAdornment", w)
a.Name = "A"
a.Adornee = w
a.AlwaysOnTop = true
a.ZIndex = 0
a.Size = w.Size
a.Transparency = 0.2
a.Color = BrickColor.new("Cyan")
end
end
end
end

for __,v in pairs(game.Workspace.Harvestables:GetChildren()) do
if v.Name == "Military Crate" then
local a = Instance.new("BillboardGui",v)
a.Name = "A"
a.StudsOffset = Vector3.new(0, 500, 0)
a.AlwaysOnTop = true
a.Size = UDim2.new(0, 5, 0, 5)
local b = Instance.new("Frame",a)
b.Size = UDim2.new(1,0, 1,0)
b.BackgroundTransparency = 1
b.BorderSizePixel = 0
local c = Instance.new("TextLabel",b)
c.Text = "V"
c.TextColor3 = Color3.new(0,255,0)
c.BackgroundTransparency = 1
c.Size = UDim2.new(1,0,10,0)
c.TextSize = 30
end
end

for __,v in pairs(game.Workspace.Harvestables:GetChildren()) do
if v.Name == "Military Crate" then
for __,w in pairs(v:GetChildren()) do
if w.Name == "Main" then
local a = Instance.new("BoxHandleAdornment", w)
a.Name = "A"
a.Adornee = b
a.AlwaysOnTop = true
a.ZIndex = 0
a.Size = w.Size
a.Transparency = 0.7
a.Color = BrickColor.new("Lime Green")
end
end
end
end

for __,v in pairs(game.Workspace.Harvestables:GetChildren()) do
if v.Name == "Supply Crate" then
local a = Instance.new("BillboardGui",v)
a.Name = "A"
a.StudsOffset = Vector3.new(0, 500, 0)
a.AlwaysOnTop = true
a.Size = UDim2.new(0, 5, 0, 5)
local b = Instance.new("Frame",a)
b.Size = UDim2.new(1,0, 1,0)
b.BackgroundTransparency = 1
b.BorderSizePixel = 0
local c = Instance.new("TextLabel",b)
c.Text = "V"
c.TextColor3 = Color3.new(255,0,0)
c.BackgroundTransparency = 1
c.Size = UDim2.new(1,0,10,0)
c.TextSize = 30
end
end

for __,v in pairs(game.Workspace.Harvestables:GetChildren()) do
if v.Name == "Supply Crate" then
for __,w in pairs(v:GetChildren()) do
if w.Name == "Main" then
local a = Instance.new("BoxHandleAdornment", w)
a.Name = "A"
a.Adornee = b
a.AlwaysOnTop = true
a.ZIndex = 0
a.Size = w.Size
a.Transparency = 0.7
a.Color = BrickColor.new("Crimson")
end
end
end
end