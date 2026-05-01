-- 🥋😈😈 FIVEM PANEL
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Configurações
local Settings = {
    Aimbot = {
        Legit = false,
        Rage = false,
        Aimlock = false,
        TeamCheck = false,
        WallCheck = false,
        ShowFOV = false,
        FOVSize = 150
    },
    ESP = {
        Line = false,
        Box = false,
        Skeleton = false,
        Distance = false,
        Name = false
    },
    Random = {
        HitboxExpander = false,
        HitboxSize = 5
    }
}

-- Criar ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FiveMPanel"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    if LocalPlayer.PlayerGui:FindFirstChild("FiveMPanel") then
        LocalPlayer.PlayerGui:FindFirstChild("FiveMPanel"):Destroy()
    end
end)

ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- CORES TOP PRETO/ROXO/ROSA
local BgBlack = Color3.fromRGB(15, 15, 20)
local SidebarBlack = Color3.fromRGB(20, 20, 25)
local ItemBlack = Color3.fromRGB(25, 25, 30)
local AccentPurple = Color3.fromRGB(138, 43, 226) -- Roxo vibrante
local AccentPink = Color3.fromRGB(255, 105, 180) -- Rosa neon
local TextWhite = Color3.fromRGB(255, 255, 255)
local ESPBlack = Color3.fromRGB(0, 0, 0)

-- ========== BOTÃO TOGGLE ==========
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 70, 0, 70)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -35)
ToggleButton.BackgroundColor3 = AccentPurple
ToggleButton.Text = "👾"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 35
ToggleButton.TextColor3 = TextWhite
ToggleButton.ZIndex = 100
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = AccentPink
ToggleStroke.Thickness = 3
ToggleStroke.Parent = ToggleButton

-- Efeito de brilho
local ToggleGradient = Instance.new("UIGradient")
ToggleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, AccentPurple),
    ColorSequenceKeypoint.new(0.5, AccentPink),
    ColorSequenceKeypoint.new(1, AccentPurple)
}
ToggleGradient.Rotation = 45
ToggleGradient.Parent = ToggleButton

-- ========== PAINEL PRINCIPAL ==========
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 380)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -190)
MainFrame.BackgroundColor3 = BgBlack
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 10
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = AccentPink
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Sombra/Brilho
local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))
}
MainGradient.Rotation = 90
MainGradient.Parent = MainFrame

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = SidebarBlack
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

-- Título com gradiente
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🥋😈😈 FIVEM PANEL"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextColor3 = AccentPink
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, AccentPurple),
    ColorSequenceKeypoint.new(1, AccentPink)
}
TitleGradient.Parent = Title

-- Botão Fechar
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -45, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseButton.Text = "✕"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 20
CloseButton.TextColor3 = TextWhite
CloseButton.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

-- ========== SIDEBAR ==========
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 100, 1, -55)
Sidebar.Position = UDim2.new(0, 0, 0, 55)
Sidebar.BackgroundColor3 = SidebarBlack
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Padding = UDim.new(0, 5)
SidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SidebarLayout.Parent = Sidebar

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingTop = UDim.new(0, 10)
SidebarPadding.Parent = Sidebar

