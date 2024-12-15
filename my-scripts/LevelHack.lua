--Configurables--
local LevelHackNotification = true
local NotificationProperties = {
    Text = "{LEVEL HACK EXCUTED}",
    Color = Color3.fromRGB(205,165,255),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
}

--Variables--
local Plrs = game:GetService("Players")
local SGui = game:GetService("StarterGui")
local LPlr = Plrs.LocalPlayer
local Lvl = LPlr.stats.other.Level.Value

--Scripts--
if Lvl < 40 then
    Lvl = 40
end

--Notifications--
if LevelHackNotification then
    SGui:SetCore("ChatMakeSystemMessage",NotificationProperties)
end