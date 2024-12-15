--[[
All credits go to their respective owners. This includes, but is not limited to,
 - Wally's UI Library
 - Edge, Zwolf, & Moon's Infinte Yield FE script
 - Google Chrome & CriShoux's Owl Hub script
 - And Me, Pans#1714
--]]

--UI Libaray Made by Wally:
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/FTdYYNX3",true))()
--Malicious Section:
local Malicious = Library:CreateWindow("Malicious")
Malicious:Section("Gun Mods")
local Gunmodall = Malicious:Toggle("Gun Mod All",{flag = "Gunmodall"},function()
	while Malicious.flags.Gunmodall do wait()
		if Malicious.flags.Infammo then
		end
	end
	if not Malicious.flags.Gunmodall then wait(.1)
		game:GetService("ReplicatedStorage").Remotes.SwapSlots:InvokeServer("01,01")
		game:GetService("ReplicatedStorage").Remotes.SwapSlots:InvokeServer("02,02")
		game:GetService("ReplicatedStorage").Remotes.SwapSlots:InvokeServer("03,03")
		game:GetService("ReplicatedStorage").Remotes.SwapSlots:InvokeServer("04,04")
		game:GetService("ReplicatedStorage").Remotes.SwapSlots:InvokeServer("05,05")
		game:GetService("ReplicatedStorage").Remotes.SwapSlots:InvokeServer("06,06")
	end
end)
local Gunmodslot = Malicious:Toggle("God Mod Slot",{flag = "Gunmodslot"},function()
end)
Malicious:Dropdown("Hotbar Slots",{flag = "Hotbarslots";list = {"Slot 1";"Slot 2";"Slot 3";"Slot 4";"Slot 5";"Slot 6"}},function()
	if Malicious.flags.Hotbarslots == "Slot 1" then
		_G.Hotbarslot = "slot01"
	elseif Malicious.flags.Hotbarslots == "Slot 2" then
		_G.Hotbarslot = "slot02"
	elseif Malicious.flags.Hotbarslots == "Slot 3" then
		_G.Hotbarslot = "slot03"
	elseif Malicious.flags.Hotbarslots == "Slot 4" then
		_G.Hotbarslot = "slot04"
	elseif Malicious.flags.Hotbarslots == "Slot 5" then
		_G.Hotbarslot = "slot05"
	elseif Malicious.flags.Hotbarslots == "Slot 6" then
		_G.Hotbarslot = "slot06"
	end
end)
Malicious:Section("Gun Mod Settings")
local Infammo = Malicious:Toggle("Inf Ammo",{flag = "Infammo"})
local Nospreadrecoil = Malicious:Toggle("No Spread/Recoil",{flag = "Nospreadrecoil"})
local Fastfirerate = Malicious:Toggle("Fast Firerate",{flag = "Fastfirerate"})
local Automatic = Malicious:Toggle("Automatic",{flag = "Automatic"})
Malicious:Section("Hitboxes")
local Torsohitbox = Malicious:Toggle("Torso Hitboxes",{flag = "Torsohitbox"},function()
	while Malicious.flags.Torsohitbox do wait()
		if Malicious.flags.Torsohitbox then
			for _,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name ~= game:GetService("Players").LocalPlayer.Name then
					pcall(function()
					v.Character.HumanoidRootPart.Size = Vector3.new(Malicious.flags.Torsohitboxsize,Malicious.flags.Torsohitboxsize,Malicious.flags.Torsohitboxsize)
					v.Character.HumanoidRootPart.Transparency = 0.6
					v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
					v.Character.HumanoidRootPart.Material = "Neon"
					v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
		end
	end
	if not Malicious.flags.Torsohitbox then
		for _,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name ~= game:GetService('Players').LocalPlayer.Name then
				pcall(function()
				v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
				v.Character.HumanoidRootPart.Transparency = 1
				end)
			end
		end
	end
end)
local Torsohitboxsize = Malicious:Slider("Torso Hitbox",{precise = false;default = 2;min = 2;max = 10;flag = "Torsohitboxsize"})
local Headhitbox = Malicious:Toggle("Head Hitboxes",{flag = "Headhitbox"},function()
end)
--Non Malicious Section:
local Nonmalicious = Library:CreateWindow("Non Malicious")
Nonmalicious:Section("Semi/Auto Healing")

--Misc Section:
local Misc = Library:CreateWindow("Misc")
Misc:Section("Crafting")

--Visual Section:
local Visual = Library:CreateWindow("Visual")
Visual:Section("ESP")





















--Settings Section:
local Settings = Library:CreateWindow("Settings")
Settings:Section("GUI Settings")
Settings:Bind("Hide GUI",{flag = "Hidegui";kbonly = true;default = Enum.KeyCode.P;},function()
	if game.CoreGui.ScreenGui.Container.Visible == false then
		game.CoreGui.ScreenGui.Container.Visible = true else
		game.CoreGui.ScreenGui.Container.Visible = false
	end
end)
local Savesettings = Settings:Button("Save Settings",function()
	Settings = game:service'HttpService':JSONDecode(readfile("Settings.cfg"))
	local Defaultsettings = {}
	local Settings
	if not pcall(function() readfile("Settings.cfg") end) then writefile("Settings.cfg", game:service'HttpService':JSONEncode(DefaultSettings)) end
	local function Save()
		writefile("Settings.cfg",game:service'HttpService':JSONEncode(Settings))
	end
end)
local Credits = Settings:Button("Click for Credits",function()
	game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Credits - Wally's UI Library";Text = "Credit goes to Wally for his UI Library.";Duration = 3}) wait(4.2)
	game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Credits - Infinite Yield";Text = "Credit goes to Edge, Zwolf, & Moon for their Infinite Yield script.";Duration = 3}) wait(4.2)
	game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Credits - Owl Hub";Text = "Credit goes to Google Chrome & CriShoux for their Owl Hub script.";Duration = 3}) wait(4.2)
	game:GetService("StarterGui"):SetCore("SendNotification",{Title = "The Rest!";Text = "Credit to all the other scripts that I use to put this together.";Duration = 3})
end)
Settings:Section("Made By: Pans#1714")
Settings:Section("Discord Server: M9eJepY")
local Copycode = Settings:Button("Click to Copy Code",function()
    setclipboard("https://discord.gg/M9eJepY")
end)