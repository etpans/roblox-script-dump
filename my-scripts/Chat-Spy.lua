--Confirguration:
local SriptName = "ChatSpy"

--Table:
if not getgenv().Settings then
    getgenv().Settings = {}
end

if getgenv().Settings then
    if not getgenv().Settings[SriptName] then
        getgenv().Settings[SriptName] = nil
    end
else
    warn("Error: Table has not been established.")
end

--Varibles:
local RS    = game:GetService("ReplicatedStorage")
local Plrs  = game:GetService("Players")
local SGui  = game:GetService("StarterGui")

local GMsg  = RS:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local LPlr  = Plrs.LocalPlayer
local In = (getgenv().ChatSpyIn or 0) + 1
getgenv().ChatSpyIn = In

--Toggle:
if getgenv().Settings[SriptName] then
    getgenv().Settings[SriptName] = false
    print(SriptName.." Disabled\n")
else
    getgenv().Settings[SriptName] = true
    print(SriptName.." Enabled\n")
end

--Script:
local function OnChatted(Plr, Msg)
    if getgenv().ChatSpyIn == In then
        if getgenv().Settings[SriptName] and (Plr ~= LPlr) then
            Msg = Msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
            local Hidden = true
            local Connect = GMsg.OnClientEvent:Connect(function(Pkct,Chnl)
                if Pkct.SpeakerUserId == Plr.UserId and Pkct.Message == Msg:sub(#Msg - #Pkct.Message + 1) and (Chnl== "All" or (Chnl == "Team" and Plrs[Pkct.FromSpeaker].Team == LPlr.Team)) then
					Hidden = false
                end
            end)
            wait(.25)
            Connect:Disconnect()
            if Hidden and getgenv().Settings[SriptName] then
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

for _, Plr in ipairs(Plrs:GetPlayers()) do
    Plr.Chatted:Connect(function(Msg) 
        OnChatted(Plr,Msg) 
    end)
end

Plrs.PlayerAdded:Connect(function(Plr)
    Plr.Chatted:Connect(function(Msg) 
        OnChatted(Plr,Msg) 
    end)
end)