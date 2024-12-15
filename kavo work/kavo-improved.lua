local kavo = {}
kavo.gs = {}

kavo.themes = {
    Default = {
        SchemeColor = Color3.fromRGB(74, 99, 135),
        Background = Color3.fromRGB(36, 37, 43),
        Header = Color3.fromRGB(28, 29, 34),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(32, 32, 38)
    },
    DarkTheme = {
        SchemeColor = Color3.fromRGB(64, 64, 64),
        Background = Color3.fromRGB(0, 0, 0),
        Header = Color3.fromRGB(0, 0, 0),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(20, 20, 20)
    },
    LightTheme = {
        SchemeColor = Color3.fromRGB(150, 150, 150),
        Background = Color3.fromRGB(255, 255, 255),
        Header = Color3.fromRGB(200, 200, 200),
        TextColor = Color3.fromRGB(0, 0, 0),
        ElementColor = Color3.fromRGB(224, 224, 224)
    },
    BloodTheme = {
        SchemeColor = Color3.fromRGB(227, 27, 27),
        Background = Color3.fromRGB(10, 10, 10),
        Header = Color3.fromRGB(5, 5, 5),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(20, 20, 20)
    },
    GrapeTheme = {
        SchemeColor = Color3.fromRGB(166, 71, 214),
        Background = Color3.fromRGB(64, 50, 71),
        Header = Color3.fromRGB(36, 28, 41),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(74, 58, 84)
    },
    Ocean = {
        SchemeColor = Color3.fromRGB(86, 76, 251),
        Background = Color3.fromRGB(26, 32, 58),
        Header = Color3.fromRGB(38, 45, 71),
        TextColor = Color3.fromRGB(200, 200, 200),
        ElementColor = Color3.fromRGB(38, 45, 71)
    },
    Midnight = {
        SchemeColor = Color3.fromRGB(26, 189, 158),
        Background = Color3.fromRGB(44, 62, 82),
        Header = Color3.fromRGB(57, 81, 105),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(52, 74, 95)
    },
    Sentinel = {
        SchemeColor = Color3.fromRGB(230, 35, 69),
        Background = Color3.fromRGB(32, 32, 32),
        Header = Color3.fromRGB(24, 24, 24),
        TextColor = Color3.fromRGB(119, 209, 138),
        ElementColor = Color3.fromRGB(24, 24, 24)
    },
    Synapse = {
        SchemeColor = Color3.fromRGB(46, 48, 43),
        Background = Color3.fromRGB(13, 15, 12),
        Header = Color3.fromRGB(36, 38, 35),
        TextColor = Color3.fromRGB(152, 99, 53),
        ElementColor = Color3.fromRGB(24, 24, 24)
    },
    Serpent = {
        SchemeColor = Color3.fromRGB(0, 166, 58),
        Background = Color3.fromRGB(31, 41, 43),
        Header = Color3.fromRGB(22, 29, 31),
        TextColor = Color3.fromRGB(255, 255, 255),
        ElementColor = Color3.fromRGB(22, 29, 31)
    }
}

setmetatable(kavo.gs, {
    __index = function(_, service) return game:GetService(service) end,
    __newindex = function(t, i)
        t[i] = nil
        return
    end
})

local mouse = kavo.gs["Players"].LocalPlayer:GetMouse()

function kavo:Create(class, properties, radius)
    local object = Instance.new(class)

    for prop, val in next, properties do
        if object[prop] and prop ~= "Parent" then
            object[prop] = val
        end
    end
    
    if radius then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = radius
        corner.Parent = object
    end

    return object
end

function kavo:TweenObject(obj, properties, duration, ...) kavo.gs["TweenService"]:Create(obj, TweenInfo.new(duration, ...), properties):Play() end

