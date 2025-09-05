local a = {windowCount = 0, flags = {}, connections = {}}
local b = {}
setmetatable(b, {__index = function(c, d) return game:GetService(d) end, __newindex = function(e, f) e[f] = nil return end})
local g
local h = b.Players.LocalPlayer:GetMouse()

function Drag(i, j)
    if g then g.ZIndex = 0 end
    g = i
    g.ZIndex = 1
    if not j then j = i end
    local k
    local l
    local m
    local n
    local function o(p)
        local q = p.Position - m
        i.Position = UDim2.new(n.X.Scale, n.X.Offset + q.X, n.Y.Scale, n.Y.Offset + q.Y)
    end
    j.InputBegan:Connect(function(p)
        if p.UserInputType == Enum.UserInputType.MouseButton1 then
            k = true
            m = p.Position
            n = i.Position
            p.Changed:Connect(function()
                if p.UserInputState == Enum.UserInputState.End then
                    k = false
                end
            end)
        end
    end)
    i.InputChanged:Connect(function(p)
        if p.UserInputType == Enum.UserInputType.MouseMovement then
            l = p
        end
    end)
    b.UserInputService.InputChanged:Connect(function(p)
        if p == l and k then
            o(p)
        end
    end)
end

function ClickEffect(r)
    spawn(function()
        if r.ClipsDescendants ~= true then
            r.ClipsDescendants = true
        end
        local s = Instance.new("ImageLabel")
        s.Name = "Ripple"
        s.Parent = r
        s.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        s.BackgroundTransparency = 1
        s.ZIndex = 10
        s.Image = "rbxassetid://132155326"
        s.ImageTransparency = 0.4
        s.ScaleType = Enum.ScaleType.Fit
        s.ImageColor3 = Color3.fromRGB(120, 120, 255)
        s.Position = UDim2.new((h.X - r.AbsolutePosition.X) / r.AbsoluteSize.X, 0, (h.Y - r.AbsolutePosition.Y) / r.AbsoluteSize.Y, 0)
        b.TweenService:Create(s, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(-3.5, 0, -3.5, 0), Size = UDim2.new(8, 0, 8, 0)}):Play()
        b.TweenService:Create(s, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
        wait(0.3)
        s:Destroy()
    end)
end

local t = Instance.new("ScreenGui")
t.Name = b.HttpService:GenerateGUID()
t.Parent = b.RunService:IsStudio() and b.Players.LocalPlayer:WaitForChild("PlayerGui") or b.CoreGui
t.IgnoreGuiInset = true
b.UserInputService.InputBegan:Connect(function(u, v)
    if u.KeyCode == Enum.KeyCode.RightShift and not v then
        t.Enabled = not t.Enabled
    end
end)

