local UserInputService = game:GetService("UserInputService")
local Character = game:GetService("Players").LocalPlayer.Character

local function Reel(direction)
    if direction == "left" then
        keyrelease(0x44)
        keyrelease(0x53)
        keypress(0x41)
    elseif direction == "right" then
        keyrelease(0x41)
        keyrelease(0x53)
        keypress(0x44)
    elseif direction == "back" then
        keyrelease(0x44)
        keyrelease(0x41)
        keypress(0x53)
    elseif not direction then
        keyrelease(0x44)
        keyrelease(0x41)
        keyrelease(0x53)
    end
end

Character.Humanoid.AnimationPlayed:Connect(function(anim)
    if anim.Animation.AnimationId:match("6415331110") then
        Reel("left")
    end
    if anim.Animation.AnimationId:match("6415331617") then
        Reel("right")
    end
    if anim.Animation.AnimationId:match("6415330705") then
        Reel("back")
    end
    if anim.Animation.AnimationId:match("6415329642") or anim.Animation.AnimationId:match("6415663939") then
        Reel()
    end
end)