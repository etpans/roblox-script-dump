local skipIntro = false

local markersEnabled = true

local players = game:GetService("Players")
local player = players.LocalPlayer

local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local debris = game:GetService("Debris")
local uis = game:GetService("UserInputService")

local markers = {}

function createMarker(type, location)
	if type == "Store" then
		
		local markerContainer = Instance.new("BillboardGui")
		local marker = Instance.new("ImageLabel")
		local distanceText = Instance.new("TextButton")
		local lootName = Instance.new("TextButton")
		
		lootName.AnchorPoint = Vector2.new(0.5, 0)
		lootName.Position = UDim2.new(0.5, 0, 0, 0)
		lootName.Size = UDim2.new(1, 0, 0.333, 0)
		
		lootName.BackgroundTransparency = 1
		lootName.Text = "Store"
		
		lootName.Font = "GothamBlack"
		lootName.TextScaled = true
		
		lootName.TextColor3 = Color3.fromRGB(255, 255, 255)
		lootName.TextStrokeTransparency = 0
		
		distanceText.AnchorPoint = Vector2.new(0.5, 1)
		distanceText.Position = UDim2.new(0.5, 0, 1, 0)
		distanceText.Size = UDim2.new(1, 0, 0.333, 0)
		
		distanceText.BackgroundTransparency = 1
		distanceText.Text = math.floor(player:DistanceFromCharacter(location.Position))
		distanceText.Font = "GothamBold"
		distanceText.TextScaled = true
		
		distanceText.TextColor3 = Color3.fromRGB(255, 255, 255)
		distanceText.TextStrokeTransparency = 0
		
		marker.AnchorPoint = Vector2.new(0.5, 0.5)
		marker.Position = UDim2.new(0.5, 0, 0.5, 0)
		marker.Size = UDim2.new(1, 0, 0.333, 0)
		
		marker.ScaleType = "Fit"
		marker.ImageColor3 = Color3.fromHSV(math.random(0, 255)/255, 100/255, 200/255)
		marker.Image = "http://www.roblox.com/asset/?id=2788872214"
		
		marker.BackgroundTransparency = 1
		
		markerContainer.ExtentsOffsetWorldSpace = Vector3.new(0, 2, 0)
		markerContainer.Size = UDim2.new(0, 44, 0, 44)
		
		markerContainer.LightInfluence = 0
		
		markerContainer.ResetOnSpawn = false
		markerContainer.AlwaysOnTop = true
		
		lootName.Name = "store"
		distanceText.Name = "distance"
		marker.Name = "marker"
		markerContainer.Name = "container"
		
		lootName.Parent = markerContainer
		distanceText.Parent = markerContainer
		marker.Parent = markerContainer
		markerContainer.Parent = location
		
	elseif type == "Loot" then
		
		if location:IsA("Model") then
			
			local markerContainer = Instance.new("BillboardGui")
			local marker = Instance.new("ImageLabel")
			local distanceText = Instance.new("TextButton")
			local lootName = Instance.new("TextButton")
			
			lootName.AnchorPoint = Vector2.new(0.5, 0)
			lootName.Position = UDim2.new(0.5, 0, 0, 0)
			lootName.Size = UDim2.new(1, 0, 0.333, 0)
			
			lootName.BackgroundTransparency = 1
			
			for x, child in pairs(location:GetChildren()) do
				if string.match(child.Name, "Pickup") then
					
					lootName.Text = string.split(child.Name, "Pickup")[1]
					
				else
					
					lootName.Text = "Nothing"
					
				end
			end
			
			lootName.Font = "GothamBlack"
			lootName.TextScaled = true
			
			lootName.TextColor3 = Color3.fromRGB(255, 255, 255)
			lootName.TextStrokeTransparency = 0
			
			distanceText.AnchorPoint = Vector2.new(0.5, 1)
			distanceText.Position = UDim2.new(0.5, 0, 1, 0)
			distanceText.Size = UDim2.new(1, 0, 0.333, 0)
			
			distanceText.BackgroundTransparency = 1
			distanceText.Text = math.floor(player:DistanceFromCharacter(location.WeaponLocation.Position))
			distanceText.Font = "GothamBold"
			distanceText.TextScaled = true
			
			distanceText.TextColor3 = Color3.fromRGB(255, 255, 255)
			distanceText.TextStrokeTransparency = 0
			
			marker.AnchorPoint = Vector2.new(0.5, 0.5)
			marker.Position = UDim2.new(0.5, 0, 0.5, 0)
			marker.Size = UDim2.new(1, 0, 0.333, 0)
			
			marker.ScaleType = "Fit"
			marker.ImageColor3 = Color3.fromHSV(math.random(0, 255)/255, 100/255, 200/255)
			marker.Image = "http://www.roblox.com/asset/?id=1204390885"
			
			marker.BackgroundTransparency = 1
			
			markerContainer.ExtentsOffsetWorldSpace = Vector3.new(0, 2, 0)
			markerContainer.Size = UDim2.new(0, 44, 0, 44)
			
			markerContainer.LightInfluence = 0
			
			markerContainer.ResetOnSpawn = false
			markerContainer.AlwaysOnTop = true
			
			lootName.Name = "loot"
			distanceText.Name = "distance"
			marker.Name = "marker"
			markerContainer.Name = "container"
			
			lootName.Parent = markerContainer
			distanceText.Parent = markerContainer
			marker.Parent = markerContainer
			markerContainer.Parent = location
			
		end
	end
