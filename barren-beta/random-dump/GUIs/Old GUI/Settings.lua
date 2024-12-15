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
	game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Credits - Wally's UI Library";Text = "Credit goes to Wally for his UI Library.";Duration = 3}) wait(4)
	game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Credits - Infinite Yield";Text = "Credit goes to Edge, Zwolf, & Moon for their Infinite Yield script.";Duration = 3}) wait(4)
	game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Credits - Owl Hub";Text = "Credit goes to Google Chrome & CriShoux for their Owl Hub script.";Duration = 3}) wait(4)
	game:GetService("StarterGui"):SetCore("SendNotification",{Title = "The Rest!";Text = "Credit to all the other scripts that I use to put this together.";Duration = 3})
end)
Settings:Section("Made By: Pans#1714")
Settings:Section("Discord Server: M9eJepY")
local Copycode = Settings:Button("Click to Copy Code",function()
    setclipboard("https://discord.gg/M9eJepY")
end)


