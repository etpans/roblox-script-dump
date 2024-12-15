--Configurables--
_G.TorosoHitboxEnabled = false
_G.TorsoSize = 10
local TorosoHitboxNotification = true
local NotificationProperties = {
    Text = "{TORSO HITBOX "..(_G.TorosoHitboxEnabled and "EN" or "DIS").."ABLED}",
    Color = Color3.fromRGB(205,165,255),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
}

--Variables--
local Plrs = game:GetService("Players")
local SGui = game:GetService("StarterGui")
local LPlr = Plrs.LocalPlayer

--Notifications--
if TorosoHitboxNotification then
    SGui:SetCore("ChatMakeSystemMessage",NotificationProperties)
end

--Scripts--
if _G.TorosoHitboxEnabled then
    while _G.TorosoHitboxEnabled do wait()
        for _,v in pairs(Plrs:GetPlayers()) do
            if v.Name ~= LPlr.Name then
                pcall(function()
                    v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                    v.Character.HumanoidRootPart.CanCollide = false
                    v.Character.HumanoidRootPart.Material = "Neon"
                    v.Character.HumanoidRootPart.Size = Vector3.new(_G.TorsoSize,_G.TorsoSize,_G.TorsoSize)
                    v.Character.HumanoidRootPart.Transparency = 0.7
                end)
            end
        end
    end
end

if not _G.TorosoHitboxEnabled then
    for _,v in pairs(Plrs:GetPlayers()) do
        if v.Name ~= LPlr.Name then
            pcall(function()
                 v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
                 v.Character.HumanoidRootPart.Transparency = 1
            end)
        end
    end
end