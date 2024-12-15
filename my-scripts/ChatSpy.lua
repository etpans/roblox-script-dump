--Configurables--
_G.ChatSpyEnabled = true
local ChatSpyNotification = true
local NotificationProperties = {
    Text = "{SPY "..(_G.ChatSpyEnabled and "EN" or "DIS").."ABLED}",
    Color = Color3.fromRGB(205,165,255),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
}

--Variables--
local Plrs = game:GetService("Players")
local SGui = game:GetService("StarterGui")
local RS = game:GetService("ReplicatedStorage")
local LPlr = Plrs.LocalPlayer
local GMsg = RS:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local IN = (_G.ChatSpyIN or 0) + 1
_G.ChatSpyIN = IN

--Scripts--
local function OnChatted(Plr, Msg)
    if _G.ChatSpyIN == IN then
        if _G.ChatSpyEnabled and (Plr ~= LPlr) then
            Msg = Msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
            local Hidden = true
            local Connect = GMsg.OnClientEvent:Connect(function(Pkct,Chnl)
                if Pkct.SpeakerUserId == Plr.UserId and Pkct.Message == Msg:sub(#Msg - #Pkct.Message + 1) and (Chnl== "All" or (Chnl == "Team" and Plrs[Pkct.FromSpeaker].Team == LPlr.Team)) then
					Hidden = false
                end
            end)
            wait(.25)
            Connect:Disconnect()
            if Hidden and _G.SpyEnabled then
                local TextProperties = {
                    Text = "{SPY} [".. Plr.Name .."]: "..Msg,
                    Color = Color3.fromRGB(160,100,255),
                    Font = Enum.Font.SourceSansBold,
                    TextSize = 18,
                }
                SGui:SetCore("ChatMakeSystemMessage", TextProperties)
            end
        end
    end
end

for _,Plr in ipairs(Plrs:GetPlayers()) do
    Plr.Chatted:Connect(function(Msg) 
        OnChatted(Plr,Msg) 
    end)
end

Plrs.PlayerAdded:Connect(function(Plr)
    Plr.Chatted:Connect(function(Msg) 
        OnChatted(Plr,Msg) 
    end)
end)

--Notifications--
if ChatSpyNotification then
    SGui:SetCore("ChatMakeSystemMessage", NotificationProperties)
end