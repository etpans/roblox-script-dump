hp = gethiddenproperty or get_hidden_prop

for _,v in pairs(game:GetService("Players"):GetPlayers()) do
   if v.Name ~= game:GetService("Players").LocalPlayer.Name then
    local Thing = game:GetService("HttpService"):JSONDecode(game:HttpGet("http://country.io/names.json"))
    local ParsedCountry = Thing[hp(v, "CountryRegionCodeReplicate")]
print(
v.Name.." is from "..tostring(ParsedCountry)
)
end
end