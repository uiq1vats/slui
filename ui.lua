local a = {windowCount = 0, flags = {}}
local b = {}
setmetatable(
    b,
    {__index = function(c, d)
            return game:GetService(d)
        end, __newindex = function(e, f)
            e[f] = nil
            return
        end}
)
local g
local h = b.Players.LocalPlayer:GetMouse()
function Drag(i, j)
    if g then
        g.ZIndex = -2
    end
    g = i
    g.ZIndex = -1
    if not j then
        j = i
    end
    local k
    local l
    local m
    local n
    local function o(p)
        local q = p.Position - m
        i.Position = UDim2.new(n.X.Scale, n.X.Offset + q.X, n.Y.Scale, n.Y.Offset + q.Y)
    end
    j.InputBegan:Connect(
        function(p)
            if p.UserInputType == Enum.UserInputType.MouseButton1 then
                k = true
                m = p.Position
                n = i.Position
                p.Changed:Connect(
                    function()
                        if p.UserInputState == Enum.UserInputState.End then
                            k = false
                        end
                    end
                )
            end
        end
    )
    i.InputChanged:Connect(
        function(p)
            if p.UserInputType == Enum.UserInputType.MouseMovement then
                l = p
            end
        end
    )
    game:service("UserInputService").InputChanged:Connect(
        function(p)
            if p == l and k then
                o(p)
            end
        end
    )
end
function ClickEffect(r)
    spawn(
        function()
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
            s.ImageTransparency = 0.600
            s.ScaleType = Enum.ScaleType.Fit
            s.ImageColor3 = Color3.fromRGB(150, 150, 255)
            s.Position =
                UDim2.new(
                (h.X - s.AbsolutePosition.X) / r.AbsoluteSize.X,
                0,
                (h.Y - s.AbsolutePosition.Y) / r.AbsoluteSize.Y,
                0
            )
            b.TweenService:Create(
                s,
                TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {Position = UDim2.new(-4, 0, -4, 0), Size = UDim2.new(9, 0, 9, 0)}
            ):Play()
            b.TweenService:Create(
                s,
                TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {ImageTransparency = 1}
            ):Play()
            wait(0.8)
            s:Destroy()
        end
    )
