-- Decompiled with the Synapse X Luau decompiler.

while true do
	wait();
	if game.Players.LocalPlayer:FindFirstChild("StatsLoaded") and game.Players.LocalPlayer:FindFirstChild("StatsLoaded").Value == true then
		break;
	end;
end;
local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
local l__LocalPlayer__2 = game.Players.LocalPlayer;
if not l__LocalPlayer__2.Character then
	local v3 = l__LocalPlayer__2.CharacterAdded:wait();
end;
local l__mouse__4 = l__LocalPlayer__2:GetMouse();
local l__PlayerGui__5 = l__LocalPlayer__2:WaitForChild("PlayerGui");
local v6 = require(game.ReplicatedStorage.Modules);
function comma_value(p1)
	local v7 = p1;
	local v8 = false;
	if 1000000 <= v7 then
		v7 = math.floor(v7 / 1000);
		v8 = true;
	end;
	while true do
		local v9, v10 = string.gsub(v7, "^(-?%d+)(%d%d%d)", "%1 %2");
		v7 = v9;
		if v10 ~= 0 then

		else
			break;
		end;	
	end;
	return v8 and v7 .. "m" or v7;
end;
l__PlayerGui__5.Messages.SecondBuySkinFrame.Close.MouseButton1Down:connect(function()
	l__PlayerGui__5.Messages.SecondBuySkinFrame.Visible = false;
end);
l__PlayerGui__5.Messages.SecondBuySkinFrame.Decline.MouseButton1Down:connect(function()
	l__PlayerGui__5.Messages.SecondBuySkinFrame.Visible = false;
end);
local u1 = nil;
local u2 = false;
l__PlayerGui__5.Messages.SecondBuySkinFrame.Accept.MouseButton1Down:connect(function()
	if u1 and not u2 then
		u2 = true;
		game.ReplicatedStorage.Remotes:WaitForChild("SecondBuySkin"):FireServer(u1);
		delay(0.5, function()
			u2 = false;
		end);
	end;
	l__PlayerGui__5.Messages.SecondBuySkinFrame.Visible = false;
end);
game.ReplicatedStorage.Remotes.Soundify.OnClientEvent:connect(function(p2)
	if script:FindFirstChild(p2) then
		script:FindFirstChild(p2):Play();
	end;
end);
local u3 = false;
local l__Microstore__4 = script.Parent.Microstore;
local u5 = false;
local u6 = "level";
local function u7(p3, p4, p5)
	local v11 = game.ReplicatedStorage.ItemData:FindFirstChild(p3);
	if v11 ~= nil and v11:FindFirstChild("TabsCost") and ((u3 or l__LocalPlayer__2.stats.skins:FindFirstChild(p3).Value == 0) and (l__Microstore__4.SkinPage.Sort.Search.TextBox.Text == "Search..." or not (not v6.search(string.lower(l__Microstore__4.SkinPage.Sort.Search.TextBox.Text), string.lower(p3), 1)) or not (not string.find(string.lower(p3), string.lower(l__Microstore__4.SkinPage.Sort.Search.TextBox.Text))) or not (not v6.search(string.lower(l__Microstore__4.SkinPage.Sort.Search.TextBox.Text), string.lower(p4), 1)) or string.find(string.lower(p4), string.lower(l__Microstore__4.SkinPage.Sort.Search.TextBox.Text)))) then
		local v12 = script.ItemFrame:Clone();
		v12.ImageButton.Image = v11.ItemImage.Image;
		v12.ImageButton.ImageColor3 = v11.ItemImage.ImageColor3;
		v12.ImageButton.NameLabel.Text = p3;
		v12.ImageButton.ItemLabel.Text = "Lv. " .. (v11:FindFirstChild("Level") and v11.Level.Value or 1) .. " " .. p4 .. " Skin";
		v12.ImageButton.CostLabel.Text = v11.TabsCost.Value;
		if v11.TabsCost.Value == 0 then
			p5 = p5 + 1000000;
			v12.ImageButton.LockedLabel.Visible = true;
		end;
		if u3 and l__LocalPlayer__2.stats.skins:FindFirstChild(p3).Value ~= 0 then
			v12.ImageButton.LockedLabel.Text = "\226\156\133";
			v12.ImageButton.LockedLabel.Visible = true;
		end;
		if u5 then
			p5 = 100000000 - p5;
		end;
		v12.LayoutOrder = p5;
		v12.Parent = l__Microstore__4.SkinPage.Main.ScrollingFrame;
		v12.ImageButton.MouseEnter:connect(function()
			v12.ImageButton.BorderColor3 = Color3.fromRGB(130, 130, 130);
		end);
		v12.ImageButton.MouseLeave:connect(function()
			v12.ImageButton.BorderColor3 = Color3.fromRGB(60, 60, 60);
		end);
		v12.ImageButton.MouseButton1Click:connect(function()
			l__PlayerGui__5.Messages.SecondBuySkinFrame.TitleText.Text = "Purchase " .. v11.Name .. " Skin";
			l__PlayerGui__5.Messages.SecondBuySkinFrame.MessageText.Text = v11.ItemDesc.Value .. "\n\nThis item is a skin for " .. p4;
			l__PlayerGui__5.Messages.SecondBuySkinFrame.Tabs.Text = comma_value(v11.TabsCost.Value);
			l__PlayerGui__5.Messages.SecondBuySkinFrame.ItemImage.Image = v11.ItemImage.Image;
			l__PlayerGui__5.Messages.SecondBuySkinFrame.ItemImage.ImageColor3 = v11.ItemImage.ImageColor3;
			l__PlayerGui__5.Messages.SecondBuySkinFrame.Visible = true;
			if v11.TabsCost.Value == 0 then
				l__PlayerGui__5.Messages.SecondBuySkinFrame.Accept.Visible = false;
				l__PlayerGui__5.Messages.SecondBuySkinFrame.TitleText.Text = v11.Name .. " Skin (UNOBTAINABLE)";
			else
				l__PlayerGui__5.Messages.SecondBuySkinFrame.Accept.Visible = true;
			end;
			u1 = v11;
		end);
		return true;
	end;
	return false;