end

function createSceenUI()
	if not skipIntro then
		local newScreen = Instance.new("ScreenGui")
		local ownership = Instance.new("TextButton")
		local speedChanger = Instance.new("TextBox")
		local introSound = Instance.new("Sound")
		
		introSound.TimePosition = 0.5
		introSound.SoundId = "rbxassetid://632912045"
		introSound.Volume = 0.5
		introSound.Playing = true
		
		speedChanger.AnchorPoint = Vector2.new(0.5, 0)
		speedChanger.Position = UDim2.new(0.5, 0, 0, 0)
		speedChanger.Size = UDim2.new(0, 60, 0, 50)
		
		speedChanger.BackgroundTransparency = 1
		
		speedChanger.Text = player.Character:FindFirstChild("Humanoid").WalkSpeed
		speedChanger.Font = "Gotham"
		speedChanger.TextStrokeTransparency = 0
		
		speedChanger.TextScaled = true
		
		ownership.AnchorPoint = Vector2.new(0.5, 0.5)
		ownership.Position = UDim2.new(0.5, 0, 0.5, 0)
		ownership.Size = UDim2.new(0, 0, 1/6, 0)
		
		ownership.Rotation = math.random(-2, 2) * 5
		
		ownership.TextScaled = false
		ownership.BackgroundTransparency = 1
		ownership.Font = "GothamBlack"
		
		ownership.Text = ""
		ownership.TextStrokeTransparency = 0
		
		newScreen.ResetOnSpawn = false
		
		newScreen.Name = "TWllNS"
		ownership.Name = "yawh"
		speedChanger.Name = "speed"
		
		newScreen.Parent = player.PlayerGui
		ownership.Parent = newScreen
		speedChanger.Parent = newScreen
		introSound.Parent = newScreen
		
		for i = 1, string.len("made by TWllNS | crenbow#6220") do
			delay(i/15, function() ownership.TextSize = i * 2 ownership.Text = string.sub("made by TWllNS | crenbow#6220", 1, i) end)
		end
		
		tweenService:Create(ownership, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), { Size = UDim2.new(0.9, 0, 1/6, 0), Rotation = 0 } ):Play()
		
		tweenService:Create(ownership, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 8), { TextTransparency = 1, TextStrokeTransparency = 1 } ):Play()
		debris:AddItem(ownership, 13)
		debris:AddItem(introSound, 16)
	end
end

function addExistingLootMarkers()
	for i, thing in pairs(workspace:GetChildren()) do
		if thing.Name == "ShopRemoval" then
			
			createMarker("Store", thing)
			
			table.insert(markers, thing)
		
		elseif thing:IsA("Model") and thing.Name == "WeaponSpawn" then
			
			createMarker("Loot", thing)
			
			table.insert(markers, thing)
		
		end
	end
end

function createHitBox()
	local newHitbox = Instance.new("SelectionBox")
	
	newHitbox.LineThickness = 0.01
	newHitbox.Name = "hitbox"
	
	newHitbox.Parent = workspace
