local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("BAInteHubCore") then
    CoreGui.BAInteHubCore:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BAInteHubCore"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Silver & Gold Color Palette
local GOLD = Color3.fromRGB(212, 175, 55)
local SILVER = Color3.fromRGB(192, 192, 192)
local DARK_GOLD = Color3.fromRGB(184, 134, 11)
local LIGHT_SILVER = Color3.fromRGB(220, 220, 220)
local DARK_BG = Color3.fromRGB(30, 30, 30)
local MID_BG = Color3.fromRGB(45, 45, 45)
local WHITE = Color3.fromRGB(255, 255, 255)

local function v10(p1)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 220, 0, 32)
    Frame.Position = UDim2.new(1, 10, 1, -45)
    Frame.BackgroundColor3 = DARK_BG
    Frame.BackgroundTransparency = 0.1
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = Frame

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = GOLD
    UIStroke.Thickness = 1.5
    UIStroke.Parent = Frame

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, -12, 1, 0)
    TextLabel.Position = UDim2.new(0, 6, 0, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = p1
    TextLabel.TextColor3 = WHITE
    TextLabel.TextSize = 9
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Parent = Frame

    TweenService:Create(Frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -230, 1, -45)
    }):Play()

    task.delay(2.5, function()
        local tween = TweenService:Create(Frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 10, 1, -45)
        })
        tween:Play()
        tween.Completed:Connect(function()
            Frame:Destroy()
        end)
    end)
end

(function()
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9000000000
        Lighting.Brightness = 1

        local _ipairs = ipairs

        for _, v72 in _ipairs(Lighting:GetChildren()) do
            local v73 = v72:IsA("PostEffect")
            if not v73 then
                v73 = v72:IsA("BlurEffect")
                if not v73 then
                    v73 = v72:IsA("SunRaysEffect")
                    if not v73 then
                        v73 = v72:IsA("ColorCorrectionEffect") or v72:IsA("BloomEffect")
                    end
                end
            end
            if v73 then
                _ipairs = "Enabled"
                v72.Enabled = false
            end
        end

        local function v74(p2)
            if p2:IsA("BasePart") then
                p2.Material = Enum.Material.SmoothPlastic
                p2.Reflectance = 0
                return
            end
            local v79 = p2:IsA("Decal")
            if not v79 then
                v79 = p2:IsA("Texture")
            end
            if v79 then
                p2.Transparency = 1
                return
            end
            local v80 = p2:IsA("ParticleEmitter")
            if not v80 then
                v80 = p2:IsA("Trail")
                if not v80 then
                    v80 = p2:IsA("Smoke")
                    if not v80 then
                        v80 = p2:IsA("Fire")
                        if not v80 then
                            v80 = p2:IsA("Sparkles")
                        end
                    end
                end
            end
            if v80 then
                p2.Enabled = false
            end
        end

        for _, descendant in ipairs(Workspace:GetDescendants()) do
            v74(descendant)
        end
        Workspace.DescendantAdded:Connect(function(descendant)
            task.wait()
            v74(descendant)
        end)
    end)
    v10("Anti-Lag Activated")
end)()

-- Main GUI Frame
local Frame = Instance.new("Frame")
Frame.Name = "GlowFrame"
Frame.Size = UDim2.new(0, 328, 0, 248)
Frame.Position = UDim2.new(0.5, -164, 0.5, -124)
Frame.BackgroundColor3 = DARK_BG
Frame.BackgroundTransparency = 0.3
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local Frame2 = Instance.new("Frame")
Frame2.Name = "MainFrame"
Frame2.Size = UDim2.new(0, 320, 0, 240)
Frame2.Position = UDim2.new(0, 4, 0, 4)
Frame2.BackgroundColor3 = MID_BG
Frame2.BackgroundTransparency = 0.1
Frame2.BorderSizePixel = 0
Frame2.ClipsDescendants = true
Frame2.Parent = Frame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 10)
UICorner2.Parent = Frame2

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = GOLD
UIStroke.Thickness = 1.5
UIStroke.Parent = Frame2

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, GOLD),
    ColorSequenceKeypoint.new(0.5, SILVER),
    ColorSequenceKeypoint.new(1, GOLD)
})
UIGradient.Rotation = 45
UIGradient.Parent = Frame2