end
local t = Instance.new("ScreenGui")
t.Name = b.HttpService:GenerateGUID()
t.Parent = b.RunService:IsStudio() and b.Players.LocalPlayer:WaitForChild("PlayerGui") or b.CoreGui
b.UserInputService.InputBegan:Connect(
    function(u, v)
        if u.KeyCode == Enum.KeyCode.LeftShift and not v then
            t.Enabled = not t.Enabled
        end
    end
)
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
    local H = Instance.new("UICorner")
    local I = Instance.new("UIStroke")
    y.Name = "Top"
    y.Parent = t
    y.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    y.BorderSizePixel = 0
    y.Position = UDim2.new(0, 25, 0, -30 + 36 * a.windowCount + 6 * a.windowCount)
    y.Size = UDim2.new(0, 220, 0, 40)
    H.CornerRadius = UDim.new(0, 8)
    H.Parent = y
    I.Thickness = 1
    I.Color = Color3.fromRGB(60, 60, 60)
    I.Parent = y
    Drag(y)
    z.Name = "WindowLine"
    z.Parent = y
    z.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    z.BorderSizePixel = 0
    z.Position = UDim2.new(0, 0, 0, 38)
    z.Size = UDim2.new(0, 220, 0, 2)
    A.Color =
        ColorSequence.new {
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 30, 30)),
        ColorSequenceKeypoint.new(0.20, Color3.fromRGB(30, 30, 30)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(150, 150, 255)),
        ColorSequenceKeypoint.new(0.80, Color3.fromRGB(30, 30, 30)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))
    }
    A.Name = "WindowLineGradient"
    A.Parent = z
    B.Name = "Header"
    B.Parent = y
    B.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    B.BackgroundTransparency = 1.000
    B.BorderSizePixel = 0
    B.Size = UDim2.new(0, 60, 0, 38)
    B.Font = Enum.Font.SourceSansPro
    B.Text = "   " .. tostring(w) or ""
    B.TextColor3 = Color3.fromRGB(220, 220, 220)
    B.TextSize = 16.000
    B.TextXAlignment = Enum.TextXAlignment.Left
    C.Name = "WindowToggle"
    C.Parent = y
    C.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    C.BackgroundTransparency = 1.000
    C.BorderSizePixel = 0
    C.Position = UDim2.new(0.82, 0, 0, 0)
    C.Size = UDim2.new(0, 40, 0, 38)
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
    E.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    E.BorderSizePixel = 0
    E.ClipsDescendants = true
    E.Position = UDim2.new(0, 0, 1, 0)
    E.Size = UDim2.new(0, 220, 0, 0)
    H.CornerRadius = UDim.new(0, 8)
    H.Parent = E
    I.Thickness = 1
    I.Color = Color3.fromRGB(60, 60, 60)
    I.Parent = E
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
    G.Size = UDim2.new(0, 100, 0, 0)
    local J = false
    local function K()
        if J then
            return
        end
        x = not x
        local J = true
        b.TweenService:Create(
            E,
            TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 220, 0, x and F.AbsoluteContentSize.Y + 6 or 0)}
        ):Play()
        b.TweenService:Create(
            D,
            TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
            {Rotation = x and 0 or 180}
        ):Play()
        wait(.3)
        J = false
    end
    local function L()
        if J or not x then
            return
        end
        E.Size.Y.Offset = F.AbsoluteContentSize.Y + 6
    end
    F:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(L)
    C.MouseButton1Click:Connect(K)
    local M = {}
    function M:Label(N)
        local O = Instance.new("TextButton")
        O.Name = "Label"
        O.Parent = E
        O.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        O.BorderSizePixel = 0
        O.Size = UDim2.new(0, 210, 0, 28)
        O.AutoButtonColor = false
        O.Font = Enum.Font.SourceSansPro
        O.Text = tostring(N) or ""
        O.TextColor3 = Color3.fromRGB(200, 200, 200)
        O.TextSize = 15.000
        H.CornerRadius = UDim.new(0, 6)
        H.Parent = O
        I.Thickness = 1
        I.Color = Color3.fromRGB(50, 50, 50)
        I.Parent = O
        return O
    end
    function M:Button(N, O)
        local P = Instance.new("Frame")
        local Q = Instance.new("TextButton")
        local R = Instance.new("UICorner")
        local S = Instance.new("UIStroke")
        local O = O or function()
            end
        P.Name = "ButtonObj"
        P.Parent = E
        P.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        P.BorderSizePixel = 0
        P.Size = UDim2.new(0, 210, 0, 38)
        R.CornerRadius = UDim.new(0, 6)
        R.Parent = P
        S.Thickness = 1
        S.Color = Color3.fromRGB(50, 50, 50)
        S.Parent = P
        Q.Name = "Button"
        Q.Parent = P
        Q.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Q.BackgroundTransparency = 1.000
        Q.BorderSizePixel = 0
        Q.Size = UDim2.new(0, 210, 0, 38)
        Q.Font = Enum.Font.SourceSansPro
        Q.Text = "  " .. tostring(N) or ""
        Q.TextColor3 = Color3.fromRGB(200, 200, 200)
        Q.TextSize = 15.000
        Q.TextXAlignment = Enum.TextXAlignment.Left
        Q.MouseEnter:Connect(
            function()
                b.TweenService:Create(
                    P,
                    TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}
                ):Play()
            end
        )
        Q.MouseLeave:Connect(
            function()
                b.TweenService:Create(
                    P,
                    TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
                ):Play()
            end
        )
        Q.MouseButton1Click:Connect(
            function()
                spawn(
                    function()
                        ClickEffect(Q)
                    end
                )
                O()
            end
        )
    end
    function M:Toggle(T, U, V, O, W)
        local W = W or a.flags
        local U = U or b.HttpService:GenerateGUID()
        local V = V or false
        local O = O or function()
            end
        W[U] = V
        local X = Instance.new("Frame")
        local Y = Instance.new("TextButton")
        local Z = Instance.new("Frame")
        local aa = Instance.new("UICorner")
        local ab = Instance.new("UIStroke")
        X.Name = "ToggleObj"
        X.Parent = E
        X.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        X.BorderSizePixel = 0
        X.Size = UDim2.new(0, 210, 0, 38)
        aa.CornerRadius = UDim.new(0, 6)
        aa.Parent = X
        ab.Thickness = 1
        ab.Color = Color3.fromRGB(50, 50, 50)
        ab.Parent = X
        Y.Name = "ToggleText"
        Y.Parent = X
        Y.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Y.BackgroundTransparency = 1.000
        Y.BorderSizePixel = 0
        Y.Size = UDim2.new(0, 210, 0, 38)
        Y.Font = Enum.Font.SourceSansPro
        Y.Text = "  " .. tostring(T) or ""
        Y.TextColor3 = Color3.fromRGB(200, 200, 200)
        Y.TextSize = 15.000
        Y.TextXAlignment = Enum.TextXAlignment.Left
        Z.Name = "ToggleStatus"
        Z.Parent = X
        Z.AnchorPoint = Vector2.new(0, 0.5)
        Z.BackgroundColor3 = V and Color3.fromRGB(0, 255, 128) or Color3.fromRGB(255, 80, 80)
        Z.BorderSizePixel = 0
        Z.Position = UDim2.new(0.85, 0, 0.5, 0)
        Z.Size = UDim2.new(0, 26, 0, 26)
        aa.CornerRadius = UDim.new(0, 13)
        aa.Parent = Z
        if V then
            O(true)
        end
        Y.MouseEnter:Connect(
            function()
                b.TweenService:Create(
                    X,
                    TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}
                ):Play()
            end
        )
        Y.MouseLeave:Connect(
            function()
                b.TweenService:Create(
                    X,
                    TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
                ):Play()
            end
        )
        Y.MouseButton1Click:Connect(
            function()
                W[U] = not W[U]
                spawn(
                    function()
                        b.TweenService:Create(
                            Z,
                            TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                            {BackgroundColor3 = W[U] and Color3.fromRGB(0, 255, 128) or Color3.fromRGB(255, 80, 80)}
                        ):Play()
                    end
                )
                spawn(
                    function()
                        ClickEffect(Y)
                    end
                )
                O(W[U])
            end
        )
    end
    function M:Slider(ac, ad, ae, af, O, V, W)
        local ag = ae or 0
        local ah = af or 100
        local ai = ad or b.HttpService:GenerateGUID()
        local O = O or function()
            end
        local W = W or a.flags
        local k = false
        W[ai] = V or ag
        local aj = Instance.new("Frame")
        local ak = Instance.new("TextButton")
        local al = Instance.new("Frame")
        local am = Instance.new("UICorner")
        local an = Instance.new("UIStroke")
        local ao = Instance.new("Frame")
        local ap = Instance.new("UICorner")
        local aq = Instance.new("TextLabel")
        aj.Name = "SliderObj"
        aj.Parent = E
        aj.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        aj.BorderSizePixel = 0
        aj.Size = UDim2.new(0, 210, 0, 50)
        am.CornerRadius = UDim.new(0, 6)
        am.Parent = aj
        an.Thickness = 1
        an.Color = Color3.fromRGB(50, 50, 50)
        an.Parent = aj
        ak.Name = "SliderText"
        ak.Parent = aj
        ak.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ak.BackgroundTransparency = 1.000
        ak.BorderSizePixel = 0
        ak.Size = UDim2.new(0, 210, 0, 25)
        ak.Font = Enum.Font.SourceSansPro
        ak.Text = "  " .. tostring(ac) or ""
        ak.TextColor3 = Color3.fromRGB(200, 200, 200)
        ak.TextSize = 15.000
        ak.TextXAlignment = Enum.TextXAlignment.Left
        al.Name = "SliderBack"
        al.Parent = aj
        al.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        al.BorderSizePixel = 0
        al.Position = UDim2.new(0.05, 0, 0.6, 0)
        al.Size = UDim2.new(0, 190, 0, 8)
        am.CornerRadius = UDim.new(0, 4)
        am.Parent = al
        ao.Name = "SliderPart"
        ao.Parent = al
        ao.BackgroundColor3 = Color3.fromRGB(150, 150, 255)
        ao.BorderSizePixel = 0
        ao.Size = UDim2.new((V or 0) / ah, 0, 1, 0)
        ap.CornerRadius = UDim.new(0, 4)
        ap.Parent = ao
        aq.Name = "SliderValue"
        aq.Parent = aj
        aq.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        aq.BackgroundTransparency = 1.000
        aq.BorderSizePixel = 0
        aq.Position = UDim2.new(0.85, 0, 0.1, 0)
        aq.Size = UDim2.new(0, 40, 0, 20)
        aq.Font = Enum.Font.SourceSansPro
        aq.Text = V or ag
        aq.TextColor3 = Color3.fromRGB(200, 200, 200)
        aq.TextSize = 14.000
        if V and V ~= ag then
            O(V)
        end
        local function ar(p)
            local as = UDim2.new(math.clamp((p.Position.X - al.AbsolutePosition.X) / al.AbsoluteSize.X, 0, 1), 0, 1, 0)
            b.TweenService:Create(
                ao,
                TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                {Size = as}
            ):Play()
            local at = math.floor(as.X.Scale * ah / ah * (ah - ag) + ag)
            aq.Text = tostring(at)
            W[ai] = at
            O(at)
        end
        ak.InputBegan:Connect(
            function(p)
                if p.UserInputType == Enum.UserInputType.MouseButton1 then
                    spawn(
                        function()
                            b.TweenService:Create(
                                ao,
                                TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                                {BackgroundColor3 = Color3.fromRGB(200, 200, 255)}
                            ):Play()
                        end
                    )
                    ar(p)
                    k = true
                end
            end
        )
        ak.InputEnded:Connect(
            function(p)
                if p.UserInputType == Enum.UserInputType.MouseButton1 then
                    spawn(
                        function()
                            b.TweenService:Create(
                                ao,
                                TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                                {BackgroundColor3 = Color3.fromRGB(150, 150, 255)}
                            ):Play()
                        end
                    )
                    k = false
                end
            end
        )
        b.UserInputService.InputChanged:Connect(
            function(p)
                if k and p.UserInputType == Enum.UserInputType.MouseMovement then
                    ar(p)
                end
            end
        )
    end
    return M
end
return a
