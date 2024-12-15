local HTTP = game:GetService("HttpService")
local Message = {
    ["content"] = ""
}

syn.request(
    {
        Url = "https://discordapp.com/api/webhooks/728026773094137879/YfyEuNKfsjKQPXehBxvwPawzcejTH_J4hjmdA99JWCruoUFhoFtfaHj5C3--yY7msyZ-",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HTTP:JSONEncode(Message)
    }
)