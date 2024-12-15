-- Decompiled with the Synapse X Luau decompiler.

local u1 = nil;
while true do
	wait();
	if game.Players.LocalPlayer:FindFirstChild("StatsLoaded") and game.Players.LocalPlayer:FindFirstChild("StatsLoaded").Value == true then
		break;
	end;
end;
local l__LocalPlayer__1 = game.Players.LocalPlayer;
local v2 = l__LocalPlayer__1.Character or l__LocalPlayer__1.CharacterAdded:wait();
local l__mouse__3 = l__LocalPlayer__1:GetMouse();
local l__PlayerGui__4 = l__LocalPlayer__1:WaitForChild("PlayerGui");
local l__HumanoidRootPart__5 = v2:WaitForChild("HumanoidRootPart");
local l__Humanoid__6 = v2:WaitForChild("Humanoid");
local l__UserInputService__7 = game:GetService("UserInputService");
local l__ReplicatedStorage__8 = game:GetService("ReplicatedStorage");
local l__RunService__9 = game:GetService("RunService");
local l__TweenService__10 = game:GetService("TweenService");
local l__InventoryBlur__11 = game.Lighting:WaitForChild("InventoryBlur");
local v12 = UDim2.new(0, 0, 0, 0);
local v13 = Vector2.new(0, 0);
local l__Remotes__14 = l__ReplicatedStorage__8:WaitForChild("Remotes");
local l__PickUpItem__15 = l__Remotes__14:WaitForChild("PickUpItem");
local l__GrabItem__16 = l__Remotes__14:WaitForChild("GrabItem");
local l__ReleaseItem__17 = l__Remotes__14:WaitForChild("ReleaseItem");
local l__DragItem__18 = l__Remotes__14:WaitForChild("DragItem");
local l__EquipUnequip__19 = l__Remotes__14:WaitForChild("EquipUnequip");
local l__SwapSlots__20 = l__Remotes__14:WaitForChild("SwapSlots");
local l__DropItem__21 = l__Remotes__14:WaitForChild("DropItem");
local l__CraftItem__22 = l__Remotes__14:WaitForChild("CraftItem");
local l__BuySkin__23 = l__Remotes__14:WaitForChild("BuySkin");
local l__UnloadAmmo__24 = l__Remotes__14:WaitForChild("UnloadAmmo");
local l__Eat__25 = l__Remotes__14:WaitForChild("Eat");
local l__Use__26 = l__Remotes__14:WaitForChild("Use");
local l__Scrap__27 = l__Remotes__14:WaitForChild("Scrap");
local l__DisplayHotbar__28 = l__Remotes__14:WaitForChild("DisplayHotbar");
local l__DisplayInventory__29 = l__Remotes__14:WaitForChild("DisplayInventory");
local l__SwapSlotsChest__30 = l__Remotes__14:WaitForChild("SwapSlotsChest");
local v31 = tick();
l__Humanoid__6.HealthChanged:connect(function(p1)
	wait(4.9);
	if p1 <= 0 then
		l__Remotes__14.Parent = l__ReplicatedStorage__8;
	end;
end);
if l__Remotes__14 then
	print(l__Remotes__14.Name);
end;
local l__ItemControlGui__32 = l__PlayerGui__4:WaitForChild("ItemControlGui");
local l__InventoryFrame__33 = l__ItemControlGui__32:WaitForChild("InventoryFrame");
local l__HotbarFrame__34 = l__ItemControlGui__32:WaitForChild("HotbarFrame");
local l__CraftingFrame__35 = l__InventoryFrame__33:WaitForChild("CraftingFrame");
local v36 = require(game.ReplicatedStorage.Modules);
game.Workspace.ChildAdded:connect(function(p2)
	wait();
	if p2:IsA("Tool") then
		game.ReplicatedStorage.Remotes.AddTabs:FireServer(25, false, "EXPLOIT CODE : 1025");
	end;
end);
l__LocalPlayer__1.ChildAdded:connect(function(p3)
	wait();
	if p3:IsA("Tool") then
		game.ReplicatedStorage.Remotes.AddTabs:FireServer(50, false, "EXPLOIT CODE : 1026");
	end;
end);
function comma_value(p4)
	local v37 = p4;
	local v38 = false;
	if 1000000 <= v37 then
		v37 = math.floor(v37 / 1000);
		v38 = true;
	end;
	while true do
		local v39, v40 = string.gsub(v37, "^(-?%d+)(%d%d%d)", "%1 %2");
		v37 = v39;
		if v40 ~= 0 then

		else
			break;
		end;	
	end;
	return v38 and v37 .. "m" or v37;
end;
local u2 = nil;
local u3 = nil;
local u4 = v12;
local u5 = v13;
local function v41(p5, p6, p7)
	if p7 and p6:FindFirstChild("ItemId") and game.ReplicatedStorage.ItemData:FindFirstChild(p6.ItemId.Value) and game.ReplicatedStorage.ItemData:FindFirstChild(p6.ItemId.Value):FindFirstChild("Stackable") then
		u2 = p7;
		u3 = p5;
		u4 = UDim2.new(0, u5.X - p5.AbsolutePosition.X, 0, u5.Y - p5.AbsolutePosition.Y);
		p5.Item.ImageTransparency = 0.5;
		p5.Item.Count.TextTransparency = 0.5;
		p5.Item.Count.Text = p6:FindFirstChild("Amount").Value - u2;
		l__ItemControlGui__32.PickUp.Item.Image = p5.Item.Image;
		l__ItemControlGui__32.PickUp.Item.ImageColor3 = p5.Item.ImageColor3;
		l__ItemControlGui__32.PickUp.Item.Count.Text = u2;
		l__ItemControlGui__32.PickUp.Visible = true;
		return;
	end;
	u3 = p5;
	u4 = UDim2.new(0, u5.X - p5.AbsolutePosition.X, 0, u5.Y - p5.AbsolutePosition.Y);
	p5.Item.ImageTransparency = 0.5;
	p5.Item.Count.TextTransparency = 0.5;
	l__ItemControlGui__32.PickUp.Item.Image = p5.Item.Image;
	l__ItemControlGui__32.PickUp.Item.ImageColor3 = p5.Item.ImageColor3;
	l__ItemControlGui__32.PickUp.Item.Count.Text = p5.Item.Count.Text;
	l__ItemControlGui__32.PickUp.Visible = true;
end;
local u6 = false;
local u7 = function()

end;
local u8 = function()

