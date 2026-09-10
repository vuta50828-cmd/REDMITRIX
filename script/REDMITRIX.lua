--==================================================
-- REDMITRIX
-- Roblox Studio
--==================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==================================================
-- CONFIG
--==================================================

local Config = {
	Name = "REDMITRIX",
	Version = "1.0.0",

	Accent = Color3.fromRGB(255, 35, 45),
	Background = Color3.fromRGB(7, 7, 10),
	Panel = Color3.fromRGB(15, 15, 20),
	Text = Color3.fromRGB(240, 240, 240),
	Muted = Color3.fromRGB(135, 135, 145)
}

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "REDMITRIX"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.Parent = PlayerGui

--==================================================
-- LOADING
--==================================================

local Loading = Instance.new("Frame")
Loading.Size = UDim2.fromScale(1, 1)
Loading.BackgroundColor3 = Config.Background
Loading.BorderSizePixel = 0
Loading.Parent = Gui

local LoadingTitle = Instance.new("TextLabel")
LoadingTitle.BackgroundTransparency = 1
Loading.Size = UDim2.new(1, 0, 0, 60)
Loading.Position = UDim2.new(0, 0, 0.38, 0)
Loading.Font = Enum.Font.GothamBlack
Loading.Text = "REDMITRIX"
Loading.TextSize = 38
Loading.TextColor3 = Config.Accent
Loading.Parent = Loading

local LoadingStatus = Instance.new("TextLabel")
LoadingStatus.BackgroundTransparency = 1
Loading.Size = UDim2.new(1, 0, 0, 30)
Loading.Position = UDim2.new(0, 0, 0.49, 0)
Loading.Font = Enum.Font.Gotham
Loading.Text = "INITIALIZING..."
Loading.TextSize = 13
Loading.TextColor3 = Config.Muted
Loading.Parent = Loading

local BarBack = Instance.new("Frame")
BarBack.Size = UDim2.fromOffset(260, 4)
BarBack.Position = UDim2.new(0.5, -130, 0.55, 0)
BarBack.BackgroundColor3 = Config.Panel
BarBack.BorderSizePixel = 0
BarBack.Parent = Loading

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(0, 0, 1, 0)
Bar.BackgroundColor3 = Config.Accent
Bar.BorderSizePixel = 0
Bar.Parent = BarBack

for i = 1, 100 do
	Bar.Size = UDim2.new(i / 100, 0, 1, 0)

	if i < 30 then
		LoadingStatus.Text = "LOADING MODULES..."
	elseif i < 70 then
		LoadingStatus.Text = "INITIALIZING SYSTEM..."
	else
		LoadingStatus.Text = "READY"
	end

	task.wait(0.008)
end

task.wait(0.25)
Loading:Destroy()

--==================================================
-- MAIN WINDOW
--==================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(520, 330)
Main.Position = UDim2.new(0.5, -260, 0.5, -165)
Main.BackgroundColor3 = Config.Background
Main.BorderSizePixel = 0
Main.Parent = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Config.Accent
MainStroke.Thickness = 1
MainStroke.Transparency = 0.35
MainStroke.Parent = Main

--==================================================
-- TOP BAR
--==================================================

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 58)
TopBar.BackgroundColor3 = Config.Panel
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

local Title = Instance.new("TextLabel")
Title.BackgroundTransparency = 1
Title.Position = UDim2.fromOffset(18, 7)
Title.Size = UDim2.new(1, -120, 0, 25)
Title.Font = Enum.Font.GothamBlack
Title.Text = "REDMITRIX"
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextColor3 = Config.Text
Title.Parent = TopBar

local Version = Instance.new("TextLabel")
Version.BackgroundTransparency = 1
Version.Position = UDim2.fromOffset(20, 32)
Version.Size = UDim2.new(1, -120, 0, 18)
Version.Font = Enum.Font.Gotham
Version.Text = "SYSTEM // v" .. Config.Version
Version.TextSize = 10
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.TextColor3 = Config.Accent
Version.Parent = TopBar

--==================================================
-- MINIMIZE / CLOSE
--==================================================

