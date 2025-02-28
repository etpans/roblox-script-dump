loadfile("proxima.lua")()

local ws = game:GetService("Workspace")
local plrs = game:GetService("Players")
local rpls = game:GetService("ReplicatedStorage")
local light = game:GetService("Lighting")
local http = game:GetService("HttpService")
local runs = game:GetService("RunService")
local core = game:GetService("CoreGui")
local lplr = plrs.LocalPlayer
local mouse = lplr:GetMouse()
local camera = ws.CurrentCamera

local r, g, b = library.round(library.flags["Menu Accent Color"])

if game.PlaceId == 6803256560 or game.PlaceId == 7176980618 then
    character = lplr.Character or lplr.CharacterAdded:Wait()
    data = lplr:WaitForChild("Data")
    remote = rpls:WaitForChild("Remotes")
end

local GeneralTab = library:AddTab("General")
local GeneralColumn1 = GeneralTab:AddColumn()
local GeneralColumn2 = GeneralTab:AddColumn()

local AutoSection = GeneralColumn1:AddSection("Automatic")
AutoSection:AddToggle({text = "Auto Join Enabled", callback = function(State)
    if State and library.flags["Auto Join Enabled"] and game.PlaceId == 6737540754 then
        rpls:WaitForChild("RemoteEvent"):FireServer(library.flags["Auto Join Server"])
    end
end}):AddList({text = "Auto Join Server", values = {"PVE", "PVP"}, value = "PVE"})
AutoSection:AddToggle({text = "Auto Quest", callback = function(State)
    if State and game.PlaceId == 7176980618 then
        library:AddConnection(runService.RenderStepped, "Auto Quest", function()
            if library.flags["Auto Quest"] then
                if data.Quest.QuestVal.Value == 0 and data.QuestCooldown.Value == 0 then
                    remote.DialogueEvent:InvokeServer(ws.NPCs.Levi, "I want to do a quest")
                end
            else
                library.connections["Auto Quest"]:Disconnect()
            end
        end)
    end
end})
AutoSection:AddToggle({text = "Auto Remove Injuries", callback = function(State)
    if State and game.PlaceId == 7176980618 or game.PlaceId == 6803256560 then
        library:AddConnection(runService.RenderStepped, "Remove Injuries", function()
            if library.flags["Auto Remove Injuries"] then
                for i, v in pairs(data:FindFirstChild("Injuries"):GetChildren()) do
                    v.Parent = nil
                end
            else
                library.connections["Remove Injuries"]:Disconnect()
            end
        end)
    end
end})
--[[AutoSection:AddList({flag = "Injuries", values = {"Everything", "Visual Only"}, value = "Everything", callback = function()
end})]]
AutoSection:AddToggle({text = "Auto Reload Blades", callback = function(State)
    if State and game.PlaceId == 6803256560 then
        if data.BladeDurability.Value == 0 then
            remote.ODM:FireServer({"ReloadBlades"})
        end
        library:AddConnection(data.BladeDurability.Changed, "Auto Reload Blades", function()
            if library.flags["Auto Reload Blades"] then
                if data.BladeDurability.Value == 0 then
                    repeat wait()
                        remote.ODM:FireServer({"ReloadBlades"})
                    until data.BladeDurability.Value ~= 0
                end
            end
        end)
    else
        if library.connections["Auto Reload Blades"] then
            library.connections["Auto Reload Blades"]:Disconnect()
        end
    end
end})
AutoSection:AddToggle({text = "Low Blades Notification", callback = function(State)
    if State and game.PlaceId == 6803256560 then
        library:AddConnection(data.BladesLeft.Changed, "Low Blade Notification", function()
            if library.flags["Low Blades Notification"] then
                if data.BladesLeft.Value == library.flags["Blades Left"] then
                    library:SendNotification(3, "You have "..data.BladesLeft.Value.." blade(s) left", 1)
                end
            end
        end)
    else
        if library.connections["Low Blades Notification"] then
            library.connections["Low Blades Notification"]:Disconnect()
        end
    end
end}):AddSlider({text = "Blades Left", min = 0, max = 5, value = 1})
--AutoSection:AddToggle({text = "Auto Pickup Mods"})
--AutoSection:AddDivider("Private Servers")
--AutoSection:AddToggle({text = "Auto Join Private Server"}):AddList({})

--auto join pve
    --confirmation
--auto quest
--auto remove injuries
    --visual injuries only
--auto reload blades
    --low notification
    --blade amount
--auto pickup mods (magnitute and teleport under map and back)
--auto join private server
    --dropdown
    --confirmation
--

local SquadSection = GeneralColumn1:AddSection("Squad")
SquadSection:AddToggle({text = "Auto Invite", callback = function(State)
    if State then
        library:AddConnection(plrs.PlayerAdded, "Invite Player", function(Player)
            if library.flags["Auto Invite"] then
                wait(1.5 + library.flags["Invite Delay"])
                if library.flags["Ignore Squads"] then
                    remote.Squad:FireServer("Invite", tostring(Player))
                    if library.flags["Invite Notification"] then
                        library:SendNotification(3, "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>"..tostring(Player).."</font> has been invited1", 4)
                    end
                else
                    if Player:WaitForChild("Data"):WaitForChild("Squad").Value == "" then
                        remote.Squad:FireServer("Invite", tostring(Player))
                    end
                    if library.flags["Invite Notification"] then
                        library:SendNotification(3, "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>"..tostring(Player).."</font> has been invited2", 4)
                    end
                end
            end
        end)
    else
        if library.connections["Invite Player"] then
            library.connections["Invite Player"]:Disconnect()
        end
    end
end}):AddSlider({text = "Invite Delay", suffix = "s", min = 0, max = 5, value = 0})
SquadSection:AddToggle({text = "Ignore Squads"})
SquadSection:AddToggle({text = "Invite Notification"})
SquadSection:AddButton({text = "Invite All", callback = function()
    local players = 0 
    for i, v in pairs(plrs:GetPlayers()) do
        if v.Name ~= lplr.Name then
            if library.flags["Ignore Squads"] then
                remote.Squad:FireServer("Invite", tostring(v))
                players = players + 1
            else
                if v.Data:WaitForChild("Squad").Value == "" then
                    remote.Squad:FireServer("Invite", tostring(v))
                    players = players + 1
                end
            end
        end
    end
    if library.flags["Invite Notification"] then
        if players == 0 then
            library:SendNotification(3, "Nobody has been invited", 2)
        else
            library:SendNotification(3, "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>"..players.."</font> player(s)\nhave been invited", 4)
        end
    end
end})