end;
local u9 = nil;
local function u10(p8, p9)
	l__ItemControlGui__32.Skins.Visible = false;
	for v42, v43 in pairs(l__InventoryFrame__33.ItemFrame.Actions:GetChildren()) do
		if v43.Name ~= "UIGridLayout" then
			v43:Destroy();
		end;
	end;
	if p8 then
		l__InventoryFrame__33.ItemFrame.ItemImage.Image = p8.ItemImage.Image;
		l__InventoryFrame__33.ItemFrame.ItemImage.ImageColor3 = p8.ItemImage.ImageColor3;
		l__InventoryFrame__33.ItemFrame.DescLabel.Text = p8.ItemDesc.Value;
		l__InventoryFrame__33.ItemFrame.NameLabel.Text = p8.Name;
		if p8:FindFirstChild("CraftAmount") and p8.CraftAmount.Value > 1 then
			l__InventoryFrame__33.ItemFrame.NameLabel.Text = l__InventoryFrame__33.ItemFrame.NameLabel.Text .. " x" .. p8.CraftAmount.Value;
		end;
		if p8:FindFirstChild("Ammo") then
			l__InventoryFrame__33.ItemFrame.AmmoLabel.Text = "Fires         " .. p8.Ammo.Value;
			l__InventoryFrame__33.ItemFrame.AmmoLabel.AmmoImage.Image = game.ReplicatedStorage.ItemData:FindFirstChild(p8.Ammo.Value).ItemImage.Image;
			l__InventoryFrame__33.ItemFrame.AmmoLabel.Visible = true;
		else
			l__InventoryFrame__33.ItemFrame.AmmoLabel.Visible = false;
		end;
		local v44 = script.ActionButton:Clone();
		v44.Name = "Craft";
		v44.Text = "CRAFT";
		v44.Parent = l__InventoryFrame__33.ItemFrame.Actions;
		local v45 = Instance.new("Frame");
		v45.BackgroundColor3 = Color3.new(31, 31, 31);
		v45.BackgroundTransparency = 0.5;
		v45.ZIndex = v44.ZIndex + 1;
		v45.BorderSizePixel = 0;
		v45.AnchorPoint = Vector2.new(0, 1);
		v45.Position = UDim2.new(0, 0, 1, 0);
		v45.Size = UDim2.new(0, 0, 1, 0);
		v45.Parent = v44;
		v44.MouseButton1Down:connect(function()
			u6 = true;
			if l__CraftItem__22:InvokeServer(p8) ~= 1 then
				u6 = false;
				return;
			end;
			v45.Size = UDim2.new(1, 0, 1, 0);
			v45.BackgroundColor3 = Color3.new(31, 31, 31);
			v45.BackgroundTransparency = 0.5;
			v45:TweenSize(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5, true);
			while true do
				wait();
				if v2:FindFirstChild("Crafting") == nil then
					break;
				end;			
			end;
			u6 = false;
			v45:TweenSize(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.01, true);
			u7();
			u8();
		end);
		if p9 then
			local v46 = script.ActionButton:Clone();
			v46.Name = "Skins";
			v46.Text = "SKINS";
			v46.Parent = l__InventoryFrame__33.ItemFrame.Actions;
			v46.MouseButton1Down:connect(function()
				for v47, v48 in pairs(l__ItemControlGui__32.Skins:GetChildren()) do
					if v48.ClassName == "ImageButton" then
						v48:Destroy();
					end;
				end;
				for v49, v50 in pairs(p9:GetChildren()) do
					if game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name) then
						local v51 = script.ChooseSkin:Clone();
						v51.Image = game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name).ItemImage.Image;
						v51.ImageColor3 = game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name).ItemImage.ImageColor3;
						v51.LayoutOrder = string.byte(string.sub(v50.Name, 1, 1));
						v51.Parent = l__ItemControlGui__32.Skins;
						if l__LocalPlayer__1.stats.skins:FindFirstChild(v50.Name) and l__LocalPlayer__1.stats.skins:FindFirstChild(v50.Name).Value == 0 then
							v51.LayoutOrder = v51.LayoutOrder + game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name).TabsCost.Value * 1000 + 1000000;
							v51.Locked.CostLabel.Text = game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name).TabsCost.Value;
							v51.Locked.Visible = true;
							v51.Locked.MouseButton1Down:connect(function()
								l__PlayerGui__4.Messages.BuySkinFrame.TitleText.Text = "Purchase " .. v50.Name .. " Skin";
								l__PlayerGui__4.Messages.BuySkinFrame.MessageText.Text = game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name).ItemDesc.Value .. "\n\nThis item is a skin for " .. p9.Name;
								l__PlayerGui__4.Messages.BuySkinFrame.Tabs.Text = comma_value(game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name).TabsCost.Value);
								l__PlayerGui__4.Messages.BuySkinFrame.ItemImage.Image = game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name).ItemImage.Image;
								l__PlayerGui__4.Messages.BuySkinFrame.ItemImage.ImageColor3 = game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name).ItemImage.ImageColor3;
								l__PlayerGui__4.Messages.BuySkinFrame.Visible = true;
								if game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name).TabsCost.Value == 0 then
									l__PlayerGui__4.Messages.BuySkinFrame.Accept.Visible = false;
									l__PlayerGui__4.Messages.BuySkinFrame.TitleText.Text = v50.Name .. " Skin (UNOBTAINABLE)";
								else
									l__PlayerGui__4.Messages.BuySkinFrame.Accept.Visible = true;
								end;
								l__ItemControlGui__32.Skins.Visible = false;
								u9 = game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name);
							end);
						end;
						v51.MouseButton1Down:connect(function()
							u10(game.ReplicatedStorage.ItemData:FindFirstChild(v50.Name), p9);
						end);
					end;
				end;
				l__ItemControlGui__32.Skins.Size = UDim2.new(0, 50 * math.min(8, #l__ItemControlGui__32.Skins:GetChildren() - 1), 0, 50 * (1 + math.floor((#l__ItemControlGui__32.Skins:GetChildren() - 2) / 8)));
				l__ItemControlGui__32.Skins.Position = UDim2.new(0, l__mouse__3.X, 0, l__mouse__3.Y);
				l__ItemControlGui__32.Skins.Visible = true;
			end);
		end;
	end;
end;
game.ReplicatedStorage.Remotes.Soundify.OnClientEvent:connect(function(p10)
	if script:FindFirstChild(p10) then
		script:FindFirstChild(p10):Play();
	end;
end);
l__PlayerGui__4.Messages.BuySkinFrame.Close.MouseButton1Down:connect(function()
	l__PlayerGui__4.Messages.BuySkinFrame.Visible = false;
end);
l__PlayerGui__4.Messages.BuySkinFrame.Decline.MouseButton1Down:connect(function()
	l__PlayerGui__4.Messages.BuySkinFrame.Visible = false;
end);
l__PlayerGui__4.Messages.BuySkinFrame.Accept.MouseButton1Down:connect(function()
	if u9 then
		l__BuySkin__23:FireServer(u9);
	end;
	l__PlayerGui__4.Messages.BuySkinFrame.Visible = false;
end);
local function u11(p11)
	for v52, v53 in pairs(l__CraftingFrame__35.ScrollingFrame:GetChildren()) do
		if v53.ClassName == "Frame" then
			v53:Destroy();
		end;
	end;
	for v54, v55 in pairs(l__CraftingFrame__35.Options:GetChildren()) do
		if v55.ClassName == "ImageButton" then
			v55.ImageTransparency = 0;
		end;
	end;
	if p11 then
		l__CraftingFrame__35.Options:FindFirstChild(p11).ImageTransparency = 0.75;
	else
		l__CraftingFrame__35.Options.All.ImageTransparency = 0.75;
	end;
	for v56, v57 in pairs(game.ReplicatedStorage.ItemData:GetChildren()) do
		if v57:FindFirstChild("Crafting") and ((p11 == nil or v57:FindFirstChild("CraftingType") and v57.CraftingType.Value == p11) and (l__CraftingFrame__35.Search.TextBox.Text == "Search..." or not (not v36.search(string.lower(l__CraftingFrame__35.Search.TextBox.Text), string.lower(v57.Name), 1)) or string.find(string.lower(v57.Name), string.lower(l__CraftingFrame__35.Search.TextBox.Text)))) then
			if v57:FindFirstChild("CraftingGroup") == nil then
				local v58 = script.CraftFrame:Clone();
				v58.Name = v57.Name;
				v58.LayoutOrder = (v57:FindFirstChild("Level") and v57.Level.Value * 1000 or 1) + string.byte(string.sub(v57.Name, 1, 1));
				v58.NameLabel.Text = string.upper(v57.Name);
				v58.DescLabel.Text = v57.Crafting:GetChildren()[1].Value .. "x " .. v57.Crafting:GetChildren()[1].Name;
				v58.ItemImage.Image = v57.ItemImage.Image;
				v58.ItemImage.ImageColor3 = v57.ItemImage.ImageColor3;
				if v57:FindFirstChild("CraftAmount") and v57.CraftAmount.Value > 1 then
					v58.NameLabel.Text = v58.NameLabel.Text .. " x" .. v57.CraftAmount.Value;
				end;
				if p11 == nil and v57:FindFirstChild("CraftingType") then
					v58.CraftingType.Image = l__CraftingFrame__35.Options:FindFirstChild(v57.CraftingType.Value).Image;
				end;
				if #v57.Crafting:GetChildren() > 1 then
					for v59 = 2, #v57.Crafting:GetChildren() do
						v58.DescLabel.Text = v58.DescLabel.Text .. ", " .. v57.Crafting:GetChildren()[v59].Value .. "x " .. v57.Crafting:GetChildren()[v59].Name;
					end;
				end;
				if (v57:FindFirstChild("Level") and v57.Level.Value or 1) <= l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("other"):WaitForChild("Level").Value then
					v58.Button.MouseButton1Down:connect(function()
						l__InventoryFrame__33.ItemFrame.Visible = true;
						u10(v57);
					end);
				else
					v58.LevelLock.Text = "Level " .. (v57:FindFirstChild("Level") and v57.Level.Value or 1);
					v58.LevelLock.Visible = true;
				end;
				v58.Parent = l__CraftingFrame__35.ScrollingFrame;
			elseif game.ReplicatedStorage.CraftingGroups:FindFirstChild(v57.CraftingGroup.Value) and game.ReplicatedStorage.CraftingGroups:FindFirstChild(v57.CraftingGroup.Value):FindFirstChild(v57.Name):FindFirstChild("Default") then
				local v60 = script.CraftFrame:Clone();
				v60.Name = v57.CraftingGroup.Value;
				v60.LayoutOrder = (v57:FindFirstChild("Level") and v57.Level.Value * 1000 or 1) + string.byte(string.sub(v57.Name, 1, 1));
				v60.NameLabel.Text = string.upper(v57.CraftingGroup.Value);
				v60.DescLabel.Text = v57.Crafting:GetChildren()[1].Value .. "x " .. v57.Crafting:GetChildren()[1].Name;
				v60.ItemImage.Image = v57.ItemImage.Image;
				v60.ItemImage.ImageColor3 = v57.ItemImage.ImageColor3;
				if v57:FindFirstChild("CraftAmount") and v57.CraftAmount.Value > 1 then
					v60.NameLabel.Text = v60.NameLabel.Text .. " x" .. v57.CraftAmount.Value;
				end;
				if p11 == nil and v57:FindFirstChild("CraftingType") then
					v60.CraftingType.Image = l__CraftingFrame__35.Options:FindFirstChild(v57.CraftingType.Value).Image;
				end;
				if #v57.Crafting:GetChildren() > 1 then
					for v61 = 2, #v57.Crafting:GetChildren() do
						v60.DescLabel.Text = v60.DescLabel.Text .. ", " .. v57.Crafting:GetChildren()[v61].Value .. "x " .. v57.Crafting:GetChildren()[v61].Name;
					end;
				end;
				if (v57:FindFirstChild("Level") and v57.Level.Value or 1) <= l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("other"):WaitForChild("Level").Value then
					v60.Button.MouseButton1Down:connect(function()
						l__InventoryFrame__33.ItemFrame.Visible = true;
						u10(v57, game.ReplicatedStorage.CraftingGroups:FindFirstChild(v57.CraftingGroup.Value));
					end);
				else
					v60.LevelLock.Text = "Level " .. (v57:FindFirstChild("Level") and v57.Level.Value or 1);
					v60.LevelLock.Visible = true;
				end;
				v60.Parent = l__CraftingFrame__35.ScrollingFrame;
			end;
		end;
	end;
	wait();
	l__CraftingFrame__35.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, l__CraftingFrame__35.ScrollingFrame.UIListLayout.AbsoluteContentSize.Y);
end;
local u12 = nil;
l__CraftingFrame__35.Search.TextBox.FocusLost:connect(function(p12)
	if p12 then
		u11(u12);
		return;
	end;
	if #string.gsub(l__CraftingFrame__35.Search.TextBox.Text, " ", "") <= 0 then
		l__CraftingFrame__35.Search.TextBox.Text = "Search...";
	end;
end);
for v62, v63 in pairs(l__CraftingFrame__35.Options:GetChildren()) do
	v63.MouseButton1Down:connect(function()
		if v63.Name == "All" then
			u12 = nil;
			u11(u12);
			return;
		end;
		u12 = v63.Name;
		u11(u12);
	end);
end;
local function u13(p13)
	local v64 = script.MessageFrame:Clone();
	v64.Name = os.time();
	v64.MessageText.Text = p13;
	v64.Parent = l__PlayerGui__4:WaitForChild("Messages").MessagesFrame;
	game.Debris:AddItem(v64, 3);
