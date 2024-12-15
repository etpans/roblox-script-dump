-- Decompiled with the Synapse X Luau decompiler.

wait();
script.Parent:WaitForChild("Messages"):WaitForChild("HelpFrame").Visible = true;
script.Parent = nil;
print("If you see anything in red, go ahead and take a screenshot and tweet it to us\n\tat @Infinite_PrimeD, or report it to us on our group wall.\n\t\n\tThanks, and enjoy the beta (version " .. game.Workspace.Version.Value .. ") for this game!\n\t\n\t\n\t\n\t\n");
local l__LocalPlayer__1 = game.Players.LocalPlayer;
local u2 = nil;
local u3 = nil;
game:GetService("RunService").RenderStepped:connect(function()
	if l__LocalPlayer__1 and l__LocalPlayer__1.Character and l__LocalPlayer__1.Character.Parent ~= nil and l__LocalPlayer__1.Character.PrimaryPart then
		if u2 then
			u3 = l__LocalPlayer__1.Character.PrimaryPart.Position;
			if (u3 - u2).Magnitude <= 10 then
				local v1 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(u2, u3 - u2), { game.Workspace.Terrain, game.Workspace.Harvestables, game.Workspace.Landmarks, game.Workspace.Structures }, true);
				if v1 and v1.CanCollide then
					print("bruh what the");
					game.ReplicatedStorage.Remotes.AddTabs:FireServer(25, false, "EXPLOIT CODE : 1013");
				end;
			end;
			u2 = u3;
			return;
		else
			u2 = l__LocalPlayer__1.Character.PrimaryPart.Position;
		end;
	end;
end);
game.Workspace.ChildAdded:connect(function(p1)
	wait();
	if p1:IsA("Tool") then
		game.ReplicatedStorage.Remotes.AddTabs:FireServer(100, false, "EXPLOIT CODE : 1014");
	end;
end);
l__LocalPlayer__1.ChildAdded:connect(function(p2)
	wait();
	if p2:IsA("Tool") then
		game.ReplicatedStorage.Remotes.AddTabs:FireServer(100, false, "EXPLOIT CODE : 1015");
	end;
end);
game.Workspace.Landmarks.DescendantRemoving:connect(function(p3)
	print(p3.Name);
	if p3:IsA("BasePart") then
		game.ReplicatedStorage.Remotes.AddTabs:FireServer(100, false, "EXPLOIT CODE : 1016");
	end;
end);
local function v2(p4)
	p4:WaitForChild("HumanoidRootPart").DescendantAdded:connect(function(p5)
		if p5.ClassName == "BodyVelocity" or p5.ClassName == "Fire" or p5.ClassName == "Beam" then
			game.ReplicatedStorage.Remotes.AddTabs:FireServer(100, false, "EXPLOIT CODE : 1017");
		end;
	end);
	p4.ChildAdded:connect(function(p6)
		print(p6.Name);
		if p6.ClassName == "SkateboardPlatform" then
			game.ReplicatedStorage.Remotes.AddTabs:FireServer(100, false, "EXPLOIT CODE : 1018");
			return;
		end;
		if p6.ClassName == "ForceField" and p6.Name ~= "ForceFieId" then
			game.ReplicatedStorage.Remotes.AddTabs:FireServer(100, false, "EXPLOIT CODE : 1019");
		end;
	end);
	p4:WaitForChild("Humanoid"):GetPropertyChangedSignal("JumpPower"):connect(function()
		local v3 = 25 * math.min(1, 3 - 3 * p4:FindFirstChild("Humanoid"):WaitForChild("JumpStamina").Value / 100);
		if v3 < 15 then
			v3 = 0;
		end;
		if p4.Humanoid.JumpPower > 27 then
			p4.Humanoid.JumpPower = v3;
			game.ReplicatedStorage.Remotes.AddTabs:FireServer(50, false, "EXPLOIT CODE : 1020");
		end;
	end);
	p4:WaitForChild("Humanoid"):GetPropertyChangedSignal("HipHeight"):connect(function()
		if math.abs(1.35 - p4.Humanoid.HipHeight) > 0.1 then
			p4.Humanoid.HipHeight = 1.35;
			game.ReplicatedStorage.Remotes.AddTabs:FireServer(25, false, "EXPLOIT CODE : 1021");
		end;
	end);
	p4:WaitForChild("Humanoid").Changed:connect(function()
		if p4.Humanoid.PlatformStand then
			game.ReplicatedStorage.Remotes.AddTabs:FireServer(50, false, "EXPLOIT CODE : 1022");
		end;
		if p4.Humanoid.Sit then
			game.ReplicatedStorage.Remotes.AddTabs:FireServer(50, false, "EXPLOIT CODE : 1023");
		end;
	end);
	p4:WaitForChild("Humanoid").AnimationPlayed:connect(function(p7)
		if p7.Animation.AnimationId then

		end;
	end);
	p4:WaitForChild("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false);
	local u4 = true;
	p4:WaitForChild("Humanoid").StateChanged:connect(function(p8, p9)
		if p9 == Enum.HumanoidStateType.RunningNoPhysics then
			p4.Humanoid:ChangeState(Enum.HumanoidStateType.Running);
			p4:WaitForChild("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false);
		end;
		if p9 == Enum.HumanoidStateType.Jumping and u4 then
			u4 = false;
			game.ReplicatedStorage.Remotes.Apple:FireServer();
			wait(0.2);
			u4 = true;
		end;
	end);
end;
if l__LocalPlayer__1.Character ~= nil and l__LocalPlayer__1.Character.Parent == game.Workspace then
	v2(l__LocalPlayer__1.Character);
end;
l__LocalPlayer__1.CharacterAdded:connect(function(p10)
	v2(p10);
end);
while wait(0.5) do
	if workspace:GetRealPhysicsFPS() > 65 then
		game.ReplicatedStorage.Remotes.AddTabs:FireServer(25, false, "EXPLOIT CODE : 1024");
	end;
end;
