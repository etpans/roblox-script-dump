getgenv().infinitejumpheight = 50

if getgenv().infinitejumpenabled == nil then
    getgenv().infinitejumpenabled = true
elseif infinitejumpenabled then
    getgenv().infinitejumpenabled = false
else
    getgenv().infinitejumpenabled = true
end

local lplr = game:GetService("Players").LocalPlayer
local plrgui = lplr.PlayerGui
local uis = game:GetService("UserInputService")

local function noification(message, seconds)
    pcall(function()
        local properties = plrgui.StarterScripts.ItemControl.MessageFrame:Clone()
        properties.Name = os.time()
        properties.MessageText.Text = message
        properties.Parent = plrgui:WaitForChild("Messages").MessageFrame
        game.Debris:AddItem(properties, seconds)
    end)
end

function Action(Object, Function)
    if Object ~= nil then
        Function(Object)
    end
end

uis.InputBegan:Connect(function(UserInput)
    if not infinitejumpenabled then
        notification("Infinite Jump has been disabled!", 2)
        return
    else
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
            Action(lplr.Character.Humanoid, function(self)
                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                    Action(self.Parent.HumanoidRootPart, function(self)
                        self.Velocity = Vector3.new(0, infinitejumpheight, 0)
                    end)
                end
            end)
        end
        notification("Infinite Jump has been enabled!", 2)
    end
end)