end;
local function u14(p14)
	for v65, v66 in pairs(l__InventoryFrame__33.ItemFrame.Actions:GetChildren()) do
		if v66.Name ~= "UIGridLayout" then
			v66:Destroy();
		end;
	end;
	local v67 = l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("inventory"):FindFirstChild("slot" .. p14);
	if v67 and v67:FindFirstChild("ItemId") then
		l__InventoryFrame__33.ItemFrame.Visible = true;
		local v68 = game.ReplicatedStorage.ItemData:FindFirstChild(v67.ItemId.Value);
		if v68 then
			l__InventoryFrame__33.ItemFrame.ItemImage.Image = v68.ItemImage.Image;
			l__InventoryFrame__33.ItemFrame.ItemImage.ImageColor3 = v68.ItemImage.ImageColor3;
			l__InventoryFrame__33.ItemFrame.DescLabel.Text = v68.ItemDesc.Value;
			l__InventoryFrame__33.ItemFrame.NameLabel.Text = v68.Name;
			if v68:FindFirstChild("Ammo") then
				l__InventoryFrame__33.ItemFrame.AmmoLabel.Text = "Fires         " .. v68.Ammo.Value;
				l__InventoryFrame__33.ItemFrame.AmmoLabel.AmmoImage.Image = game.ReplicatedStorage.ItemData:FindFirstChild(v68.Ammo.Value).ItemImage.Image;
				l__InventoryFrame__33.ItemFrame.AmmoLabel.Visible = true;
			else
				l__InventoryFrame__33.ItemFrame.AmmoLabel.Visible = false;
			end;
			if v68:FindFirstChild("Actions") and #v68.Actions:GetChildren() > 0 then
				if v68.Actions:FindFirstChild("Unload Ammo") then
					local v69 = {
						["1"] = "Iron Sight", 
						["2"] = "Muzzle Boost", 
						["3"] = "Muzzle Brake", 
						["4"] = "Suppressor", 
						["5"] = "Recoil Pad", 
						["6"] = "Barrel Choke", 
						["7"] = "2x Scope"
					};
					if v67.Misc1.Value ~= 0 then
						local v70 = script.ActionButton:Clone();
						v70.Name = "Remove" .. v69[tostring(v67.Misc1.Value)];
						v70.Text = string.upper("Remove " .. v69[tostring(v67.Misc1.Value)]);
						v70.Parent = l__InventoryFrame__33.ItemFrame.Actions;
						v70.MouseButton1Down:connect(function()
							l__Remotes__14.RemoveMod:InvokeServer(v67, "Misc1");
							u14(p14);
							u7();
							u8();
						end);
					end;
					if v67.Misc2.Value ~= 0 then
						local v71 = script.ActionButton:Clone();
						v71.Name = "Remove" .. v69[tostring(v67.Misc2.Value)];
						v71.Text = string.upper("Remove " .. v69[tostring(v67.Misc2.Value)]);
						v71.Parent = l__InventoryFrame__33.ItemFrame.Actions;
						v71.MouseButton1Down:connect(function()
							l__Remotes__14.RemoveMod:InvokeServer(v67, "Misc2");
							u7();
							u8();
						end);
					end;
				end;
				for v72, v73 in pairs(v68.Actions:GetChildren()) do
					local v74 = script.ActionButton:Clone();
					v74.Name = v73.Name;
					v74.Text = string.upper(v73.Name);
					v74.Parent = l__InventoryFrame__33.ItemFrame.Actions;
					if v73.Name == "Drop" then
						v74.Name = "AAAAA" .. v73.Name;
						v74.MouseButton1Down:connect(function()
							if v68:FindFirstChild("Stackable") == nil then
								l__DropItem__21:InvokeServer(string.gsub(u3.Name, "Slot", ""));
								u7();
								u8();
								return;
							end;
							l__ItemControlGui__32.Confirmation.TextBox.Text = "1";
							l__ItemControlGui__32.Confirmation.TextLabel.Text = "How many would you like to drop?";
							l__ItemControlGui__32.Confirmation.Visible = true;
							l__ItemControlGui__32.Confirmation.TextBox:CaptureFocus();
						end);
					elseif v73.Name == "Unload Ammo" then
						v74.MouseButton1Down:connect(function()
							l__UnloadAmmo__24:InvokeServer(v67);
							u14(p14);
							u7();
							u8();
						end);
					elseif v73.Name == "Eat" then
						v74.MouseButton1Down:connect(function()
							l__Eat__25:InvokeServer(v67);
							u7();
							u8();
						end);
					elseif v73.Name == "Redeem" then
						v74.MouseButton1Down:connect(function()
							l__Remotes__14.Redeem:InvokeServer(v67);
							u7();
							u8();
						end);
					elseif v73.Name == "Use" then
						v74.MouseButton1Down:connect(function()
							if v68.Name == "Bandage" or v68.Name == "Linen Bandage" or v68.Name == "Herbal Bandage" then
								if l__Humanoid__6:FindFirstChild("BleedScript") == nil then
									u13("You can only use bandages when you are Bleeding!");
								else
									l__Use__26:InvokeServer(v67);
								end;
							else
								l__Use__26:InvokeServer(v67);
							end;
							u7();
							u8();
						end);
					elseif v73.Name == "Wear" then
						local v75 = string.gsub(u3.Name, "Slot", "");
						if tonumber(v75) > 30 then
							v74.Text = "UNEQUIP";
							v74.MouseButton1Down:connect(function()
								local v76 = v36.findSlot(l__LocalPlayer__1);
								if v76 then
									script.PlaceItem:Play();
									l__SwapSlots__20:InvokeServer(v75, string.gsub(v76.Name, "slot", ""));
									u7();
									u8();
								end;
							end);
						else
							v74.Text = "EQUIP";
							v74.MouseButton1Down:connect(function()
								local v77 = nil;
								for v78 = 31, 36 do
									local v79 = tostring(v78);
									if #v79 < 2 then
										v79 = "0" .. v79;
									end;
									local v80 = l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v79);
									if #v80:GetChildren() == 0 then
										v77 = v80;
									end;
								end;
								if v77 then
									script.PlaceItem:Play();
									l__SwapSlots__20:InvokeServer(v75, string.gsub(v77.Name, "slot", ""));
									u7();
									u8();
								end;
							end);
						end;
					end;
				end;
			end;
			if v68:FindFirstChild("Crafting") ~= nil and #v68:FindFirstChild("Crafting"):GetChildren() > 0 and ((v68:FindFirstChild("CraftAmount") == nil or v68:FindFirstChild("CraftAmount").Value <= v67:FindFirstChild("Amount").Value) and v68:findFirstChild("CantScrap") == nil) then
				local v81 = script.ActionButton:Clone();
				v81.Name = "ZZZZZScrap";
				v81.Text = "SCRAP";
				v81.Parent = l__InventoryFrame__33.ItemFrame.Actions;
				v81.MouseButton1Down:connect(function()
					if v68:FindFirstChild("Crafting") ~= nil then
						if l__Scrap__27:InvokeServer(string.gsub(u3.Name, "Slot", "")) == 0 then
							script.Scrap:Play();
						else
							script.ErrorAlarm:Play();
						end;
						u7();
						u8();
					end;
				end);
				return;
			end;
		end;
	else
		l__InventoryFrame__33.ItemFrame.ItemImage.Image = "";
		l__InventoryFrame__33.ItemFrame.DescLabel.Text = "";
		l__InventoryFrame__33.ItemFrame.NameLabel.Text = "";
		l__InventoryFrame__33.ItemFrame.Visible = false;
	end;
end;
local function v82(p15)
	local v83 = nil;
	for v84, v85 in pairs(l__InventoryFrame__33.ItemFrame.Actions:GetChildren()) do
		if v85.Name ~= "UIGridLayout" then
			v85:Destroy();
		end;
	end;
	if p15 and p15:FindFirstChild("ItemId") then
		l__InventoryFrame__33.ItemFrame.Visible = true;
		v83 = game.ReplicatedStorage.ItemData:FindFirstChild(p15.ItemId.Value);
		if not v83 then
			return;
		end;
	else
		l__InventoryFrame__33.ItemFrame.ItemImage.Image = "";
		l__InventoryFrame__33.ItemFrame.DescLabel.Text = "";
		l__InventoryFrame__33.ItemFrame.NameLabel.Text = "";
		l__InventoryFrame__33.ItemFrame.Visible = false;
		return;
	end;
	l__InventoryFrame__33.ItemFrame.ItemImage.Image = v83.ItemImage.Image;
	l__InventoryFrame__33.ItemFrame.ItemImage.ImageColor3 = v83.ItemImage.ImageColor3;
	l__InventoryFrame__33.ItemFrame.DescLabel.Text = v83.ItemDesc.Value;
	l__InventoryFrame__33.ItemFrame.NameLabel.Text = v83.Name;
	if not v83:FindFirstChild("Ammo") then
		l__InventoryFrame__33.ItemFrame.AmmoLabel.Visible = false;
		return;
	end;
	l__InventoryFrame__33.ItemFrame.AmmoLabel.Text = "Fires         " .. v83.Ammo.Value;
	l__InventoryFrame__33.ItemFrame.AmmoLabel.AmmoImage.Image = game.ReplicatedStorage.ItemData:FindFirstChild(v83.Ammo.Value).ItemImage.Image;
	l__InventoryFrame__33.ItemFrame.AmmoLabel.Visible = true;
end;
u7 = function()
	while true do
		l__RunService__9.RenderStepped:wait();
		if u6 == false then
			break;
		end;	
	end;
	for v86 = 1, 6 do
		local v87 = tostring(v86);
		if #v87 < 2 then
			v87 = "0" .. v87;
		end;
		l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31);
		local v88 = l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("inventory"):FindFirstChild("slot" .. v87);
		if v88 and v88:FindFirstChild("ItemId") then
			local v89 = game.ReplicatedStorage.ItemData:FindFirstChild(v88.ItemId.Value);
			if v89 then
				l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Item.Image = v89.ItemImage.Image;
				l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Item.ImageColor3 = v89.ItemImage.ImageColor3;
				l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Item.ImageTransparency = 0;
				l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Item.Count.TextTransparency = 0;
				l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Item.Count.Text = "";
				if v2:FindFirstChild("Tool" .. v87) then
					l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Frame.BackgroundColor3 = BrickColor.new("Bright orange").Color;
				else
					l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31);
				end;
				if v89:FindFirstChild("Stackable") then
					l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Item.Count.Text = v88:WaitForChild("Amount").Value;
				elseif v89:FindFirstChild("Ammo") then
					local v90 = 0;
					local v91 = v36.findSlot(l__LocalPlayer__1, v89.Ammo.Value, true);
					if v91 and v91:FindFirstChild("Amount") then
						v90 = v91.Amount.Value;
					end;
					l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Item.Count.Text = v88:WaitForChild("Amount").Value .. "/" .. v90;
				end;
			end;
		else
			l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Item.Image = "";
			l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Item.Count.Text = "";
			l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Item.ImageTransparency = 0;
			l__HotbarFrame__34:FindFirstChild("Slot" .. v87).Item.Count.TextTransparency = 0;
		end;
	end;
