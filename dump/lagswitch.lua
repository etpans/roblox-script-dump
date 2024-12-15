local a = false
local b = settings()
settings()

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F3 then
        a = not a
        b.Network.IncommingReplicationLag = a and 1000 or 0
    end
end)