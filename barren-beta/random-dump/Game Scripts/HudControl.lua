-- Decompiled with the Synapse X Luau decompiler.

local u1 = nil;
while true do
	wait();
	if game.Players.LocalPlayer:FindFirstChild("StatsLoaded") and game.Players.LocalPlayer:FindFirstChild("StatsLoaded").Value == true then
		break;
	end;
end;
local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
local l__LocalPlayer__2 = game.Players.LocalPlayer;
local v3 = l__LocalPlayer__2.Character or l__LocalPlayer__2.CharacterAdded:wait();
local l__mouse__4 = l__LocalPlayer__2:GetMouse();
local l__PlayerGui__5 = l__LocalPlayer__2:WaitForChild("PlayerGui");
local l__HumanoidRootPart__6 = v3:WaitForChild("HumanoidRootPart");
local l__Humanoid__7 = v3:WaitForChild("Humanoid");
local l__Stats__8 = l__PlayerGui__5:WaitForChild("MainGui"):WaitForChild("Stats");
local l__Leaderboard__9 = l__PlayerGui__5:WaitForChild("MainGui"):WaitForChild("Top"):WaitForChild("Leaderboard");
local v10 = nil;
if script:FindFirstChild("Poison") then
	v10 = script.Poison;
end;
local v11 = nil;
if script:FindFirstChild("PoisonImmunity") then
	v11 = script.PoisonImmunity;
end;
local l__Remotes__12 = l__ReplicatedStorage__1:WaitForChild("Remotes");
local l__ClanLeave__13 = l__Remotes__12:WaitForChild("ClanLeave");
local l__ClanInvite__14 = l__Remotes__12:WaitForChild("ClanInvite");
local l__ClanKick__15 = l__Remotes__12:WaitForChild("ClanKick");
local l__DevProduct__16 = l__Remotes__12:WaitForChild("DevProduct");
local l__ClanForm__17 = l__Remotes__12:WaitForChild("ClanForm");
local l__ClanJoin__18 = l__Remotes__12:WaitForChild("ClanJoin");
local l__Message__19 = l__Remotes__12:WaitForChild("Message");
local l__PlaySound__20 = l__Remotes__12:WaitForChild("PlaySound");
local v21 = tick();
l__Humanoid__7.HealthChanged:connect(function(p1)
	wait(4.9);
	if p1 <= 0 then
		l__Remotes__12.Parent = l__ReplicatedStorage__1;
	end;
end);
if l__Remotes__12 then

end;
local v22 = require(game.ReplicatedStorage.Modules);
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
l__PlayerGui__5:SetTopbarTransparency(1);
function comma_value(p2)
	local v23 = p2;
	local v24 = false;
	if 1000000 <= v23 then
		v23 = math.floor(v23 / 1000);
		v24 = true;
	end;
	while true do
		local v25, v26 = string.gsub(v23, "^(-?%d+)(%d%d%d)", "%1 %2");
		v23 = v25;
		if v26 ~= 0 then

		else
			break;
		end;	
	end;
	return v24 and v23 .. "m" or v23;
end;
game.ReplicatedStorage.Remotes.ChatMessage.OnClientEvent:connect(function(p3)
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = p3.Text, 
		Color = p3.Color
	});
end);
l__PlayerGui__5:WaitForChild("Messages"):WaitForChild("HelpFrame").Close.MouseButton1Down:connect(function()
	l__PlayerGui__5:WaitForChild("Messages"):WaitForChild("HelpFrame").Visible = false;
end);
game:GetService("UserInputService").InputBegan:connect(function(p4, p5)
	if p5 or game:GetService("UserInputService"):GetFocusedTextBox() ~= nil then
		return;
	end;
	if p4.KeyCode == Enum.KeyCode.H then
		l__PlayerGui__5:WaitForChild("Messages"):WaitForChild("HelpFrame").Visible = not l__PlayerGui__5:WaitForChild("Messages"):WaitForChild("HelpFrame").Visible;
		return;
	end;
	if p4.KeyCode == Enum.KeyCode.Q then
		l__PlayerGui__5:WaitForChild("MainGui"):WaitForChild("Top"):WaitForChild("Leaderboard").Visible = not l__PlayerGui__5:WaitForChild("MainGui"):WaitForChild("Top"):WaitForChild("Leaderboard").Visible;
		return;
	end;
	if p4.KeyCode == Enum.KeyCode.J then
		if l__PlayerGui__5:FindFirstChild("HideGUI").Enabled == false then
			for v27, v28 in pairs(l__PlayerGui__5:GetChildren()) do
				if v28.ClassName == "ScreenGui" and v28.Name ~= "LoadUI" and v28.Name ~= "HideGUI" and v28.Name ~= "FreeCamera" and v28.Name ~= "Map" then
					v28.Enabled = false;
				end;
			end;
			l__PlayerGui__5:FindFirstChild("HideGUI").Enabled = true;
			return;
		end;
		for v29, v30 in pairs(l__PlayerGui__5:GetChildren()) do
			if v30.ClassName == "ScreenGui" and v30.Name ~= "LoadUI" and v30.Name ~= "HideGUI" and v30.Name ~= "FreeCamera" and v30.Name ~= "Map" then
				v30.Enabled = true;
			end;
		end;
		l__PlayerGui__5:FindFirstChild("HideGUI").Enabled = false;
	end;
end);
l__PlayerGui__5.ChildAdded:connect(function(p6)
	if p6.Name == "GunGUI" then
		if l__PlayerGui__5:FindFirstChild("HideGUI").Enabled ~= false then
			p6.Enabled = false;
			return;
		end;
	else
		return;
	end;
	p6.Enabled = true;
end);
l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").Close.MouseButton1Down:connect(function()
	l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").Visible = false;
