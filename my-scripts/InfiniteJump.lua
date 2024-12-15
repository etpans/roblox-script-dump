--Configurables--
_G.InfiniteJumpEnabled = true
_G.InfiniteJumpHeight = 50
local InfiniteJumpNotification = true
local NotificationProperties = {
    Text = "{INFINITE JUMP "..(_G.InfiniteJumpEnabled and "EN" or "DIS").."ABLED}",
    Color = Color3.fromRGB(205,165,255),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
}

--Variables--
local Plrs = game:GetService("Players")
local SGui = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")
local LPlr = Plrs.LocalPlayer

--Scripts--
function Action(Object, Function) 
    if Object ~= nil then 
        Function(Object)
    end
end

UIS.InputBegan:Connect(function(UserInput)
    if not _G.InfiniteJumpEnabled then return end
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(LPlr.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0,_G.InfiniteJumpHeight,0)
                end)
            end
        end)
    end
end)

--Notifications--
if InfiniteJumpNotification then
    SGui:SetCore("ChatMakeSystemMessage",NotificationProperties)
end