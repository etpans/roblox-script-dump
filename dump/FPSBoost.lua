--script updated by taronjr#0001

--Thanks for using!

local decalremover = true
local gm = game
local wspace = gm.Workspace
local lting = gm.Lighting

local terrain = wspace.Terrain

terrain.WaterTransparency = 0
terrain.WaterWaveSize = 0
terrain.WaterReflectance = 0
terrain.WaterWaveSpeed = 0

lting.FogEnd = 9e9
lting.GlobalShadows = false
lting.Brightness = 0

settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(gm:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalremover then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 133619618
    end
end
for i, e in pairs(lting:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end