--auto invite
    --invite delay
    --invite all on join
    --ignore squads
--notification
--invite all

local PlayerSection = GeneralColumn2:AddSection("Player")
--[[
PlayerSection:AddToggle({text = "Auto Run", callback = function(State)
    if State then
        Running = false
        local Animation = Instance.new("Animation")
        Animation.AnimationId = "rbxassetid://6889413515"
        local Animation2 = Instance.new("Animation")
        Animation2.AnimationId = "rbxassetid://6821636733"

        ODMRun = character.Humanoid:LoadAnimation(Animation)
        NormalRun = character.Humanoid:LoadAnimation(Animation2)

        if library.flags["Auto Run"] then
            library:AddConnection(inputService.InputBegan, "Auto Run Started", function(input)
                if input.KeyCode.Name == "W" then
                    if not character:FindFirstChild("LeftBlade") then
                        NormalRun:Play()
                    else
                        ODMRun:Play()
                    end
                    character.Humanoid.WalkSpeed = library.flags["Speed"]
                    Running = true
                end
            end)
            library:AddConnection(inputService.InputEnded, "Auto Run Ended", function(input)
                if input.KeyCode.Name == "W" then
                    NormalRun:Stop()
                    ODMRun:Stop()
                    character.Humanoid.WalkSpeed = 16
                    Running = false
                end
            end)
        end
    else
        if library.connections["Auto Run Started"] then
            library.connections["Auto Run Started"]:Disconnect()
            library.connections["Auto Run Ended"]:Disconnect()
            NormalRun:Stop()
            ODMRun:Stop()
            character.Humanoid.WalkSpeed = 16
            Running = false
        end
    end
end}):AddSlider({text = "Speed", min = 30, max = 45, value = 30, callback = function(Speed)
    if library.flags["Auto Run"] and Running then
        character.Humanoid.WalkSpeed = Speed
    end
end})]]
PlayerSection:AddToggle({text = "Anti-Reset", callback = function(State)
    if State and game.PlaceId == 6803256560 then
        local function Return()
            lplr.PlayerGui.Main.Death.Return.Visible = false
            lplr.PlayerGui.Main.Death.LastWind.Visible = false
            remote.ReturnToLobby:FireServer()
            library:SendNotification(5, "Teleporting to the lobby...")
        end

        if library.flags["Anti-Reset"] then
            if data.Dead.Value == true then
                Return()
            end
            if lplr:FindFirstChild("IsGrabbed") then
                library:SendNotification(5, "Do <i>not</i> leave the game\nfor <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>anti-reset</font> to work", 1)
            end
        end

        library:AddConnection(lplr.ChildAdded, "Grabbed Notification", function(Grabbed)
            if library.flags["Anti-Reset"] and Grabbed.Name == "IsGrabbed" then
                library:SendNotification(5, "Do <i>not</i> leave the game\nfor <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>anti-reset</font> to work", 1)
            end
        end)
        library:AddConnection(data.Dead.Changed, "Anti-Reset", function()
            if library.flags["Anti-Reset"] and data.Dead.Value == true then
                Return()
            end
        end)
    else
        if library.connections["Grabbed Notification"] then
            library.connections["Grabbed Notification"]:Disconnect()
            library.connections["Anti-Reset"]:Disconnect()
            lplr.PlayerGui.Main.Death.Return.Visible = true
            lplr.PlayerGui.Main.Death.LastWind.Visible = true
        end
    end
end})
--auto run
--toggle fov
    --field of view
--

local TeleportSection = GeneralColumn2:AddSection("Teleports")
TeleportSection:AddButton({text = "Return to Lobby", callback = function()
    if game.PlaceId == 6803256560 then
        remote.ReturnToLobby:FireServer()
        library:SendNotification(5, "Teleporting to the lobby...")
    else
        library:SendNotification(3, "Not currently in a mission", 2)
    end
end})

