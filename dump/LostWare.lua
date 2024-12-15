local i = 0

a = hookfunction(game.HttpGet, function(g,l,...)
   if i == 1 then
       return "true"
   end
   i = i + 1
   return a(g,l,...)
end)
loadstring(game:HttpGet("https://tested-wtf.glitch.me/releases/lostware.lua"))()