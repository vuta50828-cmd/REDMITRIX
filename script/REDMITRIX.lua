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

local OldGui = PlayerGui:FindFirstChild("REDMITRIX")
if OldGui then
	OldGui:Destroy()
end

local Gui = Instance.new("ScreenGui")
Gui.Name = "REDMITRIX"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
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

local LoadingMessages = {
	"LOADING MODULES...",
	"INITIALIZING SYSTEM...",
	"READY"
}

for _, message in ipairs(LoadingMessages) do
	LoadingStatus.Text = message
	task.wait(0.12)
end

task.wait(0.15)
Loading:Destroy()

--==================================================
-- MAIN WINDOW
--==================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0.86, 0, 0.62, 0)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Config.Background
Main.BorderSizePixel = 0
Main.Parent = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = Main

local MainConstraint = Instance.new("UISizeConstraint")
MainConstraint.MinSize = Vector2.new(300, 240)
MainConstraint.MaxSize = Vector2.new(620, 420)
MainConstraint.Parent = Main


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
-- VISUAL
--==================================================

local function ShowVisual()
	ClearContent()
	Header("VISUAL SYSTEM")

	Toggle("SHOW FPS", 55, function(enabled)
		print("SHOW FPS:", enabled)
	end)

	Toggle("GRAPHICS", 108, function(enabled)
		print("GRAPHICS:", enabled)
	end)

	Toggle("FIX CRACK", 161, function(enabled)
		print("FIX CRACK:", enabled)
	end)
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
OpenButton.Position = UDim2.new(1, -18, 0.35, 0)

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