TeleportSection:AddButton({text = "Teleport to Supplies", callback = function()
    if game.PlaceId == 6803256560 then
        local shortestDistance = math.huge
        for i, v in pairs(game:GetService("Workspace").SupplyStations:GetChildren()) do
            if v.Name == "Blades" then
                local magnitude = (v.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if magnitude < shortestDistance then
                    character.HumanoidRootPart.CFrame = v.CFrame
                    shortestDistance = magnitude
                end
            end
        end
    else
        library:SendNotification(3, "Not currently in a mission", 2)
    end
end})

TeleportSection:AddButton({text = "Teleport to Spawn", callback = function()
    if game.PlaceId == 6803256560 then
        character.HumanoidRootPart.CFrame = ws:WaitForChild("Effects").SpawnLocation.CFrame
    else
        library:SendNotification(3, "Not currently in a mission", 2)
    end
end})
--[[ too dangerous
TeleportSection:AddButton({text = "Teleport to Titan Nape", callback = function()
    if game.PlaceId == 6803256560 then
        local shortestDistance = math.huge
        for i, v in pairs(game:GetService("Workspace").Titans:GetChildren()) do
            if v.ClassName == "Model" then
                local magnitude = (v.Hitboxes.Nape.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if magnitude < shortestDistance then
                    character.HumanoidRootPart.CFrame = v.Hitboxes.Nape.CFrame
                    remote.ODM:FireServer({"StartSwing", "Joe biden is in my Veins\nJoe biden is in my Veins\nJoe biden is in my Veins\nJoe biden is in my Veins\nJoe biden is in my Veins\nJoe biden is in my Veins\nJoe biden is in my Veins"})
                    remote.ODM:FireServer({"EndSwing", "Joe biden is in my Veins\nJoe biden is in my Veins\nJoe biden is in my Veins\nJoe biden is in my Veins\nJoe biden is in my Veins\nJoe biden is in my Veins\nJoe biden is in my Veins"})
                    shortestDistance = magnitude
                end
            end
        end
    else
        library:SendNotification(3, "Not currently in a mission", 2)
    end
end})]]

TeleportSection:AddDivider("Binds")
TeleportSection:AddBind({text = "Lobby TP Key", callback = library.options["Return to Lobby"].callback})
TeleportSection:AddBind({text = "Supply TP Key", nomouse = true, callback = library.options["Teleport to Supplies"].callback})
TeleportSection:AddBind({text = "Spawn TP Key", nomouse = true, callback = library.options["Teleport to Spawn"].callback})
--TeleportSection:AddBind({text = "Titan TP Key", nomouse = true, callback = library.options["Teleport to Titan Nape"].callback})

---ESPPPP
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
local FFC = workspace.FindFirstChild
local GBB = workspace.GetBoundingBox
local FFA = workspace.FindFirstAncestor
local FFCoC = workspace.FindFirstChildOfClass
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

--Get functions
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

--Player data
local ESPObjects = {}

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

library:AddConnection(workspace.ChildAdded, function(Obj)
    if Obj.ClassName == "Camera" then
        Camera = Obj
        WTSP = Obj.WorldToScreenPoint
        WTVP = Obj.WorldToViewportPoint
    end
end)

local Draw = library:Create("Circle", {NumSides = 64, Thickness = 1})

local CrosshairTop = library:Create("Square", {Filled = true})
local CrosshairLeft = library:Create("Square", {Filled = true})
local CrosshairRight = library:Create("Square", {Filled = true})
local CrosshairBottom = library:Create("Square", {Filled = true})

--Aimbot Module

library.Aimbot = {
    Target = nil,
    Player = nil,
    Distance = nil,
    Position = nil,
    Position3d = nil,
    LastPosition = V3Empty,
    PositionOffset = nil,
    PositionOffset2d = nil,
    Part = nil,
    OnScreen = false,
    LastVisible = false,
    Step = 0,
    OldStep = 0,
    AutoShootStep = 0
}

--Esp module
local VisualsTab = library:AddTab("Visuals")
local VisualsColumn1 = VisualsTab:AddColumn()
local VisualsColumn2 = VisualsTab:AddColumn()

local HealthBarAddon = Vector2.new(3)
local PlayerEspSection = VisualsColumn1:AddSection("ESP")
local OldStep = 0
PlayerEspSection:AddToggle({text = "Enabled", flag = "Esp Enabled", callback = function(State)
    if not State then
        --RadarWindow.Visible = false
        if library.connections["Player ESP"] then
            library.connections["Player ESP"]:Disconnect()
            for _, v in next, ESPObjects do
                v.OOVArrow.Visible = false
                v.Invis()
                v.InvisChams()
                v.InvisChamsOutline()
            end
        end

        return
    end

    --RadarWindow.Visible = library.flags["Radar Enabled"]
    library:AddConnection(runService.RenderStepped, "Player ESP", function(Step)
        OldStep = OldStep + Step
        if OldStep < 0.016 then return end
        OldStep = 0

        for Player, Data in next, Players do
            if Player == Client then continue end
            local Objects = ESPObjects[Player]
            local Character = Data.Character

            local Show
            local Team = Data.Enemy
            if Data.Whitelist then
                Show = library.flags["Esp Show Whitelisted"]
            else
                Show = Data.Priority or library.flags["Esp Enabled For"][Team and "Enemies" or "Teammates"]
            end

            if Show and Character then
                local Health = Data.Health

                if Health > 0.1 then
                    Team = Team and "Enemy" or "Team"

                    local Pos, Size = GBB(Character)
                    local RootPart = FFC(Character, "HumanoidRootPart")
                    if RootPart and (Pos.Position - RootPart.Position).Magnitude > 5 then
                        Pos = RootPart.CFrame
                    end

                    local Distance = (Camera.CFrame.p - Pos.Position).Magnitude
                    if Distance < library.flags["Esp Max Distance"] then

                        local ScreenPosition, OnScreen = WTVP(Camera, Pos.Position)

                        local ClientChar = Players[Client].Character
                        local Ignores = {Camera, ClientChar}
                        local Hit = RayCheck(ClientChar, Pos.Position, Distance)
                        Hit = Hit and Hit.Instance and FFA(Hit.Instance, Character.Name)
                        Hit = Hit and Hit == Character
                        local Occluded = Hit and " " or " Occluded "

                        local Visible = true
                        if library.flags[Team .. " Visible Only"] then
                            Visible = Hit ~= nil
                        end

                        local Color = (library.flags["Highlight Target"] and library.Aimbot.Player == Player and library.flags["Aimbot Highlight Color"])
                        Color = Color or (Data.Priority and library.flags["Player Priority Color"] or Data.Whitelist and library.flags["Player Whitelist Color"])
                        Color = Color

                        --
                        if library.flags["Radar Enabled"] and Distance < RadarWindow.Radius then
                            Objects.RadarBlip.Visible = true

                            local RelativePos = Camera.CFrame:Inverse() * Pos.Position
                            local Middle = Camera.ViewportSize / 2
                            local Degrees = math.deg(math.atan2(-RelativePos.Y, RelativePos.X)) * math.pi / 180
                            local EndPos = Middle + (Vector2.new(math.cos(Degrees), math.sin(Degrees)) * Distance)

                            Objects.RadarBlip.Position = EndPos
                            Objects.RadarBlip.Color = Color or Color3.new(1, 1, 1)

                            if not Objects.Visible then
                                continue
                            end
                        else
                            Objects.RadarBlip.Visible = false
                        end
                        --]]

                        if Visible then
                            local Transparency = (library.Aimbot.Player == Player or Data.Priority) and 1 or 1 - (Distance / library.flags["Esp Max Distance"])

                            if OnScreen then
                                Objects.Visible = true
                                Objects.OOVArrow.Visible = false

                                --local xMin, yMin = 9e9, 9e9
                                --local xMax, yMax = 0, 0

                                local BoxColor = Color or library.flags[Team .. Occluded .. "Box Color"]
                                local TextColor = Color or library.flags[Team .. Occluded .. "Info Color"]
                                local LookColor = Color or library.flags[Team .. Occluded .. "Look Color"]
                                local ChamsColor = Color or library.flags[Team .. Occluded .. "Chams Color"]
                                local ChamsOutlineColor = Color or library.flags[Team .. Occluded .. "Chams Outline Color"]
                                local DirectionColor = Color or library.flags[Team .. Occluded .. "Direction Color"]

                                --Chams
                                if library.flags[Team .. " Chams Enabled"] and Distance < 600 then
                                    Objects.ChamsVisible = true
                                    Objects.Chams.Parent = library.base
                                    Objects.ChamsStep = Objects.ChamsStep + Step
                                    if Objects.ChamsStep > 0.2 then
                                        Objects.ChamsStep = 0
                                        for _, PartName in next, UseBodyParts do
                                            local Part = FFC((Character), PartName, true)
                                            if Part then
                                                local Cham = FFC(Objects.Chams, PartName) or (function()
                                                    return library:Create("BoxHandleAdornment", {
                                                        Name = PartName,
                                                        AlwaysOnTop = true,
                                                        ZIndex = 2,
                                                        Parent = Objects.Chams
                                                    })
                                                end)()

                                                Cham.Size = Part.Size
                                                Cham.Adornee = Part
                                                Cham.Transparency = library.flags[Team .. " Chams Transparency"]
                                                Cham.Color3 = ChamsColor

                                                if library.flags[Team .. " Chams Outline"] then
                                                    Objects.ChamsOutlineVisible = true
                                                    Objects.ChamsOutline.Parent = library.base
                                                    Cham = FFC(Objects.ChamsOutline, PartName) or (function()
                                                        return library:Create("BoxHandleAdornment", {
                                                            Name = PartName,
                                                            AlwaysOnTop = true,
                                                            ZIndex = 1,
                                                            Parent = Objects.ChamsOutline
                                                        })
                                                    end)()

                                                    Cham.Size = Part.Size * 1.2
                                                    Cham.Adornee = Part
                                                    Cham.Transparency = library.flags[Team .. " Chams Transparency"]
                                                    Cham.Color3 = ChamsOutlineColor
                                                else
                                                    if Objects.ChamsOutlineVisible then
                                                        Objects.InvisChamsOutline()
                                                    end
                                                end
                                            else
                                                local Cham = FFC(Objects.Chams, PartName)
                                                if Cham then
                                                    Cham.Visible = false
                                                end
                                                Cham = FFC(Objects.ChamsOutline, PartName)
                                                if Cham then
                                                    Cham.Visible = true
                                                end
                                            end
                                        end
                                    end
                                else
                                    if Objects.ChamsVisible then
                                        Objects.InvisChams()
                                        Objects.InvisChamsOutline()
                                    end
                                end

                                --ESP
                                local Height = (Camera.CFrame - Camera.CFrame.p) * Vector3.new(0, (math.clamp(Size.Y, 1, 10) + 0.5) / 2, 0)
                                Height = math.abs(WTSP(Camera, Pos.Position + Height).Y - WTSP(Camera, Pos.Position - Height).Y)
                                --local ViewportSize = Camera.ViewportSize
                                --local Size = ((ViewportSize.X + ViewportSize.Y) / Distance) * (1 - (Camera.FieldOfView / 200))
                                Size = library.round(Vector2.new(Height / 2, Height))
                                local Position = library.round(Vector2.new(ScreenPosition.X, ScreenPosition.Y) - (Size / 2))

                                if library.flags[Team .. " Box Enabled"] then
                                    Objects.Box.Visible = true
                                    Objects.Box.Color = BoxColor
                                    Objects.Box.Size = Size
                                    Objects.Box.Position = Position
                                    Objects.Box.Transparency = Transparency

                                    Objects.BoxOutline.Visible = true
                                    Objects.BoxOutline.Size = Size + V222
                                    Objects.BoxOutline.Position = Position - V211
                                    Objects.BoxOutline.Transparency = Transparency

                                    Objects.BoxInline.Visible = true
                                    Objects.BoxInline.Size = Size - V222
                                    Objects.BoxInline.Position = Position + V211
                                    Objects.BoxInline.Transparency = Transparency
                                else
                                    Objects.Box.Visible = false
                                    Objects.BoxOutline.Visible = false
                                    Objects.BoxInline.Visible = false
                                end

                                if library.flags[Team .. " Health Enabled"] then
                                    local MaxHealth = Data.MaxHealth
                                    local HealthPerc = Health / MaxHealth
                                    local Position = Position - HealthBarAddon
                                    local Size = Vector2.new(1, Size.Y)

                                    Objects.BarOutline.Visible = true
                                    Objects.BarOutline.Position = Position - V211
                                    Objects.BarOutline.Size = Size + V222
                                    Objects.BarOutline.Transparency = Transparency

                                    Objects.Bar.Visible = true
                                    Objects.Bar.Color = Color3.new(1 - HealthPerc, HealthPerc, 0.2)
                                    Objects.Bar.Position = Position + Vector2.new(0, Size.Y)
                                    Objects.Bar.Size = Vector2.new(1, -Size.Y * HealthPerc)
                                    Objects.Bar.Transparency = Transparency

                                    Objects.HealthText.Visible = HealthPerc < 0.99
                                    Objects.HealthText.Position = Objects.Bar.Position + Objects.Bar.Size - Vector2.new(0, 7)
                                    Objects.HealthText.Text = tostring(library.round(Health)) or ""
                                    Objects.HealthText.Transparency = Transparency
                                else
                                    Objects.BarOutline.Visible = false
                                    Objects.Bar.Visible = false
                                    Objects.HealthText.Visible = false
                                end

                                if library.flags[Team .. " Info"] then
                                    Objects.NameText.Visible = true
                                    Objects.NameText.Text = Player.Name
                                    Objects.NameText.Position = Position + Vector2.new(Size.X / 2, -Objects.NameText.TextBounds.Y - 1)
                                    Objects.NameText.Color = TextColor
                                    Objects.NameText.Transparency = Transparency

                                    Objects.DistanceText.Visible = true
                                    Objects.DistanceText.Text = "[" .. library.round(Distance) .. "m]"
                                    Objects.DistanceText.Position = Position + Vector2.new(Size.X / 2, Size.Y + 2)
                                    Objects.DistanceText.Color = TextColor
                                    Objects.DistanceText.Transparency = Transparency
                                else
                                    Objects.NameText.Visible = false
                                    Objects.DistanceText.Visible = false
                                end

                                if library.flags[Team .. " Look Enabled"] then
                                    HeadPosition = GetHitboxFromChar(Character, "Head")
                                    if HeadPosition then
                                        Objects.LookAt.Visible = true
                                        HeadPosition1 = WTVP(Camera, HeadPosition.Position)
                                        local To = WTVP(Camera, HeadPosition.Position + (HeadPosition.CFrame.LookVector * 8))

                                        Objects.LookAt.From = Vector2.new(HeadPosition1.X, HeadPosition1.Y)
                                        Objects.LookAt.To = Vector2.new(To.X, To.Y)
                                        Objects.LookAt.Color = LookColor
                                        Objects.LookAt.Transparency = Transparency
                                    else
                                        Objects.LookAt.Visible = false
                                    end
                                else
                                    Objects.LookAt.Visible = false
                                end

                                if library.flags[Team .. " Direction Enabled"] then
                                    Objects.DirectionLine.Visible = true

                                    Position = Position + (Size / 2)
                                    local PositionOffset2d = V2Empty
                                    local Diff = (Pos.Position - Data.LastPosition)
                                    if Diff.Magnitude > 0.01 then
                                        PositionOffset2d = library.round(Vector2.new(WTSP(Camera, Pos.Position + (Diff.Unit * 4)).X, Position.Y) - Position)
                                    end

                                    Objects.DirectionLine.From = Position
                                    Objects.DirectionLine.To = Position + PositionOffset2d
                                    Objects.DirectionLine.Color = DirectionColor
                                    Objects.DirectionLine.Transparency = Transparency

                                    if Distance < 600 then
                                        Objects.DirectionDot.Visible = true
                                        Objects.DirectionDot.Position = Objects.DirectionLine.To - V233
                                        Objects.DirectionDot.Color = DirectionColor
                                        Objects.DirectionDot.Transparency = Transparency
                                    else
                                        Objects.DirectionDot.Visible = false
                                    end
                                else
                                    Objects.DirectionLine.Visible = false
                                    Objects.DirectionDot.Visible = false
                                end

                                Data.LastPosition = Pos.Position
                                continue
                            end
                            if library.flags[Team .. " OOV Arrows"] then
                                Objects.OOVArrow.Visible = true
                                Objects.OOVArrow.Color = Color or library.flags[Team .. Occluded .. "OOV Arrows Color"]

                                local RelativePos = Camera.CFrame:Inverse() * Pos.Position
                                local Middle = Camera.ViewportSize / 2
                                local Degrees = math.deg(math.atan2(-RelativePos.Y, RelativePos.X)) * math.pi / 180
                                local EndPos = Middle + (Vector2.new(math.cos(Degrees), math.sin(Degrees)) * library.flags[Team .. " Out Of View Scale"])

                                Objects.OOVArrow.PointB = EndPos + (-(Middle - EndPos).Unit * 15)
                                Objects.OOVArrow.PointA = EndPos
                                Objects.OOVArrow.PointC = EndPos
                                Objects.OOVArrow.Transparency = Transparency

                                if not Objects.Visible then
                                    continue
                                end
                            end
                        end
                    end
                end
            end

            Objects.OOVArrow.Visible = false
            if Objects.Visible then
                Objects.Invis()
                Objects.InvisChams()
                Objects.InvisChamsOutline()
                Objects.InvisRadar()
            end
        end
    end)
end}):AddList({flag = "Esp Enabled For", values = {"Enemies", --[["Squadmates", "Titans"]]}, multiselect = true}):AddBind({callback = function()
    library.options["Esp Enabled"]:SetState(not library.flags["Esp Enabled"])
end})
PlayerEspSection:AddSlider({text = "Max Distance", textpos = 2, flag = "Esp Max Distance", value = 10000, min = 0, max = 10000})
PlayerEspSection:AddToggle({text = "Show Whitelisted Players", flag = "Esp Show Whitelisted"})
PlayerEspSection:AddDivider("Player List")
PlayerEspSection:AddList({flag = "Player List", textpos = 2, skipflag = true, max = 10, values = (function() local t = {} for _, Player in next, PlayerServ:GetPlayers() do if Player ~= Client then table.insert(t, Player.Name) end end return t end)(), callback = function(Value)
    local Player = Players[FFC(PlayerServ, Value)]
    library.options["Set Player Priority"]:SetState(Player and Player.Priority, true)
    library.options["Set Player Whitelist"]:SetState(Player and Player.Whitelist, true)
end})
PlayerEspSection:AddToggle({text = "Priority", skipflag = true, style = 2, flag = "Set Player Priority", callback = function(State)
    local Player = Players[FFC(PlayerServ, library.flags["Player List"])]
    if Player then
        Player.Priority = State
        if State then
            library.options["Set Player Whitelist"]:SetState(false)
        end
    end
end}):AddColor({flag = "Player Priority Color", color = Color3.fromRGB(255, 255, 0)})
PlayerEspSection:AddToggle({text = "Whitelist", skipflag = true, style = 2, flag = "Set Player Whitelist", callback = function(State)
    local Player = Players[FFC(PlayerServ, library.flags["Player List"])]
    if Player then
        Player.Whitelist = State
        if State then
            library.options["Set Player Priority"]:SetState(false)
        end
    end
end}):AddColor({flag = "Player Whitelist Color", color = Color3.fromRGB(0, 255, 255)})
local VisualsWorld = VisualsColumn1:AddSection("Lighting")
VisualsWorld:AddToggle({text = "Clock Time"}):AddSlider({flag = "Clock Time Amount", min = 0, max = 24, float = 0.5, value = LightingSpoof.ClockTime})
VisualsWorld:AddToggle({text = "Brightness"}):AddSlider({flag = "Brightness Amount", min = 0, max = 100, float = 0.5, value = LightingSpoof.Brightness})
VisualsWorld:AddToggle({text = "Ambient", flag = "Ambient Lighting"}):AddColor({flag = "Outdoor Ambient", color = LightingSpoof.OutdoorAmbient}):AddColor({flag = "Indoor Ambient", color = LightingSpoof.Ambient})
VisualsWorld:AddToggle({text = "Color Shift"}):AddColor({flag = "Color Shift Top", color = LightingSpoof.ColorShift_Top})

