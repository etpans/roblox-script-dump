local tool = game:GetService("Workspace")["1kbpi"].Tool04
local handle_cframe = tool.Handle.CFrame
local setting = require(tool.Setting)
local workspace_player = game:GetServcie("Workspace").LocalPlayer.Name

function RayCast(p4, p5, p6, p7)
	local v34, v35, v36, v37 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(p4, p5 * p6), p7);
	if v34 then
		if not (0.9 < v34.Transparency) then
			if v34.Name ~= "Effect" then
				if v34.Name ~= "Bullet" then
					if v34.Name ~= "Laser" then
						if string.lower(v34.Name) ~= "water" then
							if v34.Name ~= "Rail" then
								if v34.Name ~= "Arrow" then
									if v34.Name ~= "Leaves" then
										if v34.Name ~= "Ignore" then
											if v37 ~= Enum.Material.Water then
												if v34.Parent:FindFirstChild("Humanoid") then
													if v34.Parent.Humanoid.Health ~= 0 then
														if v34.Parent:FindFirstChild("Humanoid") then
															if u5[v34.Parent.Humanoid] then
																local v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
																v34 = v38;
																v35 = v39;
															end;
														end;
													else
														v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
														v34 = v38;
														v35 = v39;
													end;
												elseif v34.Parent:FindFirstChild("Humanoid") then
													if u5[v34.Parent.Humanoid] then
														v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
														v34 = v38;
														v35 = v39;
													end;
												end;
											else
												v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
												v34 = v38;
												v35 = v39;
											end;
										else
											v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
											v34 = v38;
											v35 = v39;
										end;
									else
										v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
										v34 = v38;
										v35 = v39;
									end;
								else
									v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
									v34 = v38;
									v35 = v39;
								end;
							else
								v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
								v34 = v38;
								v35 = v39;
							end;
						else
							v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
							v34 = v38;
							v35 = v39;
						end;
					else
						v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
						v34 = v38;
						v35 = v39;
					end;
				else
					v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
					v34 = v38;
					v35 = v39;
				end;
			else
				v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
				v34 = v38;
				v35 = v39;
			end;
		else
			v38, v39 = RayCast(v35 + p5 * 0.01, p5, p6 - (p4 - v35).magnitude, p7);
			v34 = v38;
			v35 = v39;
		end;
	end;
	return v34, v35;
end;


l__InflictTarget__12:FireServer(v22.enc({
    X = v54.X, 
    Y = v54.Y, 
    Z = v54.Z, 
    Damage = u4, 
    Knockback = v8.Knockback, 
    Lifesteal = v8.Lifesteal, 
    FlamingBullet = v8.FlamingBullet, 
    HitArmor = false
}), l__Health__55, l__PrimaryPart__56, u10, v53, p8, u9, v54);

--u10
local l__p__44 = (handle_cframe * CFrame.new(setting.MuzzleOffset.X, setting.MuzzleOffset.Y, setting.MuzzleOffset.Z)).p
local v47 = l__mouse__4.Hit.p
local u1 = setting.Spread
local v45 = 4 <= workspace_player:FindFirstChild("HumanoidRootPart").Velocity.Magnitude and setting.MovingSpreadAddition or 0; --when in doubt set 0
local v46 = u1 + v45 --v45 = 0


local u11 = setting.DropRate * ((500 - 400 * 0 / setting.MaxCharge) / 100)
local v50 = CFrame.new(l__p__44, v47) * CFrame.Angles(math.rad(-v46 + math.random() * (v46 * 2)), math.rad(-v46 + math.random() * (v46 * 2)), 0);

u10 = (v50 * CFrame.Angles(math.rad(v52 * (-u11 / 40)), 0, 0)).lookVector;

--u9
local u9 = l__p__44

--v54
local u9 = l__p__44
local u10_other = v50.lookVector
local u8 = setting.ProjectileSpeed / 40 * ((60 + 40 * 0 / setting.MaxCharge) / 100);

local v54 = RayCast(u9, u10_other, u8, { Workspace:WaitForChild(game:GetServcie("Players").LocalPlayer.Name), game.Workspace.Local });

--silent aim

function getRock()

    return closestRock or nil
end

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end
local namecallMethod = getnamecallmethod or get_namecall_method
local newClose = newcclosure or function(f) return f end

mt.__namecall = newClose(function(...)
    local method = namecallMethod()
    local args = {...}

    if tostring(method) == "FireServer" and tostring(args[1]) == "iTyPjPtVMcE4k40YjP0FHKpfDc1WNBJbRPtVDcLwHK5FObJbB8E6D8VbDcvnHK5JUAyHMIR+hfo6hbHdNftYh8mYH21pNf0WLP0GjAHdOuF=" then
        args[2]["HitPart"] = getClosestPlayer().Character.Head
        args[2]["HitPosition"] = getClosestPlayer().Character.Head.Position

        return oldNamecall(unpack(args))
    end

    return oldNamecall(...)
end)

if setreadonly then setreadonly(mt, true) else make_writeable(mt, false) end