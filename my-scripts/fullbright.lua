local lght = game:GetService("Lighting")
lght.SunRays.Parent = nil
lght.Changed:connect(function()
lght.ClockTime = 12
lght.FogEnd = 786543
lght.GlobalShadows = false
lght.Ambient = Color3.fromRGB(178, 178, 178)
end)