if getgenv().chatspyenabled == nil then
	getgenv().chatspyenabled = true 
end

local terrain = game:GetService("Workspace").Terrain
local grasscheck  = gethiddenproperty(terrain, "Decoration")
local plrgui = game:GetService("Players").LocalPlayer.PlayerGui
local plrs  = game:GetService("Players")

local SGui = game:GetService("StarterGui")
local lplr = plrs.LocalPlayer
local gmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local in = (getgenv().chatspyin or 0) + 1
chatspyin = in


local function notification(message, seconds)
    local properties = plrgui.StarterScripts.ItemControl.MessageFrame:Clone()
    properties.Name = os.time()
    properties.MessageText.Text = message
    properties.Parent = plrgui:WaitForChild("Messages").MessagesFrame
    game.Debris:AddItem(properties, seconds)
end

local function OnChatted(plr, msg)
    if chatspyin == in then
        if chatspyenabled and (plr ~= Lplr) then
            msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
            local Hidden = true
            local Connect = Gmsg.OnClientEvent:Connect(function(Pkct,Chnl)
                if Pkct.SpeakerUserId == plr.UserId and Pkct.Message == msg:sub(#msg - #Pkct.Message + 1) and (Chnl== "All" or (Chnl == "Team" and plrs[Pkct.FromSpeaker].Team == Lplr.Team)) then
					Hidden = false
                end
            end)
            wait(.25)
            Connect:Disconnect()
            if Hidden and chatspyenabled then
                local TextProperties = {
                    Text = "{SPY} [".. plr.Name .."]: "..msg,
                    Color = Color3.fromRGB(160,100,255),
                    Font = Enum.Font.SourceSansBold,
                    TextSize = 18,
                }
                SGui:SetCore("ChatMakeSystemMessage", TextProperties)
            end
        end
    end
end

for i,plr in ipairs(plrs:GetPlayers()) do
    plr.Chatted:Connect(function(msg) 
        OnChatted(plr,msg) 
    end)
end

plrs.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg) 
        OnChatted(plr,msg) 
    end)
end)

if chatspyenabled then
	getgenv().chatspyenabled = false
else
	getgenv().chatspyenabled = true
end

--This script reveals ALL hidden messages in the default chat
--chat "/e spy" to toggle!
enabled = false
--if true will check your messages too
spyOnMyself = true
--if true will chat the logs publicly (fun, risky)
public = false
--if true will use /me to stand out
publicItalics = false
--customize private logs
privateProperties = {
	Color = Color3.fromRGB(0,255,255); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
--////////////////////////////////////////////////////////////////
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,6)=="/e spy" then
			enabled = not enabled
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabled and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and p.Team==player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end

for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
player:WaitForChild("PlayerGui"):WaitForChild("Chat")
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
wait(3)

local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)