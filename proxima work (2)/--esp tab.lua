--esp tab
--Variables
local RepStorage = game:GetService("ReplicatedStorage")
local PlayerServ = game:GetService("Players")
local Client = PlayerServ["LocalPlayer"]
local Mouse = Client:GetMouse()
local Settings = settings()
local Players = {}
local Camera = workspace.CurrentCamera
local WTSP = Camera.WorldToScreenPoint
local WTVP = Camera.WorldToViewportPoint
local CameraSpoof = {
    FieldOfView = Camera.FieldOfView
}
local Lighting = game:GetService("Lighting")
local LightingSpoof = {
    ClockTime = Lighting.ClockTime,
    Brightness = Lighting.Brightness,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    ColorShift_Top = Lighting.ColorShift_Top,
}
local NameRequest
local TeamRequest
local HealthRequest
local ClientCharRequest
local Cowboys, Sheriffs = {}, {}
local FFC = workspace.FindFirstChild
local GBB = workspace.GetBoundingBox
local FFA = workspace.FindFirstAncestor
local FFCoC = workspace.FindFirstChildOfClass
local V3Empty = Vector3.new()
local V3101 = Vector3.new(1, 0, 1)
local V2Empty = Vector2.new()
local V211 = Vector2.new(1, 1)
local V222 = Vector2.new(2, 2)
local V233 = Vector2.new(3, 3)

local UniversalBodyParts = {
    "Head",
    "UpperTorso", "LowerTorso", "Torso",
    "Left Arm", "LeftUpperArm", "LeftLowerArm", "LeftHand",
    "Right Arm", "RightUpperArm", "RightLowerArm", "RightHand",
    "Left Leg", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
    "Right Leg", "RightUpperLeg", "RightLowerLeg", "RightFoot"
}

local UseBodyParts = UniversalBodyParts

--functions
local function GetHitboxFromChar(Character, BodyPart)
    BodyPart = BodyPart or "Head"
    if not Character then return end
    return FFC(Character, BodyPart) or FFC(Character, "UpperTorso")
end

local RayParams = RaycastParams.new()
RayParams.FilterType = Enum.RaycastFilterType.Blacklist
RayParams.IgnoreWater = true

local function RayCheck(ClientChar, To, Distance)
    local Ignores = {Camera, ClientChar}
    RayParams.FilterDescendantsInstances = Ignores
    return workspace:Raycast(Camera.CFrame.p, (To - Camera.CFrame.p).Unit * Distance, RayParams)
end

local function Track(Player)
    -- too lazy to add a proper check, discontinued anyway so
    if not (Player.ClassName == "Player" or Player.ClassName == "Folder") then return end

    for i,v in next, ESPObjects do
        if not v.Active then
            v.Active = true
            ESPObjects[Player] = v
            break
        end
    end
    if not ESPObjects[Player] then
        ESPObjects[Player] = {
            ChamsOutline = library:Create("Folder", {Parent = library.base}),
            Chams = library:Create("Folder", {Parent = library.base}),
            ChamsStep = 0,
            BoxOutline = library:Create("Square", {Thickness = 1}),
            BoxInline = library:Create("Square", {Thickness = 1}),
            Box = library:Create("Square", {Thickness = 1}),
            LookAt = library:Create("Line", {Thickness = 1}),
            NameText = library:Create("Text", {Size = 15, Font = 3, Center = true, Outline = true}),
            DistanceText = library:Create("Text", {Size = 15, Font = 3, Center = true, Outline = true}),
            BarOutline = library:Create("Square", {Filled = true}),
            Bar = library:Create("Square", {Filled = true}),
            HealthText = library:Create("Text", {Color = Color3.new(1, 1, 1), Size = 14, Font = 3, Center = true, Outline = true}),
            DirectionLine = library:Create("Line", {Thickness = 1}),
            DirectionDot = library:Create("Square", {Size = Vector2.new(7, 7), Filled = true}),
            --RadarHeight = library:Create("TextLabel", {BackgroundTransparency = 1, Text = "T", TextColor3 = Color3.new(), Font = Enum.Font.SciFi, TextSize = 13}),
            RadarBlip = library:Create("Circle", {Radius = 4, Filled = true}),
            OOVArrow = library:Create"Triangle",
            Active = true,

            Invis = function()
                ESPObjects[Player].Visible = false
                ESPObjects[Player].BoxOutline.Visible = false
                ESPObjects[Player].BoxInline.Visible = false
                ESPObjects[Player].Box.Visible = false
                ESPObjects[Player].BarOutline.Visible = false
                ESPObjects[Player].Bar.Visible = false
                ESPObjects[Player].HealthText.Visible = false
                ESPObjects[Player].LookAt.Visible = false
                ESPObjects[Player].NameText.Visible = false
                ESPObjects[Player].DistanceText.Visible = false
                ESPObjects[Player].DirectionLine.Visible = false
                ESPObjects[Player].DirectionDot.Visible = false
            end,

            InvisChams = function()
                ESPObjects[Player].ChamsVisible = false
                for _, Cham in next, ESPObjects[Player].Chams:GetChildren() do
                    Cham.Transparency = 1
                end
            end,

            InvisChamsOutline = function()
                ESPObjects[Player].ChamsOutlineVisible = false
                for _, Cham in next, ESPObjects[Player].ChamsOutline:GetChildren() do
                    Cham.Transparency = 1
                end
            end,

            InvisRadar = function()
                ESPObjects[Player].RadarVisible = false
                ESPObjects[Player].RadarBlip.Visible = false
            end
        }
    end

    local Character
    local MaxHealth
    Players[Player] = setmetatable({Priority = false, Whitelist = false, LastPosition = V3Empty}, {__index = function(self, index)
        if index == "Character" then
            if Player.ClassName == "Model" then
                Character = Player
            else
                Character = Player.Character or FFC(workspace, Player.Name)
            end

            if Character then 
                return Character
            end
        else
            if not Character then return (index == "Health" or index == "MaxHealth" and 0) end
            if index == "Health" then
                local Health
                local Humanoid = FFCoC(Character, "Humanoid")
                if Humanoid then
                    Health, MaxHealth = Humanoid.Health, Humanoid.MaxHealth
                end
                return Health and (Health > 0 and Health) or 0
            elseif index == "MaxHealth" then
                return MaxHealth or 0
            elseif index == "Enemy" then
                if Client.Team then
                    return Client.Team ~= Player.Team
                else
                    return true
                end
            end
        end

    end})
end

local function AddTracker(Tracking)
    for _,Player in next, Tracking:GetChildren() do
        Track(Player)
    end

    library:AddConnection(Tracking.ChildAdded, function(Player)
        wait(1)
        if Tracking == PlayerServ and library then
            library.options["Player List"]:AddValue(Player.Name)
        end
        Track(Player)
    end)

    library:AddConnection(Tracking.ChildRemoved, function(Player)
        if Players[Player] then
            if table.find(library.options["Player List"].values, Player.Name) then
                if library.hasInit then
                    library.options["Player List"]:RemoveValue(Player.Name)
                end
            end
            Players[Player] = nil
            if ESPObjects[Player] then
                ESPObjects[Player].Active = false
                ESPObjects[Player].OOVArrow.Visible = false
                ESPObjects[Player].Invis()
                ESPObjects[Player].InvisChams()
                ESPObjects[Player].InvisChamsOutline()
                ESPObjects[Player].InvisRadar()
            end
        end
    end)
end

--esp tab
local VisualsTab = library:AddTab("Visuals")
local VisualsColumn1 = VisualsTab:AddColumn()
local VisualsColumn2 = VisualsTab:AddColumn()