local n1 = 0
RunService.RenderStepped:Connect(function(dt)
    n1 = (n1 + dt * 1.5) % 6.283185307179586
    UIGradient.Rotation = math.sin(n1) * 15 + 45
    Frame.BackgroundTransparency = math.sin(n1 * 2) * 0.1 + 0.3
end)

-- Top Bar
local Frame3 = Instance.new("Frame")
Frame3.Name = "TopBar"
Frame3.Size = UDim2.new(1, 0, 0, 34)
Frame3.BackgroundColor3 = DARK_BG
Frame3.BackgroundTransparency = 0.15
Frame3.BorderSizePixel = 0
Frame3.Parent = Frame2

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 10)
UICorner3.Parent = Frame3

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, -40, 1, 0)
TextLabel.Position = UDim2.new(0, 10, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "BAInte Hub | discord.gg/Exh5pMMBCR"
TextLabel.TextColor3 = WHITE
TextLabel.TextSize = 11
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.Parent = Frame3

local TextButton = Instance.new("TextButton")
TextButton.Name = "MinimizeButton"
TextButton.Size = UDim2.new(0, 24, 0, 24)
TextButton.Position = UDim2.new(1, -28, 0.5, -12)
TextButton.BackgroundColor3 = DARK_GOLD
TextButton.Text = "_"
TextButton.TextColor3 = WHITE
TextButton.TextSize = 14
TextButton.Font = Enum.Font.GothamBold
TextButton.Parent = Frame3

local UICorner4 = Instance.new("UICorner")
UICorner4.CornerRadius = UDim.new(0, 6)
UICorner4.Parent = TextButton

-- Scrolling Frame
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollContainer"
ScrollingFrame.Size = UDim2.new(1, -12, 1, -42)
ScrollingFrame.Position = UDim2.new(0, 6, 0, 38)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 2
ScrollingFrame.ScrollBarImageColor3 = GOLD
ScrollingFrame.Parent = Frame2

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.Parent = ScrollingFrame
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 8)
end)

