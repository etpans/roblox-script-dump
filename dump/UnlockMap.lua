function unlockEverything(a)
for n,o in pairs(a:GetChildren())do
if(o:IsA("BasePart"))then o.Locked = false end
unlockEverything(o)
end
end

unlockEverything(Workspace)