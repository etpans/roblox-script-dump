--[_Better_No-Slow_]--
--[By: helpguestslikeme]--
--[Version 2.6]--

if not game:IsLoaded() then
	local loadedcheck = Instance.new("Message",workspace)
	loadedcheck.Text = 'Loading...'
	game.Loaded:Wait()
	loadedcheck:Destroy()
end

game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "No-Slow";
        Text = "Press [ to enable.";
        })

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Thank You For Using This Script!";
	Text = "Created by: helpguestslikeme#1470";
})


if NS2_LOADED and not _G.NS2_DEBUG == true then
    error("No-Slow is already running!",0)
    return
end
pcall(function() getgenv().NS2_LOADED  = true end)

noslow = true
slow = false

local mouse = game.Players.LocalPlayer:GetMouse()
mouse.KeyDown:connect(function(key)
if key == "[" then
game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "No-Slow Enabled";
        Text = "Press ] to disable.";
        })
_G.Skiznillett = noslow
elseif key == "]" then
game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "No-Slow Disabled";
        Text = "Press [ to enable.";
        })
_G.Skiznillett = slow
end
end)

_G.Skiznillett = false

while wait() do
	if _G.Skiznillett == true then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
	        if v.Name == "Justice Combination" then
	            local action = game.Players.LocalPlayer.Character:WaitForChild("Action")
	            if action then wait() action:Destroy() end end
	        if v.Name == "Attacking" then
	    		v:Destroy()
	        end
	        if v.Name == "Action" then
	            v:Destroy()
	        end
	        if v.Name == "Killed" then
	            v:Destroy()
	        end
			if v.Name == "Block" and v.Value == true then
				v.Value = false
			end
		end
    end
end