-- ========== CONTENT AREA ==========
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -110, 1, -65)
ContentArea.Position = UDim2.new(0, 105, 0, 60)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- Função criar Tab
local function CreateTab(text, icon)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(0, 90, 0, 70)
    TabButton.BackgroundColor3 = ItemBlack
    TabButton.Text = ""
    TabButton.Parent = Sidebar
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 6)
    TabCorner.Parent = TabButton
    
    local TabStroke = Instance.new("UIStroke")
    TabStroke.Color = Color3.fromRGB(70, 70, 75)
    TabStroke.Thickness = 2
    TabStroke.Parent = TabButton
    
    local IconLabel = Instance.new("TextLabel")
    IconLabel.Size = UDim2.new(1, 0, 0, 30)
    IconLabel.Position = UDim2.new(0, 0, 0, 10)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Text = icon
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.TextSize = 22
    IconLabel.TextColor3 = TextWhite
    IconLabel.Parent = TabButton
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, 0, 0, 20)
    TextLabel.Position = UDim2.new(0, 0, 1, -25)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = text
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextSize = 10
    TextLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    TextLabel.Parent = TabButton
    
    local Content = Instance.new("ScrollingFrame")
    Content.Size = UDim2.new(1, -10, 1, -10)
    Content.Position = UDim2.new(0, 5, 0, 5)
    Content.BackgroundTransparency = 1
    Content.BorderSizePixel = 0
    Content.ScrollBarThickness = 5
    Content.ScrollBarImageColor3 = AccentPurple
    Content.Visible = false
    Content.CanvasSize = UDim2.new(0, 0, 0, 0)
    Content.Parent = ContentArea
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Padding = UDim.new(0, 10)
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Parent = Content
    
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Content.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 10)
    end)
    
    return TabButton, Content, TabStroke, TextLabel
end

-- Função criar Toggle Inline
local function CreateToggleInline(parent, text, default, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(0.48, 0, 0, 50)
    ToggleFrame.BackgroundColor3 = ItemBlack
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = parent
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 6)
    ToggleCorner.Parent = ToggleFrame
    
    local ToggleStroke = Instance.new("UIStroke")
    ToggleStroke.Color = Color3.fromRGB(70, 70, 75)
    ToggleStroke.Thickness = 1
    ToggleStroke.Parent = ToggleFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -35, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 13
    Label.TextColor3 = TextWhite
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = ToggleFrame
    
    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(0, 24, 0, 24)
    Toggle.Position = UDim2.new(1, -30, 0.5, -12)
    Toggle.BackgroundColor3 = default and AccentPurple or Color3.fromRGB(70, 70, 75)
    Toggle.Text = ""
    Toggle.Parent = ToggleFrame
    
    local ToggleCorner2 = Instance.new("UICorner")
    ToggleCorner2.CornerRadius = UDim.new(0, 4)
    ToggleCorner2.Parent = Toggle
    
    local CheckIcon = Instance.new("TextLabel")
    CheckIcon.Size = UDim2.new(1, 0, 1, 0)
    CheckIcon.BackgroundTransparency = 1
    CheckIcon.Text = default and "✓" or ""
    CheckIcon.Font = Enum.Font.GothamBold
    CheckIcon.TextSize = 18
    CheckIcon.TextColor3 = TextWhite
    CheckIcon.Parent = Toggle
    
    local enabled = default
    
    Toggle.MouseButton1Click:Connect(function()
        enabled = not enabled
        callback(enabled)
        
        Toggle.BackgroundColor3 = enabled and AccentPurple or Color3.fromRGB(70, 70, 75)
        CheckIcon.Text = enabled and "✓" or ""
    end)
    
    return ToggleFrame
end

