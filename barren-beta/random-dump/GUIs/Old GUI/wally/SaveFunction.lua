local Defaultsetting = {
    Test = true,
}
if not pcall(function()readfile("Setting.cfg") end) then writefile("Setting.cfg",game:GetService("HttpService"):JSONEncode(Defaultsetting)) end
Setting = game:GetService("HttpService"):JSONDecode(readfile("Setting.cfg"))
local function Save()
    writefile("Setting.cfg",game:GetService("HttpService"):JSONEncode(Setting))
end

Setting.Test = false
Save()