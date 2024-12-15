--Confirguration:
local SriptName = "InfiniteJump"
local CustomJP  = true
getgenv().InfJP = 50

--Table:
if not getgenv().Settings then
    getgenv().Settings = {}
end

if getgenv().Settings then
    if not getgenv().Settings[SriptName] then
        getgenv().Settings[SriptName] = nil
    end
else
    warn("Error: Table has not been established.")
end

--Varibles:
local Plrs  = game:GetService("Players")
local UIS   = game:GetService("UserInputService")

local LPlr  = Plrs.LocalPlayer
local JP    = LPlr.Character.Humanoid.JumpPower


--Toggle:
if getgenv().Settings[SriptName] then
    getgenv().Settings[SriptName] = false
    print(SriptName.." Disabled\n")
else
    getgenv().Settings[SriptName] = true
    print(SriptName.." Enabled\n")
end

if not CustomJP then
    getgenv().InfJP = JP
end

--Script:
function Action(Object, Function) 
    if Object ~= nil then 
        Function(Object)
    end
end

UIS.InputBegan:Connect(function(UserInput)
    if getgenv().Settings[SriptName] then
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
            Action(LPlr.Character.Humanoid, function(self)
                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                    Action(self.Parent.HumanoidRootPart, function(self)
                        self.Velocity = Vector3.new(0, getgenv().InfJP, 0)
                    end)
                end
            end)
        end
    end
end)