-- Função criar Slider
local function CreateSlider(parent, text, min, max, default, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1, 0, 0, 60)
    SliderFrame.BackgroundColor3 = ItemBlack
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = parent
    
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 6)
    SliderCorner.Parent = SliderFrame
    
    local SliderStroke = Instance.new("UIStroke")
    SliderStroke.Color = Color3.fromRGB(70, 70, 75)
    SliderStroke.Thickness = 1
    SliderStroke.Parent = SliderFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 0, 22)
    Label.Position = UDim2.new(0, 12, 0, 10)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 13
    Label.TextColor3 = TextWhite
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = SliderFrame
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0.3, 0, 0, 22)
    ValueLabel.Position = UDim2.new(0.7, 0, 0, 10)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(default)
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextSize = 13
    ValueLabel.TextColor3 = AccentPurple
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = SliderFrame
    
    local SliderBG = Instance.new("Frame")
    SliderBG.Size = UDim2.new(1, -24, 0, 8)
    SliderBG.Position = UDim2.new(0, 12, 1, -20)
    SliderBG.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    SliderBG.BorderSizePixel = 0
    SliderBG.Parent = SliderFrame
    
    local SliderBGCorner = Instance.new("UICorner")
    SliderBGCorner.CornerRadius = UDim.new(1, 0)
    SliderBGCorner.Parent = SliderBG
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = AccentPurple
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderBG
    
    local SliderFillCorner = Instance.new("UICorner")
    SliderFillCorner.CornerRadius = UDim.new(1, 0)
    SliderFillCorner.Parent = SliderFill
    
    local SliderButton = Instance.new("TextButton")
    SliderButton.Size = UDim2.new(1, 0, 1, 10)
    SliderButton.Position = UDim2.new(0, 0, 0, -5)
    SliderButton.BackgroundTransparency = 1
    SliderButton.Text = ""
    SliderButton.Parent = SliderBG
    
    local dragging = false
    
    local function update(input)
        local pos = math.clamp((input.Position.X - SliderBG.AbsolutePosition.X) / SliderBG.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * pos)
        
        SliderFill.Size = UDim2.new(pos, 0, 1, 0)
        ValueLabel.Text = tostring(value)
        callback(value)
    end
    
    SliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
    
    return SliderFrame
end

-- Criar Tabs
local AimbotTab, AimbotContent, AimbotStroke, AimbotText = CreateTab("AIMBOT", "🎯")
local ESPTab, ESPContent, ESPStroke, ESPText = CreateTab("ESP", "👁️")
local RandomTab, RandomContent, RandomStroke, RandomText = CreateTab("RANDOM", "🎲")

-- Sistema de troca de tabs
local currentTab = AimbotContent
local currentButton = AimbotTab
local currentStroke = AimbotStroke
local currentText = AimbotText

local function SwitchTab(content, button, stroke, text)
    currentTab.Visible = false
    currentButton.BackgroundColor3 = ItemBlack
    currentStroke.Color = Color3.fromRGB(70, 70, 75)
    currentText.TextColor3 = Color3.fromRGB(180, 180, 180)
    
    content.Visible = true
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 75)
    stroke.Color = AccentPurple
    text.TextColor3 = AccentPurple
    
    currentTab = content
    currentButton = button
    currentStroke = stroke
    currentText = text
end

AimbotTab.MouseButton1Click:Connect(function()
    SwitchTab(AimbotContent, AimbotTab, AimbotStroke, AimbotText)
end)

ESPTab.MouseButton1Click:Connect(function()
    SwitchTab(ESPContent, ESPTab, ESPStroke, ESPText)
end)

RandomTab.MouseButton1Click:Connect(function()
    SwitchTab(RandomContent, RandomTab, RandomStroke, RandomText)
end)

-- ========== CONTEÚDO AIMBOT ==========
-- Linha 1
local AimbotRow1 = Instance.new("Frame")
AimbotRow1.Size = UDim2.new(1, 0, 0, 50)
AimbotRow1.BackgroundTransparency = 1
AimbotRow1.Parent = AimbotContent

local AimbotRow1Layout = Instance.new("UIListLayout")
AimbotRow1Layout.FillDirection = Enum.FillDirection.Horizontal
AimbotRow1Layout.Padding = UDim.new(0, 10)
AimbotRow1Layout.Parent = AimbotRow1

CreateToggleInline(AimbotRow1, "Aimbot Legit", false, function(value)
    Settings.Aimbot.Legit = value
    if value then
        Settings.Aimbot.Rage = false
    end
end)

CreateToggleInline(AimbotRow1, "Aimbot Rage", false, function(value)
    Settings.Aimbot.Rage = value
    if value then
        Settings.Aimbot.Legit = false
    end
end)

-- Linha 2
local AimbotRow2 = Instance.new("Frame")
AimbotRow2.Size = UDim2.new(1, 0, 0, 50)
AimbotRow2.BackgroundTransparency = 1
AimbotRow2.Parent = AimbotContent