end);
l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").Decline.MouseButton1Down:connect(function()
	l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").Visible = false;
end);
l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").Accept.MouseButton1Down:connect(function()
	game.ReplicatedStorage.Remotes.ExpandInv:FireServer();
	l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").Visible = false;
end);
delay(0.1, function()
	if l__LocalPlayer__2:WaitForChild("stats"):WaitForChild("other"):WaitForChild("InvEx").Value >= 4 then
		l__PlayerGui__5:WaitForChild("ItemControlGui"):WaitForChild("InventoryFrame"):WaitForChild("UpgradeButton").Visible = false;
	end;
end);
l__PlayerGui__5:WaitForChild("ItemControlGui"):WaitForChild("InventoryFrame"):WaitForChild("UpgradeButton").MouseButton1Down:connect(function()
	local l__Value__31 = l__LocalPlayer__2:WaitForChild("stats"):WaitForChild("other"):WaitForChild("InvEx").Value;
	if not (l__Value__31 < 4) then
		l__PlayerGui__5:WaitForChild("ItemControlGui"):WaitForChild("InventoryFrame"):WaitForChild("UpgradeButton").Visible = false;
		return;
	end;
	l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").MessageText.Text = "Expands your inventory by 6 slots (" .. 36 + 6 * l__Value__31 .. " slots total)";
	if l__Value__31 == 0 then
		l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").Tabs.Text = 200;
	elseif l__Value__31 == 1 then
		l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").Tabs.Text = 300;
	elseif l__Value__31 == 2 then
		l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").Tabs.Text = 800;
	elseif l__Value__31 == 3 then
		l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").Tabs.Text = 2000;
	end;
	l__PlayerGui__5:WaitForChild("ExpandInv"):WaitForChild("ExpandInventory").Visible = true;
end);
delay(0.01, function()
	local function v32()
		l__PlayerGui__5:WaitForChild("MainGui"):WaitForChild("Top").Level.Bar.Bar.Size = UDim2.new(l__LocalPlayer__2:WaitForChild("stats"):WaitForChild("other"):WaitForChild("XP").Value / v22.calcLevel(l__LocalPlayer__2:WaitForChild("stats"):WaitForChild("other"):WaitForChild("Level").Value), 0, 0, 4);
		l__PlayerGui__5:WaitForChild("MainGui"):WaitForChild("Top").Level.Level.Text = "LV " .. l__LocalPlayer__2:WaitForChild("stats"):WaitForChild("other"):WaitForChild("Level").Value;
	end;
	v32();
	l__LocalPlayer__2:WaitForChild("stats"):WaitForChild("other"):WaitForChild("XP").Changed:connect(function()
		v32();
	end);
	l__LocalPlayer__2:WaitForChild("stats"):WaitForChild("other"):WaitForChild("Level").Changed:connect(function()
		v32();
	end);
	local function v33()
		l__PlayerGui__5:WaitForChild("MainGui"):WaitForChild("Top").Tabs.Text = comma_value(l__LocalPlayer__2:WaitForChild("stats"):WaitForChild("other"):WaitForChild("Tabs").Value);
	end;
	v33();
	l__LocalPlayer__2:WaitForChild("stats"):WaitForChild("other"):WaitForChild("Tabs").Changed:connect(function()
		v33();
	end);
end);
local u2 = {
	Red = 1000, 
	Orange = 2000, 
	Yellow = 3000, 
	Green = 4000, 
	Blue = 5000, 
	Pink = 6000, 
	Purple = 7000, 
	Brown = 8000
};
local u3 = nil;
local function u4(p7)
	local v34 = false;
	for v35, v36 in pairs(game.Workspace.Clans:GetChildren()) do
		if v36.Value == l__LocalPlayer__2 then
			v34 = true;
			break;
		end;
	end;
	if p7 then
		for v37, v38 in pairs(l__Leaderboard__9.Main:GetChildren()) do
			if v38.ClassName == "Frame" then
				v38:Destroy();
			end;
		end;
	end;
	local v39, v40, v41 = pairs(game.Players:GetChildren());
	while true do
		local v42, v43 = v39(v40, v41);
		if not v42 then
			break;
		end;
		if l__Leaderboard__9.Main:FindFirstChild(v43.Name) == nil then
			local l__stats__44 = v43:WaitForChild("stats");
			local v45 = script.PlayerFrame:Clone();
			v45.Name = v43.Name;
			v45.Main.NameLabel.Text = v43.Name;
			v45.TeamFlag.LevelLabel.Text = tostring(l__stats__44.other.Level.Value);
			v45.LayoutOrder = string.byte(string.sub(v43.Name, 1, 1));
			if l__Leaderboard__9.Main.AbsoluteSize.Y < l__Leaderboard__9.Main.UIListLayout.AbsoluteContentSize.Y then
				v45.Size = UDim2.new(0, 179, 0, 25);
			else
				v45.Size = UDim2.new(0, 185, 0, 25);
			end;
			l__stats__44.other.Level.Changed:connect(function(p8)
				if v45:FindFirstChild("TeamFlag") then
					v45:WaitForChild("TeamFlag").LevelLabel.Text = tostring(p8);
				end;
			end);
			if v43:FindFirstChild("Intern") then
				v45.Main.Status.Image = "rbxassetid://1621669342";
				v45.Main.Status.Visible = true;
			end;
			if v43:FindFirstChild("Admin") then
				v45.Main.Status.Image = "rbxassetid://1621668651";
				v45.Main.Status.Visible = true;
			end;
			if v43:FindFirstChild("IPDDeveloper") then
				v45.Main.Status.Image = "rbxassetid://1621804220";
				v45.Main.Status.Visible = true;
			end;
			v43.ChildAdded:connect(function(p9)
				if p9.Name == "Intern" then
					v45.Main.Status.Image = "rbxassetid://1621669342";
					v45.Main.Status.Visible = true;
				end;
				if p9.Name == "Admin" then
					v45.Main.Status.Image = "rbxassetid://1621668651";
					v45.Main.Status.Visible = true;
				end;
				if p9.Name == "IPDDeveloper" then
					v45.Main.Status.Image = "rbxassetid://1621804220";
					v45.Main.Status.Visible = true;
				end;
			end);
			if v43.TeamColor == BrickColor.new("White") then
				v45:WaitForChild("TeamFlag").ImageColor3 = BrickColor.new("White").Color;
				v45.LayoutOrder = string.byte(string.sub(v43.Name, 1, 1));
				v45.TeamFlag.Crown.Visible = false;
				if v34 and v43 ~= l__LocalPlayer__2 then
					v45.Invite.TextTransparency = 0;
					v45.Invite.AutoButtonColor = true;
					v45.Invite.Text = "Invite to Clan";
				elseif v43 == l__LocalPlayer__2 then
					v45.Invite.TextTransparency = 0;
					v45.Invite.AutoButtonColor = true;
					v45.Invite.Text = "Form Clan";
				else
					v45.Invite.TextTransparency = 0.5;
					v45.Invite.AutoButtonColor = false;
					v45.Invite.Text = "Invite to Clan";
				end;
			else
				v45:WaitForChild("TeamFlag").ImageColor3 = v43.TeamColor.Color;
				v45.LayoutOrder = string.byte(string.sub(v43.Name, 1, 1)) + u2[v43.Team.Name];
				v45.Invite.TextTransparency = 0.5;
				v45.Invite.AutoButtonColor = false;
				v45.TeamFlag.Crown.Visible = false;
				if v43.Team and game.Workspace.Clans:FindFirstChild(v43.Team.Name) and game.Workspace.Clans:FindFirstChild(v43.Team.Name).Value == v43 then
					v45.TeamFlag.Crown.Visible = true;
				end;
				if v34 and v43 ~= l__LocalPlayer__2 then
					v45.Invite.TextTransparency = 0;
					v45.Invite.AutoButtonColor = true;
					if v43.TeamColor == l__LocalPlayer__2.TeamColor then
						v45.Invite.Text = "Kick from Clan";
					end;
				elseif v43 == l__LocalPlayer__2 then
					v45.Invite.TextTransparency = 0;
					v45.Invite.AutoButtonColor = true;
					v45.Invite.Text = "Leave Clan";
				end;
			end;
			v43:GetPropertyChangedSignal("TeamColor"):connect(function()
				wait(0.1);
				u4();
			end);
			v45.Invite.MouseButton1Down:connect(function()
				if v45.Invite.Text == "Form Clan" and v45.Invite.TextTransparency == 0 then
					l__PlayerGui__5:WaitForChild("MainGui").CreateClan.Visible = true;
					return;
				end;
				if v45.Invite.Text == "Leave Clan" and v45.Invite.TextTransparency == 0 then
					l__ClanLeave__13:FireServer();
					return;
				end;
				if v45.Invite.Text == "Invite to Clan" and v45.Invite.TextTransparency == 0 then
					l__ClanInvite__14:FireServer(v43);
					return;
				end;
				if v45.Invite.Text == "Kick from Clan" and v45.Invite.TextTransparency == 0 then
					l__ClanKick__15:FireServer(v43);
				end;
			end);
			v45.Main.Button.MouseButton1Down:connect(function()
				if v45.Size.Y.Offset == 75 then
					v45:TweenSize(UDim2.new(0, v45.Size.X.Offset, 0, 25), "Out", "Quad", 0.5, true);
					for v46 = 1, 30 do
						delay(v46 / 30 * 0.5, function()
							l__Leaderboard__9.Main.CanvasSize = UDim2.new(0, 0, 0, l__Leaderboard__9.Main.UIListLayout.AbsoluteContentSize.Y);
						end);
					end;
					return;
				end;
				for v47, v48 in pairs(l__Leaderboard__9.Main:GetChildren()) do
					if v48.ClassName == "Frame" then
						v48:TweenSize(UDim2.new(0, v48.Size.X.Offset, 0, 25), "Out", "Quad", 0.5, true);
					end;
				end;
				v45:TweenSize(UDim2.new(0, v45.Size.X.Offset, 0, 75), "Out", "Quad", 0.5, true);
				u3 = v43;
				for v49 = 1, 30 do
					delay(v49 / 30 * 0.5, function()
						l__Leaderboard__9.Main.CanvasSize = UDim2.new(0, 0, 0, l__Leaderboard__9.Main.UIListLayout.AbsoluteContentSize.Y);
					end);
				end;
			end);
			v45.Close.MouseButton1Down:connect(function()
				if v45.Size.Y.Offset == 75 then
					v45:TweenSize(UDim2.new(0, v45.Size.X.Offset, 0, 25), "Out", "Quad", 0.5, true);
					for v50 = 1, 30 do
						delay(v50 / 30 * 0.5, function()
							l__Leaderboard__9.Main.CanvasSize = UDim2.new(0, 0, 0, l__Leaderboard__9.Main.UIListLayout.AbsoluteContentSize.Y);
						end);
					end;
				end;
			end);
			v45.Parent = l__Leaderboard__9.Main;
		else
			local v51 = l__Leaderboard__9.Main:FindFirstChild(v43.Name);
			if l__Leaderboard__9.Main.AbsoluteSize.Y < l__Leaderboard__9.Main.UIListLayout.AbsoluteContentSize.Y then
				v51.Size = UDim2.new(0, 179, 0, v51.Size.Y.Offset);
			else
				v51.Size = UDim2.new(0, 185, 0, v51.Size.Y.Offset);
			end;
			if v43.TeamColor == BrickColor.new("White") then
				v51:WaitForChild("TeamFlag").ImageColor3 = BrickColor.new("White").Color;
				v51.LayoutOrder = string.byte(string.sub(v43.Name, 1, 1));
				v51.TeamFlag.Crown.Visible = false;
				if v34 and v43 ~= l__LocalPlayer__2 then
					v51.Invite.TextTransparency = 0;
					v51.Invite.AutoButtonColor = true;
					v51.Invite.Text = "Invite to Clan";
				elseif v43 == l__LocalPlayer__2 then
					v51.Invite.TextTransparency = 0;
					v51.Invite.AutoButtonColor = true;
					v51.Invite.Text = "Form Clan";
				else
					v51.Invite.TextTransparency = 0.5;
					v51.Invite.AutoButtonColor = false;
					v51.Invite.Text = "Invite to Clan";
				end;
			else
				v51:WaitForChild("TeamFlag").ImageColor3 = v43.TeamColor.Color;
				v51.LayoutOrder = string.byte(string.sub(v43.Name, 1, 1)) + u2[v43.Team.Name];
				v51.Invite.TextTransparency = 0.5;
				v51.Invite.AutoButtonColor = false;
				v51.TeamFlag.Crown.Visible = false;
				if v43.Team and game.Workspace.Clans:FindFirstChild(v43.Team.Name) and game.Workspace.Clans:FindFirstChild(v43.Team.Name).Value == v43 then
					v51.TeamFlag.Crown.Visible = true;
				end;
				if v34 and v43 ~= l__LocalPlayer__2 then
					v51.Invite.TextTransparency = 0;
					v51.Invite.AutoButtonColor = true;
					if v43.TeamColor == l__LocalPlayer__2.TeamColor then
						v51.Invite.Text = "Kick from Clan";
					end;
				elseif v43 == l__LocalPlayer__2 then
					v51.Invite.TextTransparency = 0;
					v51.Invite.AutoButtonColor = true;
					v51.Invite.Text = "Leave Clan";
				end;
			end;
		end;	
	end;
	for v52, v53 in pairs(l__Leaderboard__9.Main:GetChildren()) do
		if v53.ClassName == "Frame" and game.Players:FindFirstChild(v53.Name) == nil then
			v53:Destroy();
		end;
	end;
	wait();
	l__Leaderboard__9.Main.CanvasSize = UDim2.new(0, 0, 0, l__Leaderboard__9.Main.UIListLayout.AbsoluteContentSize.Y);
