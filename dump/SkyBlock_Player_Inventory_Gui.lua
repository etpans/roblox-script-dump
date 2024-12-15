-- Gui to Lua
-- Version: 3.2

-- Instances:

local AdminGui = Instance.new("ScreenGui")
local Admin = Instance.new("Frame")
local Players = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TextButton = Instance.new("TextButton")
local UIPadding = Instance.new("UIPadding")
local Player = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Items = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local Frame = Instance.new("Frame")
local ItemName = Instance.new("TextLabel")
local ItemAmount = Instance.new("TextLabel")
local PlayerInfo = Instance.new("Frame")
local Infop = Instance.new("TextLabel")
local Inventory = Instance.new("TextLabel")
local AdminToggle = Instance.new("TextButton")
local Count = Instance.new("IntValue")

--Properties:

AdminGui.Name = "AdminGui"
AdminGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
AdminGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Admin.Name = "Admin"
Admin.Parent = AdminGui
Admin.AnchorPoint = Vector2.new(0.5, 0.5)
Admin.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
Admin.BorderColor3 = Color3.fromRGB(24, 24, 24)
Admin.BorderSizePixel = 2
Admin.Position = UDim2.new(0.5, 0, 0.5, 0)
Admin.Size = UDim2.new(0.5, 0, 0.5, 0)
Admin.Visible = false

Players.Name = "Players"
Players.Parent = Admin
Players.Active = true
Players.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Players.BackgroundTransparency = 1.000
Players.BorderSizePixel = 0
Players.Size = UDim2.new(0.200000003, 0, 1, 0)
Players.CanvasSize = UDim2.new(0, 0, 0, 0)

UIListLayout.Parent = Players
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

TextButton.Parent = Players
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Size = UDim2.new(1, -12, 0, 25)
TextButton.Visible = false
TextButton.Font = Enum.Font.SourceSans
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

UIPadding.Parent = Players
UIPadding.PaddingBottom = UDim.new(0, 20)
UIPadding.PaddingTop = UDim.new(0, 20)

Player.Name = "Player"
Player.Parent = Admin
Player.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Player.BackgroundTransparency = 1.000
Player.Position = UDim2.new(0.25, 0, 0, 0)
Player.Size = UDim2.new(0.699999988, 0, 0.100000001, 0)
Player.Font = Enum.Font.SourceSans
Player.Text = "No one is selected"
Player.TextColor3 = Color3.fromRGB(0, 0, 0)
Player.TextScaled = true
Player.TextSize = 14.000
Player.TextWrapped = true

Close.Name = "Close"
Close.Parent = Admin
Close.BackgroundColor3 = Color3.fromRGB(199, 100, 100)
Close.Position = UDim2.new(1, -20, 0, 0)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Font = Enum.Font.SourceSansBold
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true

Items.Name = "Items"
Items.Parent = Admin
Items.Active = true
Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Items.BackgroundTransparency = 1.000
Items.BorderSizePixel = 0
Items.Position = UDim2.new(0.200000003, 0, 0.200000003, 0)
Items.Size = UDim2.new(0.8, 0, 0.800000012, 0)
Items.CanvasSize = UDim2.new(0, 0, 10, 0)

UIGridLayout.Parent = Items
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 70, 0, 70)

Frame.Parent = Items
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Size = UDim2.new(0, 100, 0, 100)
Frame.Visible = false

ItemName.Name = "ItemName"
ItemName.Parent = Frame
ItemName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemName.BackgroundTransparency = 1.000
ItemName.Size = UDim2.new(1, 0, 0.5, 0)
ItemName.Font = Enum.Font.SourceSans
ItemName.TextColor3 = Color3.fromRGB(0, 0, 0)
ItemName.TextScaled = true
ItemName.TextSize = 14.000
ItemName.TextWrapped = true

ItemAmount.Name = "ItemAmount"
ItemAmount.Parent = Frame
ItemAmount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemAmount.BackgroundTransparency = 1.000
ItemAmount.Position = UDim2.new(0, 0, 0.5, 0)
ItemAmount.Size = UDim2.new(1, 0, 0.5, 0)
ItemAmount.Font = Enum.Font.SourceSans
ItemAmount.TextColor3 = Color3.fromRGB(0, 0, 0)
ItemAmount.TextScaled = true
ItemAmount.TextSize = 14.000
ItemAmount.TextWrapped = true


