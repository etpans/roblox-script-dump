
--Keybind:
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(Input, Processed)
    if not Processed then
        if Input.KeyCode == Enum.KeyCode.G then
            --Code
        end
    end
end)

--Loadstrings:
loadstring(game:HttpGet("Link Goes Here"))()