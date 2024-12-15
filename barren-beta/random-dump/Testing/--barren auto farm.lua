--barren auto farm
local MainModule = require(game.ReplicatedStorage.MainModule)
local Mouse = game.Players.LocalPlayer:GetMouse()
for i, v in pairs(lplr.Backpack:GetChildren()) do
    if v.Name == "Tool04" then
        for i, v in pairs(v:GetChildren()) do
            if v.Name == "Setting" then
                getgenv().Setting = v
            elseif v.Name == "GunScript_Server" then
                getgenv().Script = v
            elseif v.Name == "Handle" then
                getgenv().Handle = v
            end
        end
    end
end
local wa = game.Workspace:FindPartOnRayWithWhitelist(Workspace.CurrentCamera:ScreenPointToRay(Mouse.X, Mouse.Y, 1000), {});
local v48 = (require(Setting).Spread + 0) * 1;
local idkwhatthisis = (Handle.CFrame * CFrame.new(require(Setting).MuzzleOffset.X, require(Setting).MuzzleOffset.Y, require(Setting).MuzzleOffset.Z)).p;
local look = (CFrame.new(idkwhatthisis, wa) * CFrame.Angles(math.rad(-v48 + math.random() * (v48 * 2)), math.rad(-v48 + math.random() * (v48 * 2)), 0)).lookVector;
local whatisthis = RayCast(idkwhatthisis, look, 5000, { game.Workspace.LocalPlayer.Name, game.Workspace.Local})
local Iwanttodie = {
    X = whatisthis.X, 
    Y = whatisthis.Y, 
    Z = whatisthis.Z, 
    Damage = require(Setting).BaseDamage
    Damage = require(Setting).BaseDamage, 
    Knockback = require(Setting).Knockback, 
    Lifesteal = require(Setting).Lifesteal, 
    FlamingBullet = require(Setting).FlamingBullet, 
    HitArmor = false
}
Script.InflictTarget:FireServer(MainModule.enc(Iwanttodie))


local v8 = require(l__Parent__1:WaitForChild("Setting"));
local v45 = (l__Handle__2.CFrame * CFrame.new(v8.MuzzleOffset.X, v8.MuzzleOffset.Y, v8.MuzzleOffset.Z)).p;
local v48 = (u1 + v46) * v47;
local l__lookVector__52 = (CFrame.new(v45, v49) * CFrame.Angles(math.rad(-v48 + math.random() * (v48 * 2)), math.rad(-v48 + math.random() * (v48 * 2)), 0)).lookVector;
local v53, v54 = RayCast(v45, l__lookVector__52, 5000, { game.Workspace.LocalPlayer.Name, game.Workspace.Local });
local v21 = require(game.ReplicatedStorage.MainModule);
l__InflictTarget__12:FireServer(
v21.enc({
X = v54.X, 
Y = v54.Y, 
Z = v54.Z, 
Damage = v8.BaseDamage, 
Knockback = v8.Knockback, 
Lifesteal = v8.Lifesteal, 
FlamingBullet = v8.FlamingBullet, 
HitArmor = false}), 


l__Health__55, l__PrimaryPart__56, l__lookVector__52, v53, p8)

local l__Parent__1 = script.Parent;
local l__Handle__2 = l__Parent__1:WaitForChild("Handle");
local l__LocalPlayer__3 = game.Players.LocalPlayer;
local l__mouse__4 = l__LocalPlayer__3:GetMouse();
local v5 = Workspace:WaitForChild(l__LocalPlayer__3.Name);
local l__Humanoid__6 = v5:WaitForChild("Humanoid");
local l__VisualizeBullet__7 = game.ReplicatedStorage:WaitForChild("VisualizeBullet");
local v8 = require(l__Parent__1:WaitForChild("Setting"));
local l__GunScript_Server__9 = l__Parent__1:WaitForChild("GunScript_Server");
local l__ChangeAmmo__10 = l__GunScript_Server__9:WaitForChild("ChangeAmmo");
local l__ChangeAmmoAndClip__11 = l__GunScript_Server__9:WaitForChild("ChangeAmmoAndClip");
local l__InflictTarget__12 = l__GunScript_Server__9:WaitForChild("InflictTarget");
local l__Ammo__13 = l__GunScript_Server__9:WaitForChild("Ammo");
local l__GunGUI__14 = script:WaitForChild("GunGUI");
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = require(game.ReplicatedStorage.MainModule);
local v22 = require(game.ReplicatedStorage.Modules);
if v8.DualEnabled then
	v20 = l__Parent__1:WaitForChild("Handle2", 2);
	if v20 == nil and v8.DualEnabled then
		error("\"Dual\" setting is enabled but \"Handle2\" is missing!");
	end;
