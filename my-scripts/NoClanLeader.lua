--Configurables--
local NoClanLeaderNotification = true
local ClanColor = "Brown"
local NotificationProperties = {
    Text = "{NO CLAN LEADER EXCUTED}",
    Color = Color3.fromRGB(205,165,255),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
}

--Variables--
local Plrs = game:GetService("Players")
local SGui = game:GetService("StarterGui")
local RS = game:GetService("ReplicatedStorage")
local LPlr = Plrs.LocalPlayer
local Clan = game:GetService("Teams").ClanColor

--Scripts--
RS.Remotes.ClanForm:InvokeServer(Clan)
RS.Remotes.ClanInvite:FireServer(LPlr.Name) wait(1)
RS.Remotes.ClanLeave:FireServer() wait(1)
RS.Remotes.ClanJoin:FireServer(Clan)

--Notifications--
if NoClanLeaderNotification then 
    SGui:SetCore("ChatMakeSystemMessage",NotificationProperties)
end