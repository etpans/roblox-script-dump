-- Decompiled with the Synapse X Luau decompiler.

game:GetService("RunService").RenderStepped:connect(function()
	if script:FindFirstChild("Target") and script.Target.Value and script.Target.Value.Character and script.Target.Value.Character:FindFirstChild("HumanoidRootPart") then
		script.Parent.CameraScript.Disabled = true;
		game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
		game.Workspace.CurrentCamera.CameraSubject = script.Target.Value.Character:WaitForChild("Humanoid");
		return;
	end;
	script.Parent.CameraScript.Disabled = false;
end);
game:GetService("UserInputService").InputBegan:connect(function(p1)
	if p1.KeyCode == Enum.KeyCode.Space then
		script.Parent.CameraScript.Disabled = false;
		script.Disabled = true;
	end;
end);
