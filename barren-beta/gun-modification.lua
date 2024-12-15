if getgenv().gunmodenabled == nil then
    getgenv().gunmodenabled = true
elseif gunmodenabled then
    getgenv().gunmodenabled = false
else
    getgenv().gunmodenabled = true
end

local lplr = game:GetService("Players").LocalPlayer
local runs = game:GetService("RunService")
local plrgui = lplr.PlayerGui
local swap = game:GetService("ReplicatedStorage").Remotes.SwapSlots
local mt = getrawmetatable(game)
local oldnamecall = mt.__namecall

setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if gunmodenabled and tostring(method) == "FireServer" and tostring(self) == "ChangeAmmo" then
        return
    end
    return oldnamecall(self, ...)
end)
setreadonly(mt, true)

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

if gunmodenabled then
    notification("Gun Modification has been enabled!", 2)
    unequip()
    getgenv().gunmodloop = runs.RenderStepped:Connect(function()
        for i, v in pairs(lplr.Backpack:GetChildren()) do
            if v.ClassName == "Tool" then
                for i, v in pairs(v:GetChildren()) do
                    if v.Name == "Setting" then
                        local setting = require(v)
                        setting.Auto = true
                        setting.FireRate = 0
                        setting.ReloadTime = 0
                        setting.Spread = 0
                        setting.SpreadMax = 0
                        setting.MovingSpreadAddition = 0
                        setting.SpreadCooldownTime = 0
                        setting.ShotsToMaxSpread = 2147483647
                        setting.ADSSpreadReduction = 2147483647
                        setting.CrouchSpreadReduction = 2147483647
                        setting.EquipAnimationTime = 0
                        setting.DropRate = 0
                        setting.ProjectileSpeed = 2147483647
                        setting.MaxCharge = 2147483647
                        setting.Range = 2147483647
                        setting.RecoilCamAmount = 0
                        setting.ShotgunEnabled = false
                        setting.ShotgunReload = false
                        setting.ShellClipinSpeed = 0
                        setting.VisualizerEnabled = false
                        setting.ChargingTime = 0
                        setting.Piercing = 2147483647
                    end
                end
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
    notification("Gun Modification has been disabled!", 2)
    gunmodloop:Disconnect()
    reset()
end
