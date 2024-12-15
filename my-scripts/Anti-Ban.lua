--Confirguration:
local SriptName = "AntiBan"

--Table:
if not getgenv().Settings then
    getgenv().Settings = {}
end

--Script:
while wait() do
    if game:IsLoaded() then
        if getgenv().Settings[SriptName] then
            print("Anti-Ban is already enabled")
            break
        end
        if not getgenv().Settings[SriptName] then
            setfflag("DFStringCrashPadUploadToBacktraceToBacktraceBaseUrl", "")
            setfflag("DFIntCrashUploadToBacktracePercentage", "0")
            setfflag("DFStringCrashUploadToBacktraceBlackholeToken", "")
            setfflag("DFStringCrashUploadToBacktraceWindowsPlayerToken", "")
            getgenv().Settings[SriptName] = true
            print("Anti-Ban Enabled")
            break
        end
    end
end