local AimbotRow2Layout = Instance.new("UIListLayout")
AimbotRow2Layout.FillDirection = Enum.FillDirection.Horizontal
AimbotRow2Layout.Padding = UDim.new(0, 10)
AimbotRow2Layout.Parent = AimbotRow2

CreateToggleInline(AimbotRow2, "Team Check", false, function(value)
    Settings.Aimbot.TeamCheck = value
end)

CreateToggleInline(AimbotRow2, "Wall Check", false, function(value)
    Settings.Aimbot.WallCheck = value
end)

-- Linha 3
local AimbotRow3 = Instance.new("Frame")
AimbotRow3.Size = UDim2.new(1, 0, 0, 50)
AimbotRow3.BackgroundTransparency = 1
AimbotRow3.Parent = AimbotContent

local AimbotRow3Layout = Instance.new("UIListLayout")
AimbotRow3Layout.FillDirection = Enum.FillDirection.Horizontal
AimbotRow3Layout.Padding = UDim.new(0, 10)
AimbotRow3Layout.Parent = AimbotRow3

CreateToggleInline(AimbotRow3, "Aimlock", false, function(value)
    Settings.Aimbot.Aimlock = value
end)

CreateToggleInline(AimbotRow3, "Mostrar FOV", false, function(value)
    Settings.Aimbot.ShowFOV = value
end)

-- Slider FOV
CreateSlider(AimbotContent, "FOV Size", 0, 500, 150, function(value)
    Settings.Aimbot.FOVSize = value
end)

-- ========== CONTEÚDO ESP ==========
-- Linha 1
local ESPRow1 = Instance.new("Frame")
ESPRow1.Size = UDim2.new(1, 0, 0, 50)
ESPRow1.BackgroundTransparency = 1
ESPRow1.Parent = ESPContent

local ESPRow1Layout = Instance.new("UIListLayout")
ESPRow1Layout.FillDirection = Enum.FillDirection.Horizontal
ESPRow1Layout.Padding = UDim.new(0, 10)
ESPRow1Layout.Parent = ESPRow1

CreateToggleInline(ESPRow1, "ESP Linha", false, function(value)
    Settings.ESP.Line = value
end)

CreateToggleInline(ESPRow1, "ESP Caixa", false, function(value)
    Settings.ESP.Box = value
end)

-- Linha 2
local ESPRow2 = Instance.new("Frame")
ESPRow2.Size = UDim2.new(1, 0, 0, 50)
ESPRow2.BackgroundTransparency = 1
ESPRow2.Parent = ESPContent

local ESPRow2Layout = Instance.new("UIListLayout")
ESPRow2Layout.FillDirection = Enum.FillDirection.Horizontal
ESPRow2Layout.Padding = UDim.new(0, 10)
ESPRow2Layout.Parent = ESPRow2

CreateToggleInline(ESPRow2, "ESP Esqueleto", false, function(value)
    Settings.ESP.Skeleton = value
end)

CreateToggleInline(ESPRow2, "ESP Distância", false, function(value)
    Settings.ESP.Distance = value
end)

-- Linha 3
local ESPRow3 = Instance.new("Frame")
ESPRow3.Size = UDim2.new(1, 0, 0, 50)
ESPRow3.BackgroundTransparency = 1
ESPRow3.Parent = ESPContent

CreateToggleInline(ESPRow3, "ESP Nome", false, function(value)
    Settings.ESP.Name = value
end)

-- ========== CONTEÚDO RANDOM ==========
CreateToggleInline(RandomContent, "Hitbox Expander", false, function(value)
    Settings.Random.HitboxExpander = value
end)

CreateSlider(RandomContent, "Tamanho Hitbox", 0, 100, 5, function(value)
    Settings.Random.HitboxSize = value
end)

-- Ativar primeira aba
AimbotContent.Visible = true
AimbotTab.BackgroundColor3 = Color3.fromRGB(70, 70, 75)
AimbotStroke.Color = AccentPurple
AimbotText.TextColor3 = AccentPurple

-- ========== TOGGLE PAINEL ==========
local isOpen = true

ToggleButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    MainFrame.Visible = isOpen
end)

