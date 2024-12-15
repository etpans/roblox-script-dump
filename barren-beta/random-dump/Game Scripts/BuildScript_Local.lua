-- Decompiled with the Synapse X Luau decompiler.

local l__LocalPlayer__1 = game.Players.LocalPlayer;
local l__mouse__2 = l__LocalPlayer__1:GetMouse();
local l__PlayerGui__3 = l__LocalPlayer__1:WaitForChild("PlayerGui");
local l__Value__4 = script.Parent:WaitForChild("EquipTime").Value;
local u1 = nil;
local u2 = l__LocalPlayer__1.Character or l__LocalPlayer__1.CharacterAdded:wait();
local u3 = nil;
delay(0.5, function()
	if script:FindFirstChild("EquipAnimation") then
		u1 = u2:WaitForChild("Humanoid"):LoadAnimation(script:FindFirstChild("EquipAnimation"));
	end;
	if script:FindFirstChild("IdleAnimation") then
		u3 = u2:WaitForChild("Humanoid"):LoadAnimation(script:FindFirstChild("IdleAnimation"));
	end;
end);
local u4 = false;
local u5 = false;
local u6 = false;
local u7 = 0;
script.Parent.Activated:connect(function()
	if u4 and not u5 and not u6 and u2:FindFirstChild("Humanoid") and u2.Humanoid.Health > 0 then
		u6 = true;
		game.ReplicatedStorage.Remotes:FindFirstChild("Build"):InvokeServer(u7, game.Workspace.CurrentCamera.CFrame.lookVector);
		u6 = false;
	end;
end);
local u8 = nil;
script.Parent.Equipped:connect(function()
	u4 = true;
	u5 = true;
	local v5 = game.ReplicatedStorage.Structures:FindFirstChild(script.Parent.Structure.Value);
	if v5 then
		local v6 = false;
		local v7, v8, v9, v10 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(u2:WaitForChild("HumanoidRootPart").Position, game.Workspace.CurrentCamera.CFrame.lookVector * 15), { game.Workspace.Terrain, game.Workspace.Structures });
		for v11, v12 in pairs(game.Workspace.CurrentCamera:GetChildren()) do
			if v12:FindFirstChild("BaseCFrame") then
				v12:Destroy();
			end;
		end;
		if v5:FindFirstChild("WaterStructure") then
			v6 = true;
		end;
		u8 = v5:Clone();
		local v13 = true;
		for v14, v15 in pairs(game.Workspace.NoBuild:GetChildren()) do
			if v15:IsA("BasePart") and (v15.Position - v8).Magnitude <= v15:FindFirstChild("Mesh").Scale.X / 2 then
				v13 = false;
				break;
			end;
		end;
		for v16, v17 in pairs(u8:GetDescendants()) do
			if v17:IsA("BasePart") then
				v17.CanCollide = false;
				if v17.Transparency ~= 1 then
					v17.Transparency = 0.2;
					v17.Material = Enum.Material.Glass;
					if v7 == game.Workspace.Terrain and v10 then
						if v6 or v10 == Enum.Material.Water then
							if v6 and v10 == Enum.Material.Water and v10 ~= Enum.Material.Air and not u5 and v13 then
								v17.Color = Color3.fromRGB(193, 190, 66);
							else
								v17.Color = Color3.fromRGB(255, 89, 89);
							end;
						elseif v10 ~= Enum.Material.Air and not u5 and v13 then
							v17.Color = Color3.fromRGB(193, 190, 66);
						else
							v17.Color = Color3.fromRGB(255, 89, 89);
						end;
					else
						v17.Color = Color3.fromRGB(255, 89, 89);
					end;
				end;
			end;
		end;
		u8:SetPrimaryPartCFrame(CFrame.new(u2:WaitForChild("HumanoidRootPart").CFrame.p + Vector3.new(0, u8.PrimaryPart.Size.Y * 0.45, 0), (Vector3.new(u2:WaitForChild("HumanoidRootPart").CFrame.p.X + u2:WaitForChild("HumanoidRootPart").CFrame.lookVector.X, u2:WaitForChild("HumanoidRootPart").CFrame.p.Y + u8.PrimaryPart.Size.Y * 0.45, u2:WaitForChild("HumanoidRootPart").CFrame.p.Z + u2:WaitForChild("HumanoidRootPart").CFrame.lookVector.Z))) * CFrame.Angles(0, math.rad(45 * u7), 0) - u2:WaitForChild("HumanoidRootPart").Position + v8);
		u8.Parent = game.Workspace.CurrentCamera;
		spawn(function()
			while u8 and u8.Parent ~= nil do
				local v18, v19, v20, v21 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(u2:WaitForChild("HumanoidRootPart").Position, game.Workspace.CurrentCamera.CFrame.lookVector * 15), { game.Workspace.Terrain, game.Workspace.Structures });
				local v22 = true;
				for v23, v24 in pairs(game.Workspace.NoBuild:GetChildren()) do
					if v24:IsA("BasePart") and (v24.Position - v19).Magnitude <= v24:FindFirstChild("Mesh").Scale.X / 2 then
						v22 = false;
						break;
					end;
				end;
				if v5:FindFirstChild("Bakuhatsu") == nil then
					for v25, v26 in pairs(game.Teams:GetChildren()) do
						if game.Workspace.Structures:FindFirstChild(v26.Name .. " Flag") and ((game.Workspace.Structures:FindFirstChild(v26.Name .. " Flag").PrimaryPart.Position - v19).Magnitude <= 200 and v26.TeamColor ~= l__LocalPlayer__1.TeamColor) then
							v22 = false;
							break;
						end;
					end;
				end;
				if v5.Name == "Sieving Machine" and game.VIPServerId ~= "" then
					v22 = false;
				end;
				if v5.Name == "Clan Flag" then
					for v27, v28 in pairs(game.Workspace.NoBuild:GetChildren()) do
						if v28:IsA("BasePart") and (v28.Position - v19).Magnitude <= v28:FindFirstChild("Mesh").Scale.X / 2 + 50 then
							v22 = false;
							break;
						end;
					end;
					for v29, v30 in pairs(game.Workspace.SpawnLocations:GetChildren()) do
						if v30:IsA("BasePart") and (v30.Position - v19).Magnitude <= 200 then
							v22 = false;
							break;
						end;
					end;
					local v31 = false;
					for v32, v33 in pairs(game.Teams:GetChildren()) do
						if game.Workspace.Clans:FindFirstChild(v33.Name) and (game.Workspace.Clans:FindFirstChild(v33.Name).Value == l__LocalPlayer__1 and l__LocalPlayer__1.TeamColor == v33.TeamColor) then
							v31 = true;
							break;
						end;
					end;
					if not v31 then
						v22 = false;
					else
						for v34, v35 in pairs(game.Teams:GetChildren()) do
							if game.Workspace.Structures:FindFirstChild(v35.Name .. " Flag") then
								if v35.TeamColor == l__LocalPlayer__1.TeamColor then
									v22 = false;
									break;
								end;
								if (game.Workspace.Structures:FindFirstChild(v35.Name .. " Flag").PrimaryPart.Position - v19).Magnitude <= 400 and v35.TeamColor ~= l__LocalPlayer__1.TeamColor then
									v22 = false;
									break;
								end;
							end;
						end;
					end;
				end;
				for v36, v37 in pairs(u8:GetDescendants()) do
					if v37:IsA("BasePart") and v37.Transparency ~= 1 then
						v37.CanCollide = false;
						if v18 == game.Workspace.Terrain and v21 then
							if v6 or v21 == Enum.Material.Water then
								if v6 and v21 == Enum.Material.Water and v21 ~= Enum.Material.Air and not u5 and v22 then
									v37.Color = Color3.fromRGB(193, 190, 66);
								else
									v37.Color = Color3.fromRGB(255, 89, 89);
								end;
							elseif v21 ~= Enum.Material.Air and not u5 and v22 then
								v37.Color = Color3.fromRGB(193, 190, 66);
							else
								v37.Color = Color3.fromRGB(255, 89, 89);
							end;
						else
							v37.Color = Color3.fromRGB(255, 89, 89);
						end;
					end;
				end;
				u8:SetPrimaryPartCFrame(CFrame.new(u2:WaitForChild("HumanoidRootPart").CFrame.p + Vector3.new(0, u8.PrimaryPart.Size.Y * 0.45, 0), (Vector3.new(u2:WaitForChild("HumanoidRootPart").CFrame.p.X + u2:WaitForChild("HumanoidRootPart").CFrame.lookVector.X, u2:WaitForChild("HumanoidRootPart").CFrame.p.Y + u8.PrimaryPart.Size.Y * 0.45, u2:WaitForChild("HumanoidRootPart").CFrame.p.Z + u2:WaitForChild("HumanoidRootPart").CFrame.lookVector.Z))) * CFrame.Angles(0, math.rad(45 * u7), 0) - u2:WaitForChild("HumanoidRootPart").Position + v19);
				game:GetService("RunService").RenderStepped:wait();			
			end;
		end);
	end;
	if u1 then
		u1:Play();
		u1:AdjustSpeed(1 / l__Value__4);
	end;
	delay(l__Value__4 - 0.05, function()
		if u5 and u4 then
			u5 = false;
			if u3 then
				u3:Play(nil, nil, 1);
			end;
		end;
	end);
end);
script.Parent.Unequipped:connect(function()
	u5 = false;
	u4 = false;
	if u1 then
		u1:Stop();
	end;
	if u3 then
		u3:Stop();
	end;
	while u8 do
		u8:Destroy();
		if u8 then
			u8 = nil;
		end;
		game:GetService("RunService").RenderStepped:wait();	
	end;
end);
game:GetService("UserInputService").InputBegan:connect(function(p1, p2)
	if p2 or game:GetService("UserInputService"):GetFocusedTextBox() ~= nil then
		return;
	end;
	if p1.KeyCode == Enum.KeyCode.R then
		u7 = u7 + 1;
		if u7 >= 8 then
			u7 = 0;
		end;
	end;
end);
