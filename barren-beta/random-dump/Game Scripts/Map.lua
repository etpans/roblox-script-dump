-- Decompiled with the Synapse X Luau decompiler.

local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
local l__LocalPlayer__2 = game.Players.LocalPlayer;
local l__HumanoidRootPart__3 = (l__LocalPlayer__2.Character or l__LocalPlayer__2.CharacterAdded:wait()):WaitForChild("HumanoidRootPart");
local l__mouse__4 = l__LocalPlayer__2:GetMouse();
local l__UserInputService__5 = game:GetService("UserInputService");
local l__PlayerGui__1 = l__LocalPlayer__2:WaitForChild("PlayerGui");
local u2 = 1.5;
l__UserInputService__5.InputBegan:connect(function(p1, p2)
	if l__UserInputService__5:GetFocusedTextBox() == nil then
		if p1.KeyCode == Enum.KeyCode.M then
			l__PlayerGui__1.Map.Enabled = not l__PlayerGui__1.Map.Enabled;
			return;
		end;
		if p1.KeyCode == Enum.KeyCode.I then
			if u2 < 3 then
				u2 = u2 + 0.25;
			end;
			print(u2);
			return;
		end;
		if p1.KeyCode == Enum.KeyCode.O then
			if u2 > 0.75 then
				u2 = u2 - 0.25;
			end;
			print(u2);
		end;
	end;
end);
local u3 = {};
local u4 = {};
local function v6()
	u3 = {};
	u4 = {};
	local v7, v8, v9 = pairs(game.Players:GetChildren());
	while true do
		local v10, v11 = v7(v8, v9);
		if not v10 then
			break;
		end;
		if l__LocalPlayer__2.Team ~= nil and v11.Team == l__LocalPlayer__2.Team and v11 ~= l__LocalPlayer__2 then
			table.insert(u3, v11);
		end;
		if v11 ~= l__LocalPlayer__2 and v11.stats.other.Notoriety.Value >= 100 then
			table.insert(u3, v11);
			table.insert(u4, v11);
		end;	
	end;
end;
v6();
spawn(function()
	while wait(5) do
		v6();	
	end;
end);
local u5 = 0;
game:GetService("RunService").RenderStepped:connect(function()
	if l__PlayerGui__1.Map.Enabled then
		local v12 = nil;
		local v13 = l__HumanoidRootPart__3.Position - workspace.MAPCENTER.Position;
		l__PlayerGui__1.Map.Main.ImageLabel.Size = UDim2.new(u2, 0, u2, 0);
		l__PlayerGui__1.Map.Main.ImageLabel.Position = UDim2.new(u2 / 1.5 * (0.5 + v13.Z / script.OffsetX.Value), 0, u2 / 1.5 * (0.5 - v13.X / script.OffsetZ.Value), 0);
		local v14 = 0.8302898 + -34.3961198 / (1 + (u2 / 0.0160603) ^ 1.021892);
		l__PlayerGui__1.Map.Main.ImageLabel.AnchorPoint = Vector2.new(v14, v14);
		l__PlayerGui__1.Map.Main.ImageLabel.MeFrame.Position = UDim2.new(0.5 - v13.Z / script.OffsetX.Value / script.Edit.Value, 0, 0.5 + v13.X / script.OffsetZ.Value / script.Edit.Value, 0);
		u5 = u5 + 1;
		if u5 >= 3 then
			u5 = 0;
			local v15, v16, v17 = pairs(l__PlayerGui__1.Map.Main.ImageLabel:GetChildren());
			while true do
				local v18, v19 = v15(v16, v17);
				if not v18 then
					break;
				end;
				local v20 = true;
				for v21, v22 in pairs(u3) do
					if v22 and v22.Name == v19.Name then
						v20 = false;
					end;
				end;
				if v19.Name ~= "UIAspectRatioConstraint" and v19.Name ~= "MeFrame" and v20 then
					v19:Destroy();
				end;			
			end;
			for v23, v24 in pairs(u3) do
				if v24 then
					print(v24.Name);
					local v25 = l__PlayerGui__1.Map.Main.ImageLabel:FindFirstChild(v24.Name);
					if v25 == nil then
						v25 = l__PlayerGui__1.Map.Main.ImageLabel.MeFrame:Clone();
						v25.TextLabel.Text = v24.Name;
						v25.Name = v24.Name;
						v25.Parent = l__PlayerGui__1.Map.Main.ImageLabel;
					end;
					local l__Character__26 = v24.Character;
					if l__Character__26 and l__Character__26:FindFirstChild("HumanoidRootPart") and l__Character__26:FindFirstChild("Humanoid") and l__Character__26.Humanoid.Health > 0 then
						local v27 = nil;
						local v28 = l__Character__26.HumanoidRootPart.Position - workspace.MAPCENTER.Position;
						v25.Position = UDim2.new(0.5 - v28.Z / script.OffsetX.Value / script.Edit.Value, 0, 0.5 + v28.X / script.OffsetZ.Value / script.Edit.Value, 0);
						local l__Unit__29 = l__Character__26.HumanoidRootPart.CFrame.lookVector.Unit;
						local v30 = Vector3.new(-1, 0, 0);
						v27 = math.deg(math.acos(l__Unit__29.X * v30.X + l__Unit__29.Y * v30.Y + l__Unit__29.Z * v30.Z));
						if l__Unit__29.Z > 0 then
							v25.ImageLabel.Rotation = 360 - v27;
						else
							v25.ImageLabel.Rotation = v27;
						end;
					end;
				end;
			end;
			local v31, v32, v33 = pairs(l__PlayerGui__1.Map.Main.ImageLabel:GetChildren());
			while true do
				local v34, v35 = v31(v32, v33);
				if not v34 then
					break;
				end;
				if v35:FindFirstChild("ImageLabel") then
					v35.ImageLabel.ImageColor3 = l__LocalPlayer__2.TeamColor.Color;
					v35.TextLabel.TextColor3 = Color3.new(1, 1, 1);
					v35.TextLabel.TextStrokeColor3 = Color3.new(0, 0, 0);
				end;
				for v36, v37 in pairs(u4) do
					if v37.Name == v35.Name then
						v35.ImageLabel.ImageColor3 = Color3.fromRGB(212, 100, 100);
						v35.TextLabel.TextColor3 = Color3.new(0, 0, 0);
						v35.TextLabel.TextStrokeColor3 = Color3.new(1, 1, 1);
					end;
				end;			
			end;
		end;
		local l__Unit__38 = l__HumanoidRootPart__3.CFrame.lookVector.Unit;
		local v39 = Vector3.new(-1, 0, 0);
		v12 = math.deg(math.acos(l__Unit__38.X * v39.X + l__Unit__38.Y * v39.Y + l__Unit__38.Z * v39.Z));
		if l__Unit__38.Z > 0 then
			l__PlayerGui__1.Map.Main.ImageLabel.MeFrame.ImageLabel.Rotation = 360 - v12;
			return;
		end;
		l__PlayerGui__1.Map.Main.ImageLabel.MeFrame.ImageLabel.Rotation = v12;
	end;
end);