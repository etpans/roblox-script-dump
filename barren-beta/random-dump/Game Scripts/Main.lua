-- Decompiled with the Synapse X Luau decompiler.

player = game.Players.LocalPlayer;
mouse = player:GetMouse();
local l__UserInputService__1 = game:GetService("UserInputService");
player:WaitForChild("PlayerGui"):WaitForChild("Chat");
for v2, v3 in pairs(player.PlayerGui:GetChildren()) do
	if v3.Name == "Chat" and v3:FindFirstChild("ClientSide") then
		script.Parent:Destroy();
	end;
end;
for v4 = 1, 1000 do
	wait();
	script.Parent.Parent = player.PlayerGui.Chat;
	if script.Parent.Parent == player.PlayerGui.Chat then
		break;
	end;
end;
workspace:WaitForChild(player.Name);
workspace[player.Name]:WaitForChild("Humanoid");
Event = workspace:WaitForChild("SpecialEvents").RemoteEvent;
Function = workspace:WaitForChild("SpecialEvents").RemoteFunction;
spawn(function()
	while true do
		wait(math.random(1, 100) / 20);
		for v5, v6 in pairs(script.Parent.Parent:GetChildren()) do
			if v6.Name == "ClientSide" and v6 ~= script.Parent then
				pcall(function()
					v6.Main.Disabled = true;
					v6:Destroy();
				end);
			end;
		end;	
	end;
end);
spawn(function()
	while true do
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "You can report exploiters/bug abusers by typing in '/e report' in chat. On the other hand, do not pick up items with suspiciously large values such as tabs. It is most likely duped and if you are caught with it, you might be banned. It's not worth the risk.", 
			Font = Enum.Font.Cartoon, 
			Color = Color3.fromRGB(255, 0, 0), 
			FontSize = Enum.FontSize.Size96
		});
		wait(300);	
	end;