CloseButton.MouseButton1Click:Connect(function()
    isOpen = false
    MainFrame.Visible = false
end)

-- ========== FOV CIRCLE ==========
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.Color = Color3.fromRGB(255, 105, 180) -- Rosa
FOVCircle.Transparency = 1
FOVCircle.Filled = false

-- ========== ESP OBJECTS ==========
local ESPObjects = {}

-- ========== AIMBOT ==========
local function GetClosestPlayer()
    if not (Settings.Aimbot.Legit or Settings.Aimbot.Rage or Settings.Aimbot.Aimlock) then return nil end
    if not LocalPlayer.Character then return nil end
    
    local closestPlayer = nil
    local shortestDistance = Settings.Aimbot.FOVSize
    local cameraPosition = Camera.CFrame.Position
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local head = character:FindFirstChild("Head")
            local humanoid = character:FindFirstChild("Humanoid")
            
            if head and humanoid and humanoid.Health > 0 then
                -- Team Check
                local isTeammate = Settings.Aimbot.TeamCheck and player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team
                
                if not isTeammate then
                    local screenPoint, onScreen = Camera:WorldToViewportPoint(head.Position)
                    
                    if onScreen then
                        -- Wall Check
                        local hasWall = false
                        if Settings.Aimbot.WallCheck then
                            local raycastParams = RaycastParams.new()
                            raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                            raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, character}
                            raycastParams.IgnoreWater = true
                            
                            local direction = (head.Position - cameraPosition)
                            local rayResult = workspace:Raycast(cameraPosition, direction, raycastParams)
                            hasWall = rayResult ~= nil
                        end
                        
                        if not hasWall then
                            local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - screenCenter).Magnitude
                            
                            if distance < shortestDistance then
                                closestPlayer = player
                                shortestDistance = distance
                            end
                        end
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

-- ========== ESP FUNCTIONS ==========
local function UpdateESPLines()
    if not Settings.ESP.Line then
        for _, player in pairs(Players:GetPlayers()) do
            if ESPObjects[player] and ESPObjects[player].Line then
                pcall(function() ESPObjects[player].Line.Visible = false end)
            end
        end
        return
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local hrp = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChild("Humanoid")
            
            if hrp and humanoid and humanoid.Health > 0 then
                if not ESPObjects[player] then
                    ESPObjects[player] = {}
                end
                
                if not ESPObjects[player].Line then
                    local success, line = pcall(function()
                        local l = Drawing.new("Line")
                        l.Visible = false
                        l.Thickness = 2
                        l.Color = ESPBlack
                        l.Transparency = 1
                        return l
                    end)
                    
                    if success then
                        ESPObjects[player].Line = line
                    end
                end
                
                if ESPObjects[player].Line then
                    local line = ESPObjects[player].Line
                    local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                    
                    if onScreen then
                        pcall(function()
                            line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                            line.To = Vector2.new(screenPos.X, screenPos.Y)
                            line.Visible = true
                        end)
                    else
                        pcall(function() line.Visible = false end)
                    end
                end
            else
                if ESPObjects[player] and ESPObjects[player].Line then
                    pcall(function() ESPObjects[player].Line.Visible = false end)
                end
            end
        end
    end
end