local VisualsMiscSection = VisualsColumn1:AddSection("Misc")
VisualsMiscSection:AddToggle({text = "FOV Changer"}):AddSlider({flag = "FOV Amount", min = 5, max = 120, value = 75})
VisualsMiscSection:AddButton({text = "Reset", callback = (function()
    if library.flags["FOV Amount"] ~= 75 then
        library.options["FOV Amount"]:SetValue(75)
    end
end)})
VisualsMiscSection:AddToggle({text = "Zoom", flag = "FOV Zoom Enabled"}):AddSlider({flag = "FOV Zoom Amount", min = 5, max = 50}):AddBind({flag = "FOV Zoom Key", mode = "hold"})

VisualsMiscSection:AddDivider("Crosshair")
VisualsMiscSection:AddToggle({text = "Enabled", flag = "Crosshair Enabled", callback = function(State)
    library.options["Crosshair T-Shape"].main.Visible = State
    library.options["Crosshair Size"].main.Visible = State
    library.options["Crosshair Gap"].main.Visible = State
    library.options["Crosshair Thickness"].main.Visible = State
    CrosshairTop.Visible = State and not library.flags["Crosshair T-Shape"]
    CrosshairLeft.Visible = State
    CrosshairRight.Visible = State
    CrosshairBottom.Visible = State
end}):AddColor({callback = function(Color)
    CrosshairTop.Color = Color
    CrosshairLeft.Color = Color
    CrosshairRight.Color = Color
    CrosshairBottom.Color = Color
end, trans = 1, calltrans = function(Transparency)
    CrosshairTop.Transparency = Transparency
    CrosshairLeft.Transparency = Transparency
    CrosshairRight.Transparency = Transparency
    CrosshairBottom.Transparency = Transparency
end})
VisualsMiscSection:AddToggle({text = "T-Shape", flag = "Crosshair T-Shape", callback = function(State)
    CrosshairTop.Visible = library.flags["Crosshair Enabled"] and not State
end})
VisualsMiscSection:AddSlider({text = "Size", textpos = 2, flag = "Crosshair Size", min = 1, max = 500, callback = function(Value)
    local Thickness = library.flags["Crosshair Thickness"]
    CrosshairTop.Size = Vector2.new(Thickness, -Value)
    CrosshairLeft.Size = Vector2.new(-Value, Thickness)
    CrosshairRight.Size = Vector2.new(Value, Thickness)
    CrosshairBottom.Size = Vector2.new(Thickness, Value)
end})
VisualsMiscSection:AddSlider({text = "Gap", textpos = 2, flag = "Crosshair Gap", min = 0, max = 20, float = 0.5})
VisualsMiscSection:AddSlider({text = "Thickness", textpos = 2, flag = "Crosshair Thickness", min = 1, max = 20, float = 0.5, callback = function(Value)
    local Size = library.flags["Crosshair Size"]
    CrosshairTop.Size = Vector2.new(Value, -Size)
    CrosshairLeft.Size = Vector2.new(-Size, Value)
    CrosshairRight.Size = Vector2.new(Size, Value)
    CrosshairBottom.Size = Vector2.new(Value, Size)
end})