local Minimize = Instance.new("TextButton")
Minimize.BackgroundTransparency = 1
Minimize.Position = UDim2.new(1, -92, 0, 10)
Minimize.Size = UDim2.fromOffset(35, 35)
Minimize.Font = Enum.Font.GothamBold
Minimize.Text = "-"
Minimize.TextSize = 25
Minimize.TextColor3 = Config.Text
Minimize.AutoButtonColor = false
Minimize.Parent = TopBar

local Close = Instance.new("TextButton")
Close.BackgroundTransparency = 1
Close.Position = UDim2.new(1, -50, 0, 10)
Close.Size = UDim2.fromOffset(35, 35)
Close.Font = Enum.Font.GothamBold
Close.Text = "X"
Close.TextSize = 20
Close.TextColor3 = Config.Text
Close.AutoButtonColor = false
Close.Parent = TopBar

--==================================================
-- SIDEBAR
--==================================================

local Sidebar = Instance.new("Frame")
Sidebar.Position = UDim2.fromOffset(10, 68)
Sidebar.Size = UDim2.fromOffset(145, 250)
Sidebar.BackgroundColor3 = Config.Panel
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 8)
SidebarCorner.Parent = Sidebar

--==================================================
-- CONTENT
--==================================================

local Content = Instance.new("Frame")
Content.Position = UDim2.fromOffset(165, 68)
Content.Size = UDim2.new(1, -175, 1, -78)
Content.BackgroundColor3 = Config.Panel
Content.BorderSizePixel = 0
Content.Parent = Main

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = Content

--==================================================
-- TAB BUTTON
--==================================================

local function CreateTab(text, order)
	local Button = Instance.new("TextButton")

	Button.Position = UDim2.fromOffset(8, 8 + ((order - 1) * 48))
	Button.Size = UDim2.new(1, -16, 0, 40)

	Button.BackgroundColor3 = Config.Background
	Button.BorderSizePixel = 0

	Button.Font = Enum.Font.GothamBold
	Button.Text = text
	Button.TextSize = 12
	Button.TextColor3 = Config.Muted

	Button.AutoButtonColor = false
	Button.Parent = Sidebar

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 6)
	Corner.Parent = Button

	return Button
end

local PlayerTab = CreateTab("PLAYER", 1)
local VisualTab = CreateTab("VISUAL", 2)
local MiscTab = CreateTab("MISC", 3)
local SettingsTab = CreateTab("SETTINGS", 4)

--==================================================
-- CLEAR CONTENT
--==================================================

local function ClearContent()
	for _, Object in ipairs(Content:GetChildren()) do
		Object:Destroy()
	end
end

--==================================================
-- HEADER
--==================================================

local function Header(text)
	local Label = Instance.new("TextLabel")

	Label.BackgroundTransparency = 1
	Label.Position = UDim2.fromOffset(15, 12)
	Label.Size = UDim2.new(1, -30, 0, 30)

	Label.Font = Enum.Font.GothamBlack
	Label.Text = text
	Label.TextSize = 17
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.TextColor3 = Config.Accent

	Label.Parent = Content
end

--==================================================
-- TOGGLE
--==================================================

local function Toggle(text, y, callback)
	local Button = Instance.new("TextButton")

	Button.Position = UDim2.fromOffset(15, y)
	Button.Size = UDim2.new(1, -30, 0, 42)

	Button.BackgroundColor3 = Config.Background
	Button.BorderSizePixel = 0

	Button.Font = Enum.Font.GothamBold
	Button.Text = text .. "   [ OFF ]"
	Button.TextSize = 12
	Button.TextColor3 = Config.Text

	Button.AutoButtonColor = false
	Button.Parent = Content

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 6)
	Corner.Parent = Button

	local Enabled = false

	Button.MouseButton1Click:Connect(function()
		Enabled = not Enabled

		if Enabled then
			Button.Text = text .. "   [ ON ]"
			Button.TextColor3 = Config.Accent
		else
			Button.Text = text .. "   [ OFF ]"
			Button.TextColor3 = Config.Text
		end

		if callback then
			callback(Enabled)
		end
	end)

	return Button
end

