-- =====================================================
--  HAIDWNG HUB | BLOX FRUITS ULTIMATE
--  Giao diện Pastel Cute | Kéo thả | Tabs
--  Telegram: @haidwng12 | Group: https://t.me/haidwngtool
-- =====================================================

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- ========== MÀU PASTEL ==========
local Colors = {
    Main = Color3.fromRGB(255, 245, 250),
    Accent = Color3.fromRGB(255, 183, 197),
    AccentDark = Color3.fromRGB(210, 130, 150),
    Text = Color3.fromRGB(80, 60, 70),
    TextDim = Color3.fromRGB(140, 100, 115),
    ButtonBg = Color3.fromRGB(255, 240, 245),
    ToggleOn = Color3.fromRGB(255, 183, 197),
    ToggleOff = Color3.fromRGB(230, 200, 210),
    SliderBg = Color3.fromRGB(255, 230, 235),
    Border = Color3.fromRGB(255, 200, 215)
}

local Font = Enum.Font.Gotham
local FontBold = Enum.Font.GothamBold

-- ========== TẠO SCREENGUI ==========
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HaidwngHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- ========== MAIN FRAME (kéo thả) ==========
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Colors.Main
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -280)
MainFrame.Size = UDim2.new(0, 700, 0, 560)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 28)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Colors.Border
UIStroke.Thickness = 2
UIStroke.Transparency = 0.3
UIStroke.Parent = MainFrame

-- ========== TIÊU ĐỀ ==========
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Colors.Accent
TitleBar.BackgroundTransparency = 0.2
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 48)

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 28)
TitleCorner.Parent = TitleBar

local Logo = Instance.new("TextLabel")
Logo.Parent = TitleBar
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.new(0, 16, 0, 0)
Logo.Size = UDim2.new(0, 40, 1, 0)
Logo.Font = FontBold
Logo.Text = "🌸"
Logo.TextColor3 = Colors.Text
Logo.TextSize = 26
Logo.TextXAlignment = Enum.TextXAlignment.Center

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 65, 0, 0)
TitleText.Size = UDim2.new(0, 200, 1, 0)
TitleText.Font = FontBold
TitleText.Text = "HAIDWNG HUB"
TitleText.TextColor3 = Colors.Text
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.BackgroundColor3 = Colors.ButtonBg
CloseBtn.BackgroundTransparency = 0.5
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -44, 0, 8)
CloseBtn.Text = "🗕"
CloseBtn.TextColor3 = Colors.Text
CloseBtn.TextSize = 18
CloseBtn.Font = Font
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 16)
CloseCorner.Parent = CloseBtn

-- ========== TAB CONTAINER ==========
local TabContainer = Instance.new("Frame")
TabContainer.Parent = MainFrame
TabContainer.BackgroundTransparency = 1
TabContainer.Position = UDim2.new(0, 0, 0, 48)
TabContainer.Size = UDim2.new(1, 0, 0, 52)

local TabsList = {"Core", "Combat", "World", "Visual", "Support"}
local TabButtons = {}
local TabFrames = {}

-- ========== CONTENT FRAME ==========
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 100)
ContentFrame.Size = UDim2.new(1, 0, 1, -100)

-- Helper functions
local function MakeTab(name, order)
    local btn = Instance.new("TextButton")
    btn.Parent = TabContainer
    btn.BackgroundColor3 = Colors.ButtonBg
    btn.BackgroundTransparency = 0.6
    btn.Size = UDim2.new(0, 130, 0, 36)
    btn.Position = UDim2.new(0, 10 + (order-1)*140, 0, 8)
    btn.Text = name
    btn.TextColor3 = Colors.TextDim
    btn.TextSize = 14
    btn.Font = FontBold
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = btn
    TabButtons[name] = btn

    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Parent = ContentFrame
    tabFrame.BackgroundTransparency = 1
    tabFrame.Size = UDim2.new(1, -20, 1, -20)
    tabFrame.Position = UDim2.new(0, 10, 0, 10)
    tabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabFrame.ScrollBarThickness = 4
    tabFrame.ScrollBarImageColor3 = Colors.Accent
    tabFrame.Visible = (order == 1)
    TabFrames[name] = tabFrame

    local layout = Instance.new("UIListLayout")
    layout.Parent = tabFrame
    layout.Padding = UDim.new(0, 12)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    btn.MouseButton1Click:Connect(function()
        for _, fr in pairs(TabFrames) do fr.Visible = false end
        for _, bt in pairs(TabButtons) do
            bt.TextColor3 = Colors.TextDim
            bt.BackgroundTransparency = 0.6
        end
        tabFrame.Visible = true
        btn.TextColor3 = Colors.AccentDark
        btn.BackgroundTransparency = 0.2
    end)