local PlayerEspEnemySection = VisualsColumn2:AddSection("Players")
PlayerEspEnemySection:AddToggle({text = "Visible Only", flag = "Enemy Visible Only"})

PlayerEspEnemySection:AddToggle({text = "Box", flag = "Enemy Box Enabled"}):AddColor({flag = "Enemy Occluded Box Color", color = Color3.fromRGB(245, 120, 65)}):AddColor({flag = "Enemy Box Color", color = Color3.fromRGB(240, 40, 50)})

PlayerEspEnemySection:AddToggle({text = "Info", flag = "Enemy Info"}):AddColor({flag = "Enemy Occluded Info Color", color = Color3.fromRGB(255, 140, 30)}):AddColor({flag = "Enemy Info Color", color = Color3.fromRGB(240, 30, 40)})

PlayerEspEnemySection:AddToggle({text = "Health", flag = "Enemy Health Enabled"})

PlayerEspEnemySection:AddToggle({text = "Out Of View", flag = "Enemy OOV Arrows", callback = function(State)
    library.options["Enemy Out Of View Scale"].main.Visible = State
end}):AddColor({flag = "Enemy Occluded OOV Arrows Color", color = Color3.fromRGB(255, 140, 30)}):AddColor({flag = "Enemy OOV Arrows Color", color = Color3.fromRGB(240, 30, 40)})
PlayerEspEnemySection:AddSlider({text = "Scale", textpos = 2, flag = "Enemy Out Of View Scale", min = 100, max = 500})

