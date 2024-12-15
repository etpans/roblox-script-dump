--Configurables--
_G.InfiniteJumpIYEnabled = true
local InfiniteJumpIYNotification = true
local NotificationProperties = {
    Text = "{INFINITE JUMP IY "..(_G.InfiniteJumpIYEnabled and "EN" or "DIS").."ABLED}",
    Color = Color3.fromRGB(205,165,255),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
}

--Variables--
local Plrs = game:GetService("Players")
local SGui = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")
local LPlr = Plrs.LocalPlayer

--Scripts--
UIS.JumpRequest:Connect(function()
    if _G.InfiniteJumpIYEnabled then
        LPlr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

--Notifications--
if InfiniteJumpIYNotification then
    SGui:SetCore("ChatMakeSystemMessage",NotificationProperties)
end