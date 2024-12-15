--variables only
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

    self2.info_container = self:Create("Frame", {
        Name = "InfoContainer",
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.new(0.299047619, 0, 0.874213815, 0),
        Size = UDim2.new(0, 368, 0, 33)
    })
    self2.info_container.ClipsDescendants = true
    self2.info_container.Parent = self2.container

    self2.blur_frame = self:Create("Frame", {
        Name = "BlurFrame",
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(-0.0222222228, 0, -0.0371747203, 0),
        Size = UDim2.new(0, 376, 0, 289),
        ZIndex = 5
    })
    self2.blur_frame.Parent = self2.pages

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

            section.label = kavo:Create("TextLabel", {
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
            section.label.Parent = section.header
            section.label.RichText = true

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
                kavo:TweenObject(section.label, {
                    TextColor3 = Color3.fromRGB(0, 0, 0)
                }, 0.2)
            end
            if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
                kavo:TweenObject(section.label, {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }, 0.2)
            end

            coroutine.wrap(function()
                while wait() do
                    section.page.BackgroundColor3 = themeList.Background
                    section.header.BackgroundColor3 = themeList.SchemeColor
                    category.button.TextColor3 = themeList.TextColor
                    category.button.BackgroundColor3 = themeList.SchemeColor
                    section.label.TextColor3 = themeList.TextColor
                end
            end)()

            UpdateSize()
            UpdateSectionFrame()

            function section:Cheat(kind, name, tip, callback, data)
                local cheat = {}
                cheat.value = nil

                if kind then
                    if string.lower(kind) ~= "label" then
                        cheat.element = kavo:Create("TextButton", {
                            Name = kind,
                            AutoButtonColor = false,
                            BackgroundColor3 = themeList.ElementColor,
                            Size = UDim2.new(0, 352, 0, 33),
                            TextTransparency = 1
                        }, UDim.new(0, 4))
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
                    end

                    if string.lower(kind) ~= "colorpicker" or string.lower(kind) ~= "dropdown" then
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
                        cheat.information.Parent = self2.info_container

                        cheat.information_button = kavo:Create("ImageButton", {
                            Name = "Information_Button",
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
                        cheat.information_button.Parent = cheat.element
                    end
                    
                    if string.lower(kind) == "toggle" then
                        cheat.value = false

                        cheat.disabled_icon = kavo:Create("ImageLabel", {
                            Name = "Toggle_Disabled",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926309567",
                            ImageColor3 = themeList.SchemeColor,
                            ImageRectOffset = Vector2.new(628, 420),
                            ImageRectSize = Vector2.new(48, 48),
                            Position = UDim2.new(0.0199999996, 0, 0.180000007, 0),
                            Size = UDim2.new(0, 21, 0, 21)
                        })
                        cheat.disabled_icon.Parent = cheat.element

                        cheat.enabled_icon = kavo:Create("ImageLabel", {
                            Name = "Toggle_Enabled",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926309567",
                            ImageColor3 = themeList.SchemeColor,
                            ImageRectOffset = Vector2.new(784, 420),
                            ImageRectSize = Vector2.new(48, 48),
                            ImageTransparency = 1,
                            Position = UDim2.new(0.0199999996, 0, 0.180000007, 0),
                            Size = UDim2.new(0, 21, 0, 21)
                        })
                        cheat.enabled_icon.Parent = cheat.element

                        cheat.animation = kavo:Create("ImageLabel", {
                            Name = "Toggle_Animation",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://4560909609",
                            ImageColor3 = themeList.SchemeColor,
                            ImageTransparency = 0.6
                        })
                        cheat.animation.Parent = cheat.element

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

                        cheat.element.MouseButton1Click:Connect(function()
                            if not focusing then
                                cheat.value = not cheat.value
                                pcall(callback, cheat.value)

                                if cheat.value then
                                    kavo.gs["TweenService"]:Create(cheat.enabled_icon, TweenInfo.new(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 0
                                    }):Play()
                                    local clone = cheat.animation:Clone()
                                    clone.Parent = cheat.element
                                    local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                    clone.Position = UDim2.new(0, x, 0, y)
                                    local length, size = 0.35, nil
                                    if cheat.element.AbsoluteSize.X >= cheat.element.AbsoluteSize.Y then
                                        size = (cheat.element.AbsoluteSize.X * 1.5)
                                    else
                                        size = (cheat.element.AbsoluteSize.Y * 1.5)
                                    end
                                    clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                                    for i = 1, 10 do
                                        clone.ImageTransparency = clone.ImageTransparency + 0.05
                                        wait(length / 12)
                                    end
                                    clone:Destroy()
                                else
                                    kavo.gs["TweenService"]:Create(cheat.enabled_icon, TweenInfo.new(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 1
                                    }):Play()
                                    local clone = cheat.animation:Clone()
                                    clone.Parent = cheat.element
                                    local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                    clone.Position = UDim2.new(0, x, 0, y)
                                    local length, size = 0.35, nil
                                    if cheat.element.AbsoluteSize.X >= cheat.element.AbsoluteSize.Y then
                                        size = (cheat.element.AbsoluteSize.X * 1.5)
                                    else
                                        size = (cheat.element.AbsoluteSize.Y * 1.5)
                                    end
                                    clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                                    for i = 1, 10 do
                                        clone.ImageTransparency = clone.ImageTransparency + 0.05
                                        wait(length / 12)
                                    end
                                    clone:Destroy()
                                end
                            else
                                for i, v in next, self2.info_container:GetChildren() do
                                    kavo:TweenObject(v, {
                                        Position = UDim2.new(0, 0, 2, 0)
                                    }, 0.2)
                                    focusing = false
                                end
                                kavo:TweenObject(self2.blur_frame, {
                                    BackgroundTransparency = 1
                                }, 0.2)
                            end
                        end)

                        if data then
                            if data.enabled then
                                spawn(function()
                                    cheat.value = true
                                    pcall(callback, cheat.value)

                                    kavo.gs["TweenService"]:Create(cheat.enabled_icon, TweenInfo.new(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 0
                                    }):Play()
                                    local clone = cheat.animation:Clone()
                                    clone.Parent = cheat.element
                                    local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                    clone.Position = UDim2.new(0, x, 0, y)
                                    local length, size = 0.35, nil
                                    if cheat.element.AbsoluteSize.X >= cheat.element.AbsoluteSize.Y then
                                        size = (cheat.element.AbsoluteSize.X * 1.5)
                                    else
                                        size = (cheat.element.AbsoluteSize.Y * 1.5)
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
                        cheat.element.MouseEnter:Connect(function()
                            if not focusing then
                                kavo.gs["TweenService"]:Create(cheat.element, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                                }):Play()
                                hovering = true
                            end
                        end)

                        cheat.element.MouseLeave:Connect(function()
                            if not focusing then
                                kavo.gs["TweenService"]:Create(cheat.element, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = themeList.ElementColor
                                }):Play()
                                hovering = false
                            end
                        end)

                        cheat.information_button.MouseButton1Click:Connect(function()
                            if not viewde then
                                viewde = true
                                focusing = true
                                for i, v in next, self2.info_container:GetChildren() do
                                    if v ~= cheat.information then
                                        kavo:TweenObject(v, {
                                            Position = UDim2.new(0, 0, 2, 0)
                                        }, 0.2)
                                    end
                                end
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 0, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blur_frame, {
                                    BackgroundTransparency = 0.5
                                }, 0.2)
                                kavo:TweenObject(cheat.element, {
                                    BackgroundColor3 = themeList.ElementColor
                                }, 0.2)
                                wait(1.5)
                                focusing = false
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 2, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blur_frame, {
                                    BackgroundTransparency = 1
                                }, 0.2)
                                wait()
                                viewde = false
                            end
                        end)

                        coroutine.wrap(function()
                            while wait() do
                                if not hovering then
                                    cheat.element.BackgroundColor3 = themeList.ElementColor
                                end 
                                cheat.disabled_icon.ImageColor3 = themeList.SchemeColor
                                cheat.enabled_icon.ImageColor3 = themeList.SchemeColor
                                cheat.element_label.TextColor3 = themeList.TextColor
                                cheat.information_button.ImageColor3 = themeList.SchemeColor
                                cheat.animation.ImageColor3 = themeList.SchemeColor
                                cheat.information.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                                cheat.information.TextColor3 = themeList.TextColor
                            end
                        end)()

                        function cheat:SetValue(value)
                            cheat.value = value

                            if cheat.value then
                                kavo.gs["TweenService"]:Create(cheat.enabled_icon, TweenInfo.new(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0
                                }):Play()
                                local clone = cheat.animation:Clone()
                                clone.Parent = cheat.element
                                local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                clone.Position = UDim2.new(0, x, 0, y)
                                local length, size = 0.35, nil
                                if cheat.element.AbsoluteSize.X >= cheat.element.AbsoluteSize.Y then
                                    size = (cheat.element.AbsoluteSize.X * 1.5)
                                else
                                    size = (cheat.element.AbsoluteSize.Y * 1.5)
                                end
                                clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                                for i = 1, 10 do
                                    clone.ImageTransparency = clone.ImageTransparency + 0.05
                                    wait(length / 12)
                                end
                                clone:Destroy()
                            else
                                kavo.gs["TweenService"]:Create(cheat.enabled_icon, TweenInfo.new(0.11, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 1
                                }):Play()
                                local clone = cheat.animation:Clone()
                                clone.Parent = cheat.element
                                local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                clone.Position = UDim2.new(0, x, 0, y)
                                local length, size = 0.35, nil
                                if cheat.element.AbsoluteSize.X >= cheat.element.AbsoluteSize.Y then
                                    size = (cheat.element.AbsoluteSize.X * 1.5)
                                else
                                    size = (cheat.element.AbsoluteSize.Y * 1.5)
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
                        local colorElement = Instance.new("TextButton") --cheat.colorpicker
                        local UICorner = Instance.new("UICorner") --cheat.colorpickercorner
                        local colorHeader = Instance.new("Frame") --cheat.colorpickerheader
                        local UICorner_2 = Instance.new("UICorner") --cheat.colorpickerheadercorner
                        local touch = Instance.new("ImageLabel") --cheat.colorpickericon
                        local togName = Instance.new("TextLabel") --cheat.colorpickername
                        local viewInfo = Instance.new("ImageButton") --cheat.information_button

                        local colorCurrent = Instance.new("Frame") --cheat.currentcolor
                        local UICorner_3 = Instance.new("UICorner") --cheat.currentcolorcorner
                        local UIListLayout = Instance.new("UIListLayout")
                        local colorInners = Instance.new("Frame") 
                        local UICorner_4 = Instance.new("UICorner")
                        local rgb = Instance.new("ImageButton") --rgb map
                        local UICorner_5 = Instance.new("UICorner")
                        local rbgcircle = Instance.new("ImageLabel")  --select circle rgb
                        local darkness = Instance.new("ImageButton") --gradient scale
                        local UICorner_6 = Instance.new("UICorner")
                        local darkcircle = Instance.new("ImageLabel") --select circle dark
                        local toggleDisabled = Instance.new("ImageLabel") --rgb toggle
                        local toggleEnabled = Instance.new("ImageLabel") --rgb toggle
                        local onrainbow = Instance.new("TextButton")
                        local togName_2 = Instance.new("TextLabel") --rainbow label

                    elseif string.lower(kind) == "dropdown" then
                        local dropFrame = Instance.new("Frame")
                        local dropOpen = Instance.new("TextButton")
                        local listImg = Instance.new("ImageLabel")
                        local itemTextbox = Instance.new("TextLabel")
                        local viewInfo = Instance.new("ImageButton")
                        local UICorner = Instance.new("UICorner")
                        local UIListLayout = Instance.new("UIListLayout")
                        local Sample = Instance.new("ImageLabel")

                    elseif string.lower(kind) == "textbox" then
                        local textboxElement = Instance.new("TextButton")
                        local UICorner = Instance.new("UICorner")
                        local viewInfo = Instance.new("ImageButton")
                        local write = Instance.new("ImageLabel")
                        local TextBox = Instance.new("TextBox")
                        local UICorner_2 = Instance.new("UICorner")
                        local togName = Instance.new("TextLabel")
                        local moreInfo = Instance.new("TextLabel")
                        local UICorner = Instance.new("UICorner")

                    elseif string.lower(kind) == "slider" then
                        local sliderElement = Instance.new("TextButton")
                        local UICorner = Instance.new("UICorner")
                        local togName = Instance.new("TextLabel")
                        local viewInfo = Instance.new("ImageButton")
                        local sliderBtn = Instance.new("TextButton")
                        local UICorner_2 = Instance.new("UICorner")
                        local UIListLayout = Instance.new("UIListLayout")
                        local sliderDrag = Instance.new("Frame")
                        local UICorner_3 = Instance.new("UICorner")
                        local write = Instance.new("ImageLabel")
                        local val = Instance.new("TextLabel")
                        local moreInfo = Instance.new("TextLabel")
                        local UICorner = Instance.new("UICorner")

                    elseif string.lower(kind) == "button" then
                        cheat.icon = kavo:Create("ImageLabel", {
                            Name = "ButtonIcon",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://3926305904",
                            ImageColor3 = themeList.Schemecolor,
                            ImageRectOffset = Vector2.new(84, 204),
                            ImageRectSize = Vector2.new(36, 36),
                            Position = UDim2.new(0.0199999996, 0, 0.180000007, 0),
                            Size = UDim2.new(0, 21, 0, 21)
                        })
                        cheat.icon.Parent = cheat.element

                        cheat.animation = kavo:Create("ImageLabel", {
                            Name = "Toggle_Animation",
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://4560909609",
                            ImageColor3 = themeList.SchemeColor,
                            ImageTransparency = 0.6
                        })
                        cheat.animation.Parent = cheat.element
                        
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

                        cheat.element.MouseButton1Click:Connect(function()
                            if not focusing then
                                callback()
                                local clone = cheat.animation:Clone()
                                clone.Parent = cheat.element
                                local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                                clone.Position = UDim2.new(0, x, 0, y)
                                local length, size = 0.35, nil
                                if cheat.element.AbsoluteSize.X >= cheat.element.AbsoluteSize.Y then
                                    size = (cheat.element.AbsoluteSize.X * 1.5)
                                else
                                    size = (cheat.element.AbsoluteSize.Y * 1.5)
                                end
                                clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                                for i = 1, 10 do
                                    clone.ImageTransparency = clone.ImageTransparency + 0.05
                                    wait(length / 12)
                                end
                                clone:Destroy()
                            else
                                for i, v in next, self2.info_container:GetChildren() do
                                    kavo:TweenObject(v, {
                                        Position = UDim2.new(0, 0, 2, 0)
                                    }, 0.2)
                                    focusing = false
                                end
                                kavo:TweenObject(self2.blur_frame, {
                                    BackgroundTransparency = 1
                                }, 0.2)
                            end
                        end)

                        local hovering = false

                        cheat.element.MouseEnter:Connect(function()
                            if not focusing then
                                kavo.gs["TweenService"]:Create(cheat.element, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9, themeList.ElementColor.b * 255 + 10)
                                }):Play()
                                hovering = true
                            end
                        end)

                        cheat.element.MouseLeave:Connect(function()
                            if not focusing then
                                kavo.gs["TweenService"]:Create(cheat.element, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = themeList.ElementColor
                                }):Play()
                                hovering = false
                            end
                        end)

                        cheat.information_button.MouseButton1Click:Connect(function()
                            if not viewde then
                                viewde = true
                                focusing = true
                                for i, v in next, self2.info_container:GetChildren() do
                                    if v ~= cheat.information then
                                        kavo:TweenObject(v, {
                                            Position = UDim2.new(0, 0, 2, 0)
                                        }, 0.2)
                                    end
                                end
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 0, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blur_frame, {
                                    BackgroundTransparency = 0.5
                                }, 0.2)
                                kavo:TweenObject(cheat.element, {
                                    BackgroundColor3 = themeList.ElementColor
                                }, 0.2)
                                wait(1.5)
                                focusing = false
                                kavo:TweenObject(cheat.information, {
                                    Position = UDim2.new(0, 0, 2, 0)
                                }, 0.2)
                                kavo:TweenObject(self2.blur_frame, {
                                    BackgroundTransparency = 1
                                }, 0.2)
                                wait()
                                viewde = false
                            end
                        end)
                        
                        coroutine.wrap(function()
                            while wait() do
                                if not hovering then
                                    cheat.element.BackgroundColor3 = themeList.ElementColor
                                end
                                cheat.information_button.ImageColor3 = themeList.SchemeColor
                                cheat.animation.ImageColor3 = themeList.SchemeColor
                                cheat.information.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
                                cheat.information.TextColor3 = themeList.TextColor
                                cheat.icon.ImageColor3 = themeList.SchemeColor
                                cheat.element_label.TextColor3 = themeList.TextColor
                            end
                        end)()

                        function cheat:Fire()
                            callback()
                            local clone = cheat.animation:Clone()
                            clone.Parent = cheat.element
                            local x, y = (mouse.X - clone.AbsolutePosition.X), (mouse.Y - clone.AbsolutePosition.Y)
                            clone.Position = UDim2.new(0, x, 0, y)
                            local length, size = 0.35, nil
                            if cheat.element.AbsoluteSize.X >= cheat.element.AbsoluteSize.Y then
                                size = (cheat.element.AbsoluteSize.X * 1.5)
                            else
                                size = (cheat.element.AbsoluteSize.Y * 1.5)
                            end
                            clone:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), "Out", "Quad", length, true, nil)
                            for i = 1, 10 do
                                clone.ImageTransparency = clone.ImageTransparency + 0.05
                                wait(length / 12)
                            end
                            clone:Destroy()
                        end
                    elseif string.lower(kind) == "keybind" then
                        local keybindElement = Instance.new("TextButton") --cheat.keybind
                        local UICorner = Instance.new("UICorner") --cheat.keybindcorner
                        local togName = Instance.new("TextLabel") --cheat.keybindlabel
                        local viewInfo = Instance.new("ImageButton")
                        local touch = Instance.new("ImageLabel") --cheat.keybindicon
                        local Sample = Instance.new("ImageLabel") --cheat.keybindanimation
                        local togName_2 = Instance.new("TextLabel") --cheat.keybindname
                        local moreInfo = Instance.new("TextLabel")
                        local UICorner1 = Instance.new("UICorner")

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
