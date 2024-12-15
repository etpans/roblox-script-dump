getgenv().infenabled = false

local mt = getrawmetatable(game)
local oldnamecall = mt.__namecall
local lplr = game:GetService("Players").LocalPlayer
local plrgui = lplr.PlayerGui
local ws = game:GetService("Workspace")

--namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if infenabled then
        if tostring(method) == "FireServer" and tostring(self) == "ChangeAmmo" then
            return
        end
    end
    return oldnamecall(self, ...)
end)

setreadonly(mt, true)

--label + change ammo value
if infenabled then 
    getgenv().inftext = game:GetService("RunService").RenderStepped:Connect(function()
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
    inftext:Disconnect()
end