local function UpdateESPBoxes()
    if not Settings.ESP.Box then
        for _, player in pairs(Players:GetPlayers()) do
            if ESPObjects[player] and ESPObjects[player].Box then
                for _, line in pairs(ESPObjects[player].Box) do
                    pcall(function() line.Visible = false end)
                end
            end
        end
        return
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local hrp = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChild("Humanoid")
            local head = character:FindFirstChild("Head")
            
            if hrp and humanoid and humanoid.Health > 0 and head then
                if not ESPObjects[player] then
                    ESPObjects[player] = {}
                end
                
                if not ESPObjects[player].Box then
                    local success, box = pcall(function()
                        local lines = {}
                        for i = 1, 4 do
                            local line = Drawing.new("Line")
                            line.Visible = false
                            line.Thickness = 2
                            line.Color = ESPBlack
                            line.Transparency = 1
                            lines[i] = line
                        end
                        return lines
                    end)
                    
                    if success then
                        ESPObjects[player].Box = box
                    end
                end
                
                if ESPObjects[player].Box then
                    local box = ESPObjects[player].Box
                    
                    local headPos = head.Position + Vector3.new(0, 0.5, 0)
                    local footPos = hrp.Position - Vector3.new(0, 3, 0)
                    
                    local headScreen, headVis = Camera:WorldToViewportPoint(headPos)
                    local footScreen, footVis = Camera:WorldToViewportPoint(footPos)
                    
                    if headVis and footVis then
                        local height = math.abs(footScreen.Y - headScreen.Y)
                        local width = height * 0.5
                        
                        local topLeft = Vector2.new(headScreen.X - width, headScreen.Y)
                        local topRight = Vector2.new(headScreen.X + width, headScreen.Y)
                        local bottomLeft = Vector2.new(footScreen.X - width, footScreen.Y)
                        local bottomRight = Vector2.new(footScreen.X + width, footScreen.Y)
                        
                        pcall(function()
                            box[1].From = topLeft
                            box[1].To = topRight
                            box[1].Visible = true
                            
                            box[2].From = bottomLeft
                            box[2].To = bottomRight
                            box[2].Visible = true
                            
                            box[3].From = topLeft
                            box[3].To = bottomLeft
                            box[3].Visible = true
                            
                            box[4].From = topRight
                            box[4].To = bottomRight
                            box[4].Visible = true
                        end)
                    else
                        for _, line in pairs(box) do
                            pcall(function() line.Visible = false end)
                        end
                    end
                end
            else
                if ESPObjects[player] and ESPObjects[player].Box then
                    for _, line in pairs(ESPObjects[player].Box) do
                        pcall(function() line.Visible = false end)
                    end
                end
            end
        end
    end
end

local function UpdateESPSkeleton()
    if not Settings.ESP.Skeleton then
        for _, player in pairs(Players:GetPlayers()) do
            if ESPObjects[player] and ESPObjects[player].Skeleton then
                for _, line in pairs(ESPObjects[player].Skeleton) do
                    pcall(function() line.Visible = false end)
                end
            end
        end
        return
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local humanoid = character:FindFirstChild("Humanoid")
            local head = character:FindFirstChild("Head")
            local upperTorso = character:FindFirstChild("UpperTorso")
            local leftUpperArm = character:FindFirstChild("LeftUpperArm")
            local rightUpperArm = character:FindFirstChild("RightUpperArm")
            
            if humanoid and humanoid.Health > 0 and head and upperTorso then
                if not ESPObjects[player] then
                    ESPObjects[player] = {}
                end
                
                if not ESPObjects[player].Skeleton then
                    local success, skeleton = pcall(function()
                        local lines = {}
                        for i = 1, 3 do
                            local line = Drawing.new("Line")
                            line.Visible = false
                            line.Thickness = 2
                            line.Color = ESPBlack
                            line.Transparency = 1
                            lines[i] = line
                        end
                        return lines
                    end)
                    
                    if success then
                        ESPObjects[player].Skeleton = skeleton
                    end
                end
                
                if ESPObjects[player].Skeleton then
                    local skeleton = ESPObjects[player].Skeleton
                    
                    local headPos, headVis = Camera:WorldToViewportPoint(head.Position)
                    local torsoPos, torsoVis = Camera:WorldToViewportPoint(upperTorso.Position)
                    
                    if headVis and torsoVis then
                        pcall(function()
                            skeleton[1].From = Vector2.new(headPos.X, headPos.Y)
                            skeleton[1].To = Vector2.new(torsoPos.X, torsoPos.Y)
                            skeleton[1].Visible = true
                        end)
                    else
                        pcall(function() skeleton[1].Visible = false end)
                    end
                    
                    if leftUpperArm then
                        local leftArmPos, leftArmVis = Camera:WorldToViewportPoint(leftUpperArm.Position)
                        if torsoVis and leftArmVis then
                            pcall(function()
                                skeleton[2].From = Vector2.new(torsoPos.X, torsoPos.Y)
                                skeleton[2].To = Vector2.new(leftArmPos.X, leftArmPos.Y)
                                skeleton[2].Visible = true
                            end)
                        else
                            pcall(function() skeleton[2].Visible = false end)
                        end
                    end
                    
                    if rightUpperArm then
                        local rightArmPos, rightArmVis = Camera:WorldToViewportPoint(rightUpperArm.Position)
                        if torsoVis and rightArmVis then
                            pcall(function()
                                skeleton[3].From = Vector2.new(torsoPos.X, torsoPos.Y)
                                skeleton[3].To = Vector2.new(rightArmPos.X, rightArmPos.Y)
                                skeleton[3].Visible = true
                            end)
                        else
                            pcall(function() skeleton[3].Visible = false end)
                        end
                    end
                end
            else
                if ESPObjects[player] and ESPObjects[player].Skeleton then
                    for _, line in pairs(ESPObjects[player].Skeleton) do
                        pcall(function() line.Visible = false end)
                    end
                end
            end
        end
    end
