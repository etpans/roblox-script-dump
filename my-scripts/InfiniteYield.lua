--Scripts--
loadstring(game:HttpGet(("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"),true))()

--Variables--
local SGui = game:GetService("StarterGui")

--Configurables--
local InfiniteYieldNotification = true
local NotificationProperties = {
    Text = "{INFINITE YIELD EXECUTED}",
    Color = Color3.fromRGB(205,165,255),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,        
}

--Notifications--
if InfiniteYieldNotification then
    SGui:SetCore("ChatMakeSystemMessage",NotificationProperties)
end