end;
u4();
game.Players.PlayerAdded:connect(function()
	wait(0.1);
	u4(true);
end);
game.Players.PlayerRemoving:connect(function()
	wait(0.1);
	u4(true);
end);
spawn(function()
	while wait(20) do
		u4(true);	
	end;
end);
l__LocalPlayer__2:GetPropertyChangedSignal("TeamColor"):connect(function()
	wait(0.1);
	u4(true);
end);
spawn(function()
	wait(20);
	local v54 = nil;
	while wait(0.1) do
		if l__HumanoidRootPart__6 and l__Humanoid__7.Health > 0 then
			if v54 then
				local l__Value__55 = l__Humanoid__7:WaitForChild("MovementSpeedModifier").Value;
				if l__Value__55 * 0.2 < (v54 - l__HumanoidRootPart__6.Position).Magnitude and (20 * l__Value__55 / 16 <= (l__HumanoidRootPart__6.Velocity.X ^ 2 + l__HumanoidRootPart__6.Velocity.Z ^ 2) ^ 0.5 or l__HumanoidRootPart__6.Velocity.Magnitude <= 5) then
					game.ReplicatedStorage.Remotes.AddTabs:FireServer(5, false, "EXPLOIT CODE : 1012");
				end;
			end;
			v54 = l__HumanoidRootPart__6.Position;
		end;	
	end;
end);
local v56 = 1 - 1;
while true do
	u1 = l__DevProduct__16;
	local u5 = v56;
	l__PlayerGui__5:WaitForChild("MainGui").Microstore.Tabs:FindFirstChild("Option" .. v56).MouseButton1Down:connect(function()
		u1:FireServer(l__PlayerGui__5:WaitForChild("MainGui").Microstore.Tabs:FindFirstChild("Option" .. u5).MerchantId.Value);
	end);
	if 0 <= 1 then
		if not (u5 < 7) then
			break;
		end;
	elseif not (u5 > 7) then
		break;
	end;
	u5 = u5 + 1;
