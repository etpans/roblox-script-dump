-- Decompiled with the Synapse X Luau decompiler.

local l__VisualizeBullet__1 = game.ReplicatedStorage:WaitForChild("VisualizeBullet");
function VisualizeBullet(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
	if p1 ~= game.Players.LocalPlayer then
		if p2 then
			local v2 = (p2.CFrame * CFrame.new(p3.X, p3.Y, p3.Z)).p;
			local v3 = (v2 - p4).magnitude / 2;
			if p12 then
				v2 = p3;
			end;
			if p12 ~= nil then
				if p12 == false then
					if game.Players.LocalPlayer.Character then
						if game.Players.LocalPlayer.Character:FindFirstChild("Head") then
							local v4 = Ray.new(v2, CFrame.new(v2, p4).lookVector * v3);
							local v5 = p4 - v2;
							local v6 = v2 + v5 * ((game.Players.LocalPlayer.Character:WaitForChild("Head").Position - v2):Dot(v5) / (math.pow(v5.X, 2) + math.pow(v5.Y, 2) + math.pow(v5.Z, 2)));
							if p1 then
								if p1.Team ~= game.Players.LocalPlayer.Team then
									if 10 < (v6 - v2).Magnitude then
										if p1 ~= game.Players.LocalPlayer then
											if (v6 - game.Players.LocalPlayer.Character:WaitForChild("Head").Position).Magnitude <= 5 then
												game.ReplicatedStorage.Remotes.SelfCombat:FireServer();
											end;
										end;
									end;
								end;
							end;
							if 0.5 < (v6 - game.Players.LocalPlayer.Character:WaitForChild("Head").Position).Magnitude then
								if (v6 - game.Players.LocalPlayer.Character:WaitForChild("Head").Position).Magnitude < 35 then
									if 10 < (v2 - game.Players.LocalPlayer.Character:WaitForChild("Head").Position).Magnitude then
										local v7 = Instance.new("Part");
										v7.Name = "SOUND";
										v7.Size = Vector3.new(0.05, 0.05, 0.05);
										v7.Transparency = 1;
										v7.Anchored = true;
										v7.CanCollide = false;
										v7.TopSurface = Enum.SurfaceType.SmoothNoOutlines;
										v7.BottomSurface = Enum.SurfaceType.SmoothNoOutlines;
										v7.Position = v6 + Vector3.new(0, 3, 0);
										v7.Parent = game.Workspace.CurrentCamera;
										local v8 = Instance.new("Sound", v7);
										v8.SoundId = "rbxassetid://1042027705";
										v8.MaxDistance = 100;
										v8.Volume = p13 and 1;
										v8:Play();
										local v9 = math.random(1, 6);
										if v9 == 1 then
											v8.TimePosition = 0.5;
											delay(0.5, function()
												v7:Destroy();
											end);
										elseif v9 == 2 then
											v8.TimePosition = 1;
											delay(1, function()
												v7:Destroy();
											end);
										elseif v9 == 3 then
											v8.TimePosition = 2;
											delay(0.6, function()
												v7:Destroy();
											end);
										elseif v9 == 4 then
											v8.TimePosition = 2.75;
											delay(1, function()
												v7:Destroy();
											end);
										elseif v9 == 5 then
											v8.TimePosition = 4.6;
											delay(0.8, function()
												v7:Destroy();
											end);
										elseif v9 == 6 then
											v8.TimePosition = 5.5;
											delay(0.5, function()
												v7:Destroy();
											end);
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			elseif game.Players.LocalPlayer.Character then
				if game.Players.LocalPlayer.Character:FindFirstChild("Head") then
					v4 = Ray.new(v2, CFrame.new(v2, p4).lookVector * v3);
					v5 = p4 - v2;
					v6 = v2 + v5 * ((game.Players.LocalPlayer.Character:WaitForChild("Head").Position - v2):Dot(v5) / (math.pow(v5.X, 2) + math.pow(v5.Y, 2) + math.pow(v5.Z, 2)));
					if p1 then
						if p1.Team ~= game.Players.LocalPlayer.Team then
							if 10 < (v6 - v2).Magnitude then
								if p1 ~= game.Players.LocalPlayer then
									if (v6 - game.Players.LocalPlayer.Character:WaitForChild("Head").Position).Magnitude <= 5 then
										game.ReplicatedStorage.Remotes.SelfCombat:FireServer();
									end;
								end;
							end;
						end;
					end;
					if 0.5 < (v6 - game.Players.LocalPlayer.Character:WaitForChild("Head").Position).Magnitude then
						if (v6 - game.Players.LocalPlayer.Character:WaitForChild("Head").Position).Magnitude < 35 then
							if 10 < (v2 - game.Players.LocalPlayer.Character:WaitForChild("Head").Position).Magnitude then
								v7 = Instance.new("Part");
								v7.Name = "SOUND";
								v7.Size = Vector3.new(0.05, 0.05, 0.05);
								v7.Transparency = 1;
								v7.Anchored = true;
								v7.CanCollide = false;
								v7.TopSurface = Enum.SurfaceType.SmoothNoOutlines;
								v7.BottomSurface = Enum.SurfaceType.SmoothNoOutlines;
								v7.Position = v6 + Vector3.new(0, 3, 0);
								v7.Parent = game.Workspace.CurrentCamera;
								v8 = Instance.new("Sound", v7);
								v8.SoundId = "rbxassetid://1042027705";
								v8.MaxDistance = 100;
								v8.Volume = p13 and 1;
								v8:Play();
								v9 = math.random(1, 6);
								if v9 == 1 then
									v8.TimePosition = 0.5;
									delay(0.5, function()
										v7:Destroy();
									end);
								elseif v9 == 2 then
									v8.TimePosition = 1;
									delay(1, function()
										v7:Destroy();
									end);
								elseif v9 == 3 then
									v8.TimePosition = 2;
									delay(0.6, function()
										v7:Destroy();
									end);
								elseif v9 == 4 then
									v8.TimePosition = 2.75;
									delay(1, function()
										v7:Destroy();
									end);
								elseif v9 == 5 then
									v8.TimePosition = 4.6;
									delay(0.8, function()
										v7:Destroy();
									end);
								elseif v9 == 6 then
									v8.TimePosition = 5.5;
									delay(0.5, function()
										v7:Destroy();
									end);
								end;
							end;
						end;
					end;
				end;
			end;
			if p12 ~= nil then
				if p12 == false then
					local v10 = Instance.new("Part");
					v10.Name = "Bullet";
					v10.Size = Vector3.new(0.01, 0.01, 0.01);
					v10.Transparency = 1;
					v10.Anchored = false;
					v10.CanCollide = false;
					v10.TopSurface = Enum.SurfaceType.SmoothNoOutlines;
					v10.BottomSurface = Enum.SurfaceType.SmoothNoOutlines;
					local v11 = p5:Clone();
					v11.Parent = v10;
					local v12 = Instance.new("Weld", v10);
					v12.Part0 = p2;
					v12.Part1 = v10;
					v12.C0 = CFrame.new(p3.X, p3.Y, p3.Z);
					v10.Position = v2;
					v10.Parent = Workspace.CurrentCamera;
					Spawn(function()
						v11:Emit(1);
					end);
					game.Debris:AddItem(v10, 10);
				end;
			else
				v10 = Instance.new("Part");
				v10.Name = "Bullet";
				v10.Size = Vector3.new(0.01, 0.01, 0.01);
				v10.Transparency = 1;
				v10.Anchored = false;
				v10.CanCollide = false;
				v10.TopSurface = Enum.SurfaceType.SmoothNoOutlines;
				v10.BottomSurface = Enum.SurfaceType.SmoothNoOutlines;
				v11 = p5:Clone();
				v11.Parent = v10;
				v12 = Instance.new("Weld", v10);
				v12.Part0 = p2;
				v12.Part1 = v10;
				v12.C0 = CFrame.new(p3.X, p3.Y, p3.Z);
				v10.Position = v2;
				v10.Parent = Workspace.CurrentCamera;
				Spawn(function()
					v11:Emit(1);
				end);
				game.Debris:AddItem(v10, 10);
			end;
			local v13 = Instance.new("Part");
			v13.Name = "Bullet";
			v13.Size = Vector3.new(0.01, 0.01, 0.01);
			v13.Transparency = 1;
			v13.Anchored = true;
			v13.CanCollide = false;
			v13.TopSurface = Enum.SurfaceType.SmoothNoOutlines;
			v13.BottomSurface = Enum.SurfaceType.SmoothNoOutlines;
			if p12 ~= nil then
				if p12 == false then
					local u1 = p6:Clone();
					u1.Parent = v13;
					Spawn(function()
						u1:Emit(2);
					end);
				end;
			else
				u1 = p6:Clone();
				u1.Parent = v13;
				Spawn(function()
					u1:Emit(2);
				end);
			end;
			if p7 then
				local u2 = Instance.new("Sound", v13);
				u2.SoundId = "rbxassetid://" .. p7;
				u2.MaxDistance = 100;
				u2.Volume = 1;
				if p7 == 119887034 then
					u2.TimePosition = 0.3;
				end;
				Spawn(function()
					u2:Play();
				end);
			end;
			v13.Position = p4;
			v13.Parent = Workspace.CurrentCamera;
			game.Debris:AddItem(v13, 10);
			if p8[1] then
				if p10 then
					local v14 = Instance.new("Explosion");
					v14.BlastRadius = p8[2];
					v14.BlastPressure = 0;
					v14.Position = p4;
					v14.Parent = Workspace.CurrentCamera;
				end;
			end;
			if p11 then
				local v15 = Instance.new("Part");
				v15.Name = "Bullet";
				v15.Size = Vector3.new(0.2, 0.2, 0.2);
				v15.BrickColor = p9[3];
				v15.Transparency = p9[4];
				v15.Material = p9[5];
				v15.Anchored = true;
				v15.CanCollide = false;
				v15.TopSurface = Enum.SurfaceType.SmoothNoOutlines;
				v15.BottomSurface = Enum.SurfaceType.SmoothNoOutlines;
				v15.Material = Enum.Material.Neon;
				local v16 = Instance.new("SpecialMesh", v15);
				v16.MeshType = Enum.MeshType.Sphere;
				v16.Scale = p9[2] * 5;
				v16.Offset = Vector3.new(0, 0, -v16.Scale.Z / 10);
				v15.CFrame = CFrame.new(v2, p4);
				v15.Parent = Workspace.CurrentCamera;
				game.Debris:AddItem(v15, 10);
				if p9[1] ~= math.huge then
					local v17 = p9[1];
					local v18 = 0 - v17;
					while true do
						if v18 ~= 0 then
							v15.CFrame = v15.CFrame * CFrame.new(0, 0, -p9[1]);
						end;
						if (v15.Position - p4).magnitude < p9[2].Z then
							v16.Scale = Vector3.new(p9[2].X, p9[2].Y, (v15.Position - p4).magnitude) * 5;
							v16.Offset = Vector3.new(0, 0, -v16.Scale.Z / 10);
						end;
						game:GetService("RunService").Stepped:wait();
						if 0 <= v17 then
							if v18 < v3 then

							else
								break;
							end;
						elseif v3 < v18 then

						else
							break;
						end;
						v18 = v18 + v17;					
					end;
				else
					v16.Scale = Vector3.new(p9[2].X, p9[2].Y, (v15.Position - p4).magnitude) * 5;
					v16.Offset = Vector3.new(0, 0, -v16.Scale.Z / 10);
					local v19 = game:GetService("RunService").Heartbeat:wait();
					while true do
						if v15.Transparency < 1 then

						else
							break;
						end;
						v15.Transparency = v15.Transparency + v19 / p9[6];
						v19 = game:GetService("RunService").Heartbeat:wait();					
					end;
				end;
				if v15 then
					v15:Destroy();
				end;
			end;
		end;
	end;
end;
script:WaitForChild("Visualize").Event:connect(VisualizeBullet);
l__VisualizeBullet__1.OnClientEvent:connect(VisualizeBullet);