booga booga auto farm
print("Farm Level Script loaded!")
warn("Made by Hamii/Tritium and Floof")
local Folder = workspace.Critters
local Player = game:GetService("Players").LocalPlayer
local player = game:GetService("Players").LocalPlayer

local Damage = function(Part)
    local A = Part
    local B = Part.Position
    local C = {
        origin = Player.Character.Head.Position,
        position = Part.Position,
        velocity = Player.Character.Head.CFrame.lookVector * math.clamp(500, 100, 500),
        acceleration = Vector3.new(0, -156.2, 0),
        age = os.time(),
        toolFrom = "Magnetite Crossbow",
        object = game:GetService("ReplicatedStorage").Projectiles:findFirstChild("Bolt")
    }
    local D = (Player.Character.Head.Position - Part.Position).magnitude
    game:GetService("ReplicatedStorage").Events.ProjectileImpact:FireServer(A, B, C, D)
end

while wait(1) do
   for i,v in pairs(Folder:GetChildren()) do
       spawn(function()
           if v.Name == "Banto" or v.Name == "Bantae" or v.Name == "Lil Banto" or v.Name == "Lost Soul" or v.Name == "Forgotten Soul" or v.Name == "Lurky Boi" or v.Name == "Golden Banto" or v.Name:find("Mammoth") then
               local Obj = v.HumanoidRootPart
               for i = 0, 20 do
                   Damage(Obj)
               end
           end
       end)
   end
   for i,v in pairs(workspace:GetChildren()) do
       spawn(function()
           if v.Name:find("Tree") or v.Name:find("Sun") then
               if v.Name == "Ancient Tree" then
                  v:Destroy()
               end
               local Obj = v.Reference
               for i = 0, 20 do
                   Damage(Obj)
               end
           end
       end)
   end
   for i,v in pairs(workspace:GetChildren()) do
       spawn(function()
       if v.Name == "Bush" or v.Name == "Big Bush" then
           local Obj = v.PrimaryPart
           for i = 0, 20 do
                 Damage(Obj)
              end
           end
       end)
   end
end