function kavo.new(kavName, themeList)
    local kavObjects = {}
    local self2 = kavObjects
    local self = kavo

    local libName = tostring(math.random(1, 100)) .. tostring(math.random(1, 50)) .. tostring(math.random(1, 100))

    if not themeList then
        themeList = kavo.themes.Default
    elseif themeList == "DarkTheme" then
        themeList = kavo.themes.DarkTheme
    elseif themeList == "LightTheme" then
        themeList = kavo.themes.LightTheme
    elseif themeList == "BloodTheme" then
        themeList = kavo.themes.BloodTheme
    elseif themeList == "GrapeTheme" then
        themeList = kavo.themes.GrapeTheme
    elseif themeList == "Ocean" then
        themeList = kavo.themes.Ocean
    elseif themeList == "Midnight" then
        themeList = kavo.themes.Midnight
    elseif themeList == "Sentinel" then
        themeList = kavo.themes.Sentinel
    elseif themeList == "Synapse" then
        themeList = kavo.themes.Synapse
    elseif themeList == "Serpent" then
        themeList = kavo.themes.Serpent
    end

    local toggled = true
    local typing = false

    local kavData
    kavData = {
        UpConnection = nil,
        ToggleKey = Enum.KeyCode.BackSlash,
        CursorColor = Color3.fromRGB(255, 255, 255)
    }

    self2.ChangeToggleKey = function(NewKey)
        kavData.ToggleKey = NewKey

        if not kavName then
            self2.tip.Text = "Press '" .. string.sub(tostring(NewKey), 14) .. "' to hide this menu"
        end

        if kavData.UpConnection then
            kavData.UpConnection:Disconnect()
        end

        kavData.UpConnection = kavo.gs["UserInputService"].InputEnded:Connect(function(Input)
            if Input.KeyCode == kavData.ToggleKey and not typing then
                toggled = not toggled
                if not toggled then
                    local Tween = kavo.gs["TweenService"]:Create(self2.container, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 0, 0, 0)
                    })
                    Tween:Play()
                    Tween.Completed:Wait()
                    self2.userinterface.Enabled = false
                else
                    self2.userinterface.Enabled = true
                    local Tween = kavo.gs["TweenService"]:Create(self2.container, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 525, 0, 318)
                    })
                    Tween:Play()
                    Tween.Completed:Wait()
                end
            end
        end)
    end

    self2.ShowCursor = function(NewColor)
        if NewColor ~= nil then
            kavData.CursorColor = NewColor
        end

        self2.cursor = Drawing.new("Triangle")
        self2.cursor.Color = finityData.CursorColor
        self2.cursor.Visible = false
        self2.cursor.Thickness = 1
        self2.cursor.Filled = true

        self2.container.MouseEnter:Connect(function() self2.cursor.Visible = true end)
        self2.container.MouseLeave:Connect(function() self2.cursor.Visible = false end)

        self.gs["RunService"].RenderStepped:Connect(function()
            self2.cursor.PointA = Vector2.new(mouse.X, mouse.Y + 35)
            self2.cursor.PointB = Vector2.new(mouse.X, mouse.Y + 45)
            self2.cursor.PointC = Vector2.new(mouse.X + 7, mouse.Y + 42)
        end)
    end

    self2.ToggleUi = function()
        if kavo.gs["CoreGui"][LibName].Enabled then
            toggled = false
            local min = kavo.gs["TweenService"]:Create(self2.container, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 0, 0, 0)
            })
            min:Play()
            min.Completed:Wait()
            self2.userinterface.Enabled = false
        else
            toggled = true
            self2.userinterface.Enabled = true
            local max = kavo.gs["TweenService"]:Create(self2.container, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 525, 0, 318)
            })
            max:Play()
            max.Completed:Wait()
        end
    end

    self2.userinterface = self:Create("ScreenGui", {
        Name = libName,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global
    })

    kavData.UpConnection = kavo.gs["UserInputService"].InputEnded:Connect(function(Input)
        if Input.KeyCode == kavData.ToggleKey and not typing then
            toggled = not toggled
            if not toggled then
                local min = kavo.gs["TweenService"]:Create(self2.container, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 0, 0, 0)
                })
                min:Play()
                min.Completed:Wait()
                self2.userinterface.Enabled = false
            else
                self2.userinterface.Enabled = true
                local max = kavo.gs["TweenService"]:Create(self2.container, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 525, 0, 318)
                })
                max:Play()
                max.Completed:Wait()
            end
        end
    end)

    if not kavo.gs["RunService"]:IsStudio() then
        self2.userinterface.Parent = self.gs["CoreGui"]
    else
        self2.userinterface.Parent = self.gs["Players"].LocalPlayer:WaitForChild("PlayerGui")
    end

    self2.container = self:Create("Frame", {
        Name = "Container",
        BackgroundColor3 = themeList.Background,
        Position = UDim2.new(0.336503863, 0, 0.275485456, 0),
        Size = UDim2.new(0, 525, 0, 318)
    }, UDim.new(0, 4))
    self2.container.ClipsDescendants = true
    self2.container.Parent = self2.userinterface

    self2.header = self:Create("Frame", {
        Name = "Header",
        BackgroundColor3 = themeList.Header,
        Size = UDim2.new(0, 525, 0, 29)
    }, UDim.new(0, 4))
    self2.header.Parent = self2.container

    self2.title = self:Create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Font = Enum.Font.Gotham,
        Position = UDim2.new(0.0171428565, 0, 0.344827592, 0),
        Size = UDim2.new(0, 204, 0, 8),
        Text = "Press '" .. string.sub(tostring(self.ToggleKey), 14) .. "' to hide this menu",
        TextColor3 = Color3.fromRGB(245, 245, 245),
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    self2.title.RichText = true
    self2.title.Parent = self2.header

    pcall(function()
        local input = kavo.gs["UserInputService"]
        local frame = self2.header
        local parent = self2.container

        parent = parent or frame

        local dragging = false
        local dragInput, mosePos, framePos

        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                mousePos = input.Position
                framePos = parent.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        frame.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)

        input.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - mousePos
                parent.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
            end
        end)
    end)

    if kavName then
        self2.title.Text = kavName
    else
        self2.title.Text = "Press '" .. string.sub(tostring(self.ToggleKey), 14) .. "' to hide this menu"
    end

    function kavo.settitle(name) self2.title.Text = tostring(name) end

    self2.close = self:Create("ImageButton", {
        Name = "Close",
        BackgroundTransparency = 1,
        Image = "rbxassetid://3926305904",
        ImageRectOffset = Vector2.new(284, 4),
        ImageRectSize = Vector2.new(24, 24),
        Position = UDim2.new(0.949999988, 0, 0.137999997, 0),
        Size = UDim2.new(0, 21, 0, 21),
        ZIndex = 2
    })
    self2.close.Parent = self2.header

    self2.close.MouseButton1Click:Connect(function()
        local tween = kavo.gs["TweenService"]:Create(self2.container, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0, self2.container.AbsolutePosition.X + (self2.container.AbsoluteSize.X / 2), 0, self2.container.AbsolutePosition.Y + (self2.container.AbsoluteSize.Y / 2))
        })
        tween:Play()
        tween.Completed:Wait()
        self2.userinterface:Destroy()
    end)

    self2.header_cover = self:Create("Frame", {
        Name = "HeaderCover",
        BackgroundColor3 = themeList.Header,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0.758620679, 0),
        Size = UDim2.new(0, 525, 0, 7)
    })
    self2.header_cover.Parent = self2.header

    self2.sidebar = self:Create("Frame", {
        Name = "SideBar",
        BackgroundColor3 = themeList.Header,
        Position = UDim2.new(-7.4505806e-09, 0, 0.0911949649, 0),
        Size = UDim2.new(0, 149, 0, 289)
    }, UDim.new(0, 4))
    self2.sidebar.Parent = self2.container

    self2.categories = self:Create("Frame", {
        Name = "Categories",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0.0438990258, 0, -0.00066378375, 0),
        Size = UDim2.new(0, 135, 0, 283)
    })
    self2.categories.Parent = self2.sidebar

    self2.category_layout = self:Create("UIListLayout", {
        Name = "CategoryLayout",
        SortOrder = Enum.SortOrder.LayoutOrder
    })
    self2.category_layout.Parent = self2.categories

    self2.sidebar_cover = self:Create("Frame", {
        Name = "SideBarCover",
        BackgroundColor3 = themeList.Header,
        BorderSizePixel = 0,
        Position = UDim2.new(0.949939311, 0, 0, 0),
        Size = UDim2.new(0, 7, 0, 289)
    })
    self2.sidebar_cover.Parent = self2.sidebar

    self2.pages = self:Create("Frame", {
        Name = "Pages",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0.299047589, 0, 0.122641519, 0),
        Size = UDim2.new(0, 360, 0, 269)
    })
    self2.pages.Parent = self2.container

    self2.infocontainer = self:Create("Frame", {
        Name = "InfoContainer",
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.new(0.299047619, 0, 0.874213815, 0),
        Size = UDim2.new(0, 368, 0, 33)
    })
    self2.infocontainer.ClipsDescendants = true
    self2.infocontainer.Parent = self2.container

    self2.blurframe = self:Create("Frame", {
        Name = "BlurFrame",
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(-0.0222222228, 0, -0.0371747203, 0),
        Size = UDim2.new(0, 376, 0, 289),
        ZIndex = 5
    })
    self2.blurframe.Parent = self2.pages

    local first = true

    function self2:Category(name)
        local category = {}

        category.page = kavo:Create("ScrollingFrame", {
            Name = name .. "Category",
            Active = true,
            BackgroundColor3 = themeList.Background,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 0, -0.00371747208, 0),
            Size = UDim2.new(1, 0, 1, 0),
            ScrollBarThickness = 5,
            ScrollBarImageColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 16, themeList.SchemeColor.g * 255 - 15, themeList.SchemeColor.b * 255 - 28),
            Visible = false
        })
        category.page.Parent = self2.pages

        category.page_layout = kavo:Create("UIListLayout", {
            Name = "PageLayout",
            Padding = UDim.new(0, 5),
            SortOrder = Enum.SortOrder.LayoutOrder
        })
        category.page_layout.Parent = category.page

        category.button = kavo:Create("TextButton", {
            Name = name .. "Button",
            AutoButtonColor = false,
            BackgroundColor3 = themeList.SchemeColor,
            BackgroundTransparency = 1,
            Font = Enum.Font.Gotham,
            Size = UDim2.new(0, 135, 0, 28),
            Text = name,
            TextColor3 = themeList.TextColor,
            TextSize = 14
        }, UDim.new(0, 5))
        category.button.Parent = self2.categories

        local function UpdateSize()
            local cS = category.page_layout.AbsoluteContentSize

            kavo.gs["TweenService"]:Create(category.page, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                CanvasSize = UDim2.new(0, cS.X, 0, cS.Y)
            }):Play()
        end

        if first then
            first = false
            category.page.Visible = true
            category.button.BackgroundTransparency = 0
            UpdateSize()
        else
            category.page.Visible = false
            category.button.BackgroundTransparency = 1
        end

        UpdateSize()
        category.page.ChildAdded:Connect(UpdateSize)
        category.page.ChildRemoved:Connect(UpdateSize)

        category.button.MouseButton1Click:Connect(function()
            UpdateSize()
            for i, v in next, self2.pages:GetChildren() do
                v.Visible = false
            end
            category.page.Visible = true
            for i, v in next, self2.categories:GetChildren() do
                if v:IsA("TextButton") then
                    if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
                        kavo:TweenObject(v, {
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        }, 0.2)
                    end
                    if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
                        kavo:TweenObject(v, {
                            TextColor3 = Color3.fromRGB(0, 0, 0)
                        }, 0.2)
                    end
                    kavo:TweenObject(v, {
                        BackgroundTransparency = 1
                    }, 0.2)
                end
            end
            if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
                kavo:TweenObject(category.button, {
                    TextColor3 = Color3.fromRGB(0, 0, 0)
                }, 0.2)
            end
            if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
                kavo:TweenObject(category.button, {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }, 0.2)
            end
            kavo:TweenObject(category.button, {
                BackgroundTransparency = 0
            }, 0.2)
        end)

        local focusing = false
        local viewde = false

        coroutine.wrap(function()
            while wait() do
                category.page.BackgroundColor3 = themeList.Background
                category.page.ScrollBarImageColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 16, themeList.SchemeColor.g * 255 - 15, themeList.SchemeColor.b * 255 - 28)
                category.button.TextColor3 = themeList.TextColor
                category.button.BackgroundColor3 = themeList.SchemeColor
            end
        end)()

        function category:Section(name, hidden)
            local section = {}
            hidden = hidden or false

            section.page = kavo:Create("Frame", {
                Name = name .. "Section",
                BackgroundColor3 = themeList.Background,
                BorderSizePixel = 0
            })
            section.page.Parent = category.page

            section.page_layout = kavo:Create("UIListLayout", {
                Name = "SectionLayout",
                Padding = UDim.new(0, 5),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            section.page_layout.Parent = section.page

            section.header = kavo:Create("Frame", {
                Name = "SectionHeader",
                BackgroundColor3 = themeList.SchemeColor,
                Size = UDim2.new(0, 352, 0, 33)
            }, UDim.new(0, 4))
            section.header.Parent = section.page

            section.name = kavo:Create("TextLabel", {
                Name = "SectionName",
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Font = Enum.Font.Gotham,
                Position = UDim2.new(0.0198863633, 0, 0, 0),
                Size = UDim2.new(0.980113626, 0, 1, 0),
                Text = name,
                TextColor3 = themeList.TextColor,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            })
            section.name.Parent = section.header
            section.name.RichText = true

            section.container = kavo:Create("Frame", {
                Name = "SectionContainer",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 0, 0.190751448, 0)
            })
            section.container.Parent = section.page

            section.container_layout = kavo:Create("UIListLayout", {
                Name = "SectionContainerLayout",
                Padding = UDim.new(0, 3),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            section.container_layout.Parent = section.container

            local function UpdateSectionFrame()
                local innerSc = section.container_layout.AbsoluteContentSize
                section.container.Size = UDim2.new(1, 0, 0, innerSc.Y)
                local frameSc = section.page_layout.AbsoluteContentSize
                section.page.Size = UDim2.new(0, 352, 0, frameSc.Y)
            end

            if hidden then
                section.header.Visible = false
            else
                section.header.Visible = true
            end

            if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
                kavo:TweenObject(section.name, {
                    TextColor3 = Color3.fromRGB(0, 0, 0)
                }, 0.2)
            end
            if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
                kavo:TweenObject(section.name, {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }, 0.2)
            end

            coroutine.wrap(function()
                while wait() do
                    section.page.BackgroundColor3 = themeList.Background
                    section.header.BackgroundColor3 = themeList.SchemeColor
                    category.button.TextColor3 = themeList.TextColor
                    category.button.BackgroundColor3 = themeList.SchemeColor
                    section.name.TextColor3 = themeList.TextColor
                end
            end)()

            UpdateSize()
            UpdateSectionFrame()

            function section:Cheat(kind, name, tip, callback, data)
                local cheat = {}
                cheat.value = nil

                cheat.information = kavo:Create("TextLabel", {
                    Name = "Information",
                    BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13),
                    Font = Enum.Font.GothamSemibold,
                    Position = UDim2.new(0, 0, 2, 0),
                    Size = UDim2.new(0, 353, 0, 33),
                    Text = "  " .. tip,
                    TextColor3 = themeList.TextColor,
                    TextScaled = true,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 9
                }, UDim.new(0, 4))
                cheat.information.Parent = self2.infocontainer

                cheat.element = kavo:Create("TextButton", {
                    Name = kind,
                    AutoButtonColor = false,
                    BackgroundColor3 = themeList.ElementColor,
                    Size = UDim2.new(0, 352, 0, 33),
                    TextTransparency = 1
                })
                cheat.element.ClipsDescendants = true
                cheat.element.Parent = section.container

                cheat.element_label = kavo:Create("TextLabel", {
                    Name = "Label",
                    BackgroundTransparency = 1,
                    Font = Enum.Font.GothamSemibold,
                    Position = UDim2.new(0.096704483, 0, 0.272727281, 0),
                    Size = UDim2.new(0, 314, 0, 14),
                    Text = name,
                    TextColor3 = themeList.TextColor,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left
                })
                cheat.element_label.RichText = true
                cheat.element_label.Parent = cheat.element

                if kind then
                    if string.lower(kind) == "toggle" then
                        cheat.value = false

                        cheat.toggle = kavo:Create("TextButton", {
                            Name = name .. "Toggle",
                            AutoButtonColor = false,
                            BackgroundColor3 = themeList.ElementColor,
                            Size = UDim2.new(0, 352, 0, 33),
                            TextTransparency = 1
                        })
                        cheat.toggle.ClipsDescendants = true
                        cheat.toggle.Parent = section.container

                        cheat.togglecorner = kavo:Create("UICorner", {
                            Name = "ToggleCorner",
                            CornerRadius = UDim.new(0, 4)
                        })
                        cheat.togglecorner.Parent = cheat.toggle

                        cheat.toggledisabled = kavo:Create("ImageLabel", {
                            Name = "ToggleDisabled",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926309567",
                            ImageColor3 = themeList.SchemeColor,
                            ImageRectOffset = Vector2.new(628, 420),
                            ImageRectSize = Vector2.new(48, 48),
                            Position = UDim2.new(0.0199999996, 0, 0.180000007, 0),
                            Size = UDim2.new(0, 21, 0, 21)
                        })
                        cheat.toggledisabled.Parent = cheat.toggle

                        cheat.toggleenabled = kavo:Create("ImageLabel", {
                            Name = "ToggleEnabled",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926309567",
                            ImageColor3 = themeList.SchemeColor,
                            ImageRectOffset = Vector2.new(784, 420),
                            ImageRectSize = Vector2.new(48, 48),
                            ImageTransparency = 1,
                            Position = UDim2.new(0.0199999996, 0, 0.180000007, 0),
                            Size = UDim2.new(0, 21, 0, 21)
                        })
                        cheat.toggleenabled.Parent = cheat.toggle

                        cheat.togglelabel = kavo:Create("TextLabel", {
                            Name = "ToggleName",
                            BackgroundTransparency = 1,
                            Font = Enum.Font.GothamSemibold,
                            Position = UDim2.new(0.096704483, 0, 0.272727281, 0),
                            Size = UDim2.new(0, 288, 0, 14),
                            Text = name,
                            TextColor3 = themeList.TextColor,
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                        cheat.togglelabel.Parent = cheat.toggle
                        cheat.togglelabel.RichText = true

                        cheat.informationbutton = kavo:Create("ImageButton", {
                            Name = "ToggleInformation",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926305904",
                            ImageColor3 = themeList.SchemeColor,
                            ImageRectOffset = Vector2.new(764, 764),
                            ImageRectSize = Vector2.new(36, 36),
                            LayoutOrder = 9,
                            Position = UDim2.new(0.930000007, 0, 0.151999995, 0),
                            Size = UDim2.new(0, 23, 0, 23),
                            ZIndex = 2
                        })
                        cheat.informationbutton.Parent = cheat.toggle

                        cheat.toggleanimation = kavo:Create("ImageLabel", {
                            Name = "ToggleAnimation",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://4560909609",
                            ImageColor3 = themeList.SchemeColor,
                            ImageTransparency = 0.6
                        })
                        cheat.toggleanimation.Parent = cheat.toggle

                        if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
                            kavo:TweenObject(cheat.information, {
                                TextColor3 = Color3.fromRGB(0, 0, 0)
                            }, 0.2)
                        end
                        if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
                            kavo:TweenObject(cheat.information, {
                                TextColor3 = Color3.fromRGB(255, 255, 255)
                            }, 0.2)
                        end

                        UpdateSectionFrame()
                        UpdateSize()

                        cheat.toggle.MouseButton1Click:Connect(function()
                            if not focusing then
                                cheat.value = not cheat.value
                                pcall(callback, cheat.value)

                                if cheat.value then
                                    kavo.gs["TweenService"]:Create(cheat.toggleenabled, TweenInfo.new(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 0
                                    }):Play()
                                    local clone = cheat.toggleanimation:Clone()
                                    clone.Parent = cheat.toggle
                                    local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                    clone.Position = UDim2.new(0, x, 0, y)
                                    local length, size = 0.35, nil
                                    if cheat.toggle.AbsoluteSize.X >= cheat.toggle.AbsoluteSize.Y then
                                        size = (cheat.toggle.AbsoluteSize.X * 1.5)
                                    else
                                        size = (cheat.toggle.AbsoluteSize.Y * 1.5)
                                    end
                                    clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                                    for i = 1, 10 do
                                        clone.ImageTransparency = clone.ImageTransparency + 0.05
                                        wait(length / 12)
                                    end
                                    clone:Destroy()
                                else
                                    kavo.gs["TweenService"]:Create(cheat.toggleenabled, TweenInfo.new(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 1
                                    }):Play()
                                    local clone = cheat.toggleanimation:Clone()
                                    clone.Parent = cheat.toggle
                                    local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                    clone.Position = UDim2.new(0, x, 0, y)
                                    local length, size = 0.35, nil
                                    if cheat.toggle.AbsoluteSize.X >= cheat.toggle.AbsoluteSize.Y then
                                        size = (cheat.toggle.AbsoluteSize.X * 1.5)
                                    else
                                        size = (cheat.toggle.AbsoluteSize.Y * 1.5)
                                    end
                                    clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                                    for i = 1, 10 do
                                        clone.ImageTransparency = clone.ImageTransparency + 0.05
                                        wait(length / 12)
                                    end
                                    clone:Destroy()
                                end
                            else
                                for i, v in next, self2.infocontainer:GetChildren() do
                                    kavo:TweenObject(v, {
                                        Position = UDim2.new(0, 0, 2, 0)
                                    }, 0.2)
                                    focusing = false
                                end
                                kavo:TweenObject(self2.blurframe, {
                                    BackgroundTransparency = 1
                                }, 0.2)
                            end
                        end)

                        if data then
                            if data.enabled then
                                spawn(function()
                                    cheat.value = true
                                    pcall(callback, cheat.value)

                                    kavo.gs["TweenService"]:Create(cheat.toggleenabled, TweenInfo.new(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 0
                                    }):Play()
                                    local clone = cheat.toggleanimation:Clone()
                                    clone.Parent = cheat.toggle
                                    local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                    clone.Position = UDim2.new(0, x, 0, y)
                                    local length, size = 0.35, nil
                                    if cheat.toggle.AbsoluteSize.X >= cheat.toggle.AbsoluteSize.Y then
                                        size = (cheat.toggle.AbsoluteSize.X * 1.5)
                                    else
                                        size = (cheat.toggle.AbsoluteSize.Y * 1.5)
                                    end
                                    clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                                    for i = 1, 10 do
                                        clone.ImageTransparency = clone.ImageTransparency + 0.05
                                        wait(length / 12)
                                    end
                                    clone:Destroy()
                                end)
                            end
                        end

                        local hovering = false
                        cheat.toggle.MouseEnter:Connect(function()
                            if not focusing then
                                kavo.gs["TweenService"]:Create(cheat.toggle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                                }):Play()
                                hovering = true
                            end
                        end)

                        cheat.toggle.MouseLeave:Connect(function()
                            if not focusing then
                                kavo.gs["TweenService"]:Create(cheat.toggle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = themeList.ElementColor
                                }):Play()
                                hovering = false
                            end
                        end)

                        cheat.informationbutton.MouseButton1Click:Connect(function()
                            if not viewde then
                                viewde = true
                                focusing = true
                                for i, v in next, self2.infocontainer:GetChildren() do
                                    if v ~= cheat.information then
                                        kavo:TweenObject(v, {
                                            Position = UDim2.new(0, 0, 2, 0)
                                        }, 0.2)
                                    end
                                end
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 0, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blurframe, {
                                    BackgroundTransparency = 0.5
                                }, 0.2)
                                kavo:TweenObject(cheat.toggle, {
                                    BackgroundColor3 = themeList.ElementColor
                                }, 0.2)
                                wait(1.5)
                                focusing = false
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 2, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blurframe, {
                                    BackgroundTransparency = 1
                                }, 0.2)
                                wait()
                                viewde = false
                            end
                        end)

                        coroutine.wrap(function()
                            while wait() do
                                if not hovering then
                                    cheat.toggle.BackgroundColor3 = themeList.ElementColor
                                end 
                                cheat.toggledisabled.ImageColor3 = themeList.SchemeColor
                                cheat.toggleenabled.ImageColor3 = themeList.SchemeColor
                                cheat.togglelabel.TextColor3 = themeList.TextColor
                                cheat.informationbutton.ImageColor3 = themeList.SchemeColor
                                cheat.toggleanimation.ImageColor3 = themeList.SchemeColor
                                cheat.information.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                                cheat.information.TextColor3 = themeList.TextColor
                            end
                        end)()

                        function cheat:SetValue(value)
                            cheat.value = value

                            if cheat.value then
                                kavo.gs["TweenService"]:Create(cheat.toggleenabled, TweenInfo.new(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0
                                }):Play()
                                local clone = cheat.toggleanimation:Clone()
                                clone.Parent = cheat.toggle
                                local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                clone.Position = UDim2.new(0, x, 0, y)
                                local length, size = 0.35, nil
                                if cheat.toggle.AbsoluteSize.X >= cheat.toggle.AbsoluteSize.Y then
                                    size = (cheat.toggle.AbsoluteSize.X * 1.5)
                                else
                                    size = (cheat.toggle.AbsoluteSize.Y * 1.5)
                                end
                                clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                                for i = 1, 10 do
                                    clone.ImageTransparency = clone.ImageTransparency + 0.05
                                    wait(length / 12)
                                end
                                clone:Destroy()
                            else
                                kavo.gs["TweenService"]:Create(cheat.toggleenabled, TweenInfo.new(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 1
                                }):Play()
                                local clone = cheat.toggleanimation:Clone()
                                clone.Parent = cheat.toggle
                                local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                clone.Position = UDim2.new(0, x, 0, y)
                                local length, size = 0.35, nil
                                if cheat.toggle.AbsoluteSize.X >= cheat.toggle.AbsoluteSize.Y then
                                    size = (cheat.toggle.AbsoluteSize.X * 1.5)
                                else
                                    size = (cheat.toggle.AbsoluteSize.Y * 1.5)
                                end
                                clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                                for i = 1, 10 do
                                    clone.ImageTransparency = clone.ImageTransparency + 0.05
                                    wait(length / 12)
                                end
                                clone:Destroy()
                            end
                        end
                    elseif string.lower(kind) == "colorpicker" then
                        cheat.value = Color3.fromRGB(1, 1, 1)
                        local colortoggled = false

                        if data then
                            if data.color then
                                cheat.value = data.color
                            end
                        end

                        cheat.colorpicker = kavo:Create("TextButton", {
                            Name = Name .. "ColorPicker",
                            AutoButtonColor = false,
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 0, 0.566834569, 0),
                            Size = UDim2.new(0, 352, 0, 33),
                            TextTransparency = 1
                        })
                        cheat.colorpicker.ClipsDescendants = true
                        cheat.colorpicker.Parent = section.container

                        cheat.colorpickercorner = kavo:Create("UICorner", {
                            Name = "ColorPickerCorner",
                            CornerRadius = UDim.new(0, 4)
                        })
                        cheat.colorpickercorner.Parent = cheat.colorpicker

                        cheat.colorpickerheader = kavo:Create("Frame", {
                            Name = "ColorPickerHeader",
                            BackgroundColor3 = themeList.ElementColor,
                            ClipsDescendants = true,
                            Size = UDim2.new(0, 352, 0, 33)
                        })
                        cheat.colorpickerheader.Parent = cheat.colorpicker

                        cheat.colorpickerheadercorner = kavo:Create("UICorner", {
                            Name = "ColorPickerHeaderCorner",
                            CornerRadius = UDim.new(0, 4)
                        })
                        cheat.colorpickerheadercorner.Parent = cheat.colorpickerheader

                        cheat.colorpickericon = kavo:Create("ImageLabel", {
                            Name = "ColorPickerIcon",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926305904",
                            ImageColor3 = themeList.SchemeColor,
                            ImageRectOffset = Vector2.new(44, 964),
                            ImageRectSize = Vector2.new(36, 36),
                            Position = UDim2.new(0.0199999996, 0, 0.180000007, 0),
                            Size = UDim2.new(0, 21, 0, 21)
                        })
                        cheat.colorpickericon.Parent = cheat.colorheader

                        cheat.colorpickername = kavo:Create("TextLabel", {
                            Name = "ColorPickerName",
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0.096704483, 0, 0.272727281, 0),
                            Size = UDim2.new(0, 288, 0, 14),
                            Text = name,
                            TextColor3 = themeList.TextColor,
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                        cheat.colorpickername.RichText = true
                        cheat.colorpickername.Parent = cheat.colorpickerheader

                        cheat.informationbutton = kavo:Create("ImageButton", {
                            Name = "ToggleInformation",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926305904",
                            ImageColor3 = themeList.SchemeColor,
                            ImageRectOffset = Vector2.new(764, 764),
                            ImageRectSize = Vector2.new(36, 36),
                            LayoutOrder = 9,
                            Position = UDim2.new(0.930000007, 0, 0.151999995, 0),
                            Size = UDim2.new(0, 23, 0, 23),
                            ZIndex = 2
                        })

                        cheat.informationbutton.MouseButton1Click:Connect(function()
                            if not viewde then
                                viewde = true
                                focusing = true
                                for i, v in next, self2.infocontainer:GetChildren() do
                                    if v ~= cheat.information then
                                        kavo:TweenObject(v, {
                                            Position = UDim2.new(0, 0, 2, 0)
                                        }, 0.2)
                                    end
                                end
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 0, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blurframe, {
                                    BackgroundTransparency = 0.5
                                }, 0.2)
                                kavo:TweenObject(cheat.colorpicker, {
                                    BackgroundColor3 = themeList.ElementColor
                                }, 0.2)
                                wait(1.5)
                                focusing = false
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 2, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blurframe, {
                                    BackgroundTransparency = 1
                                }, 0.2)
                                wait()
                                viewde = false
                            end
                        end)

                        cheat.currentcolor = kavo:Create("Frame", {
                            Name = "CurrentColor",
                            BackgroundColor3 = themeList.ElementColor,
                            Position = UDim2.new(0, 0, 0.255319148, 0),
                            Size = UDim2.new(0, 352, 0, 105)
                        })
                        cheat.currentcolor.Parent = cheat.header

                        cheat.currentcolorcorner = kavo:Create("UICorner", {
                            Name = "CurrentColorCorner",
                            CornerRadius = UDim.new(0, 4)
                        })
                        cheat.currentcolorcorner.Parent = cheat.currentcolor

                        cheat.colorpickerlayout = kavo:Create("UIListLayout", {
                            Name = "ColorPickerLayout",
                            Padding = UDim.new(0, 3),
                            SortOrder = Enum.SortOrder.LayoutOrder
                        })
                        cheat.colorpickerlayout.Parent = cheat.colorpickercorner

                        cheat.information.Parent = self2.infocontainer
                        cheat.informationcorner.Parent = cheat.information
                    elseif string.lower(kind) == "dropdown" then
                        
                    elseif string.lower(kind) == "textbox" then

                    elseif string.lower(kind) == "slider" then

                    elseif string.lower(kind) == "button" then
                        cheat.button = kavo:Create("TextButton", {
                            Name = name .. "Button",
                            AutoButtonColor = false,
                            BackgroundColor3 = themeList.ElementColor,
                            Size = UDim2.new(0, 352, 0, 33),
                            TextTransparency = 1
                        })
                        cheat.button.ClipsDescendants = true
                        cheat.button.Parent = section.container

                        cheat.buttoncorner = kavo:Create("UICorner", {
                            Name = "ButtonCorner",
                            CornerRadius = UDim.new(0, 4)
                        })
                        cheat.buttoncorner.Parent = cheat.button

                        cheat.buttonlabel = kavo:Create("TextLabel", {
                            Name = "ButtonLabel",
                            BackgroundTransparency = 1,
                            Font = Enum.Font.GothamSemibold,
                            Position = UDim2.new(0.096704483, 0, 0.272727281, 0),
                            Size = UDim2.new(0, 314, 0, 14),
                            Text = name,
                            TextColor3 = themeList.TextColor,
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                        cheat.buttonlabel.RichText = true
                        cheat.buttonlabel.Parent = cheat.button

                        cheat.informationbutton = kavo:Create("ImageButton", {
                            Name = "ButtonInformation",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926305904",
                            ImageColor3 = themeList.SchemeColor,
                            ImageRectOffset = Vector2.new(764, 764),
                            ImageRectSize = Vector2.new(36, 36),
                            LayoutOrder = 9,
                            Position = UDim2.new(0.930000007, 0, 0.151999995, 0),
                            Size = UDim2.new(0, 23, 0, 23),
                            ZIndex = 2
                        })
                        cheat.informationbutton.Parent = cheat.button

                        cheat.buttonicon = kavo:Create("ImageLabel", {
                            Name = "ButtonIcon",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926305904",
                            ImageColor3 = themeList.Schemecolor,
                            ImageRectOffset = Vector2.new(84, 204),
                            ImageRectSize = Vector2.new(36, 36),
                            Position = UDim2.new(0.0199999996, 0, 0.180000007, 0),
                            Size = UDim2.new(0, 21, 0, 21)
                        })
                        cheat.buttonicon.Parent = cheat.button

                        cheat.buttonanimation = kavo:Create("ImageLabel", {
                            Name = "ButtonAnimation",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://4560909609",
                            ImageColor3 = themeList.SchemeColor,
                            ImageTransparency = 0.6
                        })
                        cheat.buttonanimation.Parent = cheat.button

                        if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
                            kavo:TweenObject(cheat.information, {
                                TextColor3 = Color3.fromRGB(0, 0, 0)
                            }, 0.2)
                        end
                        if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
                            kavo:TweenObject(cheat.information, {
                                TextColor3 = Color3.fromRGB(255, 255, 255)
                            }, 0.2)
                        end

                        UpdateSectionFrame()
                        UpdateSize()

                        cheat.button.MouseButton1Click:Connect(function()
                            if not focusing then
                                callback()
                                local clone = cheat.buttonanimation:Clone()
                                clone.Parent = cheat.button
                                local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                clone.Position = UDim2.new(0, x, 0, y)
                                local length, size = 0.35, nil
                                if cheat.button.AbsoluteSize.X >= cheat.button.AbsoluteSize.Y then
                                    size = (cheat.button.AbsoluteSize.X * 1.5)
                                else
                                    size = (cheat.button.AbsoluteSize.Y * 1.5)
                                end
                                clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                                for i = 1, 10 do
                                    clone.ImageTransparency = clone.ImageTransparency + 0.05
                                    wait(length / 12)
                                end
                                clone:Destroy()
                            else
                                for i, v in next, self2.infocontainer:GetChildren() do
                                    kavo:TweenObject(v, {
                                        Position = UDim2.new(0, 0, 2, 0)
                                    }, 0.2)
                                    focusing = false
                                end
                                kavo:TweenObject(self2.blurframe, {
                                    BackgroundTransparency = 1
                                }, 0.2)
                            end
                        end)

                        local hovering = false

                        cheat.button.MouseEnter:Connect(function()
                            if not focusing then
                                kavo.gs["TweenService"]:Create(cheat.button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                                }):Play()
                                hovering = true
                            end
                        end)

                        cheat.button.MouseLeave:Connect(function()
                            if not focusing then
                                kavo.gs["TweenService"]:Create(cheat.button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = themeList.ElementColor
                                }):Play()
                                hovering = false
                            end
                        end)

                        cheat.informationbutton.MouseButton1Click:Connect(function()
                            if not viewde then
                                viewde = true
                                focusing = true
                                for i, v in next, self2.infocontainer:GetChildren() do
                                    if v ~= cheat.information then
                                        kavo:TweenObject(v, {
                                            Position = UDim2.new(0, 0, 2, 0)
                                        }, 0.2)
                                    end
                                end
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 0, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blurframe, {
                                    BackgroundTransparency = 0.5
                                }, 0.2)
                                kavo:TweenObject(cheat.button, {
                                    BackgroundColor3 = themeList.ElementColor
                                }, 0.2)
                                wait(1.5)
                                focusing = false
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 2, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blurframe, {
                                    BackgroundTransparency = 1
                                }, 0.2)
                                wait()
                                viewde = false
                            end
                        end)

                        coroutine.wrap(function()
                            while wait() do
                                if not hovering then
                                    cheat.button.BackgroundColor3 = themeList.ElementColor
                                end
                                cheat.informationbutton.ImageColor3 = themeList.SchemeColor
                                cheat.buttonanimation.ImageColor3 = themeList.SchemeColor
                                cheat.information.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                                cheat.information.TextColor3 = themeList.TextColor
                                cheat.buttonicon.ImageColor3 = themeList.SchemeColor
                                cheat.buttonlabel.TextColor3 = themeList.TextColor
                            end
                        end)()

                        function cheat:Fire()
                            callback()
                            local clone = cheat.buttonanimation:Clone()
                            clone.Parent = cheat.button
                            local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                            clone.Position = UDim2.new(0, x, 0, y)
                            local length, size = 0.35, nil
                            if cheat.button.AbsoluteSize.X >= cheat.button.AbsoluteSize.Y then
                                size = (cheat.button.AbsoluteSize.X * 1.5)
                            else
                                size = (cheat.button.AbsoluteSize.Y * 1.5)
                            end
                            clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                            for i = 1, 10 do
                                clone.ImageTransparency = clone.ImageTransparency + 0.05
                                wait(length / 12)
                            end
                            clone:Destroy()
                        end

                    elseif string.lower(kind) == "keybind" then
                        local callback_bind = data and data.bind
                        local connection
                        local firstcheck

                        cheat.keybind = kavo:Create("TextButton", {
                            Name = name .. "Keybind",
                            AutoButtonColor = false,
                            BackgroundColor3 = themeList.ElementColor,
                            TextTransparency = 1,
                            Size = UDim2.new(0, 352, 0, 33)
                        })
                        cheat.keybind.ClipsDescendants = true
                        cheat.keybind.Parent = section.container

                        cheat.keybindcorner = kavo:Create("UICorner", {
                            Name = "KeybindCorner",
                            CornerRadius = UDim.new(0, 4)
                        })
                        cheat.keybindcorner.Parent = cheat.keybind

                        cheat.keybindlabel = kavo:Create("TextLabel", {
                            Name = "KeybindLabel",
                            BackgroundTransparency = 1,
                            Font = Enum.Font.GothamSemibold,
                            Position = UDim2.new(0.096704483, 0, 0.272727281, 0),
                            Size = UDim2.new(0, 222, 0, 14),
                            Text = name,
                            TextColor3 = themeList.TextColor,
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Right
                        })
                        cheat.keybindlabel.RichText = true
                        cheat.keybindlabel.Parent = cheat.keybind

                        cheat.keybindname = kavo:Create("TextLabel", {
                            Name = "KeybindName",
                            BackgroundTransparency = 1,
                            Font = Enum.Font.GothamSemibold,
                            Position = UDim2.new(0.727386296, 0, 0.272727281, 0),
                            Size = UDim2.new(0, 70, 0, 14),
                            Text = data.bind,
                            TextColor3 = themeList.SchemeColor,
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Right
                        })
                        cheat.keybindname.Parent = cheat.keybind

                        cheat.keybindicon = kavo:Create("ImageLabel", {
                            Name = "KeybindIcon",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926305904",
                            ImageColor3 = themeList.SchemeColor,
                            ImageRectOffset = Vector2.new(364, 284),
                            ImageRectSize = Vector2.new(36, 36),
                            Position = UDim2.new(0.0199999996, 0, 0.180000007, 0),
                            Size = UDim2.new(0, 21, 0, 21)
                        })
                        cheat.keybindicon.Parent = cheat.keybind

                        cheat.informationbutton = kavo:Create("ImageButton", {
                            Name = "ToggleInformation",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926305904",
                            ImageColor3 = themeList.SchemeColor,
                            ImageRectOffset = Vector2.new(764, 764),
                            ImageRectSize = Vector2.new(36, 36),
                            LayoutOrder = 9,
                            Position = UDim2.new(0.930000007, 0, 0.151999995, 0),
                            Size = UDim2.new(0, 23, 0, 23),
                            ZIndex = 2
                        })
                        cheat.informationbutton.Parent = cheat.toggle

                        cheat.keybindanimation = kavo:Create("ImageLabel", {
                            Name = "KeybindAnimation",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926305904",
                            ImageColor3 = themeList.SchemeColor,
                            ImageRectOffset = Vector2.new(364, 284),
                            ImageRectSize = Vector2.new(36, 36),
                            Position = UDim2.new(0.0199999996, 0, 0.180000007, 0),
                            Size = UDim2.new(0, 21, 0, 21)
                        })
                        cheat.keybindanimation.Parent = cheat.keybind

                        if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
                            kavo:TweenObject(cheat.information, {
                                TextColor3 = Color3.fromRGB(0, 0, 0)
                            }, 0.2)
                        end
                        if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
                            kavo:TweenObject(cheat.information, {
                                TextColor3 = Color3.fromRGB(255, 255, 255)
                            }, 0.2)
                        end

                        UpdateSectionFrame()
                        UpdateSize()

                        cheat.informationbutton.MouseButton1Click:Connect(function()
                            if not viewde then
                                viewde = true
                                focusing = true
                                for i, v in next, self2.infocontainer:GetChildren() do
                                    if v ~= cheat.information then
                                        kavo:TweenObject(v, {
                                            Position = UDim2.new(0, 0, 2, 0)
                                        }, 0.2)
                                    end
                                end
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 0, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blurframe, {
                                    BackgroundTransparency = 0.5
                                }, 0.2)
                                kavo:TweenObject(cheat.button, {
                                    BackgroundColor3 = themeList.ElementColor
                                }, 0.2)
                                wait(1.5)
                                focusing = false
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 2, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blurframe, {
                                    BackgroundTransparency = 1
                                }, 0.2)
                                wait()
                                viewde = false
                            end
                        end)

                        local hover = false

                        cheat.keybind.MouseEnter:Connect(function()
                            if not focusing then
                                kavo.gs["TweenService"]:Create(cheat.keybind, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                                }):Play()
                                hover = true
                            end
                        end)

                        cheat.keybind.MouseLeave:Connect(function()
                            if not focusing then
                                kavo.gs["TweenService"]:Create(cheat.keybind, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = themeList.ElementColor
                                }):Play()
                                hover = false
                            end
                        end)

                        cheat.keybind.MouseButton1Click:Connect(function()
                            if not focusing then
                                cheat.keybindname = ". . ."
                                local a, b = kavo.gs["UserInputService"].InputBegan:Wait()
                                if a.KeyCode.Name ~= "Unknown" and Input.KeyCode ~= kavData.ToggleKey and Input.KeyCode ~= Enum.KeyCode.Backspace then
                                    firstcheck = true
                                    cheat.keybindname = a.KeyCode.Name
                                    callback_bind = a.KeyCode.Name
                                end

                                local clone = cheat.keybindanimation:Clone()
                                clone.Parent = cheat.keybind
                                local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - c.AbsolutePosition.Y)
                                clone.Position = UDim2.new(0, x, 0, y)
                                local len, size = 0.35, nil

                                if cheat.keybind.AbsoluteSize.X >= cheat.keybind.AbsoluteSize.Y then
                                    size = (cheat.keybind.AbsoluteSize.X * 1.5)
                                else
                                    size = (cheat.keybind.AbsoluteSize.Y * 1.5)
                                end
                                clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                                for i = 1, 10 do
                                    clone.ImageTransparency = clone.ImageTransparency + 0.05
                                    wait(len / 12)
                                end
                            else
                                for i, v in next, self2.infocontainer:GetChildren() do
                                    kavo:TweenObject(v, {
                                        Position = UDim2.new(0, 0, 2, 0)
                                    }, 0.2)
                                    focusing = false
                                end
                                kavo:TweenObject(self2.blurframe, {
                                    BackgroundTransparency = 1
                                }, 0.2)
                            end
                        end)

                        kavo.gs["UserInputService"].InputBegan:Connect(function(Input, Process)
                            if not Process and Input.KeyCode.Name == oldKey and Input.KeyCode ~= kavData.ToggleKey and Input.KeyCode ~= Enum.KeyCode.Backspace then
                                if not firstcheck then
                                    callback()
                                else
                                    firstcheck = false
                                end
                            end
                        end)

                        coroutine.wrap(function()
                            while wait() do
                                if not hover then
                                    cheat.keybind.BackgroundColor3 = themeList.ElementColor
                                end
                                cheat.keybindname.TextColor3 = themeList.SchemeColor
                                cheat.keybindicon.ImageColor3 = themeList.SchemeColor
                                viewInfo.ImageColor3 = themeList.SchemeColor
                                cheat.keybindlabel.BackgroundColor3 = themeList.TextColor
                                cheat.keybindlabel.TextColor3 = themeList.TextColor
                                cheat.keybindanimation.ImageColor3 = themeList.SchemeColor
                                cheat.information.TextColor3 = themeList.TextColor
                                cheat.information.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                            end
                        end)()

                    elseif string.lower(kind) == "label" then
                        cheat.label = kavo:Create("TextLabel", {
                            Name = "Label",
                            BackgroundColor3 = themeList.SchemeColor,
                            BorderSizePixel = 0,
                            Font = Enum.Font.Gotham,
                            Size = UDim2.new(0, 352, 0, 33),
                            Text = "  " .. name,
                            TextColor3 = themeList.TextColor,
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Left
                        }, UDim.new(0, 4))
                        cheat.label.RichText = true
                        cheat.label.ClipsDescendants = true
                        cheat.label.Parent = cheat.container

                        if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
                            kavo:TweenObject(cheat.label, {
                                TextColor3 = Color3.fromRGB(0, 0, 0)
                            }, 0.2)
                        end
                        if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
                            kavo:TweenObject(cheat.label, {
                                TextColor3 = Color3.fromRGB(255, 255, 255)
                            }, 0.2)
                        end

                        coroutine.wrap(function()
                            while wait() do
                                cheat.label.BackgroundColor3 = themeList.SchemeColor
                                cheat.label.TextColor3 = themeList.TextColor
                            end
                        end)()

                        UpdateSectionFrame()
                        UpdateSize()

                        function cheat:SetLabel(text)
                            if label.Text ~= "  " .. text then
                                label.Text = "  " .. text
                            end
                        end
                    end
                end

                return cheat
            end

            return section
        end

        return category
    end

    return self2, kavData
end

return kavo