end;
local l__Value__23 = l__GunScript_Server__9:WaitForChild("Clips").Value;
local l__MaxClip__24 = v8.MaxClip;
local l__Stepped__25 = game:GetService("RunService").Stepped;
local u1 = v8.Spread;
local u2 = v8.SpreadMax - v8.Spread;
local u3 = false;
l__Stepped__25:connect(function(p1, p2)
	u1 = u1 - p2 * 60 * u2 / (60 * v8.SpreadCooldownTime);
	local l__Spread__26 = v8.Spread;
	local v27 = l__Spread__26 - (u3 and l__Spread__26 * v8.ADSSpreadReduction / 100 or 0);
	if v5:FindFirstChild("Animate") and v5.Animate.idle.Animation1.AnimationId == "rbxassetid://1503404623" and v5:FindFirstChild("HumanoidRootPart") then
		local v28 = v5:FindFirstChild("HumanoidRootPart").Velocity.Magnitude < 1 and v27 * v8.CrouchSpreadReduction / 100 or 0;
	else
		v28 = 0;
	end;
	local v29 = v27 - v28;
	if u1 < v29 then
		u1 = v29;
	end;
	if v8.SpreadMax < u1 then
		u1 = v8.SpreadMax;
	end;
	if v5:FindFirstChild("HumanoidRootPart") then
		local v30 = v5:FindFirstChild("HumanoidRootPart").Velocity.Magnitude >= 4 and v8.MovingSpreadAddition or 0;
	else
		v30 = 0;
	end;
	local v31 = (u1 + v30) * 50 + 20;
	if v31 < 27 then
		v31 = 27;
	end;
	if l__GunGUI__14 and l__GunGUI__14:FindFirstChild("Reticle") then
		l__GunGUI__14.Reticle.Size = UDim2.new(0, v31, 0, v31);
	end;
end);
if v8.IdleAnimationID ~= nil or v8.DualEnabled then
	v15 = l__Humanoid__6:LoadAnimation((l__Parent__1:WaitForChild("IdleAnim")));
end;
if v8.FireAnimationID ~= nil then
	v16 = l__Humanoid__6:LoadAnimation((l__Parent__1:WaitForChild("FireAnim")));
end;
if v8.ReloadAnimationID ~= nil then
	v17 = l__Humanoid__6:LoadAnimation((l__Parent__1:WaitForChild("ReloadAnim")));
end;
if v8.EquipAnimationID ~= nil then
	v18 = l__Humanoid__6:LoadAnimation((l__Parent__1:WaitForChild("EquipAnim")));
end;
if v8.ShotgunClipinAnimationID ~= nil then
	v19 = l__Humanoid__6:LoadAnimation((l__Parent__1:WaitForChild("ShotgunClipinAnim")));
end;
function wait(p3)
	if p3 ~= nil then
		local v32 = 0 + game:GetService("RunService").Heartbeat:wait();
		while true do
			if v32 < p3 then

			else
				break;
			end;
			v32 = v32 + game:GetService("RunService").Heartbeat:wait();		
		end;
	else
		game:GetService("RunService").Heartbeat:wait();
	end;
