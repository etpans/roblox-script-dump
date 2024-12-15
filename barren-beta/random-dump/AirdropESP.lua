--[[
local function CreateBillboard(Object, Color)
    local a = Instance.new("BillboardGui", Object)
    a.StudsOffset = Vector3.new(0, 500, 0)
    a.AlwaysOnTop = true
    a.Size = UDim2.new(0, 5, 0, 5)
end


for i, v in pairs(game:GetService("Workspace"):WaitForChild("Harvestables"):GetChildren()) do
    if v.Name == "Airdrop Crate" then

    end
end]]

for i, v in pairs(game:GetService("Workspace"):WaitForChild("Harvestables"):GetChildren()) do
    if v.Name == "Airdrop Crate" then
        local billboard = Instance.new("BillboardGui")
        billboard.StudsOffset = Vector3.new(0, 500, 0)
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0, 5, 0, 5)
        billboard.Parent = v

        local label = Instance.new("Frame")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.BorderSizePixel = 0
        label.Parent = billboard

        local arrow = Instance.new("TextLabel")
        arrow.Text = "↓"
        arrow.TextColor3 = Color3.new(0, 255, 255)
        arrow.BackgroundTransparency = 1
        arrow.Size = UDim2.new(1, 0, 10, 0)
        arrow.TextSize = 20
        arrow.Parent = label

        local chams = Instance.new("BoxHandleAdornment")
        chams.Adornee = v.Main
        chams.AlwaysOnTop = true
        chams.ZIndex = 0wA 
        chams.Size = v.Main.Size
        chams.Transparency = 0.6
        chams.Color = BrickColor.new("Cyan")
        chams.Parent = v.Main
    elseif v.Name == "Military Crate" then
        local billboard = Instance.new("BillboardGui")
        billboard.StudsOffset = Vector3.new(0, 500, 0)
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0, 5, 0, 5)
        billboard.Parent = v
        
        local label = Instance.new("Frame")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.BorderSizePixel = 0
        label.Parent = billboard

        local arrow = Instance.new("TextLabel")
        arrow.Text = "↓"
        arrow.TextColor3 = Color3.new(0, 255, 0)
        arrow.BackgroundTransparency = 1
        arrow.Size = UDim2.new(1, 0, 10, 0)
        arrow.TextSize = 20
        arrow.Parent = label

        local chams = Instance.new("BoxHandleAdornment")
        chams.Adornee = v.Main
        chams.AlwaysOnTop = true
        chams.ZIndex = 0
        chams.Size = v.Main.Size
        chams.Transparency = 0.6
        chams.Color = BrickColor.new("Lime green")
        chams.Parent = v.Main
    elseif v.Name == "Supply Crate" then
        local billboard = Instance.new("BillboardGui")
        billboard.StudsOffset = Vector3.new(0, 500, 0)
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0, 5, 0, 5)
        billboard.Parent = v
        
        local label = Instance.new("Frame")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.BorderSizePixel = 0
        label.Parent = billboard

        local arrow = Instance.new("TextLabel")
        arrow.Text = "↓"
        arrow.TextColor3 = Color3.new(255, 0, 0)
        arrow.BackgroundTransparency = 1
        arrow.Size = UDim2.new(1, 0, 10, 0)
        arrow.TextSize = 20
        arrow.Parent = label

        local chams = Instance.new("BoxHandleAdornment")
        chams.Adornee = v.Main
        chams.AlwaysOnTop = true
        chams.ZIndex = 0
        chams.Size = v.Main.Size
        chams.Transparency = 0.6
        chams.Color = BrickColor.new("Crimson")
        chams.Parent = v.Main
    end
end