-- Decompiled with the Synapse X Luau decompiler.

wait();
local l__LocalPlayer__1 = game.Players.LocalPlayer;
local v2 = l__LocalPlayer__1.Character or l__LocalPlayer__1.CharacterAdded:wait();
local l__mouse__3 = l__LocalPlayer__1:GetMouse();
local l__PlayerGui__4 = l__LocalPlayer__1:WaitForChild("PlayerGui");
local l__Value__5 = script.Parent:WaitForChild("EquipTime").Value;
local v6 = nil;
local v7 = nil;
local l__Parent__8 = script.Parent;
if script:FindFirstChild("EquipAnimation") then
	v6 = v2:WaitForChild("Humanoid"):LoadAnimation(script:FindFirstChild("EquipAnimation"));
end;
if script:FindFirstChild("IdleAnimation") then
	v7 = v2:WaitForChild("Humanoid"):LoadAnimation(script:FindFirstChild("IdleAnimation"));
end;
local u1 = false;
local u2 = false;
local u3 = false;
local u4 = l__Parent__8:FindFirstChild("Range") and l__Parent__8.Range.Value or 6;
script.Parent.Activated:connect(function()
	if u1 and not u2 and not u3 and v2:FindFirstChild("Humanoid") and v2.Humanoid.Health > 0 then
		u3 = true;
		while u1 and u3 and v2:FindFirstChild("Humanoid") do
			if not (v2.Humanoid.Health > 0) then
				break;
			end;
			if v2.Humanoid:FindFirstChild("MeleeSwinging") == nil then
				if (v2:FindFirstChild("HumanoidRootPart").Position - game.Workspace.NoBuild.MilitaryOutpost.Position).Magnitude <= game.Workspace.NoBuild.MilitaryOutpost.Mesh.Scale.X / 4 then
					game.ReplicatedStorage.Remotes.Noto:FireServer();
				end;
				local v9 = Instance.new("BoolValue");
				v9.Name = "MeleeSwinging";
				v9.Parent = v2.Humanoid;
				game.Debris:AddItem(v9, l__Parent__8.SwingTime.Value * 0.9);
				local v10 = v2:WaitForChild("Humanoid"):LoadAnimation(l__Parent__8:FindFirstChild("SwingAnimation"));
				v10:Play();
				v10:AdjustSpeed(1 / l__Parent__8.SwingAnimTime.Value);
				if l__Parent__8:FindFirstChild("Handle") and l__Parent__8.Handle:FindFirstChild("SwingWoosh") then
					l__Parent__8.Handle:FindFirstChild("SwingWoosh"):Play();
				end;
				wait(l__Parent__8.SwingTime.Value * 0.4);
				if l__Parent__8:FindFirstChild("Model") and l__Parent__8.Model:FindFirstChild("Hitbox") then
					if l__Parent__8:FindFirstChild("Damage") and not l__Parent__8.Damage.Value then

					end;
					if l__Parent__8:FindFirstChild("DamageType") and not l__Parent__8.DamageType.Value then

					end;
					local v11 = { game.Workspace.Harvestables, game.Workspace.Structures, game.Workspace.ItemFolder };
					for v12, v13 in pairs(game.Workspace:GetChildren()) do
						if v13:FindFirstChild("Humanoid") and v13.Name ~= l__LocalPlayer__1.Name then
							table.insert(v11, v13);
						end;
					end;
					local l__CFrame__14 = game.Workspace.CurrentCamera.CFrame;
					local v15, v16 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(v2:WaitForChild("UpperTorso").Position, l__CFrame__14.lookVector * u4), v11);
					if v15 == nil then
						local v17, v18 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(v2:WaitForChild("Head").Position, l__CFrame__14.lookVector * u4), v11);
						v15 = v17;
					end;
					if v15 == nil then
						local v19, v20 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(v2:WaitForChild("RightUpperArm").Position, l__CFrame__14.lookVector * u4), v11);
						v15 = v19;
					end;
					while v15 == nil and math.ceil(l__Parent__8.SwingTime.Value * 8) > 0 do
						local l__CFrame__21 = game.Workspace.CurrentCamera.CFrame;
						local v22, v23 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(v2:WaitForChild("UpperTorso").Position, l__CFrame__21.lookVector * u4), v11);
						local v24 = v22;
						if v24 == nil then
							local v25, v26 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(v2:WaitForChild("Head").Position, l__CFrame__21.lookVector * u4), v11);
							v24 = v25;
						end;
						if v15 == nil then
							local v27, v28 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(v2:WaitForChild("RightUpperArm").Position, l__CFrame__21.lookVector * u4), v11);
							v15 = v27;
						end;
						wait(0.05);					
					end;
					if v15 then
						print(v15:GetFullName());
						game.ReplicatedStorage.Remotes.MeleeAttackEvent:FireServer(v15);
					end;
				end;
			end;
			wait(0.045);		
		end;
	end;
end);
script.Parent.Deactivated:connect(function()
	u3 = false;
end);
script.Parent.Equipped:connect(function()
	u1 = true;
	u2 = true;
	u3 = false;
	if v6 then
		v6:Play();
		v6:AdjustSpeed(1 / l__Value__5);
	end;
	delay(l__Value__5 - 0.05, function()
		if u2 and u1 then
			u2 = false;
			if v7 then
				v7:Play(nil, nil, 1);
			end;
		end;
	end);
end);
script.Parent.Unequipped:connect(function()
	u2 = false;
	u1 = false;
	u3 = false;
	if v6 then
		v6:Stop();
	end;
	if v7 then
		v7:Stop();
	end;
end);