end;
l__PlayerGui__5:WaitForChild("MainGui").Microstore.Loot.Airdrop.MouseButton1Down:connect(function()
	u1:FireServer(l__PlayerGui__5:WaitForChild("MainGui").Microstore.Loot.Airdrop.MerchantId.Value);
end);
l__PlayerGui__5:WaitForChild("MainGui").Top.Tabs.Store.MouseButton1Down:connect(function()
	l__PlayerGui__5:WaitForChild("MainGui").Microstore.Visible = not l__PlayerGui__5:WaitForChild("MainGui").Microstore.Visible;
end);
l__PlayerGui__5:WaitForChild("MainGui").Microstore.Close.MouseButton1Down:connect(function()
	l__PlayerGui__5:WaitForChild("MainGui").Microstore.Visible = false;
end);
l__PlayerGui__5:WaitForChild("MainGui").CreateClan.Close.MouseButton1Down:connect(function()
	l__PlayerGui__5:WaitForChild("MainGui").CreateClan.Visible = false;
end);
local u6 = nil;
l__PlayerGui__5:WaitForChild("MainGui").CreateClan.Form.MouseButton1Down:connect(function()
	if u6 and game.Workspace.Clans:FindFirstChild(u6.Name) and (game.Workspace.Clans:FindFirstChild(u6.Name).Value == nil and l__ClanForm__17:InvokeServer(u6) == 0) then
		l__PlayerGui__5:WaitForChild("MainGui").CreateClan.Visible = false;
	end;
end);
for v57, v58 in pairs(l__PlayerGui__5:WaitForChild("MainGui").CreateClan:GetChildren()) do
	if v58.ClassName == "ImageButton" then
		v58.MouseButton1Down:connect(function()
			for v59, v60 in pairs(l__PlayerGui__5:WaitForChild("MainGui").CreateClan:GetChildren()) do
				if v60.ClassName == "ImageButton" then
					v60.BorderColor3 = Color3.fromRGB(31, 31, 31);
				end;
			end;
			v58.BorderColor3 = BrickColor.new("Gold").Color;
			u6 = game.Teams:FindFirstChild(v58.Name);
		end);
	end;