end);
spawn(function()
	while true do
		wait(0.25);
		for v7, v8 in pairs(game.Players:GetChildren()) do
			pcall(function()
				if v8 ~= player and v8:FindFirstChild("Backpack") then
					if v8.Backpack:FindFirstChild("AdminGui") then
						v8.Backpack.AdminGui:Destroy();
					end;
					if v8.Backpack:FindFirstChild("ClientSide") then
						v8.Backpack.ClientSide:Destroy();
					end;
				end;
				if v8.Character and v8.Character:FindFirstChild("Head") and (v8.Character:FindFirstChild("HumanoidRootPart") and player.Character) and player.Character:FindFirstChild("HumanoidRootPart") and v8.Character.Head:FindFirstChild("Tag") then
					if (v8.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude <= 300 then
						v8.Character.Head.Tag.Enabled = true;
						return;
					end;
					v8.Character.Head.Tag.Enabled = false;
				end;
			end);
		end;	
	end;
end);
player.Chatted:connect(function(p1)
	if string.lower(p1) == "/e report" and script.Parent.ReportFrame.Visible == false then
		script.Parent.ReportFrame.Visible = true;
		script.Parent.ReportFrame.Reason.Text = "Reason for report";
		script.Parent.ReportFrame.PickPlayer.Text = "Pick A Player";
		script.Parent.ReportFrame.ScrollingFrame.Visible = false;
	end;
end);
local l__ReportFrame__9 = script.Parent.ReportFrame;
l__ReportFrame__9.Cancel.MouseButton1Down:connect(function()
	l__ReportFrame__9.Visible = false;
end);
l__ReportFrame__9.Confirm.MouseButton1Down:connect(function()
	if string.lower(l__ReportFrame__9.PickPlayer.Text) ~= "pick a player" and string.lower(l__ReportFrame__9.Reason.Text) ~= "reason for report" and l__ReportFrame__9.Confirm.Text ~= "Sending Report" and l__ReportFrame__9.Confirm.Text ~= "Sent" and l__ReportFrame__9.Confirm.Text ~= "Your sending reports too fast" and l__ReportFrame__9.Confirm.Text ~= "Sent" then
		l__ReportFrame__9.Confirm.Text = "Waiting...";
		if Function:InvokeServer("Report", l__ReportFrame__9.PickPlayer.Text, l__ReportFrame__9.Reason.Text) == true then
			l__ReportFrame__9.Confirm.Text = "Sent";
			wait(0.5);
		else
			l__ReportFrame__9.Confirm.Text = "Your sending reports too fast";
			wait(1.5);
		end;
		l__ReportFrame__9.Confirm.Text = "Confirm";
		l__ReportFrame__9.Visible = false;
	end;
end);
l__ReportFrame__9.PickPlayer.MouseButton1Down:connect(function()
	local v10 = 0;
	l__ReportFrame__9.ScrollingFrame.Visible = true;
	for v11, v12 in pairs(l__ReportFrame__9.ScrollingFrame:GetChildren()) do
		if v12.Name ~= "Example" then
			v12:Destroy();
		end;
	end;
	for v13, v14 in pairs(game.Players:GetChildren()) do
		local v15 = l__ReportFrame__9.ScrollingFrame.Example:Clone();
		v15.Parent = l__ReportFrame__9.ScrollingFrame;
		v15.Name = "Player";
		v15.Text = v14.Name;
		v15.image.ImageLabel.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?x=200&y=200&username=" .. v14.Name;
		v15.Position = UDim2.new(0, 0, 0, v10);
		v15.Visible = true;
		v10 = v10 + 60;
		spawn(function()
			v15.MouseButton1Down:connect(function()
				l__ReportFrame__9.ScrollingFrame.Visible = false;
				l__ReportFrame__9.PickPlayer.Text = v14.Name;
			end);
		end);
	end;
end);
Event.OnClientEvent:connect(function(p2, p3, p4)
	if p2 == "Purge" then
		script.Parent:Destroy();
		script.Disabled = true;
	end;
	if p2 == "ClearInventory" and player.PlayerGui:FindFirstChild("ItemControlGui") then
		for v16, v17 in pairs(player.PlayerGui.ItemControlGui.HotbarFrame:GetChildren()) do
			if v17:FindFirstChild("Item") then
				v17.Item.Image = "";
				v17.Item.Count.Text = "";
			end;
		end;
	end;
	if p2 == "Shutdown" then
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = p3, 
			Font = Enum.Font.Cartoon, 
			Color = Color3.fromRGB(255, 255, 0), 
			FontSize = Enum.FontSize.Size96
		});
	end;
	if p2 == "SendMessage" then
		script.Parent.Message.Visible = true;
		if p4.Parent then
			script.Parent.Message.Message.Text = "Message from " .. p4.Name;
		else
			script.Parent.Message.Message.Text = "[SERVER MESSAGE]";
		end;
		for v18 = 1, #p3 do
			script.Parent.Message.Text = p3:sub(1, v18);
			wait();
		end;
		wait(5);
		script.Parent.Message.Visible = false;
	end;
end);
mouse.KeyDown:connect(function(p5)
	if p5 == "x" then
		script.Parent.Shop.Visible = false;
	end;
end);
function Stackable(p6)
	if game.ReplicatedStorage.ItemData:FindFirstChild(p6) then

	else
		return false;
	end;
	if game.ReplicatedStorage.ItemData[p6]:FindFirstChild("Stackable") then
		return true;
	end;
	return false;
