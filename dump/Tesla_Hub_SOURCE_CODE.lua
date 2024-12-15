if game.PlaceId ~= 606849621 then
	game:GetService("Players").LocalPlayer:Kick("ur not in jailbreak")
	return
end
if getgenv().TeslaLoaded then
	require(game:GetService("ReplicatedStorage").Game.Notification).new({
		Text = "Tesla is already loaded!",
		Duration = 3
	})
	return
end
wait(0.025)
getgenv().TeslaLoaded = true
local NiggaToggle = {}
wait(0.1)
--api began
table.find = function(t, val)
	for i,v in pairs(t) do
		if v == val then
			return i
		end
	end
end
wrapglobal("getrenv")
wrapglobal("getfenv")
wrapglobal("getgc")
getrenv().lmao = function() return 0/0 end
local Client = {}
Client.Doors = {}
Client.Hashes = {}
for i, v in pairs(getgc(true)) do
    if type(v) == "table" then
        if rawget(v, "Event") and rawget(v, "Fireworks") then
            Client.em = v.em
            Client.Network = v.Event
            Client.Fireworks = v.Fireworks
            Client.GetVehiclePacket = v.GetVehiclePacket
        elseif rawget(v, "OpenFun") and rawget(v, "State") then
			table.insert(Client.Doors, v)
		elseif rawget(v, "ItemData") then
			Client.Guns = v.ItemData
        elseif rawget(v, "Ragdoll") then
            Client.Falling = v
		elseif rawget(v, "Part") and type(rawget(v, "Fun")) == "function" then
			if v.Part.Name == "Donut" then
				Client.GiveDonut = v.Fun 
			elseif v.Part.Name == "JetPackGiver" then
				Client.GiveJetPack = v.Fun
            end
        elseif type(rawget(v, "Heli")) == "table" then
            Client.Vehicle = v
        end
    elseif type(v) == "function" then
        if getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript then -- fetching localscript functions
			local con = getconstants(v)
			if table.find(con, "hems") and #con == 1 then
				Client.AllHashes = getupvalues(v)[2]
			elseif table.find(con, "SequenceRequireState") then
				Client.OpenDoor = v
            elseif table.find(con, "LastVehicleExit") and table.find(con, "tick") then
                Client.ExitCar = v
            elseif table.find(con, "NitroLoop") and table.find(con, "Nitro1") then
                Client.Nitro = v
            elseif table.find(con, "Punch") then
                Client.GuiFunc = v
            elseif table.find(con, "Play") and table.find(con, "Source") and table.find(con, "FireServer") then
                Client.PlaySound = v
            elseif table.find(con, "ShouldBreakout") and #con == 3 then
                Client.PoliceFunction = v
            elseif table.find(con, "PlusCash") then
                Client.PlusCash = v
            elseif table.find(con, "Pick up %s") and not table.find(con, "briefcase") then
                Client.PickItem = getupvalues(v)[1]
            end
        elseif getfenv(v).script == game:GetService("ReplicatedStorage").Game.Inventory then -- fetching inventory function (godmode)
            local con = getconstants(v)
			if table.find(con, "GetLocalVehiclePacket") then
				Client.Unequip = v
            end
        elseif getfenv(v).script == game:GetService("ReplicatedStorage").Game.Garage.GarageUI then -- fetching garage function
            local con = getconstants(v)
            if table.find(con, "Type") and table.find(con, "Make") and table.find(con, "FireServer") then
                Client.SpawnVehicle = v
            end
        elseif getfenv(v).script == game:GetService("ReplicatedStorage").Game.GunShop then -- fetching gunshop function
            local con = getconstants(v)
            if table.find(con, "CanGrab") and table.find(con, "FireServer") then
				Client.GiveGun = v
            end
        elseif type(v) == "function" and getfenv(v).script == game:GetService("ReplicatedStorage").Game.NukeControl then -- fetching nukecontrol
			local con = getconstants(v)
			if table.find(con, "Nuke") and table.find(con, "Shockwave") then
				Client.Nuke = v
			end
        end
    end
end
Client.Arrest = function(plr)
	Client.Network:FireServer(getrenv().ArrestHash, plr.Name)
end
Client.BreakOut = function(plr)
	Client.Network:FireServer(getrenv().BreakOut, plr.Name)
end
Client.PickPocket = function(plr)
	Client.Network:FireServer(getrenv().PickPocket, plr.Name)
end
Client.Hashes.ExitCar = getrenv().ExitCar
Client.Hashes.EatDonut = getrenv().EatDonut
Client.Hashes.TeamChange = getrenv().TeamChange or ""
Client.Hashes.Eject = getrenv().EjectHash
Client.Hashes.Taze = getrenv().TazeHash
Client.Hashes.Equip = getrenv().EquipHash 
Client.Hashes.Damage = getrenv().DamageHash
function Kill(plr)
    assert(typeof(plr) == "Instance" and plr:IsA("Player"), "not player")
    Client.GiveGun({ Part = { Parent = { Name = "PlasmaPistol" } }, CanGrab = true }, true)
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HotbarGui.Container:GetChildren()) do
        if v:IsA("ImageButton") and v.Icon.Image == "rbxassetid://4751591788" then
            Client.Network:FireServer(Client.Hashes.Equip, {i = v.Name, Name = "PlasmaPistol"})
            pcall(function()
                if plr.Character then
                    for i = 1, 10 do
                        Client.Network:FireServer(Client.Hashes.Damage, plr.Character.HumanoidRootPart.Position, plr.Character.HumanoidRootPart)
                    end
                end
            end)
        end
    end
end
function TP(cframe)
	if Client.GetVehiclePacket() then
		if Client.GetVehiclePacket().Model.Name ~= "Volt" or Client.GetVehiclePacket().Model.Name ~= "Patrol" then
			Client.GetVehiclePacket().Model:SetPrimaryPartCFrame(cframe);
			return
		else
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
			return
		end
    else
		Client.Network:FireServer(Client.Hashes.ExitCar)
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
		return
	end
end
function Punch(num)
    setconstant(Client.GuiFunc, table.find(getconstants(Client.GuiFunc), "tick"), "lmao")
    for i = 1, num do
        Client.GuiFunc({Name = "Punch"}, true)
    end
    setconstant(Client.GuiFunc, table.find(getconstants(Client.GuiFunc), "lmao"), "tick")
end
function Equip(name)
	local thing
	for i,v in pairs(getgc(true)) do
		if type(v) == "table" and rawget(v, 'i') and rawget(v, 'Frame') and rawget(v, 'Name') then
			if v.Name == name then
				thing = v
			end
		end
	end
	require(game:GetService("ReplicatedStorage").Game.ItemSystem.ItemSystem).Equip(game:GetService("Players").LocalPlayer, thing)
	return
end
function GrabClickGun()
    for i,v in pairs(workspace.Givers:GetChildren()) do
        if v.Name == "Guns" then
            fireclickdetector(v.ClickDetector)
        end
    end
    return
end
local Colors = {}
for i,v in pairs(require(game:GetService("ReplicatedStorage").Game.Garage.StoreData.Color).Items) do
	table.insert(Colors, v.Name)
end
function zigzag(X) 
    return math.acos(math.cos(X*math.pi))/math.pi 
end
local counter = 0
local hatclick = (function()
	for i,v in pairs(game:GetService("Workspace").Givers:GetChildren()) do
		if v.Name == 'Station' then
			if v:FindFirstChild("Item").Value == 'HatPolice' then
				return v.ClickDetector
			end
		end
	end
end)()
function firehatoff()
    fireclickdetector(hatclick)
    local Hat = game:GetService('Players').LocalPlayer.Character:WaitForChild("HatPolice")
    Hat.Parent = workspace
end
function Taze(plr)
	pcall(function()
		if not plr:IsA("Player") then return end
		if plr.Character then
			Client.Network:FireServer(Client.Hashes.Taze, plr.Name, plr.Character.HumanoidRootPart, plr.Character.HumanoidRootPart.Position)
		end
	end)
end
require(game:GetService("ReplicatedStorage").Game.ItemSystem.ItemSystem).Fake = function() return end
function sendn(title, text, time)
	game.StarterGui:SetCore("SendNotification", {
		Title = title;
		Text = text; 
		Duration = time; 
	})
end
function SendN(text)
	require(game:GetService("ReplicatedStorage").Game.Notification).new({
		Text = text,
	})
end 
local oldFS = Client.Network.FireServer
Client.Network.FireServer = function(p, ...)
    local args = {...}
    if args[2] and type(args[2]) == "table" and rawget(args[2], "Name") == "Cuffed" and NiggaToggle.AntiArrest then
        Client.BreakOut(game:GetService("Players").LocalPlayer);
        require(game:GetService("ReplicatedStorage").Game.ItemSystem.ItemSystem).Unequip();
        return nil
    end;
    return oldFS(p, ...);
end
local oldRagdoll = Client.Falling.Ragdoll
Client.Falling.Ragdoll = function(...)
	if NiggaToggle.AntiRagdoll then
		return wait(9e9)
	else
		return oldRagdoll(...)
	end