Inventory.Name = "Inventory"
Inventory.Parent = Admin
Inventory.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Inventory.BackgroundTransparency = 1.000
Inventory.Position = UDim2.new(0.25, 0, 0.100000001, 0)
Inventory.Size = UDim2.new(0.7, 0, 0.100000001, 0)
Inventory.Font = Enum.Font.SourceSans
Inventory.Text = "Player Inventory"
Inventory.TextColor3 = Color3.fromRGB(0, 0, 0)
Inventory.TextScaled = true
Inventory.TextSize = 14.000
Inventory.TextWrapped = true

AdminToggle.Name = "AdminToggle"
AdminToggle.Parent = AdminGui
AdminToggle.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
AdminToggle.BorderColor3 = Color3.fromRGB(24, 24, 24)
AdminToggle.Position = UDim2.new(0, 0, 0.600000024, 0)
AdminToggle.Size = UDim2.new(0, 100, 0, 30)
AdminToggle.AutoButtonColor = false
AdminToggle.Font = Enum.Font.SourceSans
AdminToggle.Text = "Admin"
AdminToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
AdminToggle.TextScaled = true
AdminToggle.TextSize = 14.000
AdminToggle.TextWrapped = true

Count.Name = "Count"
Count.Value = 0
Count.Parent = Items


local function iDiv(a,b)
	return math.floor(a/b)
end
local Size = 70

	function resize()
		

		
		local Length = Items.AbsoluteSize.X - 22
		local Collums = iDiv(Length,Size + 10)
		local Extra = Length - (Collums * (Size + 10))
		local Cell = Size + iDiv(Extra,Collums)
		UIGridLayout.CellSize = UDim2.new(0, Cell, 0, Cell)
		
		local Buttons = Items.Count.Value
		Items.CanvasSize = UDim2.new(0,0,0,10 + (Cell + 10) * math.ceil(Buttons / Collums))	
	end
	
	resize()
	Items.Count.Changed:connect(resize)


local playerButtons = {}
function UpdateButtons()
	for i,Btn in pairs(playerButtons) do
		Btn.MouseButton1Click:Connect(function()
			Count.Value = 0
			Player.Text = Btn.Name.." is selected"
			Inventory.Text = Btn.Name.."'s Inventory"
			
			for i,v in pairs(Items:GetChildren()) do
				if v.Name ~= "Frame" and v:IsA("GuiObject")  then
					v:Destroy()
				end
			end
			local BackPack = game.Players:FindFirstChild(Btn.Name).Backpack
			for i,Item in pairs(BackPack:GetChildren()) do
				Count.Value = Count.Value +1
				local Clone = Frame:Clone()
				Clone.Name = Item.DisplayName.Value
				Clone.ItemName.Text = Item.DisplayName.Value
				Clone.ItemAmount.Text = Item.Amount.Value
				Clone.Parent = Items
				Clone.Visible = true
			end
			resize()
			
			
		end)
	end
end

function GetPlayers()
	for i,Btn in pairs(Players:GetChildren()) do
		if Btn.Name ~= "TextButton" and Btn:IsA("GuiObject") then
			Btn:Destroy()
		end
	end
	Players.CanvasSize = UDim2.new(0,0,0,0)
    for i,v in pairs(game.Players:GetPlayers()) do
		local Clone = TextButton:Clone()
		Clone.Name = v.Name
		Clone.Text = v.Name
		if table.find(playerButtons,v.Name) == nil then
		table.insert(playerButtons,Clone)
		else
		end
		Clone.Parent = Players
		Clone.Visible = true
		Players.CanvasSize = Players.CanvasSize +  UDim2.new(0,0,0,25)
end
UpdateButtons()
end


AdminToggle.MouseButton1Click:Connect(function()
	Admin.Visible = not Admin.Visible
	GetPlayers()
end)

Close.MouseButton1Click:Connect(function()
	Admin.Visible = false
end)