end;
game:GetService("RunService").RenderStepped:connect(function()
	local v19 = nil;
	for v20, v21 in pairs(workspace:GetChildren()) do
		if v21.Name == "Terminal" then
			v21:WaitForChild("Main");
			v21.Main.ClickDetector.MouseClick:connect(function()
				if script.Parent.Shop.Visible == false then
					script.Parent.Shop.Visible = true;
					for v22, v23 in pairs(script.Parent.Shop.ScrollingFrame:GetChildren()) do
						if v23.Name ~= "Example" and v23.ClassName == "Frame" then
							v23:Destroy();
						end;
					end;
					for v24, v25 in pairs(v21.Items:GetChildren()) do
						local v26 = script.Parent.Shop.ScrollingFrame.Example:Clone();
						v26.Parent = script.Parent.Shop.ScrollingFrame;
						v26.Name = "Frame";
						v26.Quantity.Text = v25.Amount.Value .. " Remaining";
						v26.Title.Text = v25.Name;
						v26.Visible = true;
						spawn(function()
							while true do
								wait(0.2);
								pcall(function()
									if (player.Character.HumanoidRootPart.Position - v21.Main.Position).magnitude >= 15 then
										script.Parent.Shop.Visible = false;
									end;
								end);
								if not v26 then
									break;
								end;
								if not v26.Parent then
									break;
								end;
								v26.Quantity.Text = v25.Amount.Value .. " Remaining";
								if script.Parent.Shop.Visible == false then
									break;
								end;							
							end;
						end);
						v26.Purchase.MouseButton1Down:connect(function()
							if v26.Purchase.Text ~= "You cannot buy more than 2" and v26.Purchase.Text ~= "Purchased" then
								if tonumber(v26.Amount.Text) > 2 then
									v26.Purchase.Text = "You cannot buy more than 2";
									wait(1);
									v26.Purchase.Text = "Purchase";
									return;
								end;
								if Stackable(v25.Name) == false then
									if tonumber(v26.Amount.Text) and v25.Amount.Value - tonumber(v26.Amount.Text) >= 0 then
										v26.Purchase.Text = "Purchased";
										Event:FireServer("PurchaseItems", v21, v25.Name, tonumber(v26.Amount.Text), 1);
										wait(1);
										v26.Purchase.Text = "Purchase";
										return;
									end;
								elseif tonumber(v26.Stack.Text) and tonumber(v26.Stack.Text) >= 1 and v25.Amount.Value - tonumber(v26.Amount.Text) * tonumber(v26.Stack.Text) >= 0 then
									v26.Purchase.Text = "Purchased";
									Event:FireServer("PurchaseItems", v21, v25.Name, tonumber(v26.Amount.Text), tonumber(v26.Stack.Text));
									wait(1);
									v26.Purchase.Text = "Purchase";
								end;
							end;
						end);
					end;
				end;
			end);
		end;
	end;
	if workspace:FindFirstChild("CapturePoint") then
		script.Parent.KingOfTheHill.Visible = true;
		local l__CapturePoint__27 = workspace.CapturePoint;
		v19 = script.Parent.KingOfTheHill;
		v19.Red.Text = l__CapturePoint__27.RedDisplay.Value;
		v19.Blue.Text = l__CapturePoint__27.BlueDisplay.Value;
		if l__CapturePoint__27.Contested.Value == true then
			v19.Display.Text = "Contested";
		else
			v19.Display.Text = "";
		end;
		if l__CapturePoint__27.Capturing.Value == true then
			v19.BackgroundFrame.Show.Size = UDim2.new(l__CapturePoint__27.Capturing.Percent.Value, 0, 1, 0);
			if l__CapturePoint__27.Capturing.TeamColor.Value == "Blue" then
				v19.BackgroundFrame.Show.ImageColor3 = Color3.fromRGB(0, 85, 255);
				return;
			elseif l__CapturePoint__27.Capturing.TeamColor.Value == "Red" then
				v19.BackgroundFrame.Show.ImageColor3 = Color3.fromRGB(230, 0, 0);
				return;
			else
				return;
			end;
		end;
	else
		script.Parent.KingOfTheHill.Visible = false;
		return;
	end;
	v19.BackgroundFrame.Show.Size = UDim2.new(0, 0, 1, 0);
end);