end
local whitelisted = {}
local locations = {
    Stores = {
        {'Jewelry Out', CFrame.new(156.103851, 18.540699, 1353.72388)},
        {'Jewelry In', CFrame.new(133.300705, 17.9375954, 1316.42407)},
        {'Bank Out', CFrame.new(11.6854906, 17.8929214, 788.188171)},
        {'Bank In', CFrame.new(24.6513691, 19.4347649, 853.291687)},
        {'Museum Out', CFrame.new(1103.53406, 138.152878, 1246.98511)},
        {'Museum In', CFrame.new(1071.72, 102.8, 1191.9)},
        {'Donut Shop', CFrame.new(270.763885, 18.4229183, -1762.90149)},
		{'Gas Station', CFrame.new(-1584.1051, 18.4732189, 721.38739)},
		{'Power Plant', CFrame.new(691.559326, 37.6575089, 2362.05591)},
    },

    Locations = {
        {'Prison Cells', CFrame.new(-1461.07605, -0.318537951, -1824.14917)},
        {'Prison Yard', CFrame.new(-1219.36316, 17.7750931, -1760.8584)},
        {'Prison Sewer', CFrame.new(-1050.70667, 0.7002424, -1498.72766)},
        {'Prison Parking', CFrame.new(-1173.36951, 18.698061, -1533.47656)},
        {'Gun Shop', CFrame.new(-27.8670673, 17.7929249, -1774.66882)},
        {'1M Shop', CFrame.new(388.804688, 17.5929279, -1701.1698)},
        {'Volcano Base', CFrame.new(1726.72266, 50.4146309, -1745.76196)},
        {'City Base', CFrame.new(-244.824478, 17.8677788, 1573.81616)},
        {'Police HQ1', CFrame.new(-1134.69604, 17.9251575, -1586.79395)},
        {'Police HQ2', CFrame.new(738.103577, 38.1275024, 1134.48059)},
        {'Military Base', CFrame.new(766.283386, 18.0144463, -324.15921)},
        {'Evil Lair', CFrame.new(1735.52405, 18.1646328, -1726.05249)},
        {'Secret Agent Base', CFrame.new(1506.60754, 69.8824005, 1634.42456)},
        {'Garage', CFrame.new(-336.791779, 18.2407684, 1137.49451)},
        {'Glider Shop', CFrame.new(137.43399, 18.1547852, -1768.24658)},
        {'Lookout', CFrame.new(1328.05725, 166.614426, 2609.93457)},
		{'Airport', CFrame.new(-1227.47449, 64.4552231, 2787.64233)},
		{'Boat Cave', CFrame.new(1870.72498, 31.4386101, 1896.98865)},
		{'Port', CFrame.new(-423.029663, 21.2136765, 2023.55713)},
		{'Volcano Inside', CFrame.new(1704.46484, 25.0370979, -1775.46484)},
    },

    Vehicles = {
        {'Prison Camaro', CFrame.new(-951.755493, 18.5451126, -1446.42664)},
        {'Lamborghini', CFrame.new(146.728821, 17.5929279, 774.655396)},
        {'Bugatti', CFrame.new(241.109451, 17.6066723, 1362.49316)},
        {'McLaren', CFrame.new(597.850708, 37.712925, 1649.81897)},
        {'Pickup Truck', CFrame.new(-1543.02686, 18.3732185, 721.518494)},
        {'Model3', CFrame.new(-117.721481, 17.5907402, 547.516052)},
        {'Mini Cooper', CFrame.new(760.116577, 17.8929214, -1228.13806)},
        {'Dirtbike', CFrame.new(1643.61707, 18.8864899, 233.026291)},
        {'SUV', CFrame.new(-1066.26172, 18.6751556, -1476.00732)},
        {'Dune Buggy', CFrame.new(580.013916, 17.1554928, -458.795807)},
        {'ATV', CFrame.new(-1452.651, 24.8182373, 202.176361)},
        {'Mustang', CFrame.new(-97.1472931, 18.2549458, -1724.10986)},
        {'Porsche', CFrame.new(1111.16809, 101.783577, 1296.94312)},
        {'Ambulance', CFrame.new(-139.396881, 18.1840897, 1098.80212)},
        {'UFO', CFrame.new(775.515747, 18.3745003, -142.552948)},
        {'SWAT Van', CFrame.new(-1356.85388, 17.9232101, -1534.93152)},
        {'Wraith', CFrame.new(1687.08911, 50.4146309, -1704.4657)},
        {'Ferrari', CFrame.new(-1500.52051, 49.4602127, 1804.38611)},
        {'Classic', CFrame.new(1194.28406, 106.283951, 1176.69458)},
        {'Audi R8', CFrame.new(1714.05151, 18.646801, -1691.49756)},
        {'Raptor', CFrame.new(1520.34692, 73.6122742, 1741.82507)},
        {'Police Motorcycle', CFrame.new(718.890076, 38.3909264, 1072.3656)},
        {'Firetruck', CFrame.new(-967.847168, 33.1665268, 1320.79968)},
        {'Jet Skis', CFrame.new(-505.554657, 18.6864834, 812.503174)},
    },
}
local blur = Instance.new("BlurEffect", game.Lighting)
blur.Size = 0
local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
ScreenGui.Parent = game.CoreGui
ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0.5, -(303 / 2), 0.5, -(263 / 2))
ImageLabel.Rotation = 0
ImageLabel.Size = UDim2.new(0, 303,0, 263)
ImageLabel.Image = "rbxassetid://4733685600"
ImageLabel.ImageTransparency = 1
for i = 1, 50, 2 do
    blur.Size = i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency - 0.1
    wait()
end
wait(0.1)

for i = 1, 50, 2 do
    blur.Size = 50 - i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency + 0.1
    wait()