end;
local function u8()
	for v13, v14 in pairs(l__Microstore__4.SkinPage.Main.ScrollingFrame:GetChildren()) do
		if v14:IsA("Frame") then
			v14:Destroy();
		end;
	end;
	local v15 = 0;
	local v16 = {};
	for v17, v18 in pairs(game.ReplicatedStorage.CraftingGroups:GetChildren()) do
		table.insert(v16, v18);
	end;
	table.sort(v16, function(p6, p7)
		return p6.Name:lower() < p7.Name:lower();
	end);
	if u6 == "level" then
		local v19, v20, v21 = pairs(v16);
		while true do
			local v22, v23 = v19(v20, v21);
			if not v22 then
				break;
			end;
			local v24 = nil;
			for v25, v26 in pairs(v23:GetChildren()) do
				if v26:FindFirstChild("Default") then
					v24 = game.ReplicatedStorage.ItemData:FindFirstChild(v26.Name);
				end;
			end;
			if v24 then
				local v27 = v24:FindFirstChild("Level") and v24:FindFirstChild("Level").Value or 1;
				local v28 = {};
				for v29, v30 in pairs(v23:GetChildren()) do
					table.insert(v28, v30);
				end;
				table.sort(v28, function(p8, p9)
					return p8.Name:lower() < p9.Name:lower();
				end);
				for v31, v32 in pairs(v28) do
					if u7(v32.Name, v23.Name, v27 * 100 + 10000 + v15) then
						local v33 = 1;
					else
						v33 = 0;
					end;
					v15 = v15 + v33;
				end;
			end;		
		end;
	elseif u6 == "alphabetical groups" then
		local v34, v35, v36 = pairs(v16);
		while true do
			local v37, v38 = v34(v35, v36);
			if not v37 then
				break;
			end;
			local v39 = {};
			for v40, v41 in pairs(v38:GetChildren()) do
				table.insert(v39, v41);
			end;
			table.sort(v39, function(p10, p11)
				return p10.Name:lower() < p11.Name:lower();
			end);
			for v42, v43 in pairs(v39) do
				if u7(v43.Name, v38.Name, v37 * 100 + 10000 + v15) then
					local v44 = 1;
				else
					v44 = 0;
				end;
				v15 = v15 + v44;
			end;		
		end;
	elseif u6 == "alphabetical" then
		local v45 = {};
		for v46, v47 in pairs(v16) do
			for v48, v49 in pairs(v47:GetChildren()) do
				table.insert(v45, { v49, v47 });
			end;
		end;
		table.sort(v45, function(p12, p13)
			return p12[1].Name:lower() < p13[1].Name:lower();
		end);
		for v50, v51 in pairs(v45) do
			if u7(v51[1].Name, v51[2].Name, v50 * 100 + 10000 + v15) then
				local v52 = 1;
			else
				v52 = 0;
			end;
			v15 = v15 + v52;
		end;
	end;
	wait();
	l__Microstore__4.SkinPage.Main.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, l__Microstore__4.SkinPage.Main.ScrollingFrame.UIGridLayout.AbsoluteContentSize.Y);