function a:Window(w)
    local x = false
    a.windowCount = a.windowCount + 1
    local y = Instance.new("Frame")
    local z = Instance.new("Frame")
    local A = Instance.new("UIGradient")
    local B = Instance.new("TextLabel")
    local C = Instance.new("TextButton")
    local D = Instance.new("ImageLabel")
    local E = Instance.new("Frame")
    local F = Instance.new("UIListLayout")
    local UICorner = Instance.new("UICorner")
    local Shadow = Instance.new("ImageLabel")

    y.Name = "Top"
    y.Parent = t
    y.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    y.BorderSizePixel = 0
    y.Position = UDim2.new(0, 30, 0, -30 + 40 * a.windowCount + 10 * a.windowCount)
    y.Size = UDim2.new(0, 220, 0, 40)
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = y
    Drag(y)

    Shadow.Name = "Shadow"
    Shadow.Parent = y
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0, -10, 0, -10)
    Shadow.Size = UDim2.new(1, 20, 1, 20)
    Shadow.ZIndex = -1
    Shadow.Image = "rbxassetid://1316045217"
    Shadow.ImageTransparency = 0.5
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 118, 118)

    z.Name = "WindowLine"
    z.Parent = y
    z.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    z.BorderSizePixel = 0
    z.Position = UDim2.new(0, 0, 1, -2)
    z.Size = UDim2.new(1, 0, 0, 2)
    A.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(30, 30, 30)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 120, 255)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(30, 30, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
    }
    A.Name = "WindowLineGradient"
    A.Parent = z

    B.Name = "Header"
    B.Parent = y
    B.BackgroundTransparency = 1
    B.Size = UDim2.new(0, 160, 0, 40)
    B.Font = Enum.Font.SourceSansPro
    B.Text = "  " .. tostring(w) or ""
    B.TextColor3 = Color3.fromRGB(255, 255, 255)
    B.TextSize = 16
    B.TextXAlignment = Enum.TextXAlignment.Left

    C.Name = "WindowToggle"
    C.Parent = y
    C.BackgroundTransparency = 1
    C.BorderSizePixel = 0
    C.Position = UDim2.new(0.82, 0, 0, 0)
    C.Size = UDim2.new(0, 40, 0, 40)
    C.Font = Enum.Font.SourceSans
    C.Text = ""
    C.TextColor3 = Color3.fromRGB(0, 0, 0)
    C.TextSize = 14

    D.Name = "WindowToggleImg"
    D.Parent = C
    D.AnchorPoint = Vector2.new(0.5, 0.5)
    D.BackgroundTransparency = 1
    D.Position = UDim2.new(0.5, 0, 0.5, 0)
    D.Size = UDim2.new(0, 20, 0, 20)
    D.Image = "rbxassetid://3926305904"
    D.ImageRectOffset = Vector2.new(524, 764)
    D.ImageRectSize = Vector2.new(36, 36)
    D.Rotation = 180

    E.Name = "Bottom"
    E.Parent = y
    E.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    E.BorderSizePixel = 0
    E.ClipsDescendants = true
    E.Position = UDim2.new(0, 0, 1, 0)
    E.Size = UDim2.new(0, 220, 0, 0)
    local UICornerBottom = Instance.new("UICorner")
    UICornerBottom.CornerRadius = UDim.new(0, 8)
    UICornerBottom.Parent = E

    F.Name = "BottomLayout"
    F.Parent = E
    F.HorizontalAlignment = Enum.HorizontalAlignment.Center
    F.SortOrder = Enum.SortOrder.LayoutOrder
    F.Padding = UDim.new(0, 6)

    local H = false
    local function I()
        if H then return end
        x = not x
        H = true
        b.TweenService:Create(E, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 220, 0, x and F.AbsoluteContentSize.Y + 8 or 0)}):Play()
        b.TweenService:Create(D, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = x and 0 or 180, ImageColor3 = x and Color3.fromRGB(120, 120, 255) or Color3.fromRGB(255, 255, 255)}):Play()
        wait(0.3)
        H = false
    end
    local function J()
        if H or not x then return end
        E.Size = UDim2.new(0, 220, 0, F.AbsoluteContentSize.Y + 8)
    end
    F:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(J)
    C.MouseButton1Click:Connect(function()
        ClickEffect(C)
        I()
    end)

    local K = {}
    function K:Label(L)
        local M = Instance.new("TextLabel")
        M.Name = "Label"
        M.Parent = E
        M.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        M.BorderSizePixel = 0
        M.Size = UDim2.new(0, 200, 0, 28)
        M.Font = Enum.Font.SourceSansPro
        M.Text = tostring(L) or ""
        M.TextColor3 = Color3.fromRGB(200, 200, 200)
        M.TextSize = 15
        M.TextXAlignment = Enum.TextXAlignment.Left
        M.TextYAlignment = Enum.TextYAlignment.Center
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = M
        return M
    end

    function K:Button(L, N)
        local O = Instance.new("Frame")
        local P = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local N = N or function() end
        O.Name = "ButtonObj"
        O.Parent = E
        O.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        O.BorderSizePixel = 0
        O.Size = UDim2.new(0, 200, 0, 34)
        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = O

        P.Name = "Button"
        P.Parent = O
        P.BackgroundTransparency = 1
        P.BorderSizePixel = 0
        P.Size = UDim2.new(1, 0, 1, 0)
        P.Font = Enum.Font.SourceSansPro
        P.Text = "  " .. tostring(L) or ""
        P.TextColor3 = Color3.fromRGB(255, 255, 255)
        P.TextSize = 15
        P.TextXAlignment = Enum.TextXAlignment.Left

        P.MouseEnter:Connect(function()
            b.TweenService:Create(O, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
        end)
        P.MouseLeave:Connect(function()
            b.TweenService:Create(O, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()
        end)
        P.MouseButton1Click:Connect(function()
            ClickEffect(P)
            N()
        end)
    end

    function K:Toggle(Q, R, S, N, T)
        local T = T or a.flags
        local R = R or b.HttpService:GenerateGUID()
        local S = S or false
        local N = N or function() end
        T[R] = S
        local U = Instance.new("Frame")
        local V = Instance.new("TextButton")
        local W = Instance.new("Frame")
        local X = Instance.new("UICorner")
        local UICorner = Instance.new("UICorner")
        U.Name = "ToggleObj"
        U.Parent = E
        U.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        U.BorderSizePixel = 0
        U.Size = UDim2.new(0, 200, 0, 34)
        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = U

        V.Name = "ToggleText"
        V.Parent = U
        V.BackgroundTransparency = 1
        V.BorderSizePixel = 0
        V.Size = UDim2.new(1, 0, 1, 0)
        V.Font = Enum.Font.SourceSansPro
        V.Text = "  " .. tostring(Q) or ""
        V.TextColor3 = Color3.fromRGB(255, 255, 255)
        V.TextSize = 15
        V.TextXAlignment = Enum.TextXAlignment.Left

        W.Name = "ToggleStatus"
        W.Parent = U
        W.AnchorPoint = Vector2.new(0, 0.5)
        W.BackgroundColor3 = S and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(200, 60, 60)
        W.BorderSizePixel = 0
        W.Position = UDim2.new(0.85, 0, 0.5, 0)
        W.Size = UDim2.new(0, 24, 0, 24)
        X.CornerRadius = UDim.new(0, 12)
        X.Name = "ToggleStatusRound"
        X.Parent = W

        if S then
            a.connections[R] = N(true)
        end

        V.MouseEnter:Connect(function()
            b.TweenService:Create(U, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
        end)
        V.MouseLeave:Connect(function()
            b.TweenService:Create(U, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()
        end)
        V.MouseButton1Click:Connect(function()
            T[R] = not T[R]
            spawn(function()
                b.TweenService:Create(W, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundColor3 = T[R] and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(200, 60, 60)}):Play()
                ClickEffect(V)
            end)
            if T[R] then
                a.connections[R] = N(true)
            else
                if a.connections[R] then
                    a.connections[R]:Disconnect()
                    a.connections[R] = nil
                end
                N(false)
            end
        end)
    end

    function K:Slider(Y, Z, _, a0, N, S, T)
        local a1 = _ or 0
        local a2 = a0 or 100
        local a3 = Z or b.HttpService:GenerateGUID()
        local N = N or function() end
        local T = T or a.flags
        local k = false
        T[a3] = S or a1
        local a4 = Instance.new("Frame")
        local a5 = Instance.new("TextButton")
        local a6 = Instance.new("Frame")
        local a7 = Instance.new("UICorner")
        local a8 = Instance.new("Frame")
        local a9 = Instance.new("UICorner")
        local aa = Instance.new("TextLabel")
        local UICorner = Instance.new("UICorner")
        local Knob = Instance.new("Frame")
        local KnobCorner = Instance.new("UICorner")

        a4.Name = "SliderObj"
        a4.Parent = E
        a4.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        a4.BorderSizePixel = 0
        a4.Size = UDim2.new(0, 200, 0, 34)
        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = a4

        a5.Name = "SliderText"
        a5.Parent = a4
        a5.BackgroundTransparency = 1
        a5.BorderSizePixel = 0
        a5.Size = UDim2.new(1, 0, 1, 0)
        a5.Font = Enum.Font.SourceSansPro
        a5.Text = "  " .. tostring(Y) or ""
        a5.TextColor3 = Color3.fromRGB(255, 255, 255)
        a5.TextSize = 15
        a5.TextXAlignment = Enum.TextXAlignment.Left

        a6.Name = "SliderBack"
        a6.Parent = a4
        a6.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        a6.BorderSizePixel = 0
        a6.Position = UDim2.new(0.55, 0, 0.65, 0)
        a6.Size = UDim2.new(0, 80, 0, 6)
        a7.CornerRadius = UDim.new(0, 3)
        a7.Name = "SliderBackRound"
        a7.Parent = a6

        a8.Name = "SliderPart"
        a8.Parent = a6
        a8.BackgroundColor3 = Color3.fromRGB(120, 120, 255)
        a8.BorderSizePixel = 0
        a8.Size = UDim2.new((S or a1) / a2, 0, 1, 0)
        a9.CornerRadius = UDim.new(0, 3)
        a9.Name = "SliderPartRound"
        a9.Parent = a8

        Knob.Name = "SliderKnob"
        Knob.Parent = a8
        Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Knob.BorderSizePixel = 0
        Knob.Position = UDim2.new(1, -8, 0.5, -8)
        Knob.Size = UDim2.new(0, 16, 0, 16)
        Knob.ZIndex = 2
        KnobCorner.CornerRadius = UDim.new(0, 8)
        KnobCorner.Parent = Knob

        aa.Name = "SliderValue"
        aa.Parent = a4
        aa.BackgroundTransparency = 1
        aa.BorderSizePixel = 0
        aa.Position = UDim2.new(0.55, 0, 0.1, 0)
        aa.Size = UDim2.new(0, 80, 0, 16)
        aa.Font = Enum.Font.SourceSansPro
        aa.Text = tostring(S or a1)
        aa.TextColor3 = Color3.fromRGB(200, 200, 200)
        aa.TextSize = 14

        if S and S ~= a1 then
            N(S)
        end

        local function ab(p)
            local ac = UDim2.new(math.clamp((p.Position.X - a6.AbsolutePosition.X) / a6.AbsoluteSize.X, 0, 1), 0, 1, 0)
            b.TweenService:Create(a8, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = ac}):Play()
            local ad = math.floor(ac.X.Scale * (a2 - a1) + a1)
            aa.Text = tostring(ad)
            T[a3] = ad
            N(ad)
        end

        a5.InputBegan:Connect(function(p)
            if p.UserInputType == Enum.UserInputType.MouseButton1 then
                spawn(function()
                    b.TweenService:Create(Knob, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(120, 120, 255)}):Play()
                end)
                ab(p)
                k = true
            end
        end)

        a5.InputEnded:Connect(function(p)
            if p.UserInputType == Enum.UserInputType.MouseButton1 then
                spawn(function()
                    b.TweenService:Create(Knob, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                end)
                k = false
            end
        end)

        b.UserInputService.InputChanged:Connect(function(p)
            if k and p.UserInputType == Enum.UserInputType.MouseMovement then
                ab(p)
            end
        end)
    end
    return K
end
return a