end
blur:Destroy()
ScreenGui:Destroy()
local library = {}
local toggleoff = Color3.fromRGB(255, 60, 60)
local toggleon = Color3.fromRGB(98, 255, 161)
local UIS = game:GetService("UserInputService")
function library:Create(Text)
    local ScreenGui = Instance.new('ScreenGui')
    local HomeFrame = Instance.new("ImageLabel")
    local TopDesign = Instance.new("ImageLabel")
    local TopDesign_2 = Instance.new("ImageLabel")
    local TextLabel = Instance.new("TextLabel")
    local TabContainer = Instance.new("Frame")
    local Container = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local binding = false
    ScreenGui.Name = 'Tesla'
    ScreenGui.Parent = game.CoreGui

    HomeFrame.Name = "HomeFrame"
    HomeFrame.Parent = ScreenGui
    HomeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    HomeFrame.BackgroundTransparency = 1.000
    HomeFrame.Position = UDim2.new(0.0438378826, 0, 0.152298853, 0)
    HomeFrame.Size = UDim2.new(0, 412, 0, 290)
    HomeFrame.Image = "rbxassetid://3570695787"
    HomeFrame.ImageColor3 = Color3.fromRGB(22, 22, 22)
    HomeFrame.ScaleType = Enum.ScaleType.Slice
    HomeFrame.SliceCenter = Rect.new(100, 100, 100, 100)
    HomeFrame.SliceScale = 0.05

    TopDesign.Name = "TopDesign"
    TopDesign.Parent = HomeFrame
    TopDesign.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopDesign.BackgroundTransparency = 1.000
    TopDesign.Size = UDim2.new(0, 412, 0, 44)
    TopDesign.Image = "rbxassetid://3570695787"
    TopDesign.ImageColor3 = Color3.fromRGB(26, 26, 26)
    TopDesign.ScaleType = Enum.ScaleType.Slice
    TopDesign.SliceCenter = Rect.new(100, 100, 100, 100)
    TopDesign.SliceScale = 0.05

    TopDesign_2.Name = "TopDesign"
    TopDesign_2.Parent = HomeFrame
    TopDesign_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopDesign_2.BackgroundTransparency = 1.000
    TopDesign_2.Size = UDim2.new(0, 412, 0, 5)
    TopDesign_2.Image = "rbxassetid://3570695787"
    TopDesign_2.ImageColor3 = Color3.fromRGB(98, 255, 161)
    TopDesign_2.ScaleType = Enum.ScaleType.Slice
    TopDesign_2.SliceCenter = Rect.new(100, 100, 100, 100)
    TopDesign_2.SliceScale = 0.05
    TextLabel.Parent = HomeFrame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0, 0, 0, 5)
    TextLabel.Size = UDim2.new(0, 120, 0, 40)
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.Text = Text
    TextLabel.TextColor3 = Color3.fromRGB(98, 255, 161)
    TextLabel.TextSize = 18.000
    game:GetService("RunService").Stepped:connect(function()
        TopDesign_2.ImageColor3  = Color3.fromHSV(zigzag(counter),1,1)
    	TextLabel.TextColor3 = Color3.fromHSV(zigzag(counter),1,1)
    	counter = counter + 0.002
    end)

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = HomeFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0.29126215, 0, 0.0219298247, 0)
    TabContainer.Size = UDim2.new(0, 292, 0, 40)

    UIListLayout.Parent = TabContainer
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    Container.Name = "Container"
    Container.Parent = HomeFrame
    Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Container.BackgroundTransparency = 1.000
    Container.BorderSizePixel = 0
    Container.Position = UDim2.new(0, 0, 0.173076928, 0)
    Container.Size = UDim2.new(0, 412, 0, 215)

    local function dodragger()
        local script = Instance.new('LocalScript', HomeFrame)
        local UILIB = {}
        UILIB = script.Parent
        local UserInputService = game:GetService("UserInputService")
        local dragging
        local dragInput
        local dragStart
        local startPos
        local function update(input)
            local delta = input.Position - dragStart
            UILIB:TweenPosition(UDim2.new(startPos.X.Scale,startPos.X.Offset + delta.X,startPos.Y.Scale,startPos.Y.Offset + delta.Y),"Out", "Linear", 0.01, true)
        end
        UILIB.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or
                input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = UILIB.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        UILIB.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        UserInputService.InputChanged:Connect(
            function(input)
                if input == dragInput and dragging then
                    update(input)
                end
            end)
        end
    coroutine.wrap(dodragger)()

    local tabshit = {}
    function tabshit:CreateTab(Text)
        local Frame = Instance.new("Frame")
        local TextButton = Instance.new("TextLabel")
        local SecContainer = Instance.new("Frame")
        local UIListLayout_2 = Instance.new("UIListLayout")

        Frame.Parent = TabContainer
        Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Frame.BorderSizePixel = 0
        Frame.Position = UDim2.new(0, 175, 0, 110)
        Frame.Size = UDim2.new(0, 103, 0, 40)

        TextButton.Name = "TextButton"
        TextButton.Parent = Frame
        TextButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        TextButton.BackgroundTransparency = 1.000
        TextButton.BorderColor3 = Color3.fromRGB(56, 56, 56)
        TextButton.BorderSizePixel = 0
        TextButton.Size = UDim2.new(0, 103, 0, 40)
        TextButton.Font = Enum.Font.SourceSansBold
        TextButton.Text = Text
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextSize = 15.000

        SecContainer.Name = Text
        SecContainer.Parent = Container
        SecContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SecContainer.BackgroundTransparency = 1.000
        SecContainer.BorderSizePixel = 0
        SecContainer.Position = UDim2.new(0, 5, 0, 7)
        SecContainer.Size = UDim2.new(0, 116, 0, 201)

        UIListLayout_2.Parent = SecContainer
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

        local function JEOZBI_fake_script()
            local script = Instance.new('LocalScript', TabContainer)
    
            local parent = script.Parent
            local value = 0
            for _, v in pairs(parent:GetChildren()) do
                if v:IsA('Frame') then value = value + 1 end
            end
            wait(.25)
            local storedshit = value
            value = value * 292 / value
            storedshit = value / storedshit
            for i, v in pairs(parent:GetChildren()) do
                if v:IsA('Frame') then
                    v.Size = UDim2.new(0, storedshit, 0, 40)
                    v.TextButton.Size = UDim2.new(0, storedshit, 0, 40)
                end
            end
        end
        coroutine.wrap(JEOZBI_fake_script)()

        local section = {}

        function section:CreateSection(text)

            local Frame_3 = Instance.new("ImageLabel")
            local TextButton_3 = Instance.new("TextButton")
            local ShitContainer = Instance.new("ImageLabel")
            local ScrollingFrame = Instance.new("ScrollingFrame")
            local UIListLayout_3 = Instance.new("UIListLayout")

            Frame_3.Name = text
            Frame_3.Parent = SecContainer
            Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame_3.BackgroundTransparency = 1.000
            Frame_3.Size = UDim2.new(0, 116, 0, 32)
            Frame_3.Image = "rbxassetid://3570695787"
            Frame_3.ImageColor3 = Color3.fromRGB(26, 26, 26)
            Frame_3.ScaleType = Enum.ScaleType.Slice
            Frame_3.SliceCenter = Rect.new(100, 100, 100, 100)
            Frame_3.SliceScale = 0.05

            TextButton_3.Parent = Frame_3
            TextButton_3.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
            TextButton_3.BackgroundTransparency = 1.000
            TextButton_3.BorderColor3 = Color3.fromRGB(56, 56, 56)
            TextButton_3.BorderSizePixel = 0
            TextButton_3.Size = UDim2.new(0, 116, 0, 32)
            TextButton_3.AutoButtonColor = false
            TextButton_3.Font = Enum.Font.SourceSansBold
            TextButton_3.Text = text
            TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_3.TextSize = 15.000
            TextButton_3.MouseButton1Down:connect(function()
                for i, v in pairs(Container:GetChildren()) do
                    if v:IsA('ImageLabel') then
                        v.Visible = false
                        if v.Name == text then
                            v.Visible = true
                        end
                    end
                end
            end)

            ShitContainer.Name = text
            ShitContainer.Parent = Container
            ShitContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ShitContainer.BackgroundTransparency = 1.000
            ShitContainer.Position = UDim2.new(0, 125, 0, 7)
            ShitContainer.Size = UDim2.new(0, 282, 0, 225)
            ShitContainer.Image = "rbxassetid://3570695787"
            ShitContainer.ImageColor3 = Color3.fromRGB(26, 26, 26)
            ShitContainer.ScaleType = Enum.ScaleType.Slice
            ShitContainer.SliceCenter = Rect.new(100, 100, 100, 100)
            ShitContainer.SliceScale = 0.05

            ScrollingFrame.Parent = ShitContainer
            ScrollingFrame.Active = true
            ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollingFrame.BackgroundTransparency = 1.000
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.Position = UDim2.new(0.0106382975, 0, 0.0298507456, 0)
            ScrollingFrame.Size = UDim2.new(0, 275, 0, 215)
            ScrollingFrame.ScrollBarThickness = 0

            UIListLayout_3.Parent = ScrollingFrame
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.Padding = UDim.new(0, 4)

            local function aidsppshit()
                local script = Instance.new('LocalScript', ScrollingFrame)

                local aids = script.Parent
                wait(1.5)
                aids.CanvasSize = UDim2.new(0, 0, 0, aids.UIListLayout.AbsoluteContentSize.Y)
            end
            coroutine.wrap(aidsppshit)()

            local Toolshit = {}
            function Toolshit:Button(text, callback)
                local Frame_4 = Instance.new("ImageLabel")
                local TextButton_4 = Instance.new("TextButton")
                local callback = callback or function() end

                Frame_4.Name = "Frame"
                Frame_4.Parent = ScrollingFrame
                Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame_4.BackgroundTransparency = 1.000
                Frame_4.Size = UDim2.new(0, 275, 0, 32)
                Frame_4.Image = "rbxassetid://3570695787"
                Frame_4.ImageColor3 = Color3.fromRGB(22, 22, 22)
                Frame_4.ScaleType = Enum.ScaleType.Slice
                Frame_4.SliceCenter = Rect.new(100, 100, 100, 100)
                Frame_4.SliceScale = 0.05

                TextButton_4.Parent = Frame_4
                TextButton_4.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                TextButton_4.BackgroundTransparency = 1.000
                TextButton_4.BorderColor3 = Color3.fromRGB(56, 56, 56)
                TextButton_4.BorderSizePixel = 0
                TextButton_4.Size = UDim2.new(0, 275, 0, 32)
                TextButton_4.AutoButtonColor = false
                TextButton_4.Font = Enum.Font.SourceSansBold
                TextButton_4.Text = text
                TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_4.TextSize = 15.000
                TextButton_4.MouseButton1Down:connect(function() 
                    pcall(callback)
                end)
            end

            function Toolshit:Bind(text, callback, keybind_options)
                local keybind_data = {}
                local Frame_4 = Instance.new("ImageLabel")
                local TextButton_4 = Instance.new("TextButton")
                local callback = callback or function() end
                keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
                keybind_options = {
                    ["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
                }

                Frame_4.Name = "Frame"
                Frame_4.Parent = ScrollingFrame
                Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame_4.BackgroundTransparency = 1.000
                Frame_4.Size = UDim2.new(0, 275, 0, 32)
                Frame_4.Image = "rbxassetid://3570695787"
                Frame_4.ImageColor3 = Color3.fromRGB(22, 22, 22)
                Frame_4.ScaleType = Enum.ScaleType.Slice
                Frame_4.SliceCenter = Rect.new(100, 100, 100, 100)
                Frame_4.SliceScale = 0.05

                TextButton_4.Parent = Frame_4
                TextButton_4.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                TextButton_4.BackgroundTransparency = 1.000
                TextButton_4.BorderColor3 = Color3.fromRGB(56, 56, 56)
                TextButton_4.BorderSizePixel = 0
                TextButton_4.Size = UDim2.new(0, 275, 0, 32)
                TextButton_4.AutoButtonColor = false
                TextButton_4.Font = Enum.Font.SourceSansBold
                TextButton_4.Text = text.." ".."["..keybind_options.standard.Name.."]"
                TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_4.TextSize = 15.000
                local shortkeys = {
                    RightControl = 'RightCtrl',
                    LeftControl = 'LeftCtrl',
                    LeftShift = 'LShift',
                    RightShift = 'RShift',
                    MouseButton1 = "Mouse1",
                    MouseButton2 = "Mouse2"
                }
                local keybind = keybind_options.standard

                function keybind_data:Set(Keybind)
                    local key = shortkeys[Keybind.Name] or Keybind.Name
                    TextButton_4.Text = text.." ".."["..key.."]"
                    keybind = Keybind
                end

                UIS.InputBegan:Connect(function(a, b)
                    if binding then
                        spawn(function()
                            wait()
                            binding = false
                        end)
                        return
                    end
                    if a.KeyCode == keybind and not b then
                        pcall(callback, keybind)
                    end
                end)

                keybind_data:Set(keybind_options.standard)

                TextButton_4.MouseButton1Click:Connect(function()
                    if binding then return end
                    TextButton_4.Text = "..."
                    binding = true
                    local a, b = UIS.InputBegan:Wait()
                    keybind_data:Set(a.KeyCode)
                end)

                return keybind_data
            end

            function Toolshit:Label(text)
                local Frame_4 = Instance.new("ImageLabel")
                local TextButton_4 = Instance.new("TextLabel")
                Frame_4.Name = "Frame"
                Frame_4.Parent = ScrollingFrame
                Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame_4.BackgroundTransparency = 1.000
                Frame_4.Size = UDim2.new(0, 275, 0, 32)
                Frame_4.Image = "rbxassetid://3570695787"
                Frame_4.ImageColor3 = Color3.fromRGB(36, 36, 36)
                Frame_4.ScaleType = Enum.ScaleType.Slice
                Frame_4.SliceCenter = Rect.new(100, 100, 100, 100)
                Frame_4.SliceScale = 0.05

                TextButton_4.Parent = Frame_4
                TextButton_4.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                TextButton_4.BackgroundTransparency = 1.000
                TextButton_4.BorderColor3 = Color3.fromRGB(56, 56, 56)
                TextButton_4.BorderSizePixel = 0
                TextButton_4.Size = UDim2.new(0, 275, 0, 32)
                TextButton_4.Font = Enum.Font.SourceSansBold
                TextButton_4.Text = text
                TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_4.TextSize = 15.000
            end

            function Toolshit:Toggle(title, description, callback)
                local callback = callback or function() end
                local actions = {}
                local enabled = false
                local Frame_7 = Instance.new("ImageLabel")
                local Frame_8 = Instance.new("ImageLabel")
                local TextButton_7 = Instance.new("TextButton")
                local TextLabel_3 = Instance.new("TextLabel")

                Frame_7.Name = "Frame"
                Frame_7.Parent = ScrollingFrame
                Frame_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame_7.BackgroundTransparency = 1.000
                Frame_7.ClipsDescendants = true
                Frame_7.Position = UDim2.new(0, 0, 0.369230777, 0)
                Frame_7.Size = UDim2.new(0, 275, 0, 50)
                Frame_7.Image = "rbxassetid://3570695787"
                Frame_7.ImageColor3 = Color3.fromRGB(22, 22, 22)
                Frame_7.ScaleType = Enum.ScaleType.Slice
                Frame_7.SliceCenter = Rect.new(100, 100, 100, 100)
                Frame_7.SliceScale = 0.05

                Frame_8.Name = "Frame"
                Frame_8.Parent = Frame_7
                Frame_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame_8.BackgroundTransparency = 1.000
                Frame_8.ClipsDescendants = true
                Frame_8.Position = UDim2.new(0, 249, 0, 6)
                Frame_8.Size = UDim2.new(0, 20, 0, 20)
                Frame_8.Image = "rbxassetid://3570695787"
                Frame_8.ImageColor3 = Color3.fromRGB(255, 60, 60)
                Frame_8.ScaleType = Enum.ScaleType.Slice
                Frame_8.SliceCenter = Rect.new(100, 100, 100, 100)
                Frame_8.SliceScale = 0.05

                TextButton_7.Parent = Frame_7
                TextButton_7.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                TextButton_7.BackgroundTransparency = 1.000
                TextButton_7.BorderColor3 = Color3.fromRGB(56, 56, 56)
                TextButton_7.BorderSizePixel = 0
                TextButton_7.Size = UDim2.new(0, 275, 0, 32)
                TextButton_7.AutoButtonColor = false
                TextButton_7.Font = Enum.Font.SourceSansBold
                TextButton_7.Text = title
                TextButton_7.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_7.TextSize = 15.000

                TextLabel_3.Parent = Frame_7
                TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_3.BackgroundTransparency = 1.000
                TextLabel_3.Position = UDim2.new(0, 9, 0, 28)
                TextLabel_3.Size = UDim2.new(0, 266, 0, 22)
                TextLabel_3.Font = Enum.Font.SourceSansBold
                TextLabel_3.Text = description
                TextLabel_3.TextColor3 = Color3.fromRGB(111, 111, 111)
                TextLabel_3.TextSize = 14.000
                TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

                function fire()
                    enabled = not enabled
                    Frame_8.ImageColor3 = enabled and toggleon or toggleoff
                    pcall(callback, enabled)
                end

                TextButton_7.MouseButton1Down:connect(fire)

                function actions:Set(arg)
                    enabled = arg
                    Frame_8.ImageColor3 = enabled and toggleon or toggleoff
                    pcall(callback, arg)
                end
                return actions
            end

            function Toolshit:Box(text, callback)
                local callback = callback or function() end
                local Frame_9 = Instance.new("ImageLabel")
                local TextBox = Instance.new("TextBox")

                Frame_9.Name = "Frame"
                Frame_9.Parent = ScrollingFrame
                Frame_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame_9.BackgroundTransparency = 1.000
                Frame_9.ClipsDescendants = true
                Frame_9.Position = UDim2.new(0, 0, 0.184615389, 0)
                Frame_9.Size = UDim2.new(0, 275, 0, 32)
                Frame_9.Image = "rbxassetid://3570695787"
                Frame_9.ImageColor3 = Color3.fromRGB(22, 22, 22)
                Frame_9.ScaleType = Enum.ScaleType.Slice
                Frame_9.SliceCenter = Rect.new(100, 100, 100, 100)
                Frame_9.SliceScale = 0.05

                TextBox.Parent = Frame_9
                TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.BackgroundTransparency = 1.000
                TextBox.BorderSizePixel = 0
                TextBox.Size = UDim2.new(0, 275, 0, 32)
                TextBox.Font = Enum.Font.SourceSansBold
                TextBox.PlaceholderText = text
                TextBox.Text = ""
                TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.TextSize = 15.000
                TextBox.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
                    if enterPressed then
                        if #TextBox.Text > 0 then
                            pcall(callback, TextBox.Text)
                            TextBox.Text = ""
                        end
                    end
                end)
            end
            function Toolshit:Dropdown(text)
                local Frame_5 = Instance.new("ImageLabel")
                local TextLabel_2 = Instance.new("TextLabel")
                local TextButton_5 = Instance.new("TextButton")
                local Frame_6 = Instance.new("ImageLabel")
                local UIListLayout_4 = Instance.new("UIListLayout")

                Frame_5.Name = "Frame"
                Frame_5.Parent = ScrollingFrame
                Frame_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame_5.BackgroundTransparency = 1.000
                Frame_5.ClipsDescendants = true
                Frame_5.Position = UDim2.new(0, 0, 0.184615389, 0)
                Frame_5.Size = UDim2.new(0, 275, 0, 32)
                Frame_5.Image = "rbxassetid://3570695787"
                Frame_5.ImageColor3 = Color3.fromRGB(22, 22, 22)
                Frame_5.ScaleType = Enum.ScaleType.Slice
                Frame_5.SliceCenter = Rect.new(100, 100, 100, 100)
                Frame_5.SliceScale = 0.05

                TextLabel_2.Parent = Frame_5
                TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_2.BackgroundTransparency = 1.000
                TextLabel_2.BorderSizePixel = 0
                TextLabel_2.Size = UDim2.new(0, 275, 0, 32)
                TextLabel_2.Font = Enum.Font.SourceSansBold
                TextLabel_2.Text =
                    "                                                                                   v"
                TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_2.TextSize = 15.000
                TextLabel_2.TextWrapped = true

                TextButton_5.Parent = Frame_5
                TextButton_5.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                TextButton_5.BackgroundTransparency = 1.000
                TextButton_5.BorderColor3 = Color3.fromRGB(56, 56, 56)
                TextButton_5.BorderSizePixel = 0
                TextButton_5.Size = UDim2.new(0, 275, 0, 32)
                TextButton_5.AutoButtonColor = false
                TextButton_5.Font = Enum.Font.SourceSansBold
                TextButton_5.Text = text
                TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_5.TextSize = 15.000

                Frame_6.Name = "Frame"
                Frame_6.Parent = Frame_5
                Frame_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame_6.BackgroundTransparency = 1.000
                Frame_6.ClipsDescendants = false
                Frame_6.Position = UDim2.new(0, 0, 0, 32)
                Frame_6.Size = UDim2.new(0, 275, 0, 32)
                Frame_6.Image = "rbxassetid://3570695787"
                Frame_6.ImageColor3 = Color3.fromRGB(22, 22, 22)
                Frame_6.ScaleType = Enum.ScaleType.Slice
                Frame_6.SliceCenter = Rect.new(100, 100, 100, 100)
                Frame_6.SliceScale = 0.05

                UIListLayout_4.Parent = Frame_6
                UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

                function dropdownshit()
                        local script = Instance.new("LocalScript",TextButton_5)
                        local TextButton_5 = script.Parent
                        local container = script.Parent.Parent.Frame
                        local box = script.Parent.Parent.Parent
                        local value = 0
                        local toggled = false
                        wait(1)
                        for _,v in pairs(container:GetChildren()) do
                            if v:IsA('TextButton')  then
                                value = value + 1
                            end
                        end
                        wait(1)
                        value = value * 32
                        value = value + 32
                        TextButton_5.MouseButton1Down:connect(function()
                        if toggled == false then
                            toggled = true
                            Frame_5:TweenSize(UDim2.new(0, 275, 0, value), 'Out','Linear', 0.25)
                            wait(0.25)
                            box.CanvasSize = UDim2.new(0, 0, 0, box.UIListLayout.AbsoluteContentSize.Y)
                        elseif toggled == true then
                            toggled = false
                            Frame_5:TweenSize(UDim2.new(0, 275, 0, 32), 'In', 'Linear', 0.25)
                            wait(0.25)
                            box.CanvasSize = UDim2.new(0, 0, 0, box.UIListLayout.AbsoluteContentSize.Y)
                        end
                    end)
                end
                coroutine.wrap(dropdownshit)()
                
                    local droptable = {}

                    function droptable:Add(text, callback)
                        local TextButton_6 = Instance.new("TextButton")

                        TextButton_6.Parent = Frame_6
                        TextButton_6.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                        TextButton_6.BackgroundTransparency = 1.000
                        TextButton_6.BorderColor3 = Color3.fromRGB(56, 56, 56)
                        TextButton_6.BorderSizePixel = 0
                        TextButton_6.Size = UDim2.new(0, 275, 0, 32)
                        TextButton_6.AutoButtonColor = false
                        TextButton_6.Font = Enum.Font.SourceSansBold
                        TextButton_6.Text = text
                        TextButton_6.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextButton_6.TextSize = 15.000
                        TextButton_6.MouseButton1Down:connect(function() pcall(callback) end)
                    end
                    return droptable
                end
                return Toolshit
            end
            return section
        end
        return tabshit, ScreenGui
    end