end;
l__ClanInvite__14.OnClientEvent:connect(function(p10)
	if game.Workspace.Clans:FindFirstChild(p10.Team.Name) and game.Workspace.Clans:FindFirstChild(p10.Team.Name).Value == p10 then
		local v61 = script.ClanInviteFrame:Clone();
		v61.Name = os.time();
		v61.MessageText.Text = p10.Name .. " is inviting you to the " .. p10.Team.Name .. " clan";
		v61.Parent = l__PlayerGui__5:WaitForChild("Messages").MessagesFrame;
		v61.Decline.MouseButton1Down:connect(function()
			v61:Destroy();
		end);
		v61.Accept.MouseButton1Down:connect(function()
			l__ClanJoin__18:FireServer(p10.Team);
		end);
		game.Debris:AddItem(v61, 10);
	end;
end);
local function v62()
	local v63 = math.max(0, l__Humanoid__7.Health);
	l__Stats__8.Health.Frame.Bar.Size = UDim2.new(v63 / l__Humanoid__7.MaxHealth, 0, 1, 0);
	l__Stats__8.Health.Frame.Bar.TextLabel.Size = UDim2.new(1 / (v63 / l__Humanoid__7.MaxHealth), 0, 1, 0);
	l__Stats__8.Health.Frame.Bar.TextLabel.Text = math.ceil(v63);
	l__Stats__8.Health.Frame.TextLabel.Text = math.ceil(v63);