PlayerEspEnemySection:AddToggle({text = "Look Direction", flag = "Enemy Look Enabled"}):AddColor({flag = "Enemy Occluded Look Color", color = Color3.fromRGB(240, 120, 80)}):AddColor({flag = "Enemy Look Color", color = Color3.fromRGB(240, 60, 20)})

--PlayerEspEnemySection:AddToggle({text = "Velocity", flag = "Enemy Direction Enabled"}):AddColor({flag = "Enemy Occluded Direction Color", color = Color3.fromRGB(240, 120, 80)}):AddColor({flag = "Enemy Direction Color", color = Color3.fromRGB(240, 60, 20)})

PlayerEspEnemySection:AddToggle({text = "Chams", flag = "Enemy Chams Enabled"}):AddSlider({text = "Transparency", flag = "Enemy Chams Transparency", min = 0, max = 1, float = 0.1}):AddColor({flag = "Enemy Occluded Chams Color", color = Color3.fromRGB(245, 120, 65)}):AddColor({flag = "Enemy Chams Color", color = Color3.fromRGB(240, 40, 50)})
PlayerEspEnemySection:AddToggle({text = "Outline", flag = "Enemy Chams Outline"}):AddColor({flag = "Enemy Occluded Chams Outline Color", color = Color3.fromRGB(245, 120, 65)}):AddColor({flag = "Enemy Chams Outline Color", color = Color3.fromRGB(240, 40, 50)})
--[[
local PlayerEspTeamSection = VisualsColumn2:AddSection("Teammates")
PlayerEspTeamSection:AddToggle({text = "Visible Only", flag = "Team Visible Only"})

PlayerEspTeamSection:AddToggle({text = "Box", flag = "Team Box Enabled"}):AddColor({flag = "Team Occluded Box Color", color = Color3.fromRGB(20, 50, 255)}):AddColor({flag = "Team Box Color", color = Color3.fromRGB(40, 255, 180)})

PlayerEspTeamSection:AddToggle({text = "Info", flag = "Team Info"}):AddColor({flag = "Team Occluded Info Color", color = Color3.fromRGB(20, 120, 255)}):AddColor({flag = "Team Info Color", color = Color3.fromRGB(40, 240, 130)})

PlayerEspTeamSection:AddToggle({text = "Health", flag = "Team Health Enabled"})

PlayerEspTeamSection:AddToggle({text = "Out Of View", flag = "Team OOV Arrows", callback = function(State)
    library.options["Team Out Of View Scale"].main.Visible = State
end}):AddColor({flag = "Team Occluded OOV Arrows Color", color = Color3.fromRGB(20, 120, 255)}):AddColor({flag = "Team OOV Arrows Color", color = Color3.fromRGB(40, 240, 130)})
PlayerEspTeamSection:AddSlider({text = "Scale", textpos = 2, flag = "Team Out Of View Scale", min = 100, max = 500})

PlayerEspTeamSection:AddToggle({text = "Look Direction", flag = "Team Look Enabled"}):AddColor({flag = "Team Occluded Look Color", color = Color3.fromRGB(40, 80, 230)}):AddColor({flag = "Team Look Color", color = Color3.fromRGB(40, 250, 100)})

--PlayerEspTeamSection:AddToggle({text = "Velocity", flag = "Team Direction Enabled"}):AddColor({flag = "Team Occluded Direction Color", color = Color3.fromRGB(240, 120, 80)}):AddColor({flag = "Team Direction Color", color = Color3.fromRGB(240, 60, 20)})

PlayerEspTeamSection:AddToggle({text = "Chams", flag = "Team Chams Enabled"}):AddSlider({text = "Transparency", flag = "Team Chams Transparency", min = 0, max = 1, float = 0.5}):AddColor({flag = "Team Occluded Chams Color", color = Color3.fromRGB(20, 50, 255)}):AddColor({flag = "Team Chams Color", color = Color3.fromRGB(40, 255, 180)})
PlayerEspTeamSection:AddToggle({text = "Outline", flag = "Team Chams Outline"}):AddColor({flag = "Team Occluded Chams Outline Color", color = Color3.fromRGB(80, 100, 255)}):AddColor({flag = "Team Chams Outline Color", color = Color3.fromRGB(80, 255, 200)})



local PlayerEspTeamSection = VisualsColumn2:AddSection("Titans")
PlayerEspTeamSection:AddToggle({text = "Visible Only", flag = "Team Visible Only"})

PlayerEspTeamSection:AddToggle({text = "Box", flag = "Team Box Enabled"}):AddColor({flag = "Team Occluded Box Color", color = Color3.fromRGB(20, 50, 255)}):AddColor({flag = "Team Box Color", color = Color3.fromRGB(40, 255, 180)})

PlayerEspTeamSection:AddToggle({text = "Info", flag = "Team Info"}):AddColor({flag = "Team Occluded Info Color", color = Color3.fromRGB(20, 120, 255)}):AddColor({flag = "Team Info Color", color = Color3.fromRGB(40, 240, 130)})

PlayerEspTeamSection:AddToggle({text = "Out Of View", flag = "Team OOV Arrows", callback = function(State)
    library.options["Team Out Of View Scale"].main.Visible = State
end}):AddColor({flag = "Team Occluded OOV Arrows Color", color = Color3.fromRGB(20, 120, 255)}):AddColor({flag = "Team OOV Arrows Color", color = Color3.fromRGB(40, 240, 130)})
PlayerEspTeamSection:AddSlider({text = "Scale", textpos = 2, flag = "Team Out Of View Scale", min = 100, max = 500})

PlayerEspTeamSection:AddToggle({text = "Look Direction", flag = "Team Look Enabled"}):AddColor({flag = "Team Occluded Look Color", color = Color3.fromRGB(40, 80, 230)}):AddColor({flag = "Team Look Color", color = Color3.fromRGB(40, 250, 100)})

--PlayerEspTeamSection:AddToggle({text = "Velocity", flag = "Team Direction Enabled"}):AddColor({flag = "Team Occluded Direction Color", color = Color3.fromRGB(240, 120, 80)}):AddColor({flag = "Team Direction Color", color = Color3.fromRGB(240, 60, 20)})

PlayerEspTeamSection:AddToggle({text = "Chams", flag = "Team Chams Enabled"}):AddSlider({text = "Transparency", flag = "Team Chams Transparency", min = 0, max = 1, float = 0.5}):AddColor({flag = "Team Occluded Chams Color", color = Color3.fromRGB(20, 50, 255)}):AddColor({flag = "Team Chams Color", color = Color3.fromRGB(40, 255, 180)})
PlayerEspTeamSection:AddToggle({text = "Outline", flag = "Team Chams Outline"}):AddColor({flag = "Team Occluded Chams Outline Color", color = Color3.fromRGB(80, 100, 255)}):AddColor({flag = "Team Chams Outline Color", color = Color3.fromRGB(80, 255, 200)})]]