local main, teslagui = library:Create("Tesla")
local tesla = main:CreateTab("Jailbreak")
local tptab = tesla:CreateSection("Teleports")
local playertab = tesla:CreateSection("Player")
local combatab = tesla:CreateSection("Combat")
local vehicle = tesla:CreateSection("Vehicle")
local farming = tesla:CreateSection("Farming")
local funtab = tesla:CreateSection("Fun")
local setting = tesla:CreateSection("Settings")
tptab:Box("Teleport Player", function(callback)
    for i,v in next, game:GetService("Players"):GetPlayers() do
		if string.find(string.lower(v.Name), string.lower(tostring(callback))) then
			TP(v.Character.HumanoidRootPart.CFrame)
			return
		end
	end
end)
local storedrop = tptab:Dropdown('Store Teleports')
local locationdrop = tptab:Dropdown('Location Teleports')
local vehicledrop = tptab:Dropdown('Vehicle Teleports')
for i,v in pairs(locations.Stores) do
    storedrop:Add(v[1] ,function()
        TP(v[2])
    end)
end
for i,v in pairs(locations.Locations) do
    locationdrop:Add(v[1] ,function()
        TP(v[2])
    end)
end
for i,v in pairs(locations.Vehicles) do
    vehicledrop:Add(v[1] ,function()
        TP(v[2])
    end)
