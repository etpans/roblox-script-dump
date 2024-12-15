--Configurables--
local MapESPNotification = true
local NotificationProperties = {
    Text = "{MAP ESP EXCUTED}",
    Color = Color3.fromRGB(205,165,255),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
}

--Variables--
local Plrs = game:GetService("Players")
local SGui = game:GetService("StarterGui")
local LPlr = Plrs.LocalPlayer

--Scripts--
while true do wait()
    for _,v in pairs(Plrs:GetPlayers()) do
        if v.Name ~= LPlr.Name then
            v.stats.other.Notoriety = 100
        end
    end
end

--Notifications--
if MapESPNotification then
    SGui:SetCore("ChatMakeSystemMessage",NotificationProperties)
end