--==================================================
-- PLAYER
--==================================================

local function ShowPlayer()
	ClearContent()
	Header("PLAYER SYSTEM")

	Toggle("BOOT FPS", 55, function(enabled)
		print("BOOT FPS:", enabled)
	end)

	Toggle("ANTI AFK", 108, function(enabled)
		print("ANTI AFK:", enabled)
	end)
end

--==================================================
-- VISUAL / GRAPHICS
--==================================================

local Lighting = game:GetService("Lighting")
local GraphicsMode = "Classic"
local FPSLabel
local FPSConnection

local GraphicsPresets = {
    Classic = {Technology = Enum.Technology.Compatibility, GlobalShadows = false, Brightness = 2},
    ClassicPlus = {Technology = Enum.Technology.ShadowMap, GlobalShadows = true, Brightness = 2},
    Modern = {Technology = Enum.Technology.Future, GlobalShadows = true, Brightness = 2},
    Low = {Technology = Enum.Technology.Compatibility, GlobalShadows = false, Brightness = 1.5}
}

local function ApplyGraphics(mode)
    local preset = GraphicsPresets[mode]
    if not preset then return end
    GraphicsMode = mode
    pcall(function() Lighting.Technology = preset.Technology end)
    Lighting.GlobalShadows = preset.GlobalShadows
    Lighting.Brightness = preset.Brightness
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("ParticleEmitter") or object:IsA("Trail") or object:IsA("Beam") then
            object.Enabled = mode ~= "Low"
        end
    end
end

local function ShowFPS(enabled)
    if FPSConnection then FPSConnection:Disconnect(); FPSConnection = nil end
    if FPSLabel then FPSLabel:Destroy(); FPSLabel = nil end
    if not enabled then return end

    FPSLabel = Instance.new("TextLabel")
    FPSLabel.Size = UDim2.fromOffset(100, 30)
    FPSLabel.Position = UDim2.new(1, -110, 0, 12)
    FPSLabel.BackgroundColor3 = Config.Background
    FPSLabel.BorderSizePixel = 0
    FPSLabel.Font = Enum.Font.GothamBold
    FPSLabel.TextSize = 13
    FPSLabel.TextColor3 = Config.Accent
    FPSLabel.Text = "FPS: --"
    FPSLabel.Parent = Gui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = FPSLabel

    local last, frames = os.clock(), 0
    FPSConnection = RunService.RenderStepped:Connect(function()
        frames += 1
        local now = os.clock()
        if now - last >= 0.5 then
            FPSLabel.Text = "FPS: " .. math.floor(frames / (now-last) + 0.5)
            frames, last = 0, now
        end
    end)
end

local function ShowVisual()
    ClearContent()
    Header("VISUAL SYSTEM")

    Toggle("SHOW FPS", 55, function(enabled)
        ShowFPS(enabled)
    end)

    local Label = Instance.new("TextLabel")
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.fromOffset(15, 108)
    Label.Size = UDim2.new(1, -30, 0, 22)
    Label.Font = Enum.Font.GothamBold
    Label.Text = "GRAPHICS  //  " .. GraphicsMode
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextColor3 = Config.Accent
    Label.Parent = Content

    local modes = {
        {"Classic", 135},
        {"ClassicPlus", 177},
        {"Modern", 219},
        {"Low", 261}
    }

    for _, data in ipairs(modes) do
        local mode, y = data[1], data[2]
        local Button = Instance.new("TextButton")
        Button.Position = UDim2.fromOffset(15, y)
        Button.Size = UDim2.new(1, -30, 0, 36)
        Button.BackgroundColor3 = Config.Background
        Button.BorderSizePixel = 0
        Button.Font = Enum.Font.GothamBold
        Button.Text = mode
        Button.TextSize = 11
        Button.TextColor3 = mode == GraphicsMode and Config.Accent or Config.Text
        Button.AutoButtonColor = false
        Button.Parent = Content

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 6)
        Corner.Parent = Button

        Button.MouseButton1Click:Connect(function()
            ApplyGraphics(mode)
            Label.Text = "GRAPHICS  //  " .. GraphicsMode
            for _, child in ipairs(Content:GetChildren()) do
                if child:IsA("TextButton") and GraphicsPresets[child.Text] then
                    child.TextColor3 = child.Text == GraphicsMode and Config.Accent or Config.Text
                end
            end
        end)
    end
