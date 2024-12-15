repeat wait() until game:IsLoaded()

local rs = game:GetService("ReplicatedStorage")
local lplr = game:GetService("Players").LocalPlayer
local light = game:GetService("Lighting")

if game.PlaceId == 6737540754 then 
	local rm = rs:WaitForChild("RemoteEvent")
	rm:FireServer("PVE")
elseif game.PlaceId == 7176980618 then
	local data = lplr:WaitForChild("Data")
	local rm = rs:WaitForChild("Remotes")
	if data.Quest.QuestName.Value == "" then
		rm.DialogueEvent:InvokeServer(workspace.NPCs.Levi, "I want to do a quest")
	end
	spawn(function()
		while true do wait()
			for i, v in pairs(data.Injuries:GetChildren()) do
				v.Parent = nil
			end
		end
	end)
elseif game.PlaceId == 6803256560 then
	local data = lplr:WaitForChild("Data")
	local rm = rs:WaitForChild("Remotes")
	local mouse = lplr:GetMouse()
	spawn(function()
		mouse.KeyDown:connect(function(key)
			if key == "p" then
				rm.ReturnToLobby:FireServer()
			end
		end)
	end)
	spawn(function()
		while true do wait()
			for i, v in pairs(data.Injuries:GetChildren()) do
				v.Parent = nil
			end
		end
	end)
	spawn(function()
		local esp = Instance.new("BoolValue", lplr.Data.Skills)
		esp.Name = "Good Nose"
	end)
	spawn(function()
		light.SunRays.Parent = nil
		light.Brightness = 1
		light.ClockTime = 12
		light.FogEnd = 786543
		light.Ambient = Color3.fromRGB(178, 178, 178)
	end)
end