end;
local u4 = {};
function RayCast(p4, p5, p6, p7)
	local v33, v34, v35, v36 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(p4, p5 * p6), p7);
	if v33 then
		if not (0.9 < v33.Transparency) then
			if v33.Name ~= "Effect" then
				if v33.Name ~= "Bullet" then
					if v33.Name ~= "Laser" then
						if string.lower(v33.Name) ~= "water" then
							if v33.Name ~= "Rail" then
								if v33.Name ~= "Arrow" then
									if v33.Name ~= "Leaves" then
										if v33.Name ~= "Ignore" then
											if v36 ~= Enum.Material.Water then
												if v33.Parent:FindFirstChild("Humanoid") then
													if v33.Parent.Humanoid.Health ~= 0 then
														if v33.Parent:FindFirstChild("Humanoid") then
															if u4[v33.Parent.Humanoid] then
																local v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
																v33 = v37;
																v34 = v38;
															end;
														end;
													else
														v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
														v33 = v37;
														v34 = v38;
													end;
												elseif v33.Parent:FindFirstChild("Humanoid") then
													if u4[v33.Parent.Humanoid] then
														v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
														v33 = v37;
														v34 = v38;
													end;
												end;
											else
												v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
												v33 = v37;
												v34 = v38;
											end;
										else
											v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
											v33 = v37;
											v34 = v38;
										end;
									else
										v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
										v33 = v37;
										v34 = v38;
									end;
								else
									v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
									v33 = v37;
									v34 = v38;
								end;
							else
								v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
								v33 = v37;
								v34 = v38;
							end;
						else
							v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
							v33 = v37;
							v34 = v38;
						end;
					else
						v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
						v33 = v37;
						v34 = v38;
					end;
				else
					v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
					v33 = v37;
					v34 = v38;
				end;
			else
				v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
				v33 = v37;
				v34 = v38;
			end;
		else
			v37, v38 = RayCast(v34 + p5 * 0.01, p5, p6 - (p4 - v34).magnitude, p7);
			v33 = v37;
			v34 = v38;
		end;
	end;
	return v33, v34;
end;
local u5 = false;
local l__CurrentCamera__6 = Workspace.CurrentCamera;
function ShakeCamera()
	if v8.CameraShakingEnabled then
		local v39 = v8.Intensity / (u5 and v8.MouseSensitive or 1);
		local v40 = (-v39 + math.random(80, 100) * (v39 * 2)) / 10000;
		local v41 = 1 - 1;
		while true do
			l__CurrentCamera__6.CoordinateFrame = CFrame.new(l__CurrentCamera__6.Focus.p) * (l__CurrentCamera__6.CoordinateFrame - l__CurrentCamera__6.CoordinateFrame.p) * CFrame.fromEulerAnglesXYZ(v40, 0, 0) * CFrame.new(0, 0, (l__CurrentCamera__6.CoordinateFrame.p - l__CurrentCamera__6.Focus.p).magnitude);
			wait();
			if 0 <= 1 then
				if v41 < 5 then

				else
					break;
				end;
			elseif 5 < v41 then

			else
				break;
			end;
			v41 = v41 + 1;		
		end;
		local v42 = 1 - 1;
		while true do
			l__CurrentCamera__6.CoordinateFrame = CFrame.new(l__CurrentCamera__6.Focus.p) * (l__CurrentCamera__6.CoordinateFrame - l__CurrentCamera__6.CoordinateFrame.p) * CFrame.fromEulerAnglesXYZ(-v40 / 2, 0, 0) * CFrame.new(0, 0, (l__CurrentCamera__6.CoordinateFrame.p - l__CurrentCamera__6.Focus.p).magnitude);
			wait();
			if 0 <= 1 then
				if v42 < 10 then

				else
					break;
				end;
			elseif 10 < v42 then

			else
				break;
			end;
			v42 = v42 + 1;		
		end;
	end;
