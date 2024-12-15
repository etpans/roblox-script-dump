--Configurables--
local AntiBanNotification = true
local NotificationProperties = {
    Text = "{ANTI-BAN EXCUTED}",
    Color = Color3.fromRGB(215,0,0),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
}
--Variables--
local SGui = game:GetService("StarterGui")

--Scripts--
while true do wait()
    if game:IsLoaded() then
        setfflag("DFStringCrashPadUploadToBacktraceToBacktraceBaseUrl", "")
        setfflag("DFIntCrashUploadToBacktracePercentage", "0")
        setfflag("DFStringCrashUploadToBacktraceBlackholeToken", "")
        setfflag("DFStringCrashUploadToBacktraceWindowsPlayerToken", "")
        break
    end
end

--Notifications--
if AntiBanNotification then
    SGui:SetCore("ChatMakeSystemMessage",NotificationProperties)
end