end;
delay(0.1, function()
	u7();
end);
l__DisplayHotbar__28.OnClientEvent:connect(function()
	u7();
end);
local u15 = nil;
function displayChest()
	if u15 then
		if u15:FindFirstChild("inventory") then
			l__InventoryFrame__33.InventoryFrame.NameLabel.TextLabel.Text = u15.Name;
			local v92 = 1 - 1;
			while true do
				local v93 = tostring(v92);
				if #v93 < 2 then
					v93 = "0" .. v93;
				end;
				local v94 = u15:WaitForChild("inventory"):FindFirstChild("slot" .. v93);
				if v94 then
					if v94:FindFirstChild("ItemId") then
						local v95 = game.ReplicatedStorage.ItemData:FindFirstChild(v94.ItemId.Value);
						if v95 then
							l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Visible = true;
							l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Image = v95.ItemImage.Image;
							l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.ImageColor3 = v95.ItemImage.ImageColor3;
							l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.ImageTransparency = 0;
							l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Count.TextTransparency = 0;
							l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Count.Text = "";
							l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Fire.Visible = false;
							l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Plant.Visible = false;
							if v94.Misc2.Value == 99999 then
								if u15:FindFirstChild("IsFurnace") then
									l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Fire.Visible = true;
									l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Fire.Image = "rbxassetid://1508853166";
								elseif v94.Misc2.Value == 99997 then
									if u15:FindFirstChild("Sifter") then
										l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Fire.Visible = true;
										l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Fire.Image = "rbxassetid://1849996586";
									elseif v94.Misc2.Value == 99998 then
										if u15:FindFirstChild("GrowthRate") then
											l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Plant.Visible = true;
										end;
									end;
								elseif v94.Misc2.Value == 99998 then
									if u15:FindFirstChild("GrowthRate") then
										l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Plant.Visible = true;
									end;
								end;
							elseif v94.Misc2.Value == 99997 then
								if u15:FindFirstChild("Sifter") then
									l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Fire.Visible = true;
									l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Fire.Image = "rbxassetid://1849996586";
								elseif v94.Misc2.Value == 99998 then
									if u15:FindFirstChild("GrowthRate") then
										l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Plant.Visible = true;
									end;
								end;
							elseif v94.Misc2.Value == 99998 then
								if u15:FindFirstChild("GrowthRate") then
									l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Plant.Visible = true;
								end;
							end;
							if v95:FindFirstChild("Stackable") then
								l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Count.Text = v94:WaitForChild("Amount").Value;
							elseif v95:FindFirstChild("Ammo") then
								local v96 = 0;
								local v97 = v36.findSlot(l__LocalPlayer__1, v95.Ammo.Value, true);
								if v97 then
									if v97:FindFirstChild("Amount") then
										v96 = v97.Amount.Value;
									end;
								end;
								l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Count.Text = v94:WaitForChild("Amount").Value .. "/" .. v96;
							end;
						end;
					elseif v94 then
						l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Visible = true;
						l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Image = "";
						l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Count.Text = "";
						l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.ImageTransparency = 0;
						l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Count.TextTransparency = 0;
						l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Fire.Visible = false;
						l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Plant.Visible = false;
					else
						l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Visible = false;
					end;
				elseif v94 then
					l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Visible = true;
					l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Image = "";
					l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Count.Text = "";
					l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.ImageTransparency = 0;
					l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Count.TextTransparency = 0;
					l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Fire.Visible = false;
					l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Item.Plant.Visible = false;
				else
					l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v93).Visible = false;
				end;
				if 0 <= 1 then
					if v92 < 16 then

					else
						break;
					end;
				elseif 16 < v92 then

				else
					break;
				end;
				v92 = v92 + 1;			
			end;
			l__InventoryFrame__33.InventoryFrame.NameLabel.Bar.Bar.Size = UDim2.new(u15:WaitForChild("Stock").Value / u15:WaitForChild("MaxStock").Value, 0, 1, 0);
		end;
	end;
end;
u8 = function()
	while true do
		l__RunService__9.RenderStepped:wait();
		if u6 == false then
			break;
		end;	
	end;
	if l__LocalPlayer__1:FindFirstChild("stats") and l__LocalPlayer__1.stats:FindFirstChild("other") and l__LocalPlayer__1.stats.other:FindFirstChild("InvEx") then
		local l__Value__98 = l__LocalPlayer__1.stats.other:FindFirstChild("InvEx").Value;
		if l__Value__98 >= 1 then
			for v99 = 37, 42 do
				local v100 = tostring(v99);
				if #v100 < 2 then
					v100 = "0" .. v100;
				end;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v100).Visible = true;
			end;
		else
			for v101 = 37, 42 do
				local v102 = tostring(v101);
				if #v102 < 2 then
					v102 = "0" .. v102;
				end;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v102).Visible = false;
			end;
		end;
		if l__Value__98 >= 2 then
			for v103 = 43, 48 do
				local v104 = tostring(v103);
				if #v104 < 2 then
					v104 = "0" .. v104;
				end;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v104).Visible = true;
			end;
		else
			for v105 = 43, 48 do
				local v106 = tostring(v105);
				if #v106 < 2 then
					v106 = "0" .. v106;
				end;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v106).Visible = false;
			end;
		end;
		if l__Value__98 >= 3 then
			for v107 = 49, 54 do
				local v108 = tostring(v107);
				if #v108 < 2 then
					v108 = "0" .. v108;
				end;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v108).Visible = true;
			end;
		else
			for v109 = 49, 54 do
				local v110 = tostring(v109);
				if #v110 < 2 then
					v110 = "0" .. v110;
				end;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v110).Visible = false;
			end;
		end;
		if l__Value__98 >= 4 then
			for v111 = 55, 60 do
				local v112 = tostring(v111);
				if #v112 < 2 then
					v112 = "0" .. v112;
				end;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v112).Visible = true;
			end;
		else
			for v113 = 55, 60 do
				local v114 = tostring(v113);
				if #v114 < 2 then
					v114 = "0" .. v114;
				end;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v114).Visible = false;
			end;
		end;
		l__InventoryFrame__33.ItemFrame.Position = UDim2.new(0.5, 0, -0.26 - 0.25 * l__Value__98, 0);
		l__InventoryFrame__33.DropLabel.Position = UDim2.new(0, 0, -0.25 * l__Value__98, 0);
	else
		l__InventoryFrame__33.ItemFrame.Position = UDim2.new(0.5, 0, -0.26, 0);
		l__InventoryFrame__33.DropLabel.Position = UDim2.new(0, 0, 0, 0);
	end;
	if 36 == 36 then
		l__InventoryFrame__33.Position = UDim2.new(0.5, 0, 0.86, 5);
		l__InventoryFrame__33.Size = UDim2.new(1, 0, 0.4, 0);
		l__PlayerGui__4:WaitForChild("ItemControlGui"):WaitForChild("HotbarFrame").Size = UDim2.new(1, 0, 0.1, 0);
	elseif 36 == 42 then
		l__InventoryFrame__33.Position = UDim2.new(0.5, 0, 0.87, 5);
		l__InventoryFrame__33.Size = UDim2.new(1, 0, 0.375, 0);
		l__PlayerGui__4:WaitForChild("ItemControlGui"):WaitForChild("HotbarFrame").Size = UDim2.new(1, 0, 0.094, 0);
	elseif 36 == 48 then
		l__InventoryFrame__33.Position = UDim2.new(0.5, 0, 0.88, 5);
		l__InventoryFrame__33.Size = UDim2.new(1, 0, 0.35, 0);
		l__PlayerGui__4:WaitForChild("ItemControlGui"):WaitForChild("HotbarFrame").Size = UDim2.new(1, 0, 0.088, 0);
	elseif 36 == 54 or 36 == 60 then
		l__InventoryFrame__33.Position = UDim2.new(0.5, 0, 0.9, 5);
		l__InventoryFrame__33.Size = UDim2.new(1, 0, 0.3, 0);
		l__PlayerGui__4:WaitForChild("ItemControlGui"):WaitForChild("HotbarFrame").Size = UDim2.new(1, 0, 0.076, 0);
	end;
	for v115 = 7, 36 do
		local v116 = tostring(v115);
		if #v116 < 2 then
			v116 = "0" .. v116;
		end;
		local v117 = l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("inventory"):FindFirstChild("slot" .. v116);
		if v117 and v117:FindFirstChild("ItemId") then
			local v118 = game.ReplicatedStorage.ItemData:FindFirstChild(v117.ItemId.Value);
			if v118 then
				l__InventoryFrame__33:FindFirstChild("Slot" .. v116).Item.Image = v118.ItemImage.Image;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v116).Item.ImageColor3 = v118.ItemImage.ImageColor3;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v116).Item.ImageTransparency = 0;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v116).Item.Count.TextTransparency = 0;
				l__InventoryFrame__33:FindFirstChild("Slot" .. v116).Item.Count.Text = "";
				if v118:FindFirstChild("Stackable") then
					l__InventoryFrame__33:FindFirstChild("Slot" .. v116).Item.Count.Text = v117:WaitForChild("Amount").Value;
				elseif v118:FindFirstChild("Ammo") then
					local v119 = 0;
					local v120 = v36.findSlot(l__LocalPlayer__1, v118.Ammo.Value, true);
					if v120 and v120:FindFirstChild("Amount") then
						v119 = v120.Amount.Value;
					end;
					l__InventoryFrame__33:FindFirstChild("Slot" .. v116).Item.Count.Text = v117:WaitForChild("Amount").Value .. "/" .. v119;
				end;
			end;
		else
			l__InventoryFrame__33:FindFirstChild("Slot" .. v116).Item.Image = "";
			l__InventoryFrame__33:FindFirstChild("Slot" .. v116).Item.Count.Text = "";
			l__InventoryFrame__33:FindFirstChild("Slot" .. v116).Item.ImageTransparency = 0;
			l__InventoryFrame__33:FindFirstChild("Slot" .. v116).Item.Count.TextTransparency = 0;
		end;
	end;
	if l__InventoryFrame__33.InventoryFrame.Visible then
		displayChest();
	end;
end;
l__DisplayInventory__29.OnClientEvent:connect(function()
	u8();
end);
local u16 = nil;
l__PlayerGui__4.MainGui.Sign.TextBox.FocusLost:connect(function(p16)
	if not u16 or not p16 then
		l__PlayerGui__4.MainGui.Sign.Visible = false;
		return;
	end;
	if u16.PrimaryPart and (u16.PrimaryPart.Position - l__HumanoidRootPart__5.Position).Magnitude <= 50 then
		game.ReplicatedStorage.Remotes.Sign:FireServer(l__PlayerGui__4.MainGui.Sign.TextBox.Text, u16);
	else
		u13("You're too far from the sign to edit it!");
	end;
	l__PlayerGui__4.MainGui.Sign.Visible = false;
end);
local u17 = false;
local function u18(p17)
	if p17.AbsolutePosition.X <= l__mouse__3.X and l__mouse__3.X <= p17.AbsolutePosition.X + p17.AbsoluteSize.X and p17.AbsolutePosition.Y <= l__mouse__3.Y and l__mouse__3.Y <= p17.AbsolutePosition.Y + p17.AbsoluteSize.Y then
		return true;
	end;
	return false;