end

local function AddToggle(parent, text, default, callback)
    local container = Instance.new("Frame")
    container.Parent = parent
    container.BackgroundColor3 = Colors.ButtonBg
    container.BackgroundTransparency = 0.4
    container.Size = UDim2.new(0.92, 0, 0, 44)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 24)
    corner.Parent = container

    local label = Instance.new("TextLabel")
    label.Parent = container
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 15, 0, 0)
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Text = text
    label.TextColor3 = Colors.Text
    label.TextSize = 14
    label.Font = Font
    label.TextXAlignment = Enum.TextXAlignment.Left

    local toggle = Instance.new("Frame")
    toggle.Parent = container
    toggle.BackgroundColor3 = default and Colors.ToggleOn or Colors.ToggleOff
    toggle.Size = UDim2.new(0, 52, 0, 28)
    toggle.Position = UDim2.new(1, -64, 0, 8)
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggle

    local knob = Instance.new("Frame")
    knob.Parent = toggle
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Size = UDim2.new(0, 24, 0, 24)
    knob.Position = default and UDim2.new(1, -26, 0, 2) or UDim2.new(0, 2, 0, 2)
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob

    local btn = Instance.new("TextButton")
    btn.Parent = container
    btn.BackgroundTransparency = 1
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.Text = ""

    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        local targetPos = state and UDim2.new(1, -26, 0, 2) or UDim2.new(0, 2, 0, 2)
        TweenService:Create(knob, TweenInfo.new(0.2), {Position = targetPos}):Play()
        TweenService:Create(toggle, TweenInfo.new(0.2), {BackgroundColor3 = state and Colors.ToggleOn or Colors.ToggleOff}):Play()
        if callback then callback(state) end
    end)
    return container
end

local function AddButton(parent, text, callback)
    local container = Instance.new("Frame")
    container.Parent = parent
    container.BackgroundColor3 = Colors.ButtonBg
    container.BackgroundTransparency = 0.4
    container.Size = UDim2.new(0.92, 0, 0, 48)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 24)
    corner.Parent = container

    local btn = Instance.new("TextButton")
    btn.Parent = container
    btn.BackgroundColor3 = Colors.Accent
    btn.BackgroundTransparency = 0.8
    btn.Size = UDim2.new(1, -20, 1, -8)
    btn.Position = UDim2.new(0, 10, 0, 4)
    btn.Text = text
    btn.TextColor3 = Colors.Text
    btn.TextSize = 14
    btn.Font = FontBold
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 20)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    return container
end

