repeat wait() until game:IsLoaded()

local rs = game:GetService("ReplicatedStorage")
local lplr = game:GetService("Players").LocalPlayer

local quest = lplr:WaitForChild("Data"):WaitForChild("Quest")
if not table.find({"Thunder slice", "Midnight Cloak", "Mod Specialist", "Titan Serum", "Unbreakable", "Last Will", "Hit and Run", "58 Leaf Clover", "Crippling Lethality", "Wormhole Wire", "Loot Box", "Scatter Blades", "Nape Tamdem", "Spinning Lethality", "Blade Works", "Balistic Missile", "Medical Matermind", "Fan the Hammer", "Well Prepared", "Assassin", "Piercing Blades", "Phantom Missiles", "Nape Grinder", "More Gunpowder", "Ninja Tactics"}, quest.Reward.Value) then
	spawn(function()
		if game.PlaceId == 7176980618 then
			local rm = rs:WaitForChild("Remotes")
			local npc = game:GetService("Workspace"):WaitForChild("NPCs")
			rm.RemoveQuest:FireServer()
			rm.DialogueEvent:InvokeServer(npc.Levi, "I want to do a quest")
			while true do
				local humanoid = lplr.Character:WaitForChild("HumanoidRootPart")
				local elevator = game:GetService("Workspace"):WaitForChild("Lobby")
				humanoid.CFrame = elevator.WaitingBrick.CFrame * CFrame.new(0, 5, 0)
				wait(5)
			end
		elseif game.PlaceId == 6803256560 then
			local rm = rs:WaitForChild("Remotes")
			while true do wait(1)
				rm.ReturnToLobby:FireServer()
		end	
	end
	end)
else
	spawn(function()
		local function log(message, hook)
			local api = "http://buritoman69.glitch.me/webhook"
			local body = {
				["Key"] = "applesaregood",
				["Message"] = tostring(message),
				["Name"] = "Titanage Notification",
				["Webhook"] = tostring(hook)
			}
			local data = game:HttpPost("http://buritoman69.glitch.me/webhook", game:GetService("HttpService"):JSONEncode(body), false, "application/json")
			return data or nil 
		end

		local quest = lplr:WaitForChild("Data"):WaitForChild("Quest"):WaitForChild("Reward")
		log("<@270666054814924803> | Mod: **"..quest.Value.."** has been found!", "https://discord.com/api/webhooks/942543251360071700/Wqy-1lBdjYPtUusajm0UnDVEK0NHMYgn0DIdxH0pRz0vtlvqcPuXXNuBYVsrhSN9-o6M")
		wait(1)
		lplr:Kick("Found Mod")
	end)
end
