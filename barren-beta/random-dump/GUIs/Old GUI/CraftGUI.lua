local CraftGUI = Instance.new("ScreenGui")
local FrameOfItem = Instance.new("Frame")
local ButtonOfItem = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local ButtonOfDestroy = Instance.new("TextButton")

CraftGUI.Name = "CraftGUI"
CraftGUI.Parent = game.CoreGui
CraftGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

FrameOfItem.Name = "FrameOfItem"
FrameOfItem.Parent = CraftGUI
FrameOfItem.Active = true
FrameOfItem.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
FrameOfItem.BackgroundTransparency = 0.100
FrameOfItem.BorderColor3 = Color3.fromRGB(0, 0, 0)
FrameOfItem.Position = UDim2.new(0.6968472, 0, 0.172240824, 0)
FrameOfItem.Size = UDim2.new(0, 240, 0, 40)
FrameOfItem.Draggable = true
--Cursor:
local rs = game:GetService("RunService").RenderStepped
local mouse = game:GetService("Players").LocalPlayer:GetMouse()

cursor = Drawing.new("Triangle")
cursor.Color = Color3.fromRGB(255, 0, 0)
cursor.Visible = false
cursor.Thickness = 1
cursor.Filled = true

FrameOfItem.MouseEnter:Connect(function()
	cursor.Visible = true
end)

FrameOfItem.MouseLeave:Connect(function()
	cursor.Visible = false
end)

rs:Connect(function()
	cursor.PointA = Vector2.new(mouse.X, mouse.Y + 35)
	cursor.PointB = Vector2.new(mouse.X, mouse.Y + 45)
	cursor.PointC = Vector2.new(mouse.X + 7, mouse.Y + 42)
end)

ButtonOfItem.Name = "ButtonOfItem"
ButtonOfItem.Parent = FrameOfItem
ButtonOfItem.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ButtonOfItem.BorderColor3 = Color3.fromRGB(16, 27, 35)
ButtonOfItem.Position = UDim2.new(0.849166632, 0, 0.125, 0)
ButtonOfItem.Size = UDim2.new(0, 30, 0, 30)
ButtonOfItem.Font = Enum.Font.SourceSansBold
ButtonOfItem.Text = "Craft"
ButtonOfItem.TextColor3 = Color3.fromRGB(147, 147, 147)
ButtonOfItem.TextSize = 13.000
ButtonOfItem.MouseButton1Down:connect(function()
    local A1 = game:GetService("ReplicatedStorage").ItemData[TextBox.Text]
    game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(A1)
end)

TextBox.Parent = FrameOfItem
TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TextBox.BorderColor3 = Color3.fromRGB(16, 27, 35)
TextBox.Position = UDim2.new(0.0250000004, 0, 0.125, 0)
TextBox.Size = UDim2.new(0, 194, 0, 30)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderColor3 = Color3.fromRGB(147, 147, 147)
TextBox.PlaceholderText = "Item Name (Be Specific)"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(147, 147, 147)
TextBox.TextSize = 14.000

ButtonOfDestroy.Name = "ButtonOfDestroy"
ButtonOfDestroy.Parent = CraftGUI
ButtonOfDestroy.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ButtonOfDestroy.BorderColor3 = Color3.fromRGB(16, 27, 35)
ButtonOfDestroy.Position = UDim2.new(0.9, 0, 0, 9)
ButtonOfDestroy.Size = UDim2.new(0, 48, 0, 20)
ButtonOfDestroy.Font = Enum.Font.SourceSansBold
ButtonOfDestroy.Text = "Destroy"
ButtonOfDestroy.TextColor3 = Color3.fromRGB(147, 147, 147)
ButtonOfDestroy.TextSize = 13.000
ButtonOfDestroy.MouseButton1Down:connect(function()
CraftGUI:Destroy()
end)