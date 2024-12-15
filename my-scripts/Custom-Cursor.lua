local LPlr   = game:GetService("Players").LocalPlayer
local RunS   = game:GetService("RunService").RenderStepped
local Mouse  = LPlr:GetMouse()
local Cursor = Drawing.new("Circle")
Cursor.Color = Color3.fromRGB(255, 0, 0)
Cursor.Thickness = 0.1
Cursor.NumSides = 12
Cursor.Radius = 5
Cursor.Visible = true
Cursor.Filled = false

RunS:Connect(function()
    Cursor.Position = Vector2.new(Mouse.X, Mouse.Y + 35)
end)