--Hooks
local OldCallingScript
OldCallingScript = hookfunction(getcallingscript, function()
    return OldCallingScript() or {}
end)

local Old_new
Old_new = hookmetamethod(game, "__newindex", function(t, i, v)
    if checkcaller() or not library then return Old_new(t, i, v) end
    if t == Lighting then
        if i == "ClockTime" then
            LightingSpoof[i] = v
            v = library.flags["ClockTime"] and library.flags["Clock Time Amount"] or v
        elseif i == "Brightness" then
            LightingSpoof[i] = v
            v = library.flags["Brightness"] and library.flags["Brightness Amount"] or v
        elseif i == "Ambient" or i == "OutdoorAmbient" then
            LightingSpoof[i] = v
            v = library.flags["Ambient Lighting"] and (i == "Ambient" and library.flags["Indoor Ambient"] or library.flags["Outdoor Ambient"]) or v
        elseif i == "ColorShift_Top" then
            LightingSpoof[i] = v
            v = library.flags["Color Shift"] and library.flags["Color Shift Top"] or v
        end
    elseif t == Camera then
        if i == "FieldOfView" then
            CameraSpoof[i] = v
            v = (library.flags["FOV Zoom Enabled"] and library.flags["FOV Zoom Key"] and (50 - library.flags["FOV Zoom Amount"])) or library.flags["FOV Changer"] and (false and (CameraSpoof.FieldOfView + library.flags["FOV Amount"]) or library.flags["FOV Amount"]) or v
        end
    end

    return Old_new(t, i, v)
end)