end;
local u7 = {};
function Fire(p8)
	if (v5:FindFirstChild("HumanoidRootPart").Position - game.Workspace.NoBuild.MilitaryOutpost.Position).Magnitude <= game.Workspace.NoBuild.MilitaryOutpost.Mesh.Scale.X / 4 then
		game.ReplicatedStorage.Remotes.Noto:FireServer();
	end;
	local v43 = 1;
	if u7["5"] then
		if v8.RecoilPadCombatible == nil then
			v43 = v43 * 0.9;
		end;
	end;
	if u7["3"] then
		v43 = v43 * 0.85;
	end;
	if v8.RecoilCamAmount then
		game.ReplicatedStorage.Remotes.DoRecoil:Fire(v8.RecoilCamAmount * v43);
	end;
	local v44 = v8.Piercing;
	u4 = {};
	if v16 then
		v16:Play(nil, nil, v8.FireAnimationSpeed);
	end;
	if p8.FireSound.Playing then
		if not p8.FireSound.Looped then
			if not u7["4"] then
				p8.FireSound:Play();
			else
				p8.SuppressedFireSound:Play();
			end;
		end;
	elseif not u7["4"] then
		p8.FireSound:Play();
	else
		p8.SuppressedFireSound:Play();
	end;
	local v45 = (l__Handle__2.CFrame * CFrame.new(v8.MuzzleOffset.X, v8.MuzzleOffset.Y, v8.MuzzleOffset.Z)).p;
	if v5:FindFirstChild("HumanoidRootPart") then
		local v46 = 4 <= v5:FindFirstChild("HumanoidRootPart").Velocity.Magnitude and v8.MovingSpreadAddition or 0;
	else
		v46 = 0;
	end;
	u1 = u1 + u2 / v8.ShotsToMaxSpread * v43;
	local v47 = 1;
	if u7["1"] then
		v47 = v47 * 0.85;
	end;
	if u7["2"] then
		v47 = v47 * 1.15;
	end;
	if u7["6"] then
		v47 = v47 * 0.9;
		if v8.ShotgunEnabled then
			v47 = v47 * 0.7;
		end;
	end;
	local v48 = (u1 + v46) * v47;
	if 20 < (l__mouse__4.Hit.p - v45).Magnitude then
		local v49 = l__mouse__4.Hit.p;
	else
		local v50, v51 = game.Workspace:FindPartOnRayWithWhitelist(l__CurrentCamera__6:ScreenPointToRay(l__mouse__4.X, l__mouse__4.Y, 1000), {});
		v49 = v51;
	end;
	local l__lookVector__52 = (CFrame.new(v45, v49) * CFrame.Angles(math.rad(-v48 + math.random() * (v48 * 2)), math.rad(-v48 + math.random() * (v48 * 2)), 0)).lookVector;
	while true do
		if 0 <= v44 then

		else
			break;
		end;
		local v53, v54 = RayCast(v45, l__lookVector__52, 5000, { v5, game.Workspace.Local });
		if not v8.ExplosiveEnabled then
			if v53 then
				if v53.Parent then
					if v53.Parent.Parent then
						if v53.Parent.Parent ~= game.Workspace.Structures then
							if v53.Parent.Parent == game.Workspace.Harvestables then
								local l__Health__55 = v53.Parent:FindFirstChild("Health");
								local l__PrimaryPart__56 = v53.Parent.PrimaryPart;
								if l__Health__55 then
									if 0 < l__Health__55.Value then
										if l__PrimaryPart__56 then
											l__InflictTarget__12:FireServer(v21.enc({
												X = v54.X, 
												Y = v54.Y, 
												Z = v54.Z, 
												Damage = v8.BaseDamage, 
												Knockback = v8.Knockback, 
												Lifesteal = v8.Lifesteal, 
												FlamingBullet = v8.FlamingBullet, 
												HitArmor = false
											}), l__Health__55, l__PrimaryPart__56, l__lookVector__52, v53, p8);
										end;
									end;
								end;
							else
								local v57 = v53.Parent:FindFirstChild("Humanoid") or v53.Parent:FindFirstChild("WeldTo") and (v53.Parent.Parent:FindFirstChild("Humanoid") or v53.Parent.Parent.Parent:FindFirstChild("Humanoid"));
								local v58 = v53.Parent:FindFirstChild("HumanoidRootPart") or v53.Parent:FindFirstChild("WeldTo") and (v53.Parent.Parent:FindFirstChild("HumanoidRootPart") or v53.Parent.Parent.Parent:FindFirstChild("HumanoidRootPart"));
								if v57 then
									if 0 < v57.Health then
										local v59 = {
											X = v54.X, 
											Y = v54.Y, 
											Z = v54.Z, 
											Damage = v8.BaseDamage, 
											Knockback = v8.Knockback, 
											Lifesteal = v8.Lifesteal, 
											FlamingBullet = v8.FlamingBullet
										};
										if v53.Parent:FindFirstChild("WeldTo") then
											local v60 = true;
										else
											v60 = false;
										end;
										v59.HitArmor = v60;
										l__InflictTarget__12:FireServer(v21.enc(v59), v57, v58, l__lookVector__52, v53, p8);
										u4[v57] = true;
									else
										v44 = 0;
									end;
								else
									v44 = 0;
								end;
							end;
						else
							l__Health__55 = v53.Parent:FindFirstChild("Health");
							l__PrimaryPart__56 = v53.Parent.PrimaryPart;
							if l__Health__55 then
								if 0 < l__Health__55.Value then
									if l__PrimaryPart__56 then
										l__InflictTarget__12:FireServer(v21.enc({
											X = v54.X, 
											Y = v54.Y, 
											Z = v54.Z, 
											Damage = v8.BaseDamage, 
											Knockback = v8.Knockback, 
											Lifesteal = v8.Lifesteal, 
											FlamingBullet = v8.FlamingBullet, 
											HitArmor = false
										}), l__Health__55, l__PrimaryPart__56, l__lookVector__52, v53, p8);
									end;
								end;
							end;
						end;
					end;
				end;
			end;
		else
			local v61 = Instance.new("Explosion");
			v61.BlastRadius = v8.Radius;
			v61.BlastPressure = 0;
			v61.Position = v54;
			v61.Parent = Workspace.CurrentCamera;
			v61.Hit:connect(function(p9)
				if p9 then
					if p9.Parent then
						if p9.Name == "HumanoidRootPart" then
							local l__Humanoid__62 = p9.Parent:FindFirstChild("Humanoid");
							local l__HumanoidRootPart__63 = p9.Parent:FindFirstChild("HumanoidRootPart");
							if l__Humanoid__62 then
								if 0 < l__Humanoid__62.Health then
									l__InflictTarget__12:FireServer(l__Humanoid__62, l__HumanoidRootPart__63, v8.BaseDamage, l__lookVector__52, v8.Knockback, v8.Lifesteal, v8.FlamingBullet, p9, p8);
								end;
							end;
						end;
					end;
				end;
			end);
			v44 = 0;
		end;
		l__LocalPlayer__3.PlayerScripts.BulletVisualizerScript.Visualize:Fire(nil, p8, v8.MuzzleOffset, v54, script.MuzzleEffect, script.HitEffect, v8.HitSoundIDs[math.random(1, #v8.HitSoundIDs)], { v8.ExplosiveEnabled, v8.BlastRadius, v8.BlastPressure }, { v8.BulletSpeed, v8.BulletSize, v8.BulletColor, v8.BulletTransparency, v8.BulletMaterial, v8.FadeTime }, false, (v53 and v44 - 1 or -1) == -1 and v8.VisualizerEnabled or false);
		game.ReplicatedStorage.VisualizeBullet:FireServer(p8, v8.MuzzleOffset, v54, script.MuzzleEffect, script.HitEffect, v8.HitSoundIDs[math.random(1, #v8.HitSoundIDs)], { v8.ExplosiveEnabled, v8.BlastRadius, v8.BlastPressure }, { v8.BulletSpeed, v8.BulletSize, v8.BulletColor, v8.BulletTransparency, v8.BulletMaterial, v8.FadeTime }, true, v44 == -1 and v8.VisualizerEnabled or false);
		v45 = v54 + l__lookVector__52 * 0.01;	
	end;
end;
local u8 = true;
local u9 = false;
local u10 = false;
local u11 = l__Value__23;
function Reload()
	local v64 = 0;
	local v65 = v22.findSlot(l__LocalPlayer__3, v8.AmmoType, true);
	if v65 then
		if v65:FindFirstChild("Amount") then
			v64 = v65.Amount.Value;
		end;
	end;
	if u8 then
		if not u9 then
			if 0 < v64 then
				if l__Ammo__13.Value < v8.AmmoPerClip then
					u9 = true;
					if not u10 then
						u9 = false;
						l__Handle__2.ReloadSound:Stop();
						if v17 then
							v17:Stop();
						end;
						return;
					end;
					if not u10 then
						u9 = false;
						l__Handle__2.ReloadSound:Stop();
						if v17 then
							v17:Stop();
						end;
						return;
					end;
					UpdateGUI();
					if not u10 then
						u9 = false;
						l__Handle__2.ReloadSound:Stop();
						if v17 then
							v17:Stop();
						end;
						return;
					end;
					if v8.ShotgunReload then
						if not u10 then
							u9 = false;
							l__Handle__2.ReloadSound:Stop();
							if v17 then
								v17:Stop();
							end;
							return;
						end;
						local v66 = v8.AmmoPerClip - l__Ammo__13.Value;
						local v67 = 1 - 1;
						while true do
							if not u10 then
								u9 = false;
								l__Handle__2.ReloadSound:Stop();
								if v17 then
									v17:Stop();
								end;
								if v19 then
									v19:Stop();
								end;
								break;
							end;
							if v19 then
								v19:Play(nil, nil, v8.ShotgunClipinAnimationSpeed);
							end;
							l__Handle__2.ShotgunClipin:Play();
							wait(v8.ShellClipinSpeed);
							l__GunScript_Server__9:WaitForChild("Reload"):FireServer();
							if 0 <= 1 then
								if v67 < v66 then

								else
									break;
								end;
							elseif v66 < v67 then

							else
								break;
							end;
							v67 = v67 + 1;						
						end;
					end;
					if not u10 then
						u9 = false;
						l__Handle__2.ReloadSound:Stop();
						if v17 then
							v17:Stop();
						end;
						return;
					end;
					if v17 then
						v17:Play(nil, nil, v8.ReloadAnimationSpeed);
					end;
					l__Handle__2.ReloadSound:Play();
					if not u10 then
						u9 = false;
						l__Handle__2.ReloadSound:Stop();
						if v17 then
							v17:Stop();
						end;
						return;
					end;
					local v68 = math.ceil(v8.ReloadTime * 10);
					local v69 = 1 - 1;
					while true do
						if not u10 then
							u9 = false;
							l__Handle__2.ReloadSound:Stop();
							if v17 then
								v17:Stop();
							end;
							return;
						end;
						wait(0.1);
						if 0 <= 1 then
							if v69 < v68 then

							else
								break;
							end;
						elseif v68 < v69 then

						else
							break;
						end;
						v69 = v69 + 1;					
					end;
					if not u10 then
						u9 = false;
						l__Handle__2.ReloadSound:Stop();
						if v17 then
							v17:Stop();
						end;
						return;
					end;
					if v8.LimitedClipEnabled then
						u11 = u11 - 1;
					end;
					if not v8.ShotgunReload then
						l__GunScript_Server__9:WaitForChild("Reload"):FireServer();
					end;
					u9 = false;
					UpdateGUI();
				end;
			end;
		end;
	end;
end;
local u12 = l__Ammo__13.Value;
game.ReplicatedStorage.Remotes.DisplayHotbar.OnClientEvent:connect(function()
	u12 = l__Ammo__13.Value;
end);
function UpdateGUI()
	l__GunGUI__14.Frame.Ammo.Current.Text = l__Ammo__13.Value;
	local v70 = 0;
	local v71 = v22.findSlot(l__LocalPlayer__3, v8.AmmoType, true);
	if v71 then
		if v71:FindFirstChild("Amount") then
			v70 = v71.Amount.Value;
		end;
	end;
	l__GunGUI__14.Frame.Ammo.Max.Text = v70;
	l__GunGUI__14.Frame.Ammo.Current.Visible = not u9;
	l__GunGUI__14.Frame.Ammo.Max.Visible = not u9;
	l__GunGUI__14.Frame.Ammo.Frame.Visible = not u9;
	l__GunGUI__14.Frame.Ammo.Reloading.Visible = u9;
	l__GunGUI__14.Frame.Clips.Current.Visible = not (u11 <= 0);
	l__GunGUI__14.Frame.Clips.Max.Visible = not (u11 <= 0);
	l__GunGUI__14.Frame.Clips.Frame.Visible = not (u11 <= 0);
	l__GunGUI__14.Frame.Clips.NoMoreClip.Visible = u11 <= 0;
end;
l__Ammo__13.Changed:connect(function()
	wait(0.1);
	UpdateGUI();
end);
local u13 = false;
local u14 = false;
local u15 = l__Handle__2;
l__mouse__4.Button1Down:connect(function()
	u13 = true;
	local v72 = false;
	if not u14 and u10 and u8 and u13 and not u9 and l__Ammo__13.Value > 0 and l__Humanoid__6.Health > 0 then
		u8 = false;
		if v8.ChargedShotEnabled then
			if u15:FindFirstChild("ChargeSound") then
				u15.ChargeSound:Play();
			end;
			wait(v8.ChargingTime);
			v72 = true;
		end;
		if v8.MinigunEnabled then
			if u15:FindFirstChild("WindUp") then
				u15.WindUp:Play();
			end;
			wait(v8.DelayBeforeFiring);
		end;
		while u10 and not u9 and (not (not u13) or not (not v72)) and l__Ammo__13.Value > 0 and u12 > 0 and l__Humanoid__6.Health > 0 do
			local v73, v74 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v5:WaitForChild("Head").Position, script.Parent.Handle.MuzzlePosition.WorldPosition - v5:WaitForChild("Head").Position), { v5, l__CurrentCamera__6 });
			local v75, v76, v77, v78 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v5:WaitForChild("HumanoidRootPart").Position + Vector3.new(0, 5, 0), Vector3.new(0, -10, 0)), { v5, l__CurrentCamera__6 });
			if v73 == nil and v78 ~= Enum.Material.Water then
				for v79 = 1, v8.BurstFireEnabled and v8.BulletPerBurst or 1 do
					u12 = u12 - 1;
					for v80 = 1, v8.ShotgunEnabled and v8.BulletPerShot or 1 do
						Fire(u15);
					end;
					l__ChangeAmmo__10:FireServer();
					UpdateGUI();
					if v8.BurstFireEnabled then
						wait(v8.BurstRate);
					end;
					if l__Ammo__13.Value <= 0 then
						break;
					end;
					if u12 <= 0 then
						break;
					end;
				end;
				if u15 == l__Handle__2 then
					local v81 = v8.DualEnabled and v20 or l__Handle__2;
				else
					v81 = l__Handle__2;
				end;
				u15 = v81;
				local v82 = 1;
				if u7["2"] then
					v82 = v82 * 0.75;
				end;
				wait(v8.FireRate * v82);
				if not v8.Auto then
					break;
				end;
			else
				local v83 = 1;
				if u7["2"] then
					v83 = v83 * 0.75;
				end;
				wait(v8.FireRate * v83);
				if not v8.Auto then
					break;
				end;
				if v8.MinigunEnabled then
					break;
				end;
				if v8.ChargedShotEnabled then
					break;
				end;
			end;		
		end;
		if u15.FireSound.Playing and u15.FireSound.Looped then
			u15.FireSound:Stop();
		end;
		if v8.MinigunEnabled then
			if u15:FindFirstChild("WindDown") then
				u15.WindDown:Play();
			end;
			wait(v8.DelayAfterFiring);
		end;
		u8 = true;
		if l__Ammo__13.Value <= 0 or u12 <= 0 then
			Reload();
		end;
	end;
end);
l__mouse__4.Button1Up:connect(function()
	u13 = false;
end);
l__mouse__4.Button2Down:connect(function()
	u3 = true;
end);
l__mouse__4.Button2Up:connect(function()
	u3 = false;
end);
l__ChangeAmmoAndClip__11.OnClientEvent:connect(function(p10, p11)
	UpdateGUI();
end);
local u16 = nil;
local l__Value__17 = script.Parent.Zoom.Value;
local u18 = nil;
l__Parent__1.Equipped:connect(function(p12)
	u10 = true;
	u14 = true;
	u12 = l__Ammo__13.Value;
	u16 = l__LocalPlayer__3:WaitForChild("stats"):WaitForChild("inventory"):WaitForChild("slot" .. string.gsub(l__Parent__1.Name, "Tool", ""));
	u7 = {};
	if u16.Misc1.Value ~= 0 then
		u7[tostring(u16.Misc1.Value)] = true;
	end;
	if u16.Misc2.Value ~= 0 then
		u7[tostring(u16.Misc2.Value)] = true;
	end;
	if u7["7"] then
		script.Parent.Zoom.Value = l__Value__17 / 2;
	end;
	if v18 then
		v18:Play();
		v18:AdjustSpeed(1 / v8.EquipAnimationTime);
	end;
	delay(v8.EquipAnimationTime - 0.05, function()
		if u14 and u10 then
			u14 = false;
			if v15 then
				v15:Play(nil, nil, v8.IdleAnimationSpeed);
			end;
			UpdateGUI();
		end;
	end);
	UpdateGUI();
	if v8.AmmoPerClip ~= math.huge then
		l__GunGUI__14.Parent = l__LocalPlayer__3.PlayerGui;
	end;
	p12.Icon = "rbxassetid://" .. v8.MouseIconID;
	p12.KeyDown:connect(function(p13)
		if string.lower(p13) == "r" and not u14 then
			Reload();
			return;
		end;
		if string.lower(p13) == "e" then
			if not u9 and u5 == false and v8.SniperEnabled then
				Workspace.CurrentCamera.FieldOfView = v8.FieldOfView;
				l__GunGUI__14.Scope.Visible = true;
				game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson;
				script["Mouse Sensitivity"].Disabled = false;
				u5 = true;
				l__mouse__4.Icon = "http://www.roblox.com/asset?id=187746799";
				return;
			end;
			Workspace.CurrentCamera.FieldOfView = 70;
			l__GunGUI__14.Scope.Visible = false;
			game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic;
			script["Mouse Sensitivity"].Disabled = true;
			u5 = false;
			l__mouse__4.Icon = "rbxassetid://" .. v8.MouseIconID;
		end;
	end);
	if v8.DualEnabled and not Workspace.FilteringEnabled then
		v20.CanCollide = false;
		local l__Left_Arm__84 = l__Parent__1.Parent:FindFirstChild("Left Arm");
		local l__Right_Arm__85 = l__Parent__1.Parent:FindFirstChild("Right Arm");
		if l__Right_Arm__85 then
			local l__RightGrip__86 = l__Right_Arm__85:WaitForChild("RightGrip", 0.01);
			if l__RightGrip__86 then
				u18 = l__RightGrip__86:Clone();
				u18.Name = "LeftGrip";
				u18.Part0 = l__Left_Arm__84;
				u18.Part1 = v20;
				u18.Parent = l__Left_Arm__84;
			end;
		end;
	end;
end);
l__Parent__1.Unequipped:connect(function()
	u14 = false;
	u10 = false;
	l__GunGUI__14.Parent = script;
	if v18 then
		v18:Stop();
	end;
	if v17 then
		v17:Stop();
	end;
	if v15 then
		v15:Stop();
	end;
	if u5 then
		Workspace.CurrentCamera.FieldOfView = 70;
		l__GunGUI__14.Scope.Visible = false;
		game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic;
		script["Mouse Sensitivity"].Disabled = true;
		u5 = false;
		l__mouse__4.Icon = "rbxassetid://" .. v8.MouseIconID;
	end;
	if v8.DualEnabled and not Workspace.FilteringEnabled then
		v20.CanCollide = true;
		if u18 then
			u18:Destroy();
		end;
	end;
end);
l__Humanoid__6.Died:connect(function()
	u10 = false;
	l__GunGUI__14.Parent = script;
	if v17 then
		v17:Stop();
	end;
	if v15 then
		v15:Stop();
	end;
	if u5 then
		Workspace.CurrentCamera.FieldOfView = 70;
		l__GunGUI__14.Scope.Visible = false;
		game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic;
		script["Mouse Sensitivity"].Disabled = true;
		u5 = false;
		l__mouse__4.Icon = "rbxassetid://" .. v8.MouseIconID;
	end;
	if v8.DualEnabled and not Workspace.FilteringEnabled then
		v20.CanCollide = true;
		if u18 then
			u18:Destroy();
		end;
	end;
end);