end;
game.ReplicatedStorage.Remotes.ReloadSkinPage.OnClientEvent:connect(function()
	u8();
end);
l__Microstore__4.SkinPage.Sort.Search.TextBox.FocusLost:connect(function(p14)
	if p14 then
		u8();
	end;
	if #string.gsub(l__Microstore__4.SkinPage.Sort.Search.TextBox.Text, " ", "") <= 0 then
		l__Microstore__4.SkinPage.Sort.Search.TextBox.Text = "Search...";
	end;
end);
l__Microstore__4.SkinPage.Sort.level.MouseButton1Click:connect(function()
	for v53, v54 in pairs(l__Microstore__4.SkinPage.Sort:GetChildren()) do
		if v54:IsA("TextButton") and v54.Name ~= "owned" then
			v54.TextColor3 = Color3.new(1, 1, 1);
		end;
	end;
	l__Microstore__4.SkinPage.Sort.level.TextColor3 = Color3.fromRGB(255, 201, 73);
	u6 = "level";
	u5 = false;
	u8();
end);
l__Microstore__4.SkinPage.Sort.levelr.MouseButton1Click:connect(function()
	for v55, v56 in pairs(l__Microstore__4.SkinPage.Sort:GetChildren()) do
		if v56:IsA("TextButton") and v56.Name ~= "owned" then
			v56.TextColor3 = Color3.new(1, 1, 1);
		end;
	end;
	l__Microstore__4.SkinPage.Sort.levelr.TextColor3 = Color3.fromRGB(255, 201, 73);
	u6 = "level";
	u5 = true;
	u8();
end);
l__Microstore__4.SkinPage.Sort.alphabeticalitem.MouseButton1Click:connect(function()
	for v57, v58 in pairs(l__Microstore__4.SkinPage.Sort:GetChildren()) do
		if v58:IsA("TextButton") and v58.Name ~= "owned" then
			v58.TextColor3 = Color3.new(1, 1, 1);
		end;
	end;
	l__Microstore__4.SkinPage.Sort.alphabeticalitem.TextColor3 = Color3.fromRGB(255, 201, 73);
	u6 = "alphabetical groups";
	u5 = false;
	u8();
end);
l__Microstore__4.SkinPage.Sort.alphabeticalitemr.MouseButton1Click:connect(function()
	for v59, v60 in pairs(l__Microstore__4.SkinPage.Sort:GetChildren()) do
		if v60:IsA("TextButton") and v60.Name ~= "owned" then
			v60.TextColor3 = Color3.new(1, 1, 1);
		end;
	end;
	l__Microstore__4.SkinPage.Sort.alphabeticalitemr.TextColor3 = Color3.fromRGB(255, 201, 73);
	u6 = "alphabetical groups";
	u5 = true;
	u8();
end);
l__Microstore__4.SkinPage.Sort.alphabetical.MouseButton1Click:connect(function()
	for v61, v62 in pairs(l__Microstore__4.SkinPage.Sort:GetChildren()) do
		if v62:IsA("TextButton") and v62.Name ~= "owned" then
			v62.TextColor3 = Color3.new(1, 1, 1);
		end;
	end;
	l__Microstore__4.SkinPage.Sort.alphabetical.TextColor3 = Color3.fromRGB(255, 201, 73);
	u6 = "alphabetical";
	u5 = false;
	u8();
end);
l__Microstore__4.SkinPage.Sort.alphabeticalr.MouseButton1Click:connect(function()
	for v63, v64 in pairs(l__Microstore__4.SkinPage.Sort:GetChildren()) do
		if v64:IsA("TextButton") and v64.Name ~= "owned" then
			v64.TextColor3 = Color3.new(1, 1, 1);
		end;
	end;
	l__Microstore__4.SkinPage.Sort.alphabeticalr.TextColor3 = Color3.fromRGB(255, 201, 73);
	u6 = "alphabetical";
	u5 = true;
	u8();
end);
l__Microstore__4.SkinPage.Sort.owned.MouseButton1Click:connect(function()
	u3 = not u3;
	if u3 then
		local v65 = "\226\156\133 Show Owned";
	else
		v65 = "\226\157\140 Show Owned";
	end;
	l__Microstore__4.SkinPage.Sort.owned.Text = v65;
	u8();
end);
local function v66(p15)
	for v67, v68 in pairs(l__Microstore__4.TopBar:GetChildren()) do
		if v68.Name ~= p15 then
			v68.BackgroundColor3 = Color3.fromRGB(21, 21, 21);
			if v68:FindFirstChild("EndFrame") then
				v68:FindFirstChild("EndFrame").BackgroundColor3 = Color3.fromRGB(21, 21, 21);
			end;
		else
			v68.BackgroundColor3 = Color3.fromRGB(31, 31, 31);
			if v68:FindFirstChild("EndFrame") then
				v68:FindFirstChild("EndFrame").BackgroundColor3 = Color3.fromRGB(31, 31, 31);
			end;
		end;
	end;
	for v69, v70 in pairs(l__Microstore__4:GetChildren()) do
		if v70:IsA("Frame") and v70.Name ~= "TopBar" then
			if v70:FindFirstChild(p15) == nil then
				v70.Visible = false;
			else
				v70.Visible = true;
			end;
		end;
	end;
	if p15 == "Skins" then
		u8();
	end;
end;
for v71, v72 in pairs(l__Microstore__4.TopBar:GetChildren()) do
	v72.MouseButton1Click:connect(function()
		v66(v72.Name);
	end);
end;