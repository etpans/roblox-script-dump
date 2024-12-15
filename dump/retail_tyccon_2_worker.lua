local args = {
    [1] = "Janitor",
    [2] = {
        ["Type"] = "Janitor",
        ["Male"] = false,
        ["Face"] = 42113161,
        ["Age"] = 18,
        ["ShirtColor"] = Color3.new(0.4, 0.698039, 1),
        ["NameTable"] = {
            [1] = 14,
            [2] = 49,
        },
        ["Name"] = "Donna Bell",
        ["Pants"] = "TrackPants",
        ["Hats"] = {
            [1] = "BlackMessyBun",
            [2] = "GlassesBlackFrame",
        },
        ["PantsColor"] = Color3.new(0.835294, 0.803922, 0.65098),
        ["Shirt"] = "Polo",
    },
}

game:GetService("ReplicatedStorage").Remotes.HireWorker:InvokeServer(unpack(args))

local args = {
    [1] = "Janitor",
    [2] = {
        ["Type"] = "Janitor",
        ["Male"] = false,
        ["Face"] = 14890275,
        ["Age"] = 20,
        ["ShirtColor"] = Color3.new(0.4, 0.698039, 1),
        ["NameTable"] = {
            [1] = 15,
            [2] = 31,
        },
        ["Name"] = "Dorothy Baker",
        ["Pants"] = "TrackPants",
        ["Hats"] = {
            [1] = "RedHighPonytail",
        },
        ["PantsColor"] = Color3.new(0.835294, 0.803922, 0.65098),
        ["Shirt"] = "Polo",
    },
}

game:GetService("ReplicatedStorage").Remotes.HireWorker:InvokeServer(unpack(args))