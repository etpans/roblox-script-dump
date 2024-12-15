--Variables--
local TS = game:GetService("TweenService")
local RF = game:GetService("ReplicatedFirst")
local Plrs = game:GetService("Players")
local LPlr = Plrs.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local Loading =  Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Gradient = Instance.new("UIGradient")
local Status = Instance.new("TextLabel")

--Scripts--
local function Tween(...)
    TS:Create(...):Play()
end
RF:RemoveDefaultLoadingScreen()
--Create Gui--
Loading.Name = "Loading"
Loading.Parent = CoreGui
Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Background.Name = "Background"
Background.Parent = Loading
Background.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
Background.Position = UDim2.new(0, 0, -0.100000001, 0)
Background.Size = UDim2.new(1, 0, 1.10000002, 0)
Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.45, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(76, 76, 76))}
Gradient.Rotation = 90
Gradient.Name = "gradient"
Gradient.Parent = Background
Status.Name = "Status"
Status.Parent = Loading
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1.000
Status.Position = UDim2.new(0, 0, 0.893442631, 0)
Status.Size = UDim2.new(1, 0, 0.0355480109, 0)
Status.Font = Enum.Font.SourceSansItalic
Status.Text = "< TRYING SERVER >"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextScaled = true
Status.TextSize = 14.000
Status.TextStrokeColor3 = Color3.fromRGB(52, 52, 52)
Status.TextStrokeTransparency = 0.000
Status.TextWrapped = true

--Destroy Gui--
if syn then syn.protect_gui(Loading) end
repeat wait() until LPlr
Status.Text = "< JOINING SERVER >"
if not game:IsLoaded() then
    game.Loaded:wait()
end
wait(.66)
Tween(Background, TweenInfo.new(.55), {BackgroundTransparency = 1})
Tween(Status, TweenInfo.new(.55), {TextTransparency = 1, TextStrokeTransparency = 1})
wait(.55)
Loading:Destroy()