local function AddSlider(parent, text, min, max, default, callback)
    local container = Instance.new("Frame")
    container.Parent = parent
    container.BackgroundColor3 = Colors.ButtonBg
    container.BackgroundTransparency = 0.4
    container.Size = UDim2.new(0.92, 0, 0, 70)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 24)
    corner.Parent = container

    local label = Instance.new("TextLabel")
    label.Parent = container
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 15, 0, 8)
    label.Size = UDim2.new(0.6, 0, 0, 24)
    label.Text = text
    label.TextColor3 = Colors.Text
    label.TextSize = 14
    label.Font = Font
    label.TextXAlignment = Enum.TextXAlignment.Left

    local valueLabel = Instance.new("TextLabel")
    valueLabel.Parent = container
    valueLabel.BackgroundTransparency = 1
    valueLabel.Position = UDim2.new(0.6, 0, 0, 8)
    valueLabel.Size = UDim2.new(0.35, -20, 0, 24)
    valueLabel.Text = tostring(default)
    valueLabel.TextColor3 = Colors.AccentDark
    valueLabel.TextSize = 14
    valueLabel.Font = FontBold
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right

    local sliderBg = Instance.new("Frame")
    sliderBg.Parent = container
    sliderBg.BackgroundColor3 = Colors.SliderBg
    sliderBg.Size = UDim2.new(0.9, 0, 0, 6)
    sliderBg.Position = UDim2.new(0.05, 0, 0, 48)
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(1, 0)
    bgCorner.Parent = sliderBg

    local fill = Instance.new("Frame")
    fill.Parent = sliderBg
    fill.BackgroundColor3 = Colors.Accent
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill

    local sliderBtn = Instance.new("TextButton")
    sliderBtn.Parent = sliderBg
    sliderBtn.BackgroundColor3 = Colors.AccentDark
    sliderBtn.Size = UDim2.new(0, 16, 0, 16)
    sliderBtn.Position = UDim2.new(fill.Size.X.Scale, -8, 0, -5)
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(1, 0)
    sliderCorner.Parent = sliderBtn
    sliderBtn.Text = ""

    local dragging = false
    sliderBtn.MouseButton1Down:Connect(function() dragging = true end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    local function update(input)
        if not dragging then return end
        local pos = input.Position.X - sliderBg.AbsolutePosition.X
        local percent = math.clamp(pos / sliderBg.AbsoluteSize.X, 0, 1)
        local val = min + (max - min) * percent
        val = math.floor(val * 10) / 10
        valueLabel.Text = tostring(val)
        fill.Size = UDim2.new(percent, 0, 1, 0)
        sliderBtn.Position = UDim2.new(percent, -8, 0, -5)
        if callback then callback(val) end
    end
    sliderBtn.MouseButton1Down:Connect(function(input) update(input) end)
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            update(input)
        end
    end)
    return container
end

-- ========== TẠO CÁC TAB ==========
for i, name in ipairs(TabsList) do MakeTab(name, i) end

-- 🧸 TAB CORE
local coreTab = TabFrames["Core"]
AddToggle(coreTab, "🍰 Auto Farm (Beli/XP)", false, function(v) print("[Auto Farm]", v) end)
AddToggle(coreTab, "✨ Auto Mastery", false, function(v) print("[Auto Mastery]", v) end)
AddToggle(coreTab, "🛡️ God Mode (Bất tử)", false, function(v) print("[God Mode]", v) end)
AddToggle(coreTab, "⚡ Infinite Energy", false, function(v) print("[Infinite Energy]", v) end)
AddToggle(coreTab, "💤 Anti AFK", false, function(v) print("[Anti AFK]", v) end)
AddSlider(coreTab, "🎯 Attack Range", 30, 200, 85, function(v) print("[Range]", v) end)

-- ⚔️ TAB COMBAT
local combatTab = TabFrames["Combat"]
AddToggle(combatTab, "🔥 Fast Attack (No CD)", false, function(v) print("[Fast Attack]", v) end)
AddToggle(combatTab, "🎯 Aimbot (Gun/Melee)", false, function(v) print("[Aimbot]", v) end)
AddToggle(combatTab, "👁️ ESP Players", false, function(v) print("[ESP Players]", v) end)
AddToggle(combatTab, "🍎 ESP Fruits", false, function(v) print("[ESP Fruits]", v) end)
AddToggle(combatTab, "📦 ESP Chests", false, function(v) print("[ESP Chests]", v) end)
AddSlider(combatTab, "📏 Combat Distance", 20, 150, 65, function(v) print("[Combat Dist]", v) end)

-- 🌍 TAB WORLD
local worldTab = TabFrames["World"]
AddToggle(worldTab, "🌀 Teleport to Fruits", false, function(v) print("[Teleport Fruit]", v) end)
AddToggle(worldTab, "👑 Teleport to Boss", false, function(v) print("[Teleport Boss]", v) end)
AddToggle(worldTab, "🚪 No Clip (Xuyên tường)", false, function(v) print("[No Clip]", v) end)
AddToggle(worldTab, "🌊 Auto Sea Beast Hunter", false, function(v) print("[Sea Beast]", v) end)
AddButton(worldTab, "📍 Mirage Island Finder (demo)", function() print("Mirage found (demo)") end)