end

local function UpdateESPNames()
    if not Settings.ESP.Name then
        for _, player in pairs(Players:GetPlayers()) do
            if ESPObjects[player] and ESPObjects[player].NameTag then
                pcall(function() ESPObjects[player].NameTag.Visible = false end)
            end
        end
        return
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local head = character:FindFirstChild("Head")
            local humanoid = character:FindFirstChild("Humanoid")
            
            if head and humanoid and humanoid.Health > 0 then
                if not ESPObjects[player] then
                    ESPObjects[player] = {}
                end
                
                if not ESPObjects[player].NameTag then
                    local success, nameTag = pcall(function()
                        local t = Drawing.new("Text")
                        t.Visible = false
                        t.Size = 14
                        t.Color = ESPBlack
                        t.Center = true
                        t.Outline = true
                        t.OutlineColor = Color3.fromRGB(255, 255, 255)
                        t.Transparency = 1
                        return t
                    end)
                    
                    if success then
                        ESPObjects[player].NameTag = nameTag
                    end
                end
                
                if ESPObjects[player].NameTag then
                    local nameTag = ESPObjects[player].NameTag
                    local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1, 0))
                    
                    if onScreen then
                        pcall(function()
                            nameTag.Position = Vector2.new(screenPos.X, screenPos.Y)
                            nameTag.Text = player.Name
                            nameTag.Visible = true
                        end)
                    else
                        pcall(function() nameTag.Visible = false end)
                    end
                end
            else
                if ESPObjects[player] and ESPObjects[player].NameTag then
                    pcall(function() ESPObjects[player].NameTag.Visible = false end)
                end
            end
        end
    end
end

local function UpdateESPDistance()
    if not Settings.ESP.Distance then
        for _, player in pairs(Players:GetPlayers()) do
            if ESPObjects[player] and ESPObjects[player].Distance then
                pcall(function() ESPObjects[player].Distance.Visible = false end)
            end
        end
        return
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and LocalPlayer.Character then
            local character = player.Character
            local head = character:FindFirstChild("Head")
            local humanoid = character:FindFirstChild("Humanoid")
            local myHrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local hrp = character:FindFirstChild("HumanoidRootPart")
            
            if head and humanoid and humanoid.Health > 0 and myHrp and hrp then
                if not ESPObjects[player] then
                    ESPObjects[player] = {}
                end
                
                if not ESPObjects[player].Distance then
                    local success, distTag = pcall(function()
                        local t = Drawing.new("Text")
                        t.Visible = false
                        t.Size = 12
                        t.Color = ESPBlack
                        t.Center = true
                        t.Outline = true
                        t.OutlineColor = Color3.fromRGB(255, 255, 255)
                        t.Transparency = 1
                        return t
                    end)
                    
                    if success then
                        ESPObjects[player].Distance = distTag
                    end
                end
                
                if ESPObjects[player].Distance then
                    local distTag = ESPObjects[player].Distance
                    local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1.5, 0))
                    
                    if onScreen then
                        local distance = math.floor((myHrp.Position - hrp.Position).Magnitude)
                        pcall(function()
                            distTag.Position = Vector2.new(screenPos.X, screenPos.Y)
                            distTag.Text = tostring(distance) .. "m"
                            distTag.Visible = true
                        end)
                    else
                        pcall(function() distTag.Visible = false end)
                    end
                end
            else
                if ESPObjects[player] and ESPObjects[player].Distance then
                    pcall(function() ESPObjects[player].Distance.Visible = false end)
                end
            end
        end
    end
