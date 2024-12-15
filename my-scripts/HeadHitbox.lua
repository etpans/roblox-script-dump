--Configurables--
_G.HeadHitboxEnabled = true
_G.HeadSize = 2
local HeadHitboxNotification = true
local NotificationProperties = {
    Text = "{HEAD HITBOX "..(_G.HeadHitboxEnabled and "EN" or "DIS").."ABLED}",
    Color = Color3.fromRGB(205,165,255),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
}

--Variables--
local Plrs = game:GetService("Players")
local SGui = game:GetService("StarterGui")
local LPlr = Plrs.LocalPlayer

--Notifications--
if HeadHitboxNotification then
    SGui:SetCore("ChatMakeSystemMessage",NotificationProperties)
end

--Scripts--
while _G.HeadHitboxEnabled do wait()
    for _,v in pairs(Plrs:GetPlayers()) do
        if v.Name ~= LPlr.Name then
            pcall(function()
                v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)  
            end)
        end
    end
end

if not _G.HeadHitboxEnabled then
    for _,v in pairs(Plrs:GetPlayers()) do
        if v.Name ~= LPlr.Name then
            pcall(function()
                v.Character.Head.Size = Vector3.new(2,2,1)
            end)
        end
    end
end