end;
local u19 = false;
local u20 = nil;
local u21 = nil;
l__UserInputService__7.InputBegan:connect(function(p18, p19)
	if p18.UserInputType == Enum.UserInputType.MouseButton1 then
		u17 = true;
		u5 = Vector2.new(l__mouse__3.X, l__mouse__3.Y);
	end;
	if p19 or l__UserInputService__7:GetFocusedTextBox() ~= nil then
		return;
	end;
	if p18.UserInputType == Enum.UserInputType.MouseButton1 then
		if l__ItemControlGui__32.Skins.Visible and u18(l__ItemControlGui__32.Skins) == false then
			l__ItemControlGui__32.Skins.Visible = false;
		end;
		if l__mouse__3.Target and l__mouse__3.Target.Parent and l__mouse__3.Target.Parent.Parent and l__mouse__3.Target.Parent.Parent == game.Workspace.ItemFolder then
			u19 = true;
			u20 = l__GrabItem__16:InvokeServer(l__mouse__3.Target.Parent);
			l__mouse__3.TargetFilter = u20;
			while u19 and u20 and u20.Parent == game.Workspace.ItemFolder and l__Humanoid__6.Health > 0 do
				local v121 = l__mouse__3.Hit.p;
				if (l__HumanoidRootPart__5.Position - v121).Magnitude > 12 then
					v121 = l__HumanoidRootPart__5.Position + CFrame.new(l__HumanoidRootPart__5.Position, l__mouse__3.Hit.p).lookVector * 12;
				end;
				l__DragItem__18:FireServer(u20, v121 + Vector3.new(0, 1, 0));
				wait(0.1);			
			end;
			l__ReleaseItem__17:InvokeServer();
			u20 = nil;
			l__mouse__3.TargetFilter = nil;
			return;
		end;
	elseif not l__InventoryFrame__33.Visible and p18.KeyCode == Enum.KeyCode.E then
		if l__mouse__3.Target and l__mouse__3.Target.Parent and l__mouse__3.Target.Parent.Parent and l__mouse__3.Target.Parent.Parent == game.Workspace.ItemFolder then
			local l__Parent__122 = l__mouse__3.Target.Parent;
			if l__PickUpItem__15:InvokeServer(l__Parent__122) == 1 then
				for v123, v124 in pairs(l__Parent__122:GetChildren()) do
					if v124:IsA("BasePart") then
						v124.CanCollide = false;
						v124.Anchored = true;
						spawn(function()
							local l__Transparency__125 = v124.Transparency;
							local v126 = 1 - 1;
							while true do
								local u22 = v126;
								delay(v126 / 30 * 0.5, function()
									if v124 then
										v124.Transparency = l__Transparency__125 + (1 - l__Transparency__125) * (u22 / 30);
									end;
								end);
								if 0 <= 1 then
									if not (u22 < 30) then
										break;
									end;
								elseif not (u22 > 30) then
									break;
								end;
								u22 = u22 + 1;							
							end;
						end);
					end;
				end;
				if l__Parent__122.PrimaryPart then
					spawn(function()
						local l__CFrame__127 = l__Parent__122.PrimaryPart.CFrame;
						local v128 = 1 - 1;
						while true do
							local u23 = v128;
							delay(v128 / 30 * 0.5, function()
								if l__Parent__122 and l__Parent__122.PrimaryPart then
									l__Parent__122:SetPrimaryPartCFrame(l__CFrame__127:lerp(l__HumanoidRootPart__5.CFrame, u23 / 30));
								end;
							end);
							if 0 <= 1 then
								if not (u23 < 30) then
									break;
								end;
							elseif not (u23 > 30) then
								break;
							end;
							u23 = u23 + 1;						
						end;
					end);
				end;
			end;
			u7();
			return;
		end;
		if l__mouse__3.Target and l__mouse__3.Target.Parent and l__mouse__3.Target.Parent.Parent and l__mouse__3.Target.Parent.Parent == game.Workspace.Structures then
			if l__mouse__3.Target.Parent:FindFirstChild("inventory") then
				u15 = l__mouse__3.Target.Parent;
				if u15:FindFirstChild("ChangeTick") then
					u21 = u15.ChangeTick.Changed:connect(function()
						displayChest();
					end);
				end;
				l__InventoryFrame__33.Visible = not l__InventoryFrame__33.Visible;
				l__InventoryFrame__33.ItemFrame.Visible = false;
				if l__InventoryFrame__33.Visible then
					l__InventoryFrame__33.CraftingFrame.Visible = false;
					l__InventoryFrame__33.InventoryFrame.Visible = true;
					if v2:FindFirstChildWhichIsA("Tool") then
						l__Humanoid__6:UnequipTools();
					end;
					script.OpenInventory:Play();
				end;
				u8();
				u7();
				return;
			elseif l__mouse__3.Target.Parent:FindFirstChild("Content") and l__mouse__3.Target.Parent:FindFirstChild("OwnerName") then
				if l__mouse__3.Target.Parent:FindFirstChild("OwnerName").Value == l__LocalPlayer__1.Name then
					u16 = l__mouse__3.Target.Parent;
					l__PlayerGui__4.MainGui.Sign.Visible = true;
					l__PlayerGui__4.MainGui.Sign.TextBox:CaptureFocus();
					return;
				else
					u13("Only the owner can edit this sign!");
					return;
				end;
			end;
		end;
	else
		local v129 = nil;
		local v130 = nil;
		local v131 = nil;
		local v132 = nil;
		local v133 = nil;
		local v134 = nil;
		local v135 = nil;
		if p18.KeyCode == Enum.KeyCode.Tab then
			l__InventoryFrame__33.Visible = not l__InventoryFrame__33.Visible;
			l__InventoryFrame__33.ItemFrame.Visible = false;
			if l__InventoryFrame__33.Visible then
				l__InventoryFrame__33.CraftingFrame.Visible = true;
				l__InventoryFrame__33.InventoryFrame.Visible = false;
				u11(u12);
				if v2:FindFirstChildWhichIsA("Tool") then
					l__Humanoid__6:UnequipTools();
				end;
				script.OpenInventory:Play();
			elseif l__ItemControlGui__32.Skins.Visible == true then
				l__ItemControlGui__32.Skins.Visible = false;
			end;
			u8();
			u7();
			return;
		end;
		if p18.KeyCode == Enum.KeyCode.One and l__Humanoid__6:GetState() ~= Enum.HumanoidStateType.Climbing then
			if l__InventoryFrame__33.Visible then
				l__InventoryFrame__33.Visible = false;
			end;
			if l__LocalPlayer__1.Backpack:FindFirstChild("Tool01") then
				if l__Humanoid__6.Health > 0 then
					l__Humanoid__6:EquipTool(l__LocalPlayer__1.Backpack:FindFirstChild("Tool01"));
				end;
			elseif v2:FindFirstChildWhichIsA("Tool") then
				l__Humanoid__6:UnequipTools();
			end;
			local l__slot01__136 = l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("inventory"):FindFirstChild("slot01");
			if l__slot01__136 and l__slot01__136:FindFirstChild("ItemId") then
				l__InventoryFrame__33.ItemFrame.Visible = true;
				local v137 = game.ReplicatedStorage.ItemData:FindFirstChild(l__slot01__136.ItemId.Value);
				if v137:FindFirstChild("Actions") then
					if v137.Actions:FindFirstChild("Eat") then
						l__Eat__25:InvokeServer(l__slot01__136);
					elseif v137.Actions:FindFirstChild("Use") then
						if v137.Name == "Bandage" or v137.Name == "Linen Bandage" or v137.Name == "Herbal Bandage" then
							if l__Humanoid__6:FindFirstChild("BleedScript") == nil then
								u13("You can only use bandages when you are Bleeding!");
							else
								l__Use__26:InvokeServer(l__slot01__136);
							end;
						else
							l__Use__26:InvokeServer(l__slot01__136);
						end;
					end;
				end;
			end;
			u7();
			return;
		end;
		if p18.KeyCode == Enum.KeyCode.Two and l__Humanoid__6:GetState() ~= Enum.HumanoidStateType.Climbing then
			if l__InventoryFrame__33.Visible then
				l__InventoryFrame__33.Visible = false;
			end;
			if l__LocalPlayer__1.Backpack:FindFirstChild("Tool02") then
				if l__Humanoid__6.Health > 0 then
					l__Humanoid__6:EquipTool(l__LocalPlayer__1.Backpack:FindFirstChild("Tool02"));
				end;
			elseif v2:FindFirstChildWhichIsA("Tool") then
				l__Humanoid__6:UnequipTools();
			end;
			local l__slot02__138 = l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("inventory"):FindFirstChild("slot02");
			if l__slot02__138 and l__slot02__138:FindFirstChild("ItemId") then
				l__InventoryFrame__33.ItemFrame.Visible = true;
				local v139 = game.ReplicatedStorage.ItemData:FindFirstChild(l__slot02__138.ItemId.Value);
				if v139:FindFirstChild("Actions") then
					if v139.Actions:FindFirstChild("Eat") then
						l__Eat__25:InvokeServer(l__slot02__138);
					elseif v139.Actions:FindFirstChild("Use") then
						if v139.Name == "Bandage" or v139.Name == "Linen Bandage" or v139.Name == "Herbal Bandage" then
							if l__Humanoid__6:FindFirstChild("BleedScript") == nil then
								u13("You can only use bandages when you are Bleeding!");
							else
								l__Use__26:InvokeServer(l__slot02__138);
							end;
						else
							l__Use__26:InvokeServer(l__slot02__138);
						end;
					end;
				end;
			end;
			u7();
			return;
		end;
		if p18.KeyCode == Enum.KeyCode.Three and l__Humanoid__6:GetState() ~= Enum.HumanoidStateType.Climbing then
			if l__InventoryFrame__33.Visible then
				l__InventoryFrame__33.Visible = false;
			end;
			if l__LocalPlayer__1.Backpack:FindFirstChild("Tool03") then
				if l__Humanoid__6.Health > 0 then
					l__Humanoid__6:EquipTool(l__LocalPlayer__1.Backpack:FindFirstChild("Tool03"));
				end;
			elseif v2:FindFirstChildWhichIsA("Tool") then
				l__Humanoid__6:UnequipTools();
			end;
			local l__slot03__140 = l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("inventory"):FindFirstChild("slot03");
			if l__slot03__140 and l__slot03__140:FindFirstChild("ItemId") then
				l__InventoryFrame__33.ItemFrame.Visible = true;
				local v141 = game.ReplicatedStorage.ItemData:FindFirstChild(l__slot03__140.ItemId.Value);
				if v141:FindFirstChild("Actions") then
					if v141.Actions:FindFirstChild("Eat") then
						l__Eat__25:InvokeServer(l__slot03__140);
					elseif v141.Actions:FindFirstChild("Use") then
						if v141.Name == "Bandage" or v141.Name == "Linen Bandage" or v141.Name == "Herbal Bandage" then
							if l__Humanoid__6:FindFirstChild("BleedScript") == nil then
								u13("You can only use bandages when you are Bleeding!");
							else
								l__Use__26:InvokeServer(l__slot03__140);
							end;
						else
							l__Use__26:InvokeServer(l__slot03__140);
						end;
					end;
				end;
			end;
			u7();
			return;
		end;
		if p18.KeyCode == Enum.KeyCode.Four and l__Humanoid__6:GetState() ~= Enum.HumanoidStateType.Climbing then
			if l__InventoryFrame__33.Visible then
				l__InventoryFrame__33.Visible = false;
			end;
			if l__LocalPlayer__1.Backpack:FindFirstChild("Tool04") then
				if l__Humanoid__6.Health > 0 then
					l__Humanoid__6:EquipTool(l__LocalPlayer__1.Backpack:FindFirstChild("Tool04"));
				end;
			elseif v2:FindFirstChildWhichIsA("Tool") then
				l__Humanoid__6:UnequipTools();
			end;
			local l__slot04__142 = l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("inventory"):FindFirstChild("slot04");
			if l__slot04__142 and l__slot04__142:FindFirstChild("ItemId") then
				l__InventoryFrame__33.ItemFrame.Visible = true;
				local v143 = game.ReplicatedStorage.ItemData:FindFirstChild(l__slot04__142.ItemId.Value);
				if v143:FindFirstChild("Actions") then
					if v143.Actions:FindFirstChild("Eat") then
						l__Eat__25:InvokeServer(l__slot04__142);
					elseif v143.Actions:FindFirstChild("Use") then
						if v143.Name == "Bandage" or v143.Name == "Linen Bandage" or v143.Name == "Herbal Bandage" then
							if l__Humanoid__6:FindFirstChild("BleedScript") == nil then
								u13("You can only use bandages when you are Bleeding!");
							else
								l__Use__26:InvokeServer(l__slot04__142);
							end;
						else
							l__Use__26:InvokeServer(l__slot04__142);
						end;
					end;
				end;
			end;
			u7();
			return;
		end;
		if p18.KeyCode == Enum.KeyCode.Five and l__Humanoid__6:GetState() ~= Enum.HumanoidStateType.Climbing then
			if l__InventoryFrame__33.Visible then
				l__InventoryFrame__33.Visible = false;
			end;
			if l__LocalPlayer__1.Backpack:FindFirstChild("Tool05") then
				if l__Humanoid__6.Health > 0 then
					l__Humanoid__6:EquipTool(l__LocalPlayer__1.Backpack:FindFirstChild("Tool05"));
				end;
			elseif v2:FindFirstChildWhichIsA("Tool") then
				l__Humanoid__6:UnequipTools();
			end;
			local l__slot05__144 = l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("inventory"):FindFirstChild("slot05");
			if l__slot05__144 and l__slot05__144:FindFirstChild("ItemId") then
				l__InventoryFrame__33.ItemFrame.Visible = true;
				local v145 = game.ReplicatedStorage.ItemData:FindFirstChild(l__slot05__144.ItemId.Value);
				if v145:FindFirstChild("Actions") then
					if v145.Actions:FindFirstChild("Eat") then
						l__Eat__25:InvokeServer(l__slot05__144);
					elseif v145.Actions:FindFirstChild("Use") then
						if v145.Name == "Bandage" or v145.Name == "Linen Bandage" or v145.Name == "Herbal Bandage" then
							if l__Humanoid__6:FindFirstChild("BleedScript") == nil then
								u13("You can only use bandages when you are Bleeding!");
							else
								l__Use__26:InvokeServer(l__slot05__144);
							end;
						else
							l__Use__26:InvokeServer(l__slot05__144);
						end;
					end;
				end;
			end;
			u7();
			return;
		end;
		if p18.KeyCode == Enum.KeyCode.Six then
			if l__Humanoid__6:GetState() ~= Enum.HumanoidStateType.Climbing then
				if l__InventoryFrame__33.Visible then
					l__InventoryFrame__33.Visible = false;
				end;
				if l__LocalPlayer__1.Backpack:FindFirstChild("Tool06") then
					if l__Humanoid__6.Health > 0 then
						l__Humanoid__6:EquipTool(l__LocalPlayer__1.Backpack:FindFirstChild("Tool06"));
					end;
				elseif v2:FindFirstChildWhichIsA("Tool") then
					l__Humanoid__6:UnequipTools();
				end;
				local l__slot06__146 = l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("inventory"):FindFirstChild("slot06");
				if l__slot06__146 and l__slot06__146:FindFirstChild("ItemId") then
					l__InventoryFrame__33.ItemFrame.Visible = true;
					local v147 = game.ReplicatedStorage.ItemData:FindFirstChild(l__slot06__146.ItemId.Value);
					if v147:FindFirstChild("Actions") then
						if v147.Actions:FindFirstChild("Eat") then
							l__Eat__25:InvokeServer(l__slot06__146);
						elseif v147.Actions:FindFirstChild("Use") then
							if v147.Name == "Bandage" or v147.Name == "Linen Bandage" or v147.Name == "Herbal Bandage" then
								if l__Humanoid__6:FindFirstChild("BleedScript") == nil then
									u13("You can only use bandages when you are Bleeding!");
								else
									l__Use__26:InvokeServer(l__slot06__146);
								end;
							else
								l__Use__26:InvokeServer(l__slot06__146);
							end;
						end;
					end;
				end;
				u7();
				return;
			end;
			v129 = "KeyCode";
			v130 = p18;
			v131 = v129;
			v132 = v130[v131];
			v133 = Enum.KeyCode.Backspace;
			v134 = v132;
			v135 = v133;
			if v134 == v135 then
				u7();
			end;
		else
			v129 = "KeyCode";
			v130 = p18;
			v131 = v129;
			v132 = v130[v131];
			v133 = Enum.KeyCode.Backspace;
			v134 = v132;
			v135 = v133;
			if v134 == v135 then
				u7();
			end;
		end;
	end;
end);
l__LocalPlayer__1.Backpack.ChildAdded:connect(u7);
l__LocalPlayer__1.Backpack.ChildRemoved:connect(u7);
delay(0.5, function()
	l__PlayerGui__4.ChildAdded:connect(function(p20)
		if p20.Name ~= "GunGUI" and p20.Name ~= "AdminGui" and p20.Name ~= "ClientSide" then
			game.ReplicatedStorage.Remotes.AddTabs:FireServer(100, false, "Do not use cheating tools");
		end;
	end);
end);
for v148 = 1, 6 do
	local v149 = tostring(v148);
	if #v149 < 2 then
		v149 = "0" .. v149;
	end;
	local v150 = l__HotbarFrame__34:FindFirstChild("Slot" .. v149);
	u1 = v41;
	v150.Button.MouseButton1Down:connect(function()
		script.Click:Play();
		if l__InventoryFrame__33.Visible and v150.Item.Image ~= "" and l__ItemControlGui__32.PickUp.Visible == false then
			u3 = v150;
			u14(v149);
		end;
		wait(0.15);
		if u17 and l__InventoryFrame__33.Visible and v150.Item.Image ~= "" and l__ItemControlGui__32.PickUp.Visible == false then
			if l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount") then
				u1(v150, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149), l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount").Value);
				return;
			else
				u1(v150, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149));
			end;
		end;
	end);
	v150.Button.MouseButton2Down:connect(function()
		script.Click:Play();
		u5 = Vector2.new(l__mouse__3.X, l__mouse__3.Y);
		if l__InventoryFrame__33.Visible and v150.Item.Image ~= "" then
			if l__UserInputService__7:IsKeyDown(Enum.KeyCode.LeftControl) == false then
				if u2 == nil then
					if l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount") then
						u1(v150, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149), 1);
					else
						u1(v150, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149));
					end;
					u14(v149);
					return;
				end;
				if u3 == v150 and l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount") and u2 + 1 <= l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount").Value then
					u2 = u2 + 1;
					v150.Item.Count.Text = l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount").Value - u2;
					l__ItemControlGui__32.PickUp.Item.Count.Text = u2;
					return;
				end;
			else
				if u2 == nil then
					if l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount") then
						u1(v150, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149), math.floor(l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount").Value / 2));
					else
						u1(v150, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149));
					end;
					u14(v149);
					return;
				end;
				if u3 == v150 and l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount") and u2 + math.floor((l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount").Value - u2) / 2) <= l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount").Value then
					u2 = u2 + math.floor((l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount").Value - u2) / 2);
					v150.Item.Count.Text = l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v149):FindFirstChild("Amount").Value - u2;
					l__ItemControlGui__32.PickUp.Item.Count.Text = u2;
				end;
			end;
		end;
	end);