-- 🎨 TAB VISUAL
local visualTab = TabFrames["Visual"]
AddToggle(visualTab, "👾 Mob ESP", false, function(v) print("[Mob ESP]", v) end)
AddToggle(visualTab, "🌈 Chams (Xuyên tường)", false, function(v) print("[Chams]", v) end)
AddSlider(visualTab, "✨ ESP Glow Intensity", 0, 100, 70, function(v) print("[Glow]", v) end)

-- 💬 TAB SUPPORT (đặc biệt)
local supportTab = TabFrames["Support"]
local supportCard = Instance.new("Frame")
supportCard.Parent = supportTab
supportCard.BackgroundColor3 = Colors.ButtonBg
supportCard.BackgroundTransparency = 0.4
supportCard.Size = UDim2.new(0.92, 0, 0, 180)
supportCard.Position = UDim2.new(0.04, 0, 0, 10)
local cardCorner = Instance.new("UICorner")
cardCorner.CornerRadius = UDim.new(0, 28)
cardCorner.Parent = supportCard

local supportTitle = Instance.new("TextLabel")
supportTitle.Parent = supportCard
supportTitle.BackgroundTransparency = 1
supportTitle.Position = UDim2.new(0, 20, 0, 20)
supportTitle.Size = UDim2.new(1, -40, 0, 30)
supportTitle.Text = "🌸 LIÊN HỆ & HỖ TRỢ 🌸"
supportTitle.TextColor3 = Colors.AccentDark
supportTitle.TextSize = 18
supportTitle.Font = FontBold

local telegramText = Instance.new("TextLabel")
telegramText.Parent = supportCard
telegramText.BackgroundTransparency = 1
telegramText.Position = UDim2.new(0, 20, 0, 65)
telegramText.Size = UDim2.new(1, -40, 0, 25)
telegramText.Text = "📱 Telegram: @haidwng12"
telegramText.TextColor3 = Colors.Text
telegramText.TextSize = 15
telegramText.Font = Font
telegramText.TextXAlignment = Enum.TextXAlignment.Left

local groupText = Instance.new("TextLabel")
groupText.Parent = supportCard
groupText.BackgroundTransparency = 1
groupText.Position = UDim2.new(0, 20, 0, 95)
groupText.Size = UDim2.new(1, -40, 0, 25)
groupText.Text = "👥 Group: https://t.me/haidwngtool"
groupText.TextColor3 = Colors.Text
groupText.TextSize = 15
groupText.Font = Font
groupText.TextXAlignment = Enum.TextXAlignment.Left

local copyBtn = AddButton(supportTab, "📋 Sao chép link group", function()
    setclipboard or toclipboard or function() end("https://t.me/haidwngtool")
    print("Đã sao chép link group")
end)
copyBtn.Parent = supportTab
copyBtn.Size = UDim2.new(0.92, 0, 0, 44)
copyBtn.Position = UDim2.new(0.04, 0, 0, 210)

local closeHubBtn = AddButton(supportTab, "❌ Đóng Hub", function()
    ScreenGui:Destroy()
end)
closeHubBtn.Parent = supportTab
closeHubBtn.Size = UDim2.new(0.92, 0, 0, 44)
closeHubBtn.Position = UDim2.new(0.04, 0, 0, 270)

-- ========== XỬ LÝ SỰ KIỆN ==========
-- Đóng/ẩn menu (thu nhỏ)
local minimized = false
CloseBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 60, 0, 60), "Out", "Quart", 0.3, true)
        TitleBar.Size = UDim2.new(1, 0, 0, 60)
        TabContainer.Visible = false
        ContentFrame.Visible = false
        TitleText.Visible = false
        Logo.Text = "🌸"
        Logo.Position = UDim2.new(0.5, -20, 0, 10)
    else
        MainFrame:TweenSize(UDim2.new(0, 700, 0, 560), "Out", "Quart", 0.3, true)
        TitleBar.Size = UDim2.new(1, 0, 0, 48)
        TabContainer.Visible = true
        ContentFrame.Visible = true
        TitleText.Visible = true
        Logo.Position = UDim2.new(0, 16, 0, 0)
        Logo.Text = "🌸"
    end
end)

-- Kéo thả menu
MainFrame.Draggable = true

print("HAIDWNG HUB đã tải thành công! Liên hệ @haidwng12 nếu cần hỗ trợ.")
