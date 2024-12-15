local UserInputService = game:GetService("UserInputService")
local Character = game:GetService("Players").LocalPlayer.Character

local Directions = {
    "6415331110", --Lean Left
    "6415331617", --Lean Right
    "6415330705", --Lean Back
    "6415330193", --Idle
    "6415329642", --Catch
    "6415663939", --Snap
}

if getgenv().executed then
    getgenv().Looping:Disconnect()
end

getgenv().fishing = false
getgenv().executed = true

getgenv().Looping = Character.Humanoid.AnimationPlayed:Connect(function(Anim)
    local Animation = Anim.Animation.AnimationId:match("//(%d+)")

    if Animation == Directions[1] then
        getgenv().fishing = true
        print("Leaning Left")
        keyrelease(0x44)
        keyrelease(0x53)
        keypress(0x41)
        
    end
    if Animation == Directions[2] then
        getgenv().fishing = true
        print("Leaning Right")
        keyrelease(0x53)
        keyrelease(0x41)
        keypress(0x44)
    end
    if Animation == Directions[3] then
        getgenv().fishing = true
        print("Leaning Back")
        keyrelease(0x44)
        keyrelease(0x41)
        keypress(0x53)
    end

    coroutine.wrap(function()
        while fishing do
            wait(0.002)
            mouse1click()

            spawn(function()
                if fishing then
                    local Tool = Character:FindFirstChildOfClass("Tool")
                    if not Tool or Tool and Tool.Name ~= "Fishing Rod" then
                        print("Fishing set to false")
                        getgenv().fishing = false
                        keyrelease(0x41)
                        keyrelease(0x44)
                        keyrelease(0x53)
                    end
                end
            end)
            
            if fishing == false then
                print("Clicking Loop Broken!", fishing)
                break
            end
        end
    end)()

    if Animation == Directions[5] or Animation == Directions[6] then
        print("Fishing Ended:", Anim.Animation.AnimationId)
        getgenv().fishing = false
        keyrelease(0x41)
        keyrelease(0x44)
        keyrelease(0x53)
    end
end)