--Confirguration:
local SriptName = "Fullbright"

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
local LG = LG

if not getgenv().NormalLightingSettings then
    getgenv().NormalLightingSettings = {
		Brightness      = LG.Brightness,
		ClockTime       = LG.ClockTime,
		FogEnd          = LG.FogEnd,
		GlobalShadows   = LG.GlobalShadows,
		Ambient         = LG.Ambient,
	}
end
--Toggle:
if getgenv().Settings[SriptName] then
    getgenv().Settings[SriptName] = false
    print(SriptName.." Disabled\n")
else
    getgenv().Settings[SriptName] = true
    print(SriptName.." Enabled\n")
end

--Script:
local function Fullbright()
    while getgenv().Settings[SriptName] do wait()
        if LG.Brightness < 1 then
            LG.Brightness = 1
        end
        LG.ClockTime        = 12
        LG.FogEnd           = 786543
        LG.GlobalShadows    = false
        LG.Ambient          = Color3.fromRGB(178, 178, 178)
    end
end

local function FullbrightOff()
    LG.Brightness       = getgenv().NormalLightingSettings.Brightness
    LG.ClockTime        = getgenv().NormalLightingSettings.ClockTim
    LG.FogEnd           = getgenv().NormalLightingSettings.FogEnd
    LG.GlobalShadows    = getgenv().NormalLightingSettings.GlobalShadows
    LG.Ambient          = getgenv().NormalLightingSettings.Ambient
end

if getgenv().Settings[ScriptName] then
    FullbrightOn()
else
    FullbrightOff()
end

-------------------------------------

--Variables:
local scriptname = "Fullbright"
local LG = game:GetService("Lighting")

--Tables:
if not getgenv().Settings then
	getgenv().Settings = {}
end

if getgenv().Settings then
    if not getgenv().Settings[scriptname] then
        getgenv().Settings[scriptname] = nil
    end
else
    warn("Error: Table has not been established.")
end



getgenv().DefaultLighting = {
	Brightness = LG.Brightness,
	ClockTime = LG.ClockTime,
	FogEnd = LG.FogEnd,
	GlobalShadows = LG.GlobalShadows,
	Ambient = LG.Ambient
}













if not getgenv().FullBrightExecuted then

	getgenv().FullBrightEnabled = false

	--Normal lighting settings
	getgenv().NormalLightingSettings = {
		Brightness = LG.Brightness,
		ClockTime = LG.ClockTime,
		FogEnd = LG.FogEnd,
		GlobalShadows = LG.GlobalShadows,
		Ambient = LG.Ambient
	}


	--If the values of the lighting changes it is updated here
	LG:GetPropertyChangedSignal("Brightness"):Connect(function()
		if LG.Brightness ~= 1 and LG.Brightness ~= getgenv().NormalLightingSettings.Brightness then
			getgenv().NormalLightingSettings.Brightness = LG.Brightness
			if not getgenv().FullBrightEnabled then
				repeat
					wait()
				until getgenv().FullBrightEnabled
			end
			LG.Brightness = 1
		end
	end)

	LG:GetPropertyChangedSignal("ClockTime"):Connect(function()
		if LG.ClockTime ~= 12 and LG.ClockTime ~= getgenv().NormalLightingSettings.ClockTime then
			getgenv().NormalLightingSettings.ClockTime = LG.ClockTime
			if not getgenv().FullBrightEnabled then
				repeat
					wait()
				until getgenv().FullBrightEnabled
			end
			LG.ClockTime = 12
		end
	end)

	LG:GetPropertyChangedSignal("FogEnd"):Connect(function()
		if LG.FogEnd ~= 786543 and LG.FogEnd ~= getgenv().NormalLightingSettings.FogEnd then
			getgenv().NormalLightingSettings.FogEnd = LG.FogEnd
			if not getgenv().FullBrightEnabled then
				repeat
					wait()
				until getgenv().FullBrightEnabled
			end
			LG.FogEnd = 786543
		end
	end)

	LG:GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if LG.GlobalShadows ~= false and LG.GlobalShadows ~= getgenv().NormalLightingSettings.GlobalShadows then
			getgenv().NormalLightingSettings.GlobalShadows = LG.GlobalShadows
			if not getgenv().FullBrightEnabled then
				repeat
					wait()
				until getgenv().FullBrightEnabled
			end
			LG.GlobalShadows = false
		end
	end)

	LG:GetPropertyChangedSignal("Ambient"):Connect(function()
		if LG.Ambient ~= Color3.fromRGB(178, 178, 178) and LG.Ambient ~= getgenv().NormalLightingSettings.Ambient then
			getgenv().NormalLightingSettings.Ambient = LG.Ambient
			if not getgenv().FullBrightEnabled then
				repeat
					wait()
				until getgenv().FullBrightEnabled
			end
			LG.Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	--Fullbright
	LG.Brightness = 1
	LG.ClockTime = 12
	LG.FogEnd = 786543
	LG.GlobalShadows = false
	LG.Ambient = Color3.fromRGB(178, 178, 178)

	--Toggle fullbright off and on
	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until getgenv().FullBrightEnabled
		while wait() do
			if getgenv().FullBrightEnabled ~= LatestValue then
				if not getgenv().FullBrightEnabled then
					LG.Brightness = getgenv().NormalLightingSettings.Brightness
					LG.ClockTime = getgenv().NormalLightingSettings.ClockTime
					LG.FogEnd = getgenv().NormalLightingSettings.FogEnd
					LG.GlobalShadows = getgenv().NormalLightingSettings.GlobalShadows
					LG.Ambient = getgenv().NormalLightingSettings.Ambient
				else
					LG.Brightness = 1
					LG.ClockTime = 12
					LG.FogEnd = 786543
					LG.GlobalShadows = false
					LG.Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

getgenv().FullBrightExecuted = true
getgenv().FullBrightEnabled = not getgenv().FullBrightEnabled