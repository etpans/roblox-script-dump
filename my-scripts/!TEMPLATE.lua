--Credits:
local Pans = [[
██████╗░░█████╗░███╗░░██╗░██████╗░░░██╗░██╗░░░███╗░░███████╗░░███╗░░░░██╗██╗
██╔══██╗██╔══██╗████╗░██║██╔════╝██████████╗░████║░░╚════██║░████║░░░██╔╝██║
██████╔╝███████║██╔██╗██║╚█████╗░╚═██╔═██╔═╝██╔██║░░░░░░██╔╝██╔██║░░██╔╝░██║
██╔═══╝░██╔══██║██║╚████║░╚═══██╗██████████╗╚═╝██║░░░░░██╔╝░╚═╝██║░░███████║
██║░░░░░██║░░██║██║░╚███║██████╔╝╚██╔═██╔══╝███████╗░░██╔╝░░███████╗╚════██║
╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░░╚═╝░╚═╝░░░╚══════╝░░╚═╝░░░╚══════╝░░░░░╚═╝
]]

if not getgenv().Settings then
    print("Made by:\n\n"..Pans.."\n\n")
end

--Confirguration:
local SriptName = "Toggle"

--Table:
if not getgenv().Settings then
    getgenv().Settings = {}
end

if getgenv().Settings then
    if not getgenv().Settings[SriptName] then
        getgenv().Settings[SriptName] = nil
    end
else
    warn("Error: Table has not been established.")
end

--Varibles:
local WP    = game:GetService("Workspace")
local LG    = game:GetService("Lighting")
local RS    = game:GetService("ReplicatedStorage")
local Plrs  = game:GetService("Players")
local SPlr  = game:GetService("StarterPlayer")
local SPak  = game:GetService("StarterPack")
local SGui  = game:GetService("StarterGui")
local CGui  = game:GetService("CoreGui")

local LPlr  = Plrs.LocalPlayer
local Char  = LPlr.Character

--Toggle:
if getgenv().Settings[SriptName] then
    getgenv().Settings[SriptName] = false
    print(SriptName.." Disabled\n")
else
    getgenv().Settings[SriptName] = true
    print(SriptName.." Enabled\n")
end