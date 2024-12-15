-- Decompiled with the Synapse X Luau decompiler.

local l__MouseSensitive__1 = require(script.Parent.Parent:WaitForChild("Setting")).MouseSensitive;
local l__RenderStepped__2 = game:GetService("RunService").RenderStepped;
local l__LocalPlayer__3 = game.Players.LocalPlayer;
local l__CurrentCamera__4 = workspace.CurrentCamera;
local l__Head__5 = l__LocalPlayer__3.Character:WaitForChild("Head");
local l__components__1 = CFrame.new().components;
local l__math_abs__2 = math.abs;
local l__math_atan2__3 = math.atan2;
local l__math_asin__4 = math.asin;
local function v6(p1)
	local v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18 = l__components__1(p1);
	return l__math_abs__2(v15) > 0.99999 and -l__math_atan2__3(-v16, v10) or -l__math_atan2__3(-v12, v18), -l__math_asin__4(v15);
end;
local v19, v20 = v6(l__CurrentCamera__4.CoordinateFrame);
local u5 = v19;
local u6 = v20;
local u7 = 2 * math.pi;
local l__math_floor__8 = math.floor;
local l__CFrame_Angles__9 = CFrame.Angles;
local l__CFrame_new__10 = CFrame.new;
function Update()
	local v21, v22 = v6(l__CurrentCamera__4.CoordinateFrame);
	local v23 = (v21 + u7 * l__math_floor__8((u5 - v21) / u7 + 0.5)) * l__MouseSensitive__1;
	local v24 = (v22 + u7 * l__math_floor__8((u6 - v22) / u7 + 0.5)) * l__MouseSensitive__1;
	u5 = u5 * (1 - l__MouseSensitive__1) + v23;
	u6 = u6 * (1 - l__MouseSensitive__1) + v24;
	l__CurrentCamera__4.CoordinateFrame = l__CFrame_Angles__9(0, u5, 0) * l__CFrame_Angles__9(u6, 0, 0) * l__CFrame_new__10(0, 0, 0.5) + l__CurrentCamera__4.Focus.p;
end;
l__RenderStepped__2:connect(Update);
m = l__LocalPlayer__3:GetMouse();
m.Button1Down:connect(function()
	zoom = true;
	out = false;
end);
m.Button1Up:connect(function()
	zoom = false;
end);
m.Button2Down:connect(function()
	out = true;
	zoom = false;
end);
m.Button2Up:connect(function()
	out = false;
end);