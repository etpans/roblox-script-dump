--////////////////////////////////////////////////////////////////////////////
--Made by Pans#1714
--Questions & Suggestions: Join the Discord Server! discord.gg/H9Qq5Zn
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

--This script will show highlight ALL the Military and Airdrop Crates in the server
for __,a in pairs(game.Workspace.Harvestables:GetChildren()) do
if a.Name == "Airdrop Crate" then
local A = Instance.new("BillboardGui",a)
A.Size = UDim2.new(1,0, 1,0)
A.Name = "A"
A.AlwaysOnTop = true
local B = Instance.new("Frame",A)
B.Size = UDim2.new(1,0, 1,0)
B.BackgroundTransparency = 1
B.BorderSizePixel = 0
local C = Instance.new("TextLabel",B)
C.Text = v.Name
C.Size = UDim2.new(1,0, 1,0)
C.BackgroundTransparency = 1
C.BorderSizePixel = 0
C.ZIndex = 10
C.TextColor3 = Color3.new(0,255,0)
C.TextSize = 10
for __,b in pairs(a:GetChildren()) do
if b.Name == "Main" then
local A = Instance.new("BoxHandleAdornment", b)
A.Name = "A"
A.Adornee = b
A.AlwaysOnTop = true
A.ZIndex = 0
A.Size = b.Size
A.Transparency = 0.7
A.Color = BrickColor.new("Cyan")
end
end
end
end

for __,a in pairs(game.Workspace:GetDescendants()) do
if a.Name == "Military Crate" then
for __,b in pairs(a:GetChildren()) do
if b.Name == "Main" then
local A = Instance.new("BoxHandleAdornment", b)
A.Name = "A"
A.Adornee = b
A.AlwaysOnTop = true
A.ZIndex = 0
A.Size = b.Size
A.Transparency = 0.7
A.Color = BrickColor.new("Lime Green")
end
end
end
end

for __,a in pairs(game.Workspace:GetDescendants()) do
if a.Name == "Supply Crate" then
for __,b in pairs(a:GetChildren()) do
if b.Name == "Main" then
local A = Instance.new("BoxHandleAdornment", b)
A.Name = "A"
A.Adornee = b
A.AlwaysOnTop = true
A.ZIndex = 0
A.Size = b.Size
A.Transparency = 0.7
A.Color = BrickColor.new("Crimson")
end
end
end
end