-- Script list (unchanged)
local t1 = {
    {Name = "ANTI HIT", HasKey = false, Script = "script_key = \"Trial\"; loadstring(game:HttpGet(\"https://api.getpolsec.com/scripts/hosted/6582551b42d21c6b7eb55f1d76d8d50ce53cb35592093d6615b5e83437594dc0.lua\"))()"},
    {Name = "BIGFROOT", HasKey = true, Script = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/hanniii1/Loader/refs/heads/main/BFLoader.lua\"))()"},
    {Name = "BK HUB", HasKey = false, Script = "loadstring(game:HttpGet(\"https://api.luarmor.net/files/v4/loaders/9ee4edde227ac85f50872bf9e4226508.lua\"))()"},
    {Name = "CLOVER HUB", HasKey = false, Script = "loadstring(game:HttpGet(\"https://rawscripts.net/raw/Steal-An-Egg-Clover-Hub-or-Auto-Steal-Egg-Predictor-Auto-Hatch-and-ESP-226600\"))()"},
    {Name = "FOXNAME HUB", HasKey = false, Script = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Bliqe/Upload/refs/heads/main/Games/RUO/12665928789.lua\"))()"},
    {Name = "FYY HUB", HasKey = false, Script = "loadstring(game:HttpGet(\"https://FyyCommunity.my.id\"))()"},
    {Name = "Keyless Hub", HasKey = false, Script = "loadstring(game:HttpGet(\"https://api.luarmor.net/files/v3/loaders/97c3f6db55a2cf72141537a85458e5a7.lua\"))()"},
    {Name = "LENNON HUB", HasKey = false, Script = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/lennonxscripts/lennonhubv2/main/stealaneggv2\"))()"},
    {Name = "LEST HUB", HasKey = false, Script = "getgenv().SCRIPT_KEY = \"KEYLESS\"; loadstring(game:HttpGet(\"https://api.jnkie.com/api/v1/luascripts/public/c916d48837ab69c48a9b3cafb04b49c8d9253af84cf8e403b19e2be302cbe67a/download\"))()"},
    {Name = "MIRANDA HUB", HasKey = false, Script = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/miirandahub/loader/refs/heads/main/stealaeggs\"))()"},
    {Name = "MOSHI HUB", HasKey = false, Script = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/moshixzn/ahhagdienavd/refs/heads/main/Loader.lua.txt\"))()"},
    {Name = "OBUROSBOS", HasKey = false, Script = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/joustingmatch/Ouroboros/main/loader.lua\"))()"},
    {Name = "OMG HUB", HasKey = true, Script = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua\"))()"},
    {Name = "OXIDE HUB", HasKey = false, Script = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/xulfo/Oxide-Loader/main/Main.lua\"))()"},
    {Name = "PET SPAWNER", HasKey = true, Script = "loadstring(game:HttpGet(\"https://scriptversekey.xyz/s/steal-an-egg-pet-spawner\"))()"},
    {Name = "RIFT HUB", HasKey = true, Script = "loadstring(game:HttpGet(\"https://rifton.top/loader.lua\"))()"},
    {Name = "SENA HUB KEYLESS", HasKey = false, Script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/senarblx/sena/refs/heads/main/loader'))()"},
    {Name = "SERVER FINDER 1 PEOPLE", HasKey = false, Script = "loadstring(game:HttpGet(\"https://api.obscuravm.com/scripts/8232205074136213997\"))()"},
    {Name = "STEAL AN EGG", HasKey = false, Script = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Dodoyung24/script-core/main/Steal-An-Egg\"))()"},
    {Name = "ZEROIN HUB", HasKey = true, Script = "loadstring(game:HttpGet(\"https://zeroinhub.com/api/script\"))()"}
}
table.sort(t1, function(p3, p4)
    return p3.Name:lower() < p4.Name:lower()
end)

for i, v in ipairs(t1) do
    local v28 = v
    local Frame4 = Instance.new("Frame")
    Frame4.Name = v28.Name
    Frame4.LayoutOrder = i
    Frame4.Size = UDim2.new(1, -4, 0, 32)
    Frame4.BackgroundColor3 = MID_BG
    Frame4.BackgroundTransparency = 0.15
    Frame4.Parent = ScrollingFrame

    local UICorner5 = Instance.new("UICorner")
    UICorner5.CornerRadius = UDim.new(0, 5)
    UICorner5.Parent = Frame4

    local UIStroke2 = Instance.new("UIStroke")
    UIStroke2.Color = SILVER
    UIStroke2.Thickness = 1
    UIStroke2.Parent = Frame4

    local TextLabel2 = Instance.new("TextLabel")
    TextLabel2.Size = UDim2.new(0.42, 0, 1, 0)
    TextLabel2.Position = UDim2.new(0, 8, 0, 0)
    TextLabel2.BackgroundTransparency = 1
    TextLabel2.Text = v28.Name
    TextLabel2.TextColor3 = WHITE
    TextLabel2.TextSize = 9
    TextLabel2.Font = Enum.Font.GothamSemibold
    TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel2.Parent = Frame4

    local Frame5 = Instance.new("Frame")
    Frame5.Size = UDim2.new(0, 56, 0, 18)
    Frame5.Position = UDim2.new(1, -132, 0.5, -9)
    Frame5.BorderSizePixel = 0
    Frame5.Parent = Frame4

    local UICorner6 = Instance.new("UICorner")
    UICorner6.CornerRadius = UDim.new(0, 4)
    UICorner6.Parent = Frame5

    local UIStroke3 = Instance.new("UIStroke")
    UIStroke3.Thickness = 1
    UIStroke3.Parent = Frame5

    local TextLabel3 = Instance.new("TextLabel")
    TextLabel3.Size = UDim2.new(1, 0, 1, 0)
    TextLabel3.BackgroundTransparency = 1
    TextLabel3.TextSize = 8
    TextLabel3.Font = Enum.Font.GothamBold
    TextLabel3.Parent = Frame5

    if v28.HasKey then
        Frame5.BackgroundColor3 = DARK_GOLD
        UIStroke3.Color = GOLD
        TextLabel3.Text = "KEY"
        TextLabel3.TextColor3 = WHITE
    else
        Frame5.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        UIStroke3.Color = SILVER
        TextLabel3.Text = "KEYLESS"
        TextLabel3.TextColor3 = WHITE
    end

    local TextButton2 = Instance.new("TextButton")
    TextButton2.Size = UDim2.new(0, 64, 0, 22)
    TextButton2.Position = UDim2.new(1, -70, 0.5, -11)
    TextButton2.BackgroundColor3 = DARK_GOLD
    TextButton2.Text = "EXECUTE"
    TextButton2.TextColor3 = WHITE
    TextButton2.TextSize = 9
    TextButton2.Font = Enum.Font.GothamBold
    TextButton2.Parent = Frame4

    local UICorner7 = Instance.new("UICorner")
    UICorner7.CornerRadius = UDim.new(0, 4)
    UICorner7.Parent = TextButton2

    local UIStroke4 = Instance.new("UIStroke")
    UIStroke4.Color = GOLD
    UIStroke4.Thickness = 1
    UIStroke4.Parent = TextButton2

    TextButton2.MouseButton1Click:Connect(function()
        pcall(function()
            loadstring(v28.Script)()
        end)
        TextButton2.Text = "LOADED"
        TextButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton2.BackgroundColor3 = GOLD
        UIStroke4.Color = DARK_GOLD
        v10("Executed " .. v28.Name)
        task.delay(2, function()
            TextButton2.Text = "EXECUTE"
            TextButton2.TextColor3 = WHITE
            TextButton2.BackgroundColor3 = DARK_GOLD
            UIStroke4.Color = GOLD
        end)
    end)
end

-- Dragging logic
local u40
local u41
local inputPosition
local FramePosition

Frame3.InputBegan:Connect(function(input)
    local v55 = input.UserInputType == Enum.UserInputType.MouseButton1
    if not v55 then
        v55 = input.UserInputType == Enum.UserInputType.Touch
    end
    if v55 then
        u40 = true
        inputPosition = input.Position
        FramePosition = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                u40 = false
            end
        end)
    end
end)