end
wait(0.1)
_G.WalkSpeed = 16
playertab:Box("WalkSpeed", function(callback)
    if not tonumber(callback) then return end
    _G.WalkSpeed = tonumber(callback)
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(callback)
end)
playertab:Box("JumpPower", function(callback)
    if not tonumber(callback) then return end
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = tonumber(callback)
end)
playertab:Toggle("No Wait", "No E Cooldown", function(arg)
    NiggaToggle.NoWait = arg
end)
playertab:Toggle("Open All Doors", "Open All Doors Serversided", function(arg)
    NiggaToggle.OpenDoors = arg
end)
playertab:Toggle("No Clip", "Walk Through Wall", function(arg)
    NiggaToggle.NoClip = arg
end)
playertab:Toggle("Anti Arrest", "Auto Breakout Yourself If Get Arrested", function(arg)
	NiggaToggle.AntiArrest = arg
end)
playertab:Toggle("Auto Breakout", "Auto Breakout If You Are In Jail", function(arg)
	NiggaToggle.Autobreakout = arg
end)
playertab:Toggle("One Punch Man", "Don't Punch Player", function(arg)
	NiggaToggle.OPM = arg
end)
playertab:Toggle("Eject All", "Loops Eject Everyone", function(arg)
	NiggaToggle.Eject = arg
end)
playertab:Toggle("God Mode", "Auto Heal", function(arg)
	NiggaToggle.GodMode = arg
	if NiggaToggle.GodMode then
		setconstant(Client.GiveDonut,1,"lmao")
        setconstant(Client.Unequip,12,"Fake")
	else
		setconstant(Client.GiveDonut,1,"tick")
        setconstant(Client.Unequip,12,"Unequip")
    end
end)
playertab:Toggle("Anti Ragdoll", "No Ragdoll", function(arg)
	NiggaToggle.AntiRagdoll = arg
end)
playertab:Toggle("No Team Change Cooldown", "No Team Change CD", function(arg)
    if arg then
		require(game:GetService("ReplicatedStorage").Resource.Settings).Time.BetweenTeamChange = 0
	else
		require(game:GetService("ReplicatedStorage").Resource.Settings).Time.BetweenTeamChange = 24
	end
end)
playertab:Toggle("No Cell Time", "No Cell Time", function(arg)
    if arg then
		require(game:GetService("ReplicatedStorage").Resource.Settings).Time.Cell = 0
	else
		require(game:GetService("ReplicatedStorage").Resource.Settings).Time.Cell = 20
	end
end)
playertab:Button("Give JetPack", Client.GiveJetPack)
playertab:Button("Inf JetPack Fuel", function()
	local JPFuel = getupvalue(require(game:GetService("ReplicatedStorage").Game.JetPack.JetPack).Init,7)
	JPFuel.LocalMaxFuel = math.huge
	JPFuel.LocalFuel = math.huge
	JPFuel.LocalFuelType = "Rocket"
end)
playertab:Button("Invisible", function()
    if not workspace.Vehicles:FindFirstChild("DuneBuggy") then
        require(game:GetService("ReplicatedStorage").Game.Notification).new({
            Text = "DuneBuggy Not Found!",
        });
        return
    end
    local ogpos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    wait()
    for i,v in pairs(require(game:GetService('ReplicatedStorage').Module.UI).CircleAction.Specs) do
        if v.Name == "Enter Passenger" and v.ValidRoot.Name == "DuneBuggy" then
            v:Callback(true)
            require(game:GetService("ReplicatedStorage").Game.Item.Gun).SetLeaning({Config = { Motion = { Hip = { Springs = { ItemOffset = nil, ItemRotation = nil, NeckRotation = nil } } } },SpringItemOffset = {SetTarget = function() end},SpringItemRotation = {SetTarget = function() end},SpringNeckRotation = {SetTarget = function() end},Local = true}, false, false)
            wait(0.3)
            Client.ExitCar()
            wait(0.5)
            TP(ogpos)
            break
        end
    end
end)
playertab:Button("PickPocket", function()
    local key = workspace:FindFirstChild("Key")
    if key then
        Client.PickItem({Part = {Parent = key}}, true)
        return
    end
	local ogpos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
	for i,v in pairs(game:GetService('Players'):GetPlayers()) do
		if tostring(v.Team) == "Police" then
			if v.Character:FindFirstChild("HumanoidRootPart") then
				if not v.Character:FindFirstChild("InVehicle") then
					TP(v.Character.HumanoidRootPart.CFrame)
					wait(0.5)
					for count = 1, 10 do
						Client.PickPocket(v)
					end
					wait()
					TP(ogpos)
					return
				end
			end
		end
	end
end)
local teamd = playertab:Dropdown("Change Team")
teamd:Add("Prisoner", function()
    Client.Network:FireServer(Client.Hashes.TeamChange, "Prisoner")
end)
teamd:Add("Police", function()
    Client.Network:FireServer(Client.Hashes.TeamChange, "Police")
end)
wait(0.1)
combatab:Button("Grab All Guns", function()
    GrabClickGun()
	for i,v in pairs(Client.Guns) do
		Client.GiveGun({ Part = { Parent = { Name = i } }, CanGrab = true }, true)
	end
end)
combatab:Button("Gun Mods", function()
	for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
		local cst = require(v)
		cst.CamShakeMagnitude = 0
		cst.MagSize = math.huge
		cst.ReloadTime = 0
		cst.FireAuto = true
		cst.FireFreq = 30
	end
end)
combatab:Toggle("Taze All", "Auto Taze Everyone", function(arg)
	NiggaToggle.TazeAll = arg
end)
combatab:Toggle("Taze Aura", "Auto Taze Nearby People", function(arg)
	NiggaToggle.TazeAura = arg
end)
combatab:Toggle("Kill Aura", "You Need Plasma Pistol Owned", function(arg)
    NiggaToggle.KillAura = arg
end)
wait(0.1)
vehicle:Box("Engine Speed", function(callback)
    if tonumber(callback) then
        _G.EngineSpeed = tonumber(callback)
	end
end)
vehicle:Box("Height", function(callback)
    if tonumber(callback) then
        _G.Height = tonumber(callback)
	end
end)
vehicle:Box("Turn Speed", function(callback)
    if tonumber(callback) then
        _G.TurnSpeed = tonumber(callback)
	end
end)
vehicle:Box("Brake", function(callback)
    if tonumber(callback) then
        _G.Brake = tonumber(callback)
	end
end)
vehicle:Button("Reset Car", function()
    _G.TurnSpeed = nil
    _G.Height = nil
    _G.EngineSpeed = nil
    _G.Brake = nil
    require(game:GetService("ReplicatedStorage").Game.Notification).new({Text = "Re-enter the vehicle"})
end)
local x = game:GetService("Players").LocalPlayer:GetMouse()
local z = workspace.CurrentCamera
function FlyPart(ak, al)
    local am = Instance.new("Folder")
    am.Name = "Storage"
    for E, an in pairs(ak:GetChildren()) do
        if an:IsA("BodyGyro") then
            an.Parent = am
        end
    end
    local ao = Instance.new("BodyPosition", ak)
    ao.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    ao.Name = "Position"
    local ap = Instance.new("BodyGyro", ak)
    ap.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    ap.Name = "Rotate"
    z.CameraSubject = ak
    local aq = 0
    local ar = x.KeyDown:Connect(function(as)
        if as == "w" then
            if al then
                aq = NiggaToggle.FlySpeed
            else
                aq = tonumber("-" .. tostring(NiggaToggle.FlySpeed))
            end
        elseif as == "s" then
            if al then
                aq = tonumber("-" .. tostring(NiggaToggle.FlySpeed))
            else
                aq = NiggaToggle.FlySpeed
            end
        end
    end)
    x.KeyUp:Connect(function(as)
        if as == "w" then
            aq = 0
        elseif as == "s" then
            aq = 0
        end
    end)
    local at = {}
    at.IsRunning = true
    at.Part = ak
    at.Storage = am
    at.MT = ar
    spawn(function()
        repeat
            local au = z.CFrame
            local av = ak.Position
            local aw = (av - au.p).Magnitude
            ao.Position = (au * CFrame.new(0, 0, tonumber("-" .. tostring(aw)) + aq)).p + Vector3.new(0, 0.2225, 0)
            ap.CFrame = au
            wait()
        until at.IsRunning == false or z.CameraSubject ~= ak
        ao:Remove()
        ap:Remove()
        for E, ax in pairs(at.Storage:GetChildren()) do
            ax.Parent = at.Part
        end
        at.MT:Disconnect()
        at.Storage:Remove()
    end)
    return at