end;
v62();
local l__DamageTint__7 = l__PlayerGui__5:WaitForChild("ScreenOverlays"):WaitForChild("DamageTint"):WaitForChild("DamageTint");
local u8 = l__Humanoid__7.Health;
l__Humanoid__7.Changed:connect(function()
	v62();
	if l__Humanoid__7.Health < u8 then
		local v64 = 1 - 0.5 * (math.min(math.max(u8 - l__Humanoid__7.Health, 10), 30) / 30);
		l__DamageTint__7.ImageTransparency = v64;
		l__DamageTint__7.Size = UDim2.new(1, 0, 1, 0);
		local v65 = 1 - 1;
		while true do
			local u9 = v65;
			delay(v65 / 15 * 0.5, function()
				l__DamageTint__7.ImageTransparency = v64 + (1 - v64) * u9 / 15;
			end);
			if 0 <= 1 then
				if not (u9 < 15) then
					break;
				end;
			elseif not (u9 > 15) then
				break;
			end;
			u9 = u9 + 1;		
		end;
		l__DamageTint__7:TweenSize(UDim2.new(1.25, 0, 1.25, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true);
	end;
	u8 = l__Humanoid__7.Health;
end);
local l__Bleed__10 = script.Bleed;
local l__Hallucinating__11 = script.Hallucinating;
local l__InCombat__12 = script.InCombat;
local l__Regen__13 = script.Regen;
local u14 = 0;
local function u15(p11)
	local v66 = script.MessageFrame:Clone();
	v66.Name = os.time();
	v66.MessageText.Text = p11;
	v66.Parent = l__PlayerGui__5:WaitForChild("Messages").MessagesFrame;
	game.Debris:AddItem(v66, 4);
end;
local function u16()
	if l__Humanoid__7:FindFirstChild("BleedScript") then
		l__Bleed__10.Parent = l__Stats__8.Frame;
	else
		l__Bleed__10.Parent = script;
	end;
	if v10 then
		if l__Humanoid__7:FindFirstChild("Poisoned") and l__Humanoid__7:FindFirstChild("PoisonImmunity") == nil then
			v10.Parent = l__Stats__8.Frame;
		else
			v10.Parent = script;
		end;
	end;
	if v11 then
		if l__Humanoid__7:FindFirstChild("PoisonImmunity") then
			v11.Parent = l__Stats__8.Frame;
		else
			v11.Parent = script;
		end;
	end;
	if l__Humanoid__7:FindFirstChild("Hallucinating") then
		l__Hallucinating__11.Parent = l__Stats__8.Frame;
	else
		l__Hallucinating__11.Parent = script;
	end;
	if l__Humanoid__7:FindFirstChild("InCombat") then
		l__InCombat__12.Parent = l__Stats__8.Frame;
	else
		l__InCombat__12.Parent = script;
	end;
	if not l__Humanoid__7:FindFirstChild("Regeneration") then
		l__Regen__13.Parent = script;
		return;
	end;
	l__Regen__13.Parent = l__Stats__8.Frame;
end;
l__Humanoid__7.ChildAdded:connect(function(p12)
	if p12.Name == "InCombat" and l__Humanoid__7:FindFirstChild("InCombat") ~= nil and u14 == 0 then
		u15("You will die if you log out while in combat!");
		u14 = 1;
	end;
	u16();
end);
l__Humanoid__7.ChildRemoved:connect(function(p13)
	if p13.Name == "InCombat" and l__Humanoid__7:FindFirstChild("InCombat") == nil and u14 == 1 then
		u15("You can now safely log out");
		u14 = 0;
	end;
	u16();
end);
local function v67(p14, p15)
	l__Stats__8.Hunger.Frame.Bar.Size = UDim2.new(p14 / p15, 0, 1, 0);
	l__Stats__8.Hunger.Frame.Bar.TextLabel.Size = UDim2.new(1 / (p14 / p15), 0, 1, 0);
	l__Stats__8.Hunger.Frame.Bar.TextLabel.Text = math.ceil(p14) .. "%";
	l__Stats__8.Hunger.Frame.TextLabel.Text = math.ceil(p14) .. "%";
end;
v67(l__Humanoid__7:WaitForChild("Hunger").Value, 100);
l__Humanoid__7:WaitForChild("Hunger").Changed:connect(function()
	v67(l__Humanoid__7:WaitForChild("Hunger").Value, 100);
end);
l__Stats__8.Temp.Text = math.ceil(l__Humanoid__7:WaitForChild("Temperature").Value * 10) / 10 .. "C";
local l__Cold__17 = script.Cold;
local l__Hot__18 = script.Hot;
local u19 = 0;
local u20 = 1;
local function u21(p16, p17, p18)
	return p17 * p18 + p16 * (1 - p18);
end;
l__Humanoid__7:WaitForChild("Temperature").Changed:connect(function(p19)
	l__Stats__8.Temp.Text = math.ceil(p19 * 10) / 10 .. "C";
	if not (p19 < 10) then
		if p19 > 45 then
			l__Cold__17.Parent = script;
			l__Hot__18.Parent = l__Stats__8.Frame;
			u19 = u19 + 1;
			if u19 == 5 or u19 == 25 then
				u15("You're overheating. Take off some equipment or find somewhere cooler.");
			end;
			if u20 ~= 2 then
				u20 = 2;
			end;
			l__PlayerGui__5:WaitForChild("ScreenOverlays").FrozenOverScreen.ImageTransparency = 1;
			game.Lighting.ColdColorCorrection.Enabled = false;
			game.Lighting.HotBlur.Enabled = true;
			return;
		else
			l__Cold__17.Parent = script;
			l__Hot__18.Parent = script;
			u19 = 0;
			u20 = 1;
			l__PlayerGui__5:WaitForChild("ScreenOverlays").FrozenOverScreen.ImageTransparency = 1;
			game.Lighting.ColdColorCorrection.Enabled = false;
			game.Lighting.HotBlur.Enabled = false;
			return;
		end;
	end;
	l__Cold__17.Parent = l__Stats__8.Frame;
	l__Hot__18.Parent = script;
	u19 = u19 + 1;
	if u19 == 5 or u19 == 25 then
		u15("You're freezing. Wear warmer clothing or find somewhere warmer.");
	end;
	if u20 ~= 0 then
		script.IceCracking:Play();
		u20 = 0;
	end;
	local v68 = (10 - p19) / 10;
	if v68 > 1 then
		v68 = 1;
	end;
	l__PlayerGui__5:WaitForChild("ScreenOverlays").FrozenOverScreen.ImageTransparency = 0.8 - math.min(1, v68);
	game.Lighting.ColdColorCorrection.Enabled = true;
	game.Lighting.ColdColorCorrection.TintColor = Color3.new(u21(1, 0.8980392156862745, v68), u21(1, 1, v68), u21(1, 0.9882352941176471, v68));
	game.Lighting.HotBlur.Enabled = false;
end);
l__Message__19.OnClientEvent:connect(function(p20)
	u15(p20);
end);
l__PlaySound__20.OnClientEvent:connect(function(p21)
	if script:FindFirstChild(p21) then
		script:FindFirstChild(p21):Play();
	end;
end);
local v69 = {
	idle1 = v3:WaitForChild("Animate"):WaitForChild("idle").Animation1.AnimationId, 
	idle2 = v3:WaitForChild("Animate"):WaitForChild("idle").Animation2.AnimationId
};
game:GetService("UserInputService").InputBegan:connect(function(p22)
	if p22.KeyCode == Enum.KeyCode.LeftControl or p22.KeyCode == Enum.KeyCode.C then
		if not v3:FindFirstChildWhichIsA("Tool") then
			v3:WaitForChild("Animate"):WaitForChild("idle").Animation1.AnimationId = script.CrouchIdle.AnimationId;
			v3:WaitForChild("Animate"):WaitForChild("idle").Animation2.AnimationId = script.CrouchIdle.AnimationId;
			v3:WaitForChild("Animate"):WaitForChild("ReloadAnim"):Fire();
			return;
		end;
	else
		return;
	end;
	v3:WaitForChild("Animate"):WaitForChild("idle").Animation1.AnimationId = script.CrouchIdleNoArms.AnimationId;
	v3:WaitForChild("Animate"):WaitForChild("idle").Animation2.AnimationId = script.CrouchIdleNoArms.AnimationId;
	v3:WaitForChild("Animate"):WaitForChild("ReloadAnim"):Fire();
end);
game:GetService("UserInputService").InputEnded:connect(function(p23)
	if p23.KeyCode == Enum.KeyCode.LeftControl or p23.KeyCode == Enum.KeyCode.C then
		v3:WaitForChild("Animate"):WaitForChild("idle").Animation1.AnimationId = v69.idle1;
		v3:WaitForChild("Animate"):WaitForChild("idle").Animation2.AnimationId = v69.idle2;
		v3:WaitForChild("Animate"):WaitForChild("ReloadAnim"):Fire();
	end;
end);
v3.ChildAdded:connect(function(p24)
	if v3:FindFirstChildWhichIsA("Tool") and v3:WaitForChild("Animate"):WaitForChild("idle").Animation1.AnimationId == script.CrouchIdle.AnimationId then
		v3:WaitForChild("Animate"):WaitForChild("idle").Animation1.AnimationId = script.CrouchIdleNoArms.AnimationId;
		v3:WaitForChild("Animate"):WaitForChild("idle").Animation2.AnimationId = script.CrouchIdleNoArms.AnimationId;
		v3:WaitForChild("Animate"):WaitForChild("ReloadAnim"):Fire();
	end;
end);
v3.ChildRemoved:connect(function(p25)
	if v3:FindFirstChildWhichIsA("Tool") == nil and v3:WaitForChild("Animate"):WaitForChild("idle").Animation1.AnimationId == script.CrouchIdleNoArms.AnimationId then
		v3:WaitForChild("Animate"):WaitForChild("idle").Animation1.AnimationId = script.CrouchIdle.AnimationId;
		v3:WaitForChild("Animate"):WaitForChild("idle").Animation2.AnimationId = script.CrouchIdle.AnimationId;
		v3:WaitForChild("Animate"):WaitForChild("ReloadAnim"):Fire();
	end;
end);
local l__ClanBuff__22 = script.ClanBuff;
local l__Warmth__23 = script.Warmth;
spawn(function()
	while wait(0.5) do
		l__ClanBuff__22.Parent = script;
		l__Warmth__23.Parent = script;
		pcall(function()
			if l__LocalPlayer__2.Team ~= nil and (game.Workspace.Structures:FindFirstChild(l__LocalPlayer__2.Team.Name .. " Flag") and game.Players.LocalPlayer.Character) and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (game.Workspace.Structures:FindFirstChild(l__LocalPlayer__2.Team.Name .. " Flag").PrimaryPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 200 then
				l__ClanBuff__22.Parent = l__Stats__8.Frame;
			end;
		end);
		pcall(function()
			for v70, v71 in pairs(game.Workspace.Structures:GetChildren()) do
				if (v71.PrimaryPart.Position - v3.HumanoidRootPart.Position).Magnitude <= 20 and v71:FindFirstChild("Fire") and v71.Fire.Value >= 30 then
					l__Warmth__23.Parent = l__Stats__8.Frame;
				end;
			end;
		end);
		l__Stats__8.Notoriety.Text = l__LocalPlayer__2.stats.other.Notoriety.Value;
		if l__LocalPlayer__2.stats.other.Notoriety.Value >= 100 then
			l__Stats__8.Notoriety.Info["100"].TextColor3 = Color3.fromRGB(212, 100, 100);
			l__Stats__8.Notoriety.Info["100"].TextTransparency = 0;
		else
			l__Stats__8.Notoriety.Info["100"].TextColor3 = Color3.new(1, 1, 1);
			l__Stats__8.Notoriety.Info["100"].TextTransparency = 0.5;
		end;
		if l__LocalPlayer__2.stats.other.Notoriety.Value >= 150 then
			l__Stats__8.Notoriety.Info["150"].TextColor3 = Color3.fromRGB(212, 100, 100);
			l__Stats__8.Notoriety.Info["150"].TextTransparency = 0;
		else
			l__Stats__8.Notoriety.Info["150"].TextColor3 = Color3.new(1, 1, 1);
			l__Stats__8.Notoriety.Info["150"].TextTransparency = 0.5;
		end;
		if l__LocalPlayer__2.stats.other.Notoriety.Value >= 200 then
			l__Stats__8.Notoriety.Info["200"].TextColor3 = Color3.fromRGB(212, 100, 100);
			l__Stats__8.Notoriety.Info["200"].TextTransparency = 0;
		else
			l__Stats__8.Notoriety.Info["200"].TextColor3 = Color3.new(1, 1, 1);
			l__Stats__8.Notoriety.Info["200"].TextTransparency = 0.5;
		end;
		if l__Humanoid__7:FindFirstChild("HostileCountdown") and l__Humanoid__7:FindFirstChild("Targeted") and l__LocalPlayer__2.stats.other.Notoriety.Value < 150 then
			l__PlayerGui__5.MainGui.MilitaryOutpost.Visible = true;
			l__PlayerGui__5.MainGui.MilitaryOutpost.TextLabel.Text = "IF YOU DO NOT DISARM WITHIN " .. l__Humanoid__7:FindFirstChild("HostileCountdown").Value .. " SECONDS\nYOU WILL BE CONSIDERED A THREAT AND YOUR NOTORIETY LEVEL WILL RISE TO 155";
		else
			l__PlayerGui__5.MainGui.MilitaryOutpost.Visible = false;
		end;	
	end;
end);
local function u24(p26)
	if p26.AbsolutePosition.X <= l__mouse__4.X and l__mouse__4.X <= p26.AbsolutePosition.X + p26.AbsoluteSize.X and p26.AbsolutePosition.Y <= l__mouse__4.Y and l__mouse__4.Y <= p26.AbsolutePosition.Y + p26.AbsoluteSize.Y then
		return true;
	end;
	return false;
end;
l__mouse__4.Move:connect(function()
	if not u24(l__Stats__8.Notoriety) and not u24(l__Stats__8.Notoriety.ImageLabel) then
		l__Stats__8.Notoriety.Info.Visible = false;
		return;
	end;
	l__Stats__8.Notoriety.Info.Visible = true;
end);
while true do
	wait();
	if l__PlayerGui__5:FindFirstChild("Chat") and l__PlayerGui__5.Chat:FindFirstChild("Frame") then
		break;
	end;
end;
l__PlayerGui__5.Chat.Frame.AnchorPoint = Vector2.new(0, 1);
l__PlayerGui__5.Chat.Frame.Position = UDim2.new(0, 0, 1, 0);