Frame3.InputChanged:Connect(function(input)
    local v57 = input.UserInputType == Enum.UserInputType.MouseMovement
    if not v57 then
        v57 = input.UserInputType == Enum.UserInputType.Touch
    end
    if v57 then
        u41 = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == u41 and u40 then
        local v59 = input.Position - inputPosition
        Frame.Position = UDim2.new(FramePosition.X.Scale, FramePosition.X.Offset + v59.X, FramePosition.Y.Scale, FramePosition.Y.Offset + v59.Y)
    end
end)

-- Minimize toggle
local u44 = false
TextButton.MouseButton1Click:Connect(function()
    if u44 then
        ScrollingFrame.Visible = true
        TextButton.Text = "_"
        TweenService:Create(Frame, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 328, 0, 248)
        }):Play()
        TweenService:Create(Frame2, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 320, 0, 240)
        }):Play()
        u44 = false
        return
    end
    TextButton.Text = "+"
    local tween = TweenService:Create(Frame, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 328, 0, 42)
    })
    TweenService:Create(Frame2, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 320, 0, 34)
    }):Play()
    tween:Play()
    tween.Completed:Connect(function()
        if u44 then
            ScrollingFrame.Visible = false
        end
    end)
    u44 = true
end)

-- Toggle visibility with RightControl or Insert
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        local v63 = input.KeyCode == Enum.KeyCode.RightControl
        if not v63 then
            v63 = input.KeyCode == Enum.KeyCode.Insert
        end
        if v63 then
            Frame.Visible = not Frame.Visible
        end
    end
end)

-- Nametag with white text
local function v45(p5)
    if not p5 then return end
    local Head = p5:WaitForChild("Head", 5)
    if not Head then return end
    if Head:FindFirstChild("BAInteTag") then
        Head.BAInteTag:Destroy()
    end

    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "BAInteTag"
    BillboardGui.Size = UDim2.new(0, 200, 0, 35)
    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Parent = Head

    local TextLabel4 = Instance.new("TextLabel")
    TextLabel4.Size = UDim2.new(1, 0, 1, 0)
    TextLabel4.BackgroundTransparency = 1
    TextLabel4.Text = "BAInte Hub | discord.gg/Exh5pMMBCR"
    TextLabel4.TextSize = 12
    TextLabel4.Font = Enum.Font.GothamBold
    TextLabel4.TextColor3 = WHITE
    TextLabel4.Parent = BillboardGui
end

if LocalPlayer.Character then
    v45(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(v45)