end
local A = workspace.Vehicles
function GetVehicleMain()
    local ai = game:GetService("Players").LocalPlayer.Name
    for E, aj in pairs(A:GetChildren()) do
        if aj:FindFirstChild("Seat") and aj.Seat:FindFirstChild("PlayerName") and aj:FindFirstChild("Engine") then
            if aj.Seat.PlayerName.Value == ai then
                return aj.Engine, false
            end
        elseif aj:FindFirstChild("Seat") and aj.Seat:FindFirstChild("PlayerName") and aj:FindFirstChild("Model") then
            if aj.Seat.PlayerName.Value == ai then
                if aj.Model:FindFirstChild("Body") then
                    return aj.Model.Body, true
                end
            end
        end
    end
end
vehicle:Button("Car Fly", function()
	if GetVehicleMain() ~= nil then
        SendN("Vehicle Fly Enabled", 2)
        local az, al = GetVehicleMain()
        local aA = FlyPart(az, al)
        if al then
            repeat
                wait()
            until az.Parent.Parent.Seat.PlayerName.Value ~= d.Name
        else
            repeat
                wait()
            until az.Parent.Seat.PlayerName.Value ~= game:GetService("Players").LocalPlayer.Name
        end
        wait(0.1)
        z.CameraSubject = N
        SendN("Vehicle Fly Disabled", 2)
    else
        SendN("Vehicle Not Found", 2)
    end
end)
vehicle:Box("Fly Speed", function(callback)
	NiggaToggle.FlySpeed = callback
end)
vehicle:Toggle("Anti Flip Over", "Anti Flip", function(arg)
	NiggaToggle.AntiFlip = arg
end)
vehicle:Toggle("No Tire Pop", "No Tire Popping", function(arg)
    NiggaToggle.TirePop = arg
end)
vehicle:Toggle("Injan Horn", "Different Horn Serversided", function(arg)
	local id = game:GetService("Players").LocalPlayer.UserId
	require(game:GetService("ReplicatedStorage").Resource.Settings).Perm.InjanHorn.Id[tostring(id)] = arg
end)
vehicle:Toggle("Rainbow Car (FLASH WARNING)", "Rainbow Car Serversided", function(arg)
	NiggaToggle.RainbowCar = arg
end)
vehicle:Button("Unlock Skins", function()
    for i,v in pairs(require(game:GetService("ReplicatedStorage").Game.Garage.StoreData.Color).Items) do
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.InteriorMainColor[v.Name] = true
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.WindowColor[v.Name] = true
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.WheelColor[v.Name] = true
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.SpoilerColor[v.Name] = true
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.InteriorDetailColor[v.Name] = true
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.HeadlightsColor[v.Name] = true
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.SeatColor[v.Name] = true
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.Glow[v.Name] = true
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.BodyColor[v.Name] = true
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.SecondBodyColor[v.Name] = true
	end
	for i,v in pairs(require(game:GetService("ReplicatedStorage").Game.Garage.StoreData.Engine).Items) do
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.Engine[v.Name] = true
	end
	for i,v in pairs(require(game:GetService("ReplicatedStorage").Game.Garage.StoreData.Brakes).Items) do
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.Brakes[v.Name] = true
	end
	for i,v in pairs(require(game:GetService("ReplicatedStorage").Game.Garage.StoreData.SuspensionHeight).Items) do
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.SuspensionHeight[v.Name] = true
	end
	for i,v in pairs(require(game:GetService("ReplicatedStorage").Game.Garage.StoreData.Rim).Items) do
		require(game:GetService("ReplicatedStorage").Game.Garage.GarageUI).Owned.Rim[v.Name] = true
	end
	for i,v in pairs(require(game:GetService("ReplicatedStorage").Game.ItemSkin.ItemSkinList)) do
		require(game:GetService("ReplicatedStorage").Game.ItemSkin.ItemSkin).ItemSkinsOwned[v.Name] = true
	end
end)
vehicle:Button("Inf Nitro SS", function()
	if game:GetService("Players").LocalPlayer.Character:FindFirstChild("InVehicle") then
		debug.setconstant(Client.Nitro, 1, "lmao")
		require(game:GetService("ReplicatedStorage").Game.Notification).new({
			Text = "Use nitro and it will be infinite!",
			Duration = 2
		})
	else
		require(game:GetService("ReplicatedStorage").Game.Notification).new({
			Text = "Make sure you are in a vehicle!",
			Duration = 2
		})
	end
end)
local sv = vehicle:Dropdown("Spawn Vehicle")
for i,v in pairs(require(game:GetService("ReplicatedStorage").Game.Garage.VehicleData)) do
	if not rawget(v, "NoGarageSpawn") then
        sv:Add(v.Make, function()
            Client.SpawnVehicle(v)
        end)
	end
end
wait(0.1)
_G.BankRobbed = nil
_G.JewRobbed = nil
_G.MusRobbed = nil
_G.TrainRobbed = nil
_G.PlaneRobbed = nil
_G.ShipRobbed = nil
spawn(function()
	while wait(2) do
		if workspace.Banks:GetChildren()[1].Extra.Sign.Decal.Transparency == 0 then
			_G.BankRobbed = false
		end
		if workspace.Jewelrys:GetChildren()[1].Extra.Sign.Decal.Transparency == 0 then
			_G.JewRobbed = false
		end
		for i,v in pairs(workspace.Museum.Roof.Hole:GetChildren()) do
			if v:GetChildren()[1] then
				if v.Transparency == 0 then
					_G.MusRobbed = false
				end
			end
		end
		if not workspace.Trains:GetChildren()[1] then
			_G.TrainRobbed = false
		end
		if not workspace:FindFirstChild("Plane") then
			_G.TrainRobbed = false
        end
        if not workspace:FindFirstChild("CargoShip") then
            _G.ShipRobbed = false
        end
	end
end)
_G.AutoRobbing = nil
local notificationcreate = sendn
local function TPBuilding()
    for i,v in pairs(workspace.Buildings:GetDescendants()) do
        if v:IsA("Texture") and v.Color3 == Color3.fromRGB(83,123,186) then
            v.Parent.CanCollide = false
            TP(v.Parent.CFrame)
            break
        end
    end
end
function JewBox()
	for i,v in pairs(workspace.Jewelrys:GetDescendants()) do
		if v.Name == "Boxes" then
			local part = v:GetChildren()[math.random(1, table.maxn(v:GetChildren()))]
			local pos = CFrame.new(part.Position - part.CFrame.LookVector * 2, part.Position)
            TP(pos)
            wait(0.2)
            Punch(10)
		end
	end
end
function JewlRobbing()
	if _G.AutoRobbing or _G.JewRobbed then return end
		_G.AutoRobbing = true
		for i,v in pairs(game.Workspace.Jewelrys:GetDescendants()) do
			if v:IsA("Decal") then
				if v.Parent.Name == "Sign" then
					if v.Transparency > 0.5 then
					notificationcreate('Jewelry', 'Open', 3)
					TP(CFrame.new(91.6347504, 20.2128963, 1302.44189, 0.164838046, 0.0733769536, -0.983587563, 0.0025376468, 0.997194052, 0.0748172998, 0.986317396, -0.0148287192, 0.164189309))
					for i,v in next, game:GetService("Workspace"):GetDescendants() do
						if v.Name == "BarbedWire" and not string.find(v:GetFullName(), "MilitaryIsland") then
							v:Destroy()
						end
					end
					wait(2)
					for count = 1, 4 do
                        JewBox()
                        wait(1)
                    end
                    TP(CFrame.new(1761.20618, 52.1366386, -1790.52783))
					wait(2)
					TPBuilding()
					_G.JewRobbed = true
					_G.AutoRobbing = false
				elseif v.Transparency == 0 then
					notificationcreate('Jewelry', 'Closed', 3)
					TPBuilding()
					_G.AutoRobbing = false
				end
			end
		end
	end
end
local function GetMoneyCapacity(a)local b=tostring(a)or a.Text;local c=b:sub(4,10)local d=c:gsub(",","")local e=tonumber(d)return e end
function getNumber(pretty)
	local lol = ''
	for i = 1, pretty:len() do
		local char = pretty:sub(i, i)
		if char:match('%d') then
			lol = lol .. char
		end
	end
	return tonumber(lol)
