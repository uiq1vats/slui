local a = {windowCount = 0, flags = {}, connections = {}}
local b = {}
setmetatable(b, {__index = function(c, d) return game:GetService(d) end, __newindex = function(e, f) e[f] = nil return end})
local g
local h = b.Players.LocalPlayer:GetMouse()
function Drag(i, j)
    if g then g.ZIndex = -2 end
    g = i
    g.ZIndex = -1
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
        s.BackgroundTransparency = 1.000
        s.ZIndex = 8
        s.Image = "rbxassetid://2708891598"
        s.ImageTransparency = 0.500
        s.ScaleType = Enum.ScaleType.Fit
        s.ImageColor3 = Color3.fromRGB(100, 100, 255)
        s.Position = UDim2.new((h.X - s.AbsolutePosition.X) / r.AbsoluteSize.X, 0, (h.Y - s.AbsolutePosition.Y) / r.AbsoluteSize.Y, 0)
        b.TweenService:Create(s, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Position = UDim2.new(-4, 0, -4, 0), Size = UDim2.new(9, 0, 9, 0)}):Play()
        b.TweenService:Create(s, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
        wait(0.4)
        s:Destroy()
    end)
end
local t = Instance.new("ScreenGui")
t.Name = b.HttpService:GenerateGUID()
t.Parent = b.RunService:IsStudio() and b.Players.LocalPlayer:WaitForChild("PlayerGui") or b.CoreGui
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
    local G = Instance.new("Frame")
    y.Name = "Top"
    y.Parent = t
    y.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    y.BorderSizePixel = 0
    y.Position = UDim2.new(0, 25, 0, -30 + 38 * a.windowCount + 8 * a.windowCount)
    y.Size = UDim2.new(0, 240, 0, 38)
    Drag(y)
    z.Name = "WindowLine"
    z.Parent = y
    z.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    z.BorderSizePixel = 0
    z.Position = UDim2.new(0, 0, 0, 36)
    z.Size = UDim2.new(0, 240, 0, 2)
    A.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)),
        ColorSequenceKeypoint.new(0.20, Color3.fromRGB(25, 25, 25)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(100, 100, 255)),
        ColorSequenceKeypoint.new(0.80, Color3.fromRGB(25, 25, 25)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))
    }
    A.Name = "WindowLineGradient"
    A.Parent = z
    B.Name = "Header"
    B.Parent = y
    B.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    B.BackgroundTransparency = 1.000
    B.BorderSizePixel = 0
    B.Size = UDim2.new(0, 60, 0, 36)
    B.Font = Enum.Font.GothamBold
    B.Text = "   " .. tostring(w) or ""
    B.TextColor3 = Color3.fromRGB(255, 255, 255)
    B.TextSize = 16.000
    B.TextXAlignment = Enum.TextXAlignment.Left
    C.Name = "WindowToggle"
    C.Parent = y
    C.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    C.BackgroundTransparency = 1.000
    C.BorderSizePixel = 0
    C.Position = UDim2.new(0.85, 0, 0, 0)
    C.Size = UDim2.new(0, 36, 0, 36)
    C.Font = Enum.Font.SourceSans
    C.Text = ""
    C.TextColor3 = Color3.fromRGB(0, 0, 0)
    C.TextSize = 14.000
    D.Name = "WindowToggleImg"
    D.Parent = C
    D.AnchorPoint = Vector2.new(0.5, 0.5)
    D.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    D.BackgroundTransparency = 1.000
    D.BorderSizePixel = 0
    D.Position = UDim2.new(0.5, 0, 0.5, 0)
    D.Size = UDim2.new(0, 20, 0, 20)
    D.Image = "rbxassetid://3926305904"
    D.ImageRectOffset = Vector2.new(524, 764)
    D.ImageRectSize = Vector2.new(36, 36)
    D.Rotation = 180
    E.Name = "Bottom"
    E.Parent = y
    E.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    E.BorderSizePixel = 0
    E.ClipsDescendants = true
    E.Position = UDim2.new(0, 0, 1, 0)
    E.Size = UDim2.new(0, 240, 0, 0)
    F.Name = "BottomLayout"
    F.Parent = E
    F.HorizontalAlignment = Enum.HorizontalAlignment.Center
    F.SortOrder = Enum.SortOrder.LayoutOrder
    F.Padding = UDim.new(0, 6)
    G.Name = "PaddingThing"
    G.Parent = E
    G.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    G.BorderSizePixel = 0
    G.Position = UDim2.new(0.263033181, 0, 0, 0)
    G.Size = UDim2.new(0, 90, 0, 0)
    local H = false
    local function I()
        if H then return end
        x = not x
        local H = true
        b.TweenService:Create(E, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 240, 0, x and F.AbsoluteContentSize.Y + 6 or 0)}):Play()
        b.TweenService:Create(D, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Rotation = x and 0 or 180}):Play()
        wait(0.3)
        H = false
    end
    local function J()
        if H or not x then return end
        E.Size.Y.Offset = F.AbsoluteContentSize.Y + 6
    end
    F:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(J)
    C.MouseButton1Click:Connect(I)
    local K = {}
    function K:Label(L)
        local M = Instance.new("TextButton")
        M.Name = "Label"
        M.Parent = E
        M.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        M.BorderSizePixel = 0
        M.Position = UDim2.new(0.0212264154, 0, 0.71676302, 0)
        M.Size = UDim2.new(0, 230, 0, 28)
        M.AutoButtonColor = false
        M.Font = Enum.Font.GothamBold
        M.Text = tostring(L) or ""
        M.TextColor3 = Color3.fromRGB(255, 255, 255)
        M.TextSize = 15.000
        return M
    end
    function K:Button(L, N)
        local O = Instance.new("Frame")
        local P = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local N = N or function() end
        O.Name = "ButtonObj"
        O.Parent = E
        O.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        O.BorderSizePixel = 0
        O.Position = UDim2.new(0, 0, 0.0172413792, 0)
        O.Size = UDim2.new(0, 230, 0, 38)
        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = O
        P.Name = "Button"
        P.Parent = O
        P.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        P.BackgroundTransparency = 1.000
        P.BorderSizePixel = 0
        P.Size = UDim2.new(0, 230, 0, 38)
        P.Font = Enum.Font.Gotham
        P.Text = "  " .. tostring(L) or ""
        P.TextColor3 = Color3.fromRGB(255, 255, 255)
        P.TextSize = 15.000
        P.TextXAlignment = Enum.TextXAlignment.Left
        P.MouseEnter:Connect(function()
            b.TweenService:Create(O, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
        end)
        P.MouseLeave:Connect(function()
            b.TweenService:Create(O, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
        end)
        P.MouseButton1Click:Connect(function()
            spawn(function()
                ClickEffect(P)
            end)
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
        U.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        U.BorderSizePixel = 0
        U.Position = UDim2.new(0, 0, 0.0172413792, 0)
        U.Size = UDim2.new(0, 230, 0, 38)
        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = U
        V.Name = "ToggleText"
        V.Parent = U
        V.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        V.BackgroundTransparency = 1.000
        V.BorderSizePixel = 0
        V.Size = UDim2.new(0, 230, 0, 38)
        V.Font = Enum.Font.Gotham
        V.Text = "  " .. tostring(Q) or ""
        V.TextColor3 = Color3.fromRGB(255, 255, 255)
        V.TextSize = 15.000
        V.TextXAlignment = Enum.TextXAlignment.Left
        W.Name = "ToggleStatus"
        W.Parent = U
        W.AnchorPoint = Vector2.new(0, 0.5)
        W.BackgroundColor3 = S and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(200, 60, 60)
        W.BorderSizePixel = 0
        W.Position = UDim2.new(0.85, 0, 0.5, 0)
        W.Size = UDim2.new(0, 28, 0, 28)
        X.CornerRadius = UDim.new(0, 6)
        X.Name = "ToggleStatusRound"
        X.Parent = W
        if S then
            a.connections[R] = N(true)
        end
        V.MouseEnter:Connect(function()
            b.TweenService:Create(U, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
        end)
        V.MouseLeave:Connect(function()
            b.TweenService:Create(U, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
        end)
        V.MouseButton1Click:Connect(function()
            T[R] = not T[R]
            spawn(function()
                b.TweenService:Create(W, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {BackgroundColor3 = T[R] and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(200, 60, 60)}):Play()
            end)
            spawn(function()
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
        a4.Name = "SliderObj"
        a4.Parent = E
        a4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        a4.BorderSizePixel = 0
        a4.Position = UDim2.new(0, 0, 0.0172413792, 0)
        a4.Size = UDim2.new(0, 230, 0, 38)
        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = a4
        a5.Name = "SliderText"
        a5.Parent = a4
        a5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        a5.BackgroundTransparency = 1.000
        a5.BorderSizePixel = 0
        a5.Size = UDim2.new(0, 230, 0, 38)
        a5.Font = Enum.Font.Gotham
        a5.Text = "  " .. tostring(Y) or ""
        a5.TextColor3 = Color3.fromRGB(255, 255, 255)
        a5.TextSize = 15.000
        a5.TextXAlignment = Enum.TextXAlignment.Left
        a6.Name = "SliderBack"
        a6.Parent = a4
        a6.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        a6.BorderSizePixel = 0
        a6.Position = UDim2.new(0.57, 0, 0.65, 0)
        a6.Size = UDim2.new(0, 90, 0, 6)
        a7.CornerRadius = UDim.new(0, 3)
        a7.Name = "SliderBackRound"
        a7.Parent = a6
        a8.Name = "SliderPart"
        a8.Parent = a6
        a8.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
        a8.BorderSizePixel = 0
        a8.Size = UDim2.new((S or 0) / a2, 0, 1, 0)
        a9.CornerRadius = UDim.new(0, 3)
        a9.Name = "SliderPartRound"
        a9.Parent = a8
        aa.Name = "SliderValue"
        aa.Parent = a4
        aa.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        aa.BackgroundTransparency = 1.000
        aa.BorderSizePixel = 0
        aa.Position = UDim2.new(0.57, 0, 0.15, 0)
        aa.Size = UDim2.new(0, 90, 0, 16)
        aa.Font = Enum.Font.Code
        aa.Text = S or a1
        aa.TextColor3 = Color3.fromRGB(255, 255, 255)
        aa.TextSize = 14.000
        if S and S ~= a1 then
            N(S)
        end
        local function ab(p)
            local ac = UDim2.new(math.clamp((p.Position.X - a6.AbsolutePosition.X) / a6.AbsoluteSize.X, 0, 1), 0, 1, 0)
            a8:TweenSize(ac, Enum.EasingDirection.InOut, Enum.EasingStyle.Cubic, 0.2, true)
            local ad = math.floor(ac.X.Scale * a2 / a2 * (a2 - a1) + a1)
            aa.Text = tostring(ad)
            T[a3] = ad
            N(ad)
        end
        a5.InputBegan:Connect(function(p)
            if p.UserInputType == Enum.UserInputType.MouseButton1 then
                spawn(function()
                    b.TweenService:Create(a8, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                end)
                ab(p)
                k = true
            end
        end)
        a5.InputEnded:Connect(function(p)
            if p.UserInputType == Enum.UserInputType.MouseButton1 then
                spawn(function()
                    b.TweenService:Create(a8, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(100, 100, 255)}):Play()
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
