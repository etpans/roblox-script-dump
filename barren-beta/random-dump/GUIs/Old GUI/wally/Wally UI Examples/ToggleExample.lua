local library = loadstring(game:HttpGet("https://pastebin.com/raw/FTdYYNX3",true))() 
local Toggleexample = library:CreateWindow("Toggle Example")
local Toggle1 = Toggleexample:Toggle("Toggle1",{flag = "Toggle1"})
spawn(function()
    while wait(1) do
        if Toggleexample.flags.Toggle2 then
            print(Toggleexample.flags.Toggle2)
        end
        if Toggleexample.flags.Toggle3 then
            print(Toggleexample.flags.Toggle3)
        end
    end
end)

local Toggle2 = Toggleexample:Toggle("Toggle2",{flag = "Toggle2"})
local Toggle3 = Toggleexample:Toggle("Toggle3",{flag = "Toggle3"})