local Old_index
Old_index = hookmetamethod(game, "__index", function(t, i)
    if checkcaller() or not library then return Old_index(t, i) end

    if t == Lighting then
        if i == "ClockTime" or i == "Brightness" or i == "Ambient" or i == "OutdoorAmbient" or i == "ColorShift_Top" then
            return LightingSpoof[i]
        end
    elseif t == Camera then
        if i == "FieldOfView" then
            return CameraSpoof[i]
        end
    end

    return Old_index(t, i)
end)

library.flagprefix = nil

if VisualsTab.canInit then
    AddTracker(PlayerServ)
end

--Always running
library:AddConnection(runService.RenderStepped, function()
    local MX, MY = Mouse.X, Mouse.Y + 36
    if library.flags["Mouse Offset"] then
        MX = MX + library.flags["MXO Amount"]
        MY = MY + library.flags["MYO Amount"]
    end

    if Draw.Visible then
        Draw.Position = Vector2.new(MX, MY)
    end

    --if RadarWindow.Visible then
    --	RadarWindow.Position = Vector2.new(MX, MY)
    --end

    if CrosshairBottom.Visible then
        local Thickness = library.flags["Crosshair Thickness"] / 2
        local TX, TY = MX - Thickness, MY - Thickness
        CrosshairTop.Position = Vector2.new(TX, MY - library.flags["Crosshair Gap"])
        CrosshairLeft.Position = Vector2.new(MX - library.flags["Crosshair Gap"], TY)
        CrosshairRight.Position = Vector2.new(MX + library.flags["Crosshair Gap"], TY)
        CrosshairBottom.Position = Vector2.new(TX, MY + library.flags["Crosshair Gap"])
    end
    
    Lighting.ClockTime = library.flags["Clock Time"] and library.flags["Clock Time Amount"] or LightingSpoof.ClockTime
    Lighting.Brightness = library.flags["Brightness"] and library.flags["Brightness Amount"] or LightingSpoof.Brightness
    Lighting.Ambient = library.flags["Ambient Lighting"] and library.flags["Indoor Ambient"] or LightingSpoof.Ambient
    Lighting.OutdoorAmbient = library.flags["Ambient Lighting"] and library.flags["Outdoor Ambient"] or LightingSpoof.OutdoorAmbient
    Lighting.ColorShift_Top = library.flags["Color Shift"] and library.flags["Color Shift Top"] or LightingSpoof.ColorShift_Top

    Camera.FieldOfView = (library.flags["FOV Zoom Enabled"] and library.flags["FOV Zoom Key"] and (50 - library.flags["FOV Zoom Amount"])) or library.flags["FOV Changer"] and (false and (CameraSpoof.FieldOfView + library.flags["FOV Amount"]) or library.flags["FOV Amount"]) or CameraSpoof.FieldOfView
end)

library:Init()
library:selectTab(library.tabs[1])