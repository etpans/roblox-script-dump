-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextButton.Parent = ScreenGui
TextButton.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
TextButton.BackgroundTransparency = 0.500
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.775, 0, 0.945, 0)
TextButton.Size = UDim2.new(0, 100, 0, 30)
TextButton.Font = Enum.Font.SourceSansBold
TextButton.Text = "SCRAP"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
TextButton.MouseButton1Down:connect(function()
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("19",1)
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("20",1)
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("21",1)
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("22",1)
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("23",1)
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("24",1)
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("13",1)
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("14",1)
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("15",1)
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("16",1)
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("17",1)
game:GetService("ReplicatedStorage").Remotes.Scrap:InvokeServer("18",1)
end)