end
function BankRobing()
	if _G.AutoRobbing or _G.BankRobbed then return end
	_G.AutoRobbing = true
	for i,v in pairs(game.Workspace.Banks:GetDescendants()) do
		if v:IsA("Decal") then
			if v.Parent.Name == "Sign" then
				if v.Transparency > 0.5 then
					game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CollectMoney.Money.Text = ""
					notificationcreate('Bank', 'Open', 3)
					TP(CFrame.new(30.8057957, 20.307003, 854.226563, -0.00389732886, 0.172487527, -0.98500371, -0.00170719274, 0.985008895, 0.172495201, 0.999990761, 0.00235385355, -0.00354445633))
					for i,v in pairs(game:GetService("Workspace").Banks:GetDescendants()) do
						if v:IsA("Part") then
							if v.Name == "TriggerDoor" then
								TP(v.Parent.Begin.CFrame + Vector3.new(0,5,0))
								wait(1)
								TP(v.CFrame + Vector3.new(0,5,0))
							end
						end
					end
					wait(2)
					for i,v in next, game:GetService("Workspace"):GetDescendants() do
						if v.Name == "BarbedWire" and not string.find(v:GetFullName(), "MilitaryIsland") then
							v:Destroy()
						end
					end
					for i,v in pairs(game:GetService("Workspace").Banks:GetDescendants()) do
						if v:IsA("Part") then
							if v.Name == "Money" then
								TP(v.CFrame + Vector3.new(0,5,0))
							end
						end
					end
					wait(5)
					repeat wait(0.5)
					until getNumber(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CollectMoney.Money.Text) == GetMoneyCapacity(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CollectMoney.Maximum.Text)
					TP(CFrame.new(1761.20618, 52.1366386, -1790.52783, -0.608304322, 0.063044101, -0.791196227, 0.018261876, 0.997688293, 0.0654573366, 0.793493927, 0.0253692511, -0.608049333))
					wait(2)
					TPBuilding()
					_G.BankRobbed = true
					_G.AutoRobbing = false
				elseif v.Transparency == 0 then
					notificationcreate('Bank', 'Closed', 3)
					TPBuilding()
					_G.AutoRobbing = false
				end
			end
		end
	end
end
function checkmuseum()
	for i,v in pairs(workspace.Museum.Roof.Hole:GetChildren()) do
		if v:GetChildren()[1] then
			if v.Transparency == 0 then
				return false
			else
				return true
			end
		end
	end
end
function robmuseum()
	if _G.AutoRobbing or _G.MusRobbed then return end
	_G.AutoRobbing = true
	if not checkmuseum() then
		for i,v in pairs(require(game:GetService('ReplicatedStorage').Module.UI).CircleAction.Specs) do
			if v.Name == "Place Dynamite" and tostring(v.Tag) ~= "BankDoor" and v.Enabled then
				v:Callback(true)
			end
		end
	end
	wait(1)
	if not checkmuseum() then 
		notificationcreate('Museum', 'Closed', 3)
		_G.AutoRobbing = false
		TP(CFrame.new(1730.87537, 20.45331, -1727.92773))
		return 
	end
	for i,v in pairs(require(game:GetService('ReplicatedStorage').Module.UI).CircleAction.Specs) do
		if rawget(v, "Name") then
			if string.find(v.Name, "Grab") and v.Name ~= "Grab" then
				if v.Name == "Grab Bone" and v.Enabled then
					TP(v.Tag.CFrame)
					wait(1)
					for count = 1,8 do
						v:Callback(true)
					end
					break
				end
			end
		end
	end
	TPBuilding() 
	notificationcreate('Museum', 'bypassing', 5)
	wait(16)
	TP(CFrame.new(1761.20618, 52.1366386, -1790.52783))
	wait(2)
	TPBuilding()
	require(game:GetService("ReplicatedStorage").Game.ItemSystem.ItemSystem).Unequip()
	_G.MusRobbed = true
	_G.AutoRobbing = false
	return
end
function CheckPlane()
	for i,v in pairs(require(game:GetService('ReplicatedStorage').Module.UI).CircleAction.Specs) do
		if v.Name == "Inspect Crate" then
			return v.Part
		end
	end
end
function RobPlane()
	if _G.AutoRobbing or _G.PlaneRobbed then return end
	_G.AutoRobbing = true
	if CheckPlane() then
		TP(CheckPlane().CFrame)
		wait(0.5)
		for i,v in pairs(require(game:GetService('ReplicatedStorage').Module.UI).CircleAction.Specs) do
			if v.Name == "Inspect Crate" then
				v:Callback(v, true)
			end
		end
		wait(1)
		TP(CFrame.new(-451.725647, 78.4250259, 2056.63135))
		wait(4)
		TP(CFrame.new(-393.667542, 21.2136765, 2025.38611))
		wait(1.5)
		TPBuilding()
		require(game:GetService("ReplicatedStorage").Game.ItemSystem.ItemSystem).Unequip()
		_G.PlaneRobbed = true
		_G.AutoRobbing = false
	else
		_G.AutoRobbing = false
		sendn("Plane", "Closed", 2)
	end
end
function CheckTrainType()
	for i,v in pairs(workspace.Trains:GetChildren()) do
		if v.Name == "BoxCar" then
			return v.Model.Rob
		elseif v.Name == "SteamEngine" then
			return "Passenger"
		end
	end
end
_G.disabletrain = true
function RobTrain()
	if _G.AutoRobbing or _G.TrainRobbed then return end
	_G.AutoRobbing = true
	if CheckTrainType() then
		if tostring(CheckTrainType()) == "Passenger" then
			for i,v in pairs(require(game:GetService('ReplicatedStorage').Module.UI).CircleAction.Specs) do
				if v.Name == "Grab briefcase" then
					v:Callback(true)
					wait(1)
				end
			 end
			 TP(CFrame.new(1761.20618, 52.1366386, -1790.52783))
			 require(game:GetService("ReplicatedStorage").Game.ItemSystem.ItemSystem).Unequip()
			 wait(2)
			 TPBuilding()
			 _G.TrainRobbed = true
			 _G.AutoRobbing = false
		else
			if _G.disabletrain then 
				_G.AutoRobbing = false
				return 
			end
			game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CollectMoney.Money.Text = ""
			for i,v in pairs(require(game:GetService('ReplicatedStorage').Module.UI).CircleAction.Specs) do
				if v.Name == "Open Door" or v.Name == "Breach Vault" then
					v:Callback(true)
				end
			end
			repeat wait()
				TP(CheckTrainType().Gold.CFrame + Vector3.new(0,0.1,0))
			until getNumber(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CollectMoney.Money.Text) == GetMoneyCapacity(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CollectMoney.Maximum.Text)
			wait()
			TP(CFrame.new(1730.87537, 20.45331, -1727.92773))
			wait()
			_G.TrainRobbed = true
			_G.AutoRobbing = false
		end
	else
		TPBuilding()
		sendn("Train", "Closed", 2)
		_G.AutoRobbing = false
		return false
	end
end
function RobShip()
    if _G.AutoRobbing or _G.ShipRobbed then return end
    _G.AutoRobbing = true
    local Ship = workspace:FindFirstChild("CargoShip")
    local Crate = Ship and Ship.Crates:FindFirstChild("Crate")
    local Heli = workspace.Vehicles:FindFirstChild("Heli")
    if Crate and Heli then
        for i,v in pairs(require(game:GetService('ReplicatedStorage').Module.UI).CircleAction.Specs) do
            if v.Name == "Hijack" then
                v:Callback(true)
            end
        end
        wait(1)
        for i,v in pairs(require(game:GetService('ReplicatedStorage').Module.UI).CircleAction.Specs) do
            if v.Name == "Enter Driver" and v.ValidRoot.Name == "Heli" then
                Client.ExitCar()
                wait(0.3)
                v:Callback(true)
                wait(0.5)
                TP(Crate.Part.CFrame + CFrame.new(0, 10 ,0))
                Client.Vehicle.Heli.OnAction({Name = "Rope"}, true)
                wait(0.1)
                Client.Network:FireServer("tvefgrlm", Crate, Vector3.new())
                break
            end
        end
    else
        _G.AutoRobbing = false
		sendn("Cargo Ship", "Closed", 2)
    end
end
farming:Toggle("Auto Rob", "Autorob by Masterzz", function(arg)
	NiggaToggle.Autorob = arg
	if arg then
		_G.AutoRobbing = false
	end
end)
farming:Button("Rob Small Stores", function()
	for i,v in pairs(require(game:GetService('ReplicatedStorage').Module.UI).CircleAction.Specs) do
		if v.Name == "Rob" then
			v:Callback(v, true)
		end
	end
end)
farming:Button("Remove Lasers", function()
	for i,v in next, game:GetService("Workspace"):GetDescendants() do
		if v.Name == "BarbedWire" and not string.find(v:GetFullName(), "MilitaryIsland") then
			v:Destroy()
		end
	end
end)
farming:Button("Arrest All", function()
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if not table.find(whitelisted, v.Name) then
			if v.Team == game.Teams.Criminal then
				if v.Character:FindFirstChild('InVehicle') then
					Client.Network:FireServer(Client.Hashes.Eject, v.Name)
				end
				if not v.Character:FindFirstChild("Handcuffs") then
					Equip("Handcuffs")
					TP(v.Character.HumanoidRootPart.CFrame);
                    wait(0.1)
					Client.Arrest(v)
					Client.Arrest(v)
					Client.Arrest(v)
					TP(v.Character.HumanoidRootPart.CFrame);
					wait(0.1)
					Client.Arrest(v)
					Client.Arrest(v)
					Client.Arrest(v)
					TP(v.Character.HumanoidRootPart.CFrame);
					wait(0.1)
					Client.Arrest(v)
					Client.Arrest(v)
					Client.Arrest(v)
					TP(v.Character.HumanoidRootPart.CFrame);
					wait(0.1)
					Client.Arrest(v)
					Client.Arrest(v)
					Client.Arrest(v)
					TP(v.Character.HumanoidRootPart.CFrame);
					wait(1)
				end
			end
		end
	end
end)
wait(0.1)
funtab:Box("Play Firework", function(callback)
    if tonumber(callback) then
        Client.Fireworks(tonumber(callback))
    end
end)
funtab:Box("Give Money", function(callback)
    if tonumber(callback) then
        Client.PlusCash(tonumber(callback), "this is fake nigga")
    end
end)
funtab:Box("Eject Player", function(callback)
    for i,v in next, game:GetService("Players"):GetPlayers() do
		if string.find(string.lower(v.Name), string.lower(tostring(callback)))  then
			Client.Network:FireServer(Client.Hashes.Eject, v.Name)
			return
		end
	end
end)
funtab:Toggle("Click Nuke", "Click For Clientsided Nuke", function(arg)
	NiggaToggle.Nuke = arg
end)
funtab:Toggle("Annoy Server", "Annoy Nearby People", function(arg)
	NiggaToggle.Annoy = arg
end)
local ps = funtab:Dropdown("Play Sound")
for i,v in pairs(require(game:GetService("ReplicatedStorage").Resource.Settings).Sounds) do
    ps:Add(tostring(i), function()
        Client.PlaySound(tostring(i), {
            Source = game:GetService("Players").LocalPlayer.Character, 
            Volume = math.huge, 
            Multi = true,
            MaxTime = 10
        }, false);
    end)