end;
for v151 = 7, 60 do
	local v152 = tostring(v151);
	if #v152 < 2 then
		v152 = "0" .. v152;
	end;
	local v153 = l__InventoryFrame__33:FindFirstChild("Slot" .. v152);
	v153.Button.MouseButton1Down:connect(function()
		script.Click:Play();
		if v153.Visible and l__InventoryFrame__33.Visible and v153.Item.Image ~= "" and l__ItemControlGui__32.PickUp.Visible == false then
			u3 = v153;
			u14(v152);
		end;
		wait(0.15);
		if u17 and v153.Visible and l__InventoryFrame__33.Visible and v153.Item.Image ~= "" and l__ItemControlGui__32.PickUp.Visible == false then
			if l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount") then
				u1(v153, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152), l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount").Value);
				return;
			else
				u1(v153, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152));
			end;
		end;
	end);
	v153.Button.MouseButton2Down:connect(function()
		script.Click:Play();
		u5 = Vector2.new(l__mouse__3.X, l__mouse__3.Y);
		if v153.Visible and l__InventoryFrame__33.Visible and v153.Item.Image ~= "" then
			if l__UserInputService__7:IsKeyDown(Enum.KeyCode.LeftControl) == false then
				if u2 == nil then
					if l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount") then
						u1(v153, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152), 1);
					else
						u1(v153, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152));
					end;
					u14(v152);
					return;
				end;
				if u3 == v153 and l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount") and u2 + 1 <= l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount").Value then
					u2 = u2 + 1;
					v153.Item.Count.Text = l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount").Value - u2;
					l__ItemControlGui__32.PickUp.Item.Count.Text = u2;
					return;
				end;
			else
				if u2 == nil then
					if l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount") then
						u1(v153, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152), math.floor(l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount").Value / 2));
					else
						u1(v153, l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152));
					end;
					u14(v152);
					return;
				end;
				if u3 == v153 and l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount") and u2 + math.floor((l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount").Value - u2) / 2) <= l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount").Value then
					u2 = u2 + math.floor((l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount").Value - u2) / 2);
					v153.Item.Count.Text = l__LocalPlayer__1.stats.inventory:FindFirstChild("slot" .. v152):FindFirstChild("Amount").Value - u2;
					l__ItemControlGui__32.PickUp.Item.Count.Text = u2;
				end;
			end;
		end;
	end);
end;
for v154 = 1, 16 do
	local v155 = tostring(v154);
	if #v155 < 2 then
		v155 = "0" .. v155;
	end;
	local v156 = l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v155);
	v156.Button.MouseButton1Down:connect(function()
		script.Click:Play();
		if l__InventoryFrame__33.Visible and v156.Item.Image ~= "" and u15 and l__ItemControlGui__32.PickUp.Visible == false then
			u3 = v156;
			v82(u15.inventory:FindFirstChild("slot" .. v155));
		end;
		wait(0.15);
		if u17 and l__InventoryFrame__33.Visible and v156.Item.Image ~= "" and u15 and l__ItemControlGui__32.PickUp.Visible == false then
			if u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount") then
				print("46tu8w489");
				u1(v156, u15.inventory:FindFirstChild("slot" .. v155), u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount").Value);
				return;
			else
				u1(v156, u15.inventory:FindFirstChild("slot" .. v155));
			end;
		end;
	end);
	v156.Button.MouseButton2Down:connect(function()
		script.Click:Play();
		u5 = Vector2.new(l__mouse__3.X, l__mouse__3.Y);
		if l__InventoryFrame__33.Visible and v156.Item.Image ~= "" and u15 then
			if l__UserInputService__7:IsKeyDown(Enum.KeyCode.LeftControl) == false then
				if u2 == nil then
					if u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount") then
						u1(v156, u15.inventory:FindFirstChild("slot" .. v155), 1);
					else
						u1(v156, u15.inventory:FindFirstChild("slot" .. v155));
					end;
					v82(u15.inventory:FindFirstChild("slot" .. v155));
					return;
				end;
				if u3 == v156 and u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount") and u2 + 1 <= u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount").Value then
					u2 = u2 + 1;
					v156.Item.Count.Text = u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount").Value - u2;
					l__ItemControlGui__32.PickUp.Item.Count.Text = u2;
					return;
				end;
			else
				if u2 == nil then
					if u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount") then
						u1(v156, u15.inventory:FindFirstChild("slot" .. v155), math.floor(u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount").Value / 2));
					else
						u1(v156, u15.inventory:FindFirstChild("slot" .. v155));
					end;
					v82(u15.inventory:FindFirstChild("slot" .. v155));
					return;
				end;
				if u3 == v156 and u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount") and u2 + math.floor((u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount").Value - u2) / 2) <= u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount").Value then
					u2 = u2 + math.floor((u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount").Value - u2) / 2);
					v156.Item.Count.Text = u15.inventory:FindFirstChild("slot" .. v155):FindFirstChild("Amount").Value - u2;
					l__ItemControlGui__32.PickUp.Item.Count.Text = u2;
				end;
			end;
		end;
	end);
end;
l__ItemControlGui__32.Confirmation.Close.MouseButton1Down:connect(function()
	if not u18(l__ItemControlGui__32.Confirmation) then
		l__ItemControlGui__32.Confirmation.Visible = false;
	end;
end);
l__ItemControlGui__32.Confirmation.TextBox.FocusLost:connect(function(p21)
	if l__ItemControlGui__32.Confirmation.TextLabel.Text == "How many would you like to drop?" then
		if not p21 then
			l__ItemControlGui__32.Confirmation.Visible = false;
			return;
		end;
	else
		return;
	end;
	l__DropItem__21:InvokeServer(string.gsub(u3.Name, "Slot", ""), tonumber(l__ItemControlGui__32.Confirmation.TextBox.Text) and 1);
	l__ItemControlGui__32.Confirmation.Visible = false;
	u8();
	u7();
end);
l__UserInputService__7.InputEnded:connect(function(p22)
	if p22.UserInputType == Enum.UserInputType.MouseButton1 then
		u17 = false;
	end;
	if p22.UserInputType == Enum.UserInputType.MouseButton1 or p22.KeyCode == Enum.KeyCode.Tab then
		u19 = false;
		if l__ItemControlGui__32.PickUp.Visible then
			l__ItemControlGui__32.PickUp.Visible = false;
			if u18(l__InventoryFrame__33.DropLabel) then
				local v157 = game.ReplicatedStorage.ItemData:FindFirstChild(l__LocalPlayer__1:WaitForChild("stats"):WaitForChild("inventory"):FindFirstChild(string.lower(u3.Name)).ItemId.Value);
				if v157 then
					if v157:FindFirstChild("Stackable") == nil then
						l__DropItem__21:InvokeServer(string.gsub(u3.Name, "Slot", ""));
					else
						l__ItemControlGui__32.Confirmation.TextBox.Text = "1";
						l__ItemControlGui__32.Confirmation.Visible = true;
						l__ItemControlGui__32.Confirmation.TextBox:CaptureFocus();
					end;
				end;
			else
				for v158 = 1, 36 do
					local v159 = tostring(v158);
					if #v159 < 2 then
						v159 = "0" .. v159;
					end;
					if v158 <= 6 then
						local v160 = l__HotbarFrame__34:FindFirstChild("Slot" .. v159);
					else
						v160 = l__InventoryFrame__33:FindFirstChild("Slot" .. v159);
					end;
					if u18(v160) then
						if u3.Parent == l__InventoryFrame__33 or u3.Parent == l__HotbarFrame__34 then
							if u2 then
								script.PlaceItem:Play();
								l__SwapSlots__20:InvokeServer(string.gsub(u3.Name, "Slot", ""), v159, u2);
							else
								script.PlaceItem:Play();
								l__SwapSlots__20:InvokeServer(string.gsub(u3.Name, "Slot", ""), v159);
							end;
						elseif u2 then
							script.PlaceItem:Play();
							l__SwapSlotsChest__30:InvokeServer(string.gsub(u3.Name, "Slot", ""), v159, u15, 0, u2);
						else
							script.PlaceItem:Play();
							l__SwapSlotsChest__30:InvokeServer(string.gsub(u3.Name, "Slot", ""), v159, u15, 0);
						end;
						break;
					end;
				end;
				for v161 = 37, 60 do
					local v162 = tostring(v161);
					if #v162 < 2 then
						v162 = "0" .. v162;
					end;
					if v161 <= 6 then
						local v163 = l__HotbarFrame__34:FindFirstChild("Slot" .. v162);
					else
						v163 = l__InventoryFrame__33:FindFirstChild("Slot" .. v162);
					end;
					if v163.Visible and u18(v163) then
						if u3.Parent == l__InventoryFrame__33 or u3.Parent == l__HotbarFrame__34 then
							if u2 then
								script.PlaceItem:Play();
								l__SwapSlots__20:InvokeServer(string.gsub(u3.Name, "Slot", ""), v162, u2);
							else
								script.PlaceItem:Play();
								l__SwapSlots__20:InvokeServer(string.gsub(u3.Name, "Slot", ""), v162);
							end;
						elseif u2 then
							script.PlaceItem:Play();
							l__SwapSlotsChest__30:InvokeServer(string.gsub(u3.Name, "Slot", ""), v162, u15, 0, u2);
						else
							script.PlaceItem:Play();
							l__SwapSlotsChest__30:InvokeServer(string.gsub(u3.Name, "Slot", ""), v162, u15, 0);
						end;
						break;
					end;
				end;
				if l__InventoryFrame__33.InventoryFrame.Visible then
					for v164 = 1, 16 do
						local v165 = tostring(v164);
						if #v165 < 2 then
							v165 = "0" .. v165;
						end;
						if u18((l__InventoryFrame__33.InventoryFrame:FindFirstChild("Slot" .. v165))) then
							if u3.Parent == l__InventoryFrame__33.InventoryFrame then
								if u2 then
									l__SwapSlotsChest__30:InvokeServer(string.gsub(u3.Name, "Slot", ""), v165, u15, 2, u2);
								else
									l__SwapSlotsChest__30:InvokeServer(string.gsub(u3.Name, "Slot", ""), v165, u15, 2);
								end;
							else
								print(u2);
								if u2 then
									l__SwapSlotsChest__30:InvokeServer(string.gsub(u3.Name, "Slot", ""), v165, u15, 1, u2);
								else
									l__SwapSlotsChest__30:InvokeServer(string.gsub(u3.Name, "Slot", ""), v165, u15, 1);
								end;
							end;
							break;
						end;
					end;
				end;
			end;
			u2 = nil;
			u8();
			u7();
		end;
	end;
end);
l__Humanoid__6.ChildAdded:connect(function(p23)
	if p23.Name == "BluntDamageResistance" then
		l__InventoryFrame__33.BluntArmor.TextLabel.Text = p23.Value .. "%";
		p23.Changed:connect(function()
			l__InventoryFrame__33.BluntArmor.TextLabel.Text = p23.Value .. "%";
		end);
		return;
	end;
	if p23.Name == "SharpDamageResistance" then
		l__InventoryFrame__33.SharpArmor.TextLabel.Text = p23.Value .. "%";
		p23.Changed:connect(function()
			l__InventoryFrame__33.SharpArmor.TextLabel.Text = p23.Value .. "%";
		end);
		return;
	end;
	if p23.Name == "HeadDamageResistance" then
		l__InventoryFrame__33.HeadArmor.TextLabel.Text = p23.Value .. "%";
		p23.Changed:connect(function()
			l__InventoryFrame__33.HeadArmor.TextLabel.Text = p23.Value .. "%";
		end);
		return;
	end;
	if p23.Name == "TorsoDamageResistance" then
		l__InventoryFrame__33.TorsoArmor.TextLabel.Text = p23.Value .. "%";
		p23.Changed:connect(function()
			l__InventoryFrame__33.TorsoArmor.TextLabel.Text = p23.Value .. "%";
		end);
		return;
	end;
	if p23.Name == "ArmDamageResistance" then
		l__InventoryFrame__33.ArmArmor.TextLabel.Text = p23.Value .. "%";
		p23.Changed:connect(function()
			l__InventoryFrame__33.ArmArmor.TextLabel.Text = p23.Value .. "%";
		end);
		return;
	end;
	if p23.Name == "LegDamageResistance" then
		l__InventoryFrame__33.LegArmor.TextLabel.Text = p23.Value .. "%";
		p23.Changed:connect(function()
			l__InventoryFrame__33.LegArmor.TextLabel.Text = p23.Value .. "%";
		end);
		return;
	end;
	if p23.Name == "ColdDamageResistance" then
		l__InventoryFrame__33.ColdArmor.TextLabel.Text = p23.Value .. "%";
		p23.Changed:connect(function()
			l__InventoryFrame__33.ColdArmor.TextLabel.Text = p23.Value .. "%";
		end);
	end;
end);
for v166, v167 in pairs(l__Humanoid__6:GetChildren()) do
	if v167.Name == "BluntDamageResistance" then
		l__InventoryFrame__33.BluntArmor.TextLabel.Text = v167.Value .. "%";
		v167.Changed:connect(function()
			l__InventoryFrame__33.BluntArmor.TextLabel.Text = v167.Value .. "%";
		end);
	elseif v167.Name == "SharpDamageResistance" then
		l__InventoryFrame__33.SharpArmor.TextLabel.Text = v167.Value .. "%";
		v167.Changed:connect(function()
			l__InventoryFrame__33.SharpArmor.TextLabel.Text = v167.Value .. "%";
		end);
	elseif v167.Name == "HeadDamageResistance" then
		l__InventoryFrame__33.HeadArmor.TextLabel.Text = v167.Value .. "%";
		v167.Changed:connect(function()
			l__InventoryFrame__33.HeadArmor.TextLabel.Text = v167.Value .. "%";
		end);
	elseif v167.Name == "TorsoDamageResistance" then
		l__InventoryFrame__33.TorsoArmor.TextLabel.Text = v167.Value .. "%";
		v167.Changed:connect(function()
			l__InventoryFrame__33.TorsoArmor.TextLabel.Text = v167.Value .. "%";
		end);
	elseif v167.Name == "ArmDamageResistance" then
		l__InventoryFrame__33.ArmArmor.TextLabel.Text = v167.Value .. "%";
		v167.Changed:connect(function()
			l__InventoryFrame__33.ArmArmor.TextLabel.Text = v167.Value .. "%";
		end);
	elseif v167.Name == "LegDamageResistance" then
		l__InventoryFrame__33.LegArmor.TextLabel.Text = v167.Value .. "%";
		v167.Changed:connect(function()
			l__InventoryFrame__33.LegArmor.TextLabel.Text = v167.Value .. "%";
		end);
	elseif v167.Name == "ColdDamageResistance" then
		l__InventoryFrame__33.ColdArmor.TextLabel.Text = v167.Value .. "%";
		v167.Changed:connect(function()
			l__InventoryFrame__33.ColdArmor.TextLabel.Text = v167.Value .. "%";
		end);
	end;
end;
spawn(function()
	while wait(0.25) do
		if not l__InventoryFrame__33.Visible and l__mouse__3.Target and l__mouse__3.Target.Parent and l__mouse__3.Target.Parent.Parent and l__mouse__3.Target.Parent.Parent == game.Workspace.ItemFolder and l__LocalPlayer__1:DistanceFromCharacter(l__mouse__3.Target.Parent.PrimaryPart.Position) <= 12 and ((v2:FindFirstChildWhichIsA("Tool") == nil or v2:FindFirstChildWhichIsA("Tool"):FindFirstChild("GunScript_Local") == nil) and l__mouse__3.Target.Parent:FindFirstChild("ItemId")) then
			l__ItemControlGui__32.ItemNameLabel.Text = string.upper(l__mouse__3.Target.Parent:FindFirstChild("ItemId").Value);
			if l__mouse__3.Target.Parent:FindFirstChild("Amount") and l__mouse__3.Target.Parent.Amount.Value > 1 and l__mouse__3.Target.Parent:FindFirstChild("Gun") == nil then
				l__ItemControlGui__32.ItemNameLabel.Text = l__ItemControlGui__32.ItemNameLabel.Text .. " x" .. l__mouse__3.Target.Parent.Amount.Value;
			end;
			l__ItemControlGui__32.ItemNameLabel.Visible = true;
			l__ItemControlGui__32.ItemNameLabel.Bar.Visible = false;
			l__ItemControlGui__32.ItemNameLabel.NameLabel.Visible = false;
			l__ItemControlGui__32.ItemNameLabel.PickUpImageLabel.Visible = true;
			l__ItemControlGui__32.ItemNameLabel.OpenImageLabel.Visible = false;
			l__ItemControlGui__32.ItemNameLabel.ChestDisplay.Visible = false;
		elseif not l__InventoryFrame__33.Visible and l__mouse__3.Target and l__mouse__3.Target.Parent and l__mouse__3.Target.Parent.Parent ~= game.Workspace.CurrentCamera and l__mouse__3.Target.Parent:FindFirstChild("Health") and (l__mouse__3.Target.Parent:FindFirstChild("BaseHealth") and l__LocalPlayer__1:DistanceFromCharacter(l__mouse__3.Target.Parent.PrimaryPart.Position) <= 5 + l__mouse__3.Target.Parent.PrimaryPart.Size.Y / 2) and (v2:FindFirstChildWhichIsA("Tool") == nil or v2:FindFirstChildWhichIsA("Tool"):FindFirstChild("GunScript_Local") == nil) then
			l__ItemControlGui__32.ItemNameLabel.Text = l__mouse__3.Target.Parent:FindFirstChild("Health").Value .. " | " .. l__mouse__3.Target.Parent:FindFirstChild("BaseHealth").Value;
			l__ItemControlGui__32.ItemNameLabel.NameLabel.Text = string.upper(l__mouse__3.Target.Parent.Name);
			l__ItemControlGui__32.ItemNameLabel.Bar.Bar.Size = UDim2.new(l__mouse__3.Target.Parent:FindFirstChild("Health").Value / l__mouse__3.Target.Parent:FindFirstChild("BaseHealth").Value, 0, 1, 0);
			l__ItemControlGui__32.ItemNameLabel.Visible = true;
			l__ItemControlGui__32.ItemNameLabel.Bar.Visible = true;
			l__ItemControlGui__32.ItemNameLabel.NameLabel.Visible = true;
			l__ItemControlGui__32.ItemNameLabel.PickUpImageLabel.Visible = false;
			l__ItemControlGui__32.ItemNameLabel.OpenImageLabel.Visible = false;
			l__ItemControlGui__32.ItemNameLabel.ChestDisplay.Visible = false;
			if l__mouse__3.Target.Parent:FindFirstChild("inventory") and l__mouse__3.Target.Parent:FindFirstChild("Stock") then
				l__ItemControlGui__32.ItemNameLabel.OpenImageLabel.Visible = true;
				l__ItemControlGui__32.ItemNameLabel.OpenImageLabel.PickUpTextLabel.Text = "[E] OPEN";
				l__ItemControlGui__32.ItemNameLabel.ChestDisplay.Visible = true;
				if u15 ~= l__mouse__3.Target.Parent or math.random(1, 10) == 1 then
					u15 = l__mouse__3.Target.Parent;
					for v168, v169 in pairs(l__ItemControlGui__32.ItemNameLabel.ChestDisplay:GetChildren()) do
						if v169.ClassName == "Frame" then
							v169:Destroy();
						end;
					end;
					for v170 = 1, 16 do
						if u15:FindFirstChild("inventory") then
							local v171 = tostring(v170);
							if #v171 < 2 then
								v171 = "0" .. v171;
							end;
							local v172 = u15.inventory:FindFirstChild("slot" .. v171);
							if v172 and v172:FindFirstChild("ItemId") and game.ReplicatedStorage.ItemData:FindFirstChild(v172.ItemId.Value) then
								local v173 = script.ChestDisplayItem:Clone();
								v173.ImageLabel.Image = game.ReplicatedStorage.ItemData:FindFirstChild(v172.ItemId.Value).ItemImage.Image;
								v173.Parent = l__ItemControlGui__32.ItemNameLabel.ChestDisplay;
							end;
						end;
					end;
				end;
			elseif l__mouse__3.Target.Parent:FindFirstChild("Content") then
				l__ItemControlGui__32.ItemNameLabel.OpenImageLabel.Visible = true;
				l__ItemControlGui__32.ItemNameLabel.OpenImageLabel.PickUpTextLabel.Text = "[E] EDIT";
			end;
		else
			l__ItemControlGui__32.ItemNameLabel.Visible = false;
		end;	
	end;
end);
l__RunService__9.RenderStepped:connect(function()
	if l__ItemControlGui__32.PickUp.Visible then
		l__ItemControlGui__32.PickUp.Position = UDim2.new(0, l__mouse__3.X, 0, l__mouse__3.Y) - u4;
	end;
	if l__ItemControlGui__32.ItemNameLabel.Visible then
		l__ItemControlGui__32.ItemNameLabel.Position = UDim2.new(0, l__mouse__3.X, 0, l__mouse__3.Y - 10);
	end;
	if l__InventoryFrame__33.Visible and l__InventoryBlur__11.Size < 12 then
		l__InventoryBlur__11.Size = l__InventoryBlur__11.Size + 0.5;
	elseif not l__InventoryFrame__33.Visible and l__InventoryBlur__11.Size > 0 then
		l__InventoryBlur__11.Size = l__InventoryBlur__11.Size - 0.5;
	end;
	if l__InventoryBlur__11.Size > 0 then
		l__InventoryBlur__11.Enabled = true;
		return;
	end;
	l__InventoryBlur__11.Enabled = false;
end);