end

-- ========== LOOP PRINCIPAL ==========
-- Tabela para salvar tamanhos originais
local OriginalSizes = {}

RunService.RenderStepped:Connect(function()
    -- HITBOX EXPANDER
    if Settings.Random.HitboxExpander then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    -- Salvar tamanho original
                    if not OriginalSizes[player] then
                        OriginalSizes[player] = hrp.Size
                    end
                    
                    -- Expandir hitbox
                    local newSize = Settings.Random.HitboxSize
                    hrp.Size = Vector3.new(newSize, newSize, newSize)
                    hrp.Transparency = 0.7
                    hrp.CanCollide = false
                    hrp.Massless = true
                end
            end
        end
    else
        -- Restaurar tamanhos originais
        for player, originalSize in pairs(OriginalSizes) do
            if player.Character then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Size = originalSize
                    hrp.Transparency = 1
                    hrp.CanCollide = false
                end
            end
        end
    end
    
    -- AIMBOT
    if (Settings.Aimbot.Legit or Settings.Aimbot.Rage or Settings.Aimbot.Aimlock) and LocalPlayer.Character then
        local target = GetClosestPlayer()
        if target and target.Character then
            local head = target.Character:FindFirstChild("Head")
            if head then
                local smoothness = 1.0
                
                -- Aimbot Legit: 0.59
                if Settings.Aimbot.Legit then
                    smoothness = 0.59
                end
                
                -- Aimbot Rage e Aimlock: 1.0
                if Settings.Aimbot.Rage or Settings.Aimbot.Aimlock then
                    smoothness = 1.0
                end
                
                Camera.CFrame = Camera.CFrame:Lerp(
                    CFrame.new(Camera.CFrame.Position, head.Position),
                    smoothness
                )
            end
        end
    end
    
    -- FOV CIRCLE
    if Settings.Aimbot.ShowFOV then
        FOVCircle.Visible = true
        FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        FOVCircle.Radius = Settings.Aimbot.FOVSize
    else
        FOVCircle.Visible = false
    end
    
    -- ESP
    UpdateESPLines()
    UpdateESPBoxes()
    UpdateESPSkeleton()
    UpdateESPNames()
    UpdateESPDistance()
end)

-- Cleanup
Players.PlayerRemoving:Connect(function(player)
    -- Limpar OriginalSizes
    if OriginalSizes[player] then
        OriginalSizes[player] = nil
    end
    
    if ESPObjects[player] then
        if ESPObjects[player].Line then pcall(function() ESPObjects[player].Line:Remove() end) end
        if ESPObjects[player].Box then
            for _, line in pairs(ESPObjects[player].Box) do
                pcall(function() line:Remove() end)
            end
        end
        if ESPObjects[player].Skeleton then
            for _, line in pairs(ESPObjects[player].Skeleton) do
                pcall(function() line:Remove() end)
            end
        end
        if ESPObjects[player].NameTag then pcall(function() ESPObjects[player].NameTag:Remove() end) end
        if ESPObjects[player].Distance then pcall(function() ESPObjects[player].Distance:Remove() end) end
        ESPObjects[player] = nil
    end
end)

print("🥋😈😈 FIVEM PANEL carregado!")