end
funtab:Toggle("Spam Hats", "Spam Hats", function(arg)
	NiggaToggle.Hats = arg
end)
funtab:Button("Volcano Eruption", function()
	firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, workspace.LavaFun.Lavatouch, 0)
	wait()
	firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, workspace.LavaFun.Lavatouch, 1)
end)
funtab:Button("Teleport All Unanchored Part to You", function()
	for index, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") and part.Anchored == false and part:IsDescendantOf(game:GetService("Players").LocalPlayer.Character) == false then
			part.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-50,50),50,math.random(-50,50)))
		end
	end
end)
funtab:Button("Teleport All Vehicle to You", function()
	for index, part in pairs(workspace.Vehicles:GetDescendants()) do
        if part:IsA("Part") and part.Anchored == false and part:IsDescendantOf(game:GetService("Players").LocalPlayer.Character) == false then
			part.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-50,50),50,math.random(-50,50)))
		end
	end
end)
wait(0.1)
setting:Box("Whitelist Player", function(callback)
    for i,v in next, game:GetService("Players"):GetPlayers() do
		if string.find(string.lower(v.Name), string.lower(tostring(callback))) and not table.find(whitelisted, v.Name) then
			table.insert(whitelisted, v.Name)
		end
	end
end)
setting:Box("Unwhitelist Player", function(callback)
    for i,v in next, game:GetService("Players"):GetPlayers() do
		if string.find(string.lower(v.Name), string.lower(tostring(callback))) then
			if table.find(whitelisted, v.Name) then
				table.remove(whitelisted, table.find(whitelisted, v.Name))
			end
		end
	end
end)
setting:Button("Copy Discord Link", function()
	setclipboard("https://discord.gg/WRhsPBx")
end)
setting:Button("Rejoin To Same Server", function()
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)
local togglekey = Enum.KeyCode.RightShift
setting:Bind("Toggle GUI Key", function(obj)
    togglekey = obj
end, {
    ["standard"] = Enum.KeyCode.RightShift
})
setting:Label("Credits:")
setting:Label("linsonder6 for all")
setting:Label("Masterzz for autorob & UI library")
setting:Label("mark for testing")
game:GetService("UserInputService").InputBegan:connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == togglekey then
        teslagui.Enabled = not teslagui.Enabled
    end
end)
game:GetService("RunService").Stepped:Connect(function()
	if NiggaToggle.NoClip then
        for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
    if NiggaToggle.Hats then
        firehatoff()
    end
	game.Players.LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)*math.huge
	game.Players.LocalPlayer.SimulationRadius = math.pow(math.huge,math.huge)*math.huge
end)
game:GetService("Players").LocalPlayer:GetMouse().Button1Down:Connect(function()
	if NiggaToggle.Nuke then
		require(game:GetService("ReplicatedStorage").Game.Notification).new({
			Text = "Nuke is incoming! (client sided)",
			Duration = 1.5
		})
		local bruh = game:GetService("Players").LocalPlayer:GetMouse().Hit.p
		Client.Nuke({
			Nuke = {
				Origin = Vector3.new(),
				Speed = 650,
				Duration = 10,
				Target = bruh,
				TimeDilation = 1.5
			},
			Shockwave = {
				Duration = 20,
				MaxRadius = 500
			}
		})
	end
end)
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.F and NiggaToggle.OPM and not Client.GetVehiclePacket() then
		Punch(20)
	end
end)
spawn(function()
	while wait(3) do
		writefile("Tesla.json", game:GetService("HttpService"):JSONEncode(NiggaToggle))
        if NiggaToggle.OpenDoors then
            table.foreachi(Client.Doors, function(i, v)
                Client.OpenDoor(v)
            end)
		end
		if NiggaToggle.Autobreakout then
			if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Team == game.Teams.Prisoner then
				TP(CFrame.new(1730.87537, 20.45331, -1727.92773))
				require(game:GetService("ReplicatedStorage").Game.Notification).new({
					Text = "Escaping...",
				})
				if NiggaToggle.Autorob then
					_G.AutoRobbing = false
				end
			end
        end
    end
end)
spawn(function()
	while wait(1) do
		if NiggaToggle.Autorob then
			BankRobing()
			JewlRobbing()
			robmuseum()
			RobPlane()
			RobTrain()
			for i,v in pairs(require(game:GetService('ReplicatedStorage').Module.UI).CircleAction.Specs) do
				if v.Name == "Rob" then
					v:Callback(v, true)
				end
			end
			wait(14)
		end
	end
end)
spawn(function()
    while wait(0.5) do
        if NiggaToggle.KillAura then
            Client.GiveGun({ Part = { Parent = { Name = "PlasmaPistol" } }, CanGrab = true }, true)
            for _,k in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HotbarGui.Container:GetChildren()) do
                if k:IsA("ImageButton") and k.Icon.Image == "rbxassetid://4751591788" then
                    Client.Network:FireServer(Client.Hashes.Equip, {i = k.Name, Name = "PlasmaPistol"})
                    pcall(function()
                        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                            local HRP = v.Character and v.Character:FindFirstChild("HumanoidRootPart")
                            if v ~= game:GetService("Players").LocalPlayer and HRP and not table.find(whitelisted, v.Name) and v.Team ~= game:GetService("Players").LocalPlayer.Team then
                                for i = 1, 10 do
                                    Client.Network:FireServer(Client.Hashes.Damage, HRP.Position, HRP)
                                end
                            end
                        end
                    end)
                end
            end
        end
        if NiggaToggle.Eject then
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if not table.find(whitelisted, v.Name) then
                    Client.Network:FireServer(Client.Hashes.Eject, v.Name)
                end
            end
		end
    end
end)
spawn(function()
    while wait() do
        local gv = Client.GetVehiclePacket()
        if gv then
            gv.GarageEngineSpeed = _G.EngineSpeed or gv.GarageEngineSpeed
            gv.Height = _G.Height or gv.Height
            gv.TurnSpeed = _G.TurnSpeed or gv.TurnSpeed
            gv.GarageBrakes = _G.Brake or gv.GarageBrakes
            if NiggaToggle.TirePop then
                gv.TirePopDuration = 0
            end
            if NiggaToggle.AntiFlip then
                Client.GuiFunc({Name = "Flip"}, true)
            end
            if NiggaToggle.RainbowCar then
                local v = { Name = Colors[math.random(1,#Colors)] }
                Client.ModifyCar(v, { Name = "BodyColor" })
                Client.ModifyCar(v, { Name = "WindowColor" })
                Client.ModifyCar(v, { Name = "SpoilerColor" })
                Client.ModifyCar(v, { Name = "WheelColor" })
                Client.ModifyCar(v, { Name = "SecondBodyColor" })
                Client.ModifyCar(v, { Name = "Glow" })
                Client.ModifyCar(v, { Name = "HeadlightsColor" })
            end
        end
        if NiggaToggle.NoWait then
            for i,v in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
                v.Timed = false;
            end
		end
		if NiggaToggle.GodMode then
			Client.GiveDonut()
			Client.Network:FireServer(Client.Hashes.EatDonut)
		end
		if NiggaToggle.TazeAll then
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v ~= game:GetService("Players").LocalPlayer and not table.find(whitelisted, v.Name) then
					Taze(v);
				end;
			end;
		end
		if NiggaToggle.TazeAura then
			pcall(function()
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    local HRP = v.Character and v.Character:FindFirstChild("HumanoidRootPart")
                    if v ~= game:GetService("Players") and HRP and (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - HRP.Position).magnitude < 50 and not table.find(whitelisted, v.Name) then
                        Taze(v);
                    end
				end
			end)
        end
		if NiggaToggle.Annoy then
			Client.PlaySound("FireworkBang", {
				Source = game:GetService("Players").LocalPlayer.Character, 
				Volume = math.huge, 
				Multi = true,
			}, false)
			Client.PlaySound("Horn", {
				Pitch = math.huge,
				Source = game:GetService("Players").LocalPlayer.Character, 
				Volume = math.huge, 
				Multi = true,
				MaxTime = 0.1
			}, false)
		end
    end
end)
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__newindex
mt.__newindex = newcclosure(function(a, b, c)
	if b == "WalkSpeed" then
		if tonumber(_G.WalkSpeed) == 16 then
			return old(a, b, c)
        elseif tonumber(_G.WalkSpeed) > 150 then
			Client.Network:FireServer(Client.Hashes.ExitCar)
		end
		return old(a, b, _G.WalkSpeed)
	end
	return old(a, b, c)
end)
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
require(game:GetService("ReplicatedStorage").Game.Notification).new({
    Text = "Thanks for using Tesla!",
});
Client.Fireworks(10);