end

createHitBox()

function updateLootDisplay()
	local t = 10
	
	local hue = tick() % t / t
	local color = Color3.fromHSV(hue, 140/255, 200/255)
	
	if player.PlayerGui:FindFirstChild("TWllNS"):FindFirstChild("yawh") then
		player.PlayerGui.TWllNS.yawh.TextColor3 = color
	end
	
	if player.Character:FindFirstChildWhichIsA("Tool") and player.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Handle") then
		local tool = player.Character:FindFirstChildWhichIsA("Tool")
		local hitbox = workspace:WaitForChild("hitbox")
		
		hitbox.Adornee = tool:FindFirstChild("Handle")
		hitbox.Color3 = color
	else
		local hitbox = workspace:WaitForChild("hitbox")
		hitbox.Adornee = player.Character
		hitbox.Color3 = color
	end
	
	player.PlayerGui.TWllNS.speed.TextColor3 = color
	
	if markersEnabled and player.Character then
		for i, marker in pairs(markers) do
			
			local playerDistance = 0
			
			if marker:IsA("BasePart") then
			    playerDistance = player:DistanceFromCharacter(marker.Position)
			else
			    playerDistance = player:DistanceFromCharacter(marker:FindFirstChild("WeaponLocation").Position)
			end
			
			marker:FindFirstChild("container"):FindFirstChild("distance").Text = math.floor(playerDistance)
			
			if marker.Name == "ShopRemoval" then
			    
			    marker:FindFirstChild("container"):FindFirstChild("store").TextColor3 = color
					
				marker:FindFirstChild("container"):FindFirstChild("marker").ImageColor3 = color
				marker:FindFirstChild("container"):FindFirstChild("distance").TextColor3 = color
				marker:FindFirstChild("container").Size = UDim2.new(0, 60 + math.floor(playerDistance/150), 0, 60 + math.floor(playerDistance/150))
			    
			else
			
			for x, child in pairs(marker:GetChildren()) do
				    
				    if string.match(child.Name, "Pickup") then
					
    					marker:FindFirstChild("container"):FindFirstChild("loot").TextColor3 = color
    					marker:FindFirstChild("container"):FindFirstChild("loot").Text = string.split(child.Name, "Pickup")[1]
    					
    					marker:FindFirstChild("container"):FindFirstChild("marker").ImageColor3 = color
    					marker:FindFirstChild("container"):FindFirstChild("distance").TextColor3 = color
    					marker:FindFirstChild("container").Size = UDim2.new(0, 50 + math.floor(playerDistance/100), 0, 50 + math.floor(playerDistance/100))
    					
    				else
    					
    					marker:FindFirstChild("container").loot.TextColor3 = Color3.fromRGB(255, 255, 255)
    					marker:FindFirstChild("container"):FindFirstChild("loot").Text = "Nothing"
    					
    					marker:FindFirstChild("container"):FindFirstChild("marker").ImageColor3 = Color3.fromRGB(255, 255, 255)
    					marker:FindFirstChild("container"):FindFirstChild("distance").TextColor3 = Color3.fromRGB(255, 255, 255)
    					marker:FindFirstChild("container").Size = UDim2.new(0, 34 - math.floor(playerDistance/50), 0, 34 - math.floor(playerDistance/50))
					
					end
				end
			end
		end
	end
end

createSceenUI()

runService.RenderStepped:Connect(updateLootDisplay)

uis.InputBegan:Connect(function(input)
	if not uis:GetFocusedTextBox() then
		if input.KeyCode == Enum.KeyCode.F1 then
			if markersEnabled then
				for _, marker in pairs(markers) do
					marker:FindFirstChild("container").Enabled = false
				end
				player.PlayerGui:FindFirstChild("TWllNS").Enabled = false
				markersEnabled = false
			else
				for _, marker in pairs(markers) do
					marker:FindFirstChild("container").Enabled = true
				end
				player.PlayerGui:FindFirstChild("TWllNS").Enabled = true
				markersEnabled = true  
			end
		elseif input.KeyCode == Enum.KeyCode.J then
			player.Character.Humanoid.WalkSpeed = player.PlayerGui.TWllNS.speed.Text
		end
	end
end)

addExistingLootMarkers()