end

--==================================================
-- MISC
--==================================================

local function ShowMisc()
	ClearContent()
	Header("MISC SYSTEM")

	Toggle("AUTO MODE", 55, function(enabled)
		print("AUTO MODE:", enabled)
	end)

	Toggle("PERFORMANCE", 108, function(enabled)
		print("PERFORMANCE:", enabled)
	end)
end

--==================================================
-- SETTINGS
--==================================================

local function ShowSettings()
	ClearContent()
	Header("REDMITRIX SETTINGS")

	Toggle("UI EFFECTS", 55, function(enabled)
		print("UI EFFECTS:", enabled)
	end)

	Toggle("MOBILE MODE", 108, function(enabled)
		print("MOBILE MODE:", enabled)
	end)
end

--==================================================
-- TAB EVENTS
--==================================================

PlayerTab.MouseButton1Click:Connect(ShowPlayer)
VisualTab.MouseButton1Click:Connect(ShowVisual)
MiscTab.MouseButton1Click:Connect(ShowMisc)
SettingsTab.MouseButton1Click:Connect(ShowSettings)

ShowPlayer()

--==================================================
-- DRAG MAIN WINDOW
--==================================================

local dragging = false
local dragStart
local startPosition

TopBar.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPosition = Main.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)

	if not dragging then
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then

		local delta = input.Position - dragStart

		Main.Position = UDim2.new(
			startPosition.X.Scale,
			startPosition.X.Offset + delta.X,
			startPosition.Y.Scale,
			startPosition.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = false
	end
end)

--==================================================
-- REOPEN ICON
--==================================================

local OpenButton = Instance.new("TextButton")

OpenButton.Size = UDim2.fromOffset(48, 48)
OpenButton.AnchorPoint = Vector2.new(1, 0.5)
OpenButton.Position = UDim2.new(1, -18, 0.5, 0)

OpenButton.BackgroundColor3 = Config.Background
OpenButton.BorderSizePixel = 0

OpenButton.Font = Enum.Font.GothamBlack
OpenButton.Text = "R"
OpenButton.TextSize = 20
OpenButton.TextColor3 = Config.Accent

OpenButton.Visible = false
OpenButton.AutoButtonColor = false
OpenButton.Parent = Gui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0)
OpenCorner.Parent = OpenButton

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Color = Config.Accent
OpenStroke.Thickness = 2
OpenStroke.Parent = OpenButton

--==================================================
-- DRAG ICON
--==================================================

local draggingIcon = false
local movedIcon = false
local iconStart
local iconDragStart

OpenButton.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.Touch
		or input.UserInputType == Enum.UserInputType.MouseButton1 then

		draggingIcon = true
		movedIcon = false

		iconDragStart = input.Position
		iconStart = OpenButton.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)

	if not draggingIcon then
		return
	end

	if input.UserInputType == Enum.UserInputType.Touch
		or input.UserInputType == Enum.UserInputType.MouseMovement then

		local delta = input.Position - iconDragStart

		if math.abs(delta.X) > 10 or math.abs(delta.Y) > 10 then
			movedIcon = true
		end

		OpenButton.Position = UDim2.new(
			iconStart.X.Scale,
			iconStart.X.Offset + delta.X,
			iconStart.Y.Scale,
			iconStart.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.Touch
		or input.UserInputType == Enum.UserInputType.MouseButton1 then

		if draggingIcon and not movedIcon then
			Main.Visible = true
			OpenButton.Visible = false
		end

		draggingIcon = false
	end
end)

--==================================================
-- MINIMIZE
--==================================================

Minimize.MouseButton1Click:Connect(function()
	Main.Visible = false
	OpenButton.Visible = true
end)

--==================================================
-- CLOSE
--==================================================

Close.MouseButton1Click:Connect(function()
	Main.Visible = false
	OpenButton.Visible = false
	Gui.Enabled = false
end)