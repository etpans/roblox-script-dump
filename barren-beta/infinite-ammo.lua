if getgenv().infammoenabled == nil then
    getgenv().infammoenabled = true
elseif infammoenabled then
    getgenv().infammoenabled = false
else
    getgenv().infammoenabled = true
end

local lplr = game:GetService("Players").LocalPlayer
local runs = game:GetService("RunService")
local plrgui = lplr.PlayerGui
local swap = game:GetService("ReplicatedStorage").Remotes.SwapSlots
local mt = getrawmetatable(game)
local oldnamecall = mt.__namecall

local function notification(message, seconds)
	pcall(function()
		local properties = plrgui.StarterScripts.ItemControl.MessageFrame:Clone()
		properties.Name = os.time()
		properties.MessageText.Text = message
		properties.Parent = plrgui:WaitForChild("Messages").MessagesFrame
		game.Debris:AddItem(properties, seconds)
	end)
end

local function unequip()
    pcall(function()
        for i, v in pairs(lplr.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = lplr.Backpack
            end
        end
    end)
end

local function reset()
    pcall(function()
        swap:InvokeServer("01", "01")
        swap:InvokeServer("02", "02")
        swap:InvokeServer("03", "03")
        swap:InvokeServer("04", "04")
        swap:InvokeServer("05", "05")
        swap:InvokeServer("06", "06")
    end)
end

setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if infammoenabled and tostring(method) == "FireServer" and tostring(self) == "ChangeAmmo" then
        return
    end
    return oldnamecall(self, ...)
end)
setreadonly(mt, true)

if infammoenabled then
	unequip()
	notification("Infinite Ammo has been enabled!", 2)
    getgenv().infammo = runs.RenderStepped:Connect(function()
        for i, v in pairs(lplr.Backpack:GetChildren()) do
            if v.ClassName == "Tool" then
                for i, v in pairs(v:GetChildren()) do
                    if v.Name == "GunScript_Server" then
                        v.Ammo.Value = 2147483647
                    end
                end
            end
        end
        pcall(function()
            plrgui.GunGUI.Frame.Ammo.Current.Text = "∞"
            plrgui.GunGUI.Frame.Ammo.Max.Text = "∞"
        end)
    end)
else
	notification("Infinite Ammo has been disabled!", 2)
	infammo:Disconnect()
    reset()
end

