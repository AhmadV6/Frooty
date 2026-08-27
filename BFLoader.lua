--// GHEMS HUB - PINK LOADING SCREEN + ACCESS PANEL

local link = "https://discord.gg/C4j5WJDNr"

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

--==================================================
-- REMOVE OLD GUI
--==================================================

pcall(function()
	game.CoreGui.ScriptPanelUI:Destroy()
end)

pcall(function()
	game.CoreGui.GhemsLoadingScreen:Destroy()
end)

--==================================================
-- LOADING SCREEN
--==================================================

local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "GhemsLoadingScreen"
loadingGui.Parent = game.CoreGui
loadingGui.ResetOnSpawn = false
loadingGui.IgnoreGuiInset = true
loadingGui.DisplayOrder = 99999

-- Background
local loadingBG = Instance.new("Frame")
loadingBG.Parent = loadingGui
loadingBG.Size = UDim2.new(1, 0, 1, 0)
loadingBG.BackgroundColor3 = Color3.fromRGB(7, 3, 10)
loadingBG.BorderSizePixel = 0

-- Background gradient
local bgGradient = Instance.new("UIGradient")
bgGradient.Parent = loadingBG
bgGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 2, 14)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 3, 35)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 2, 14))
})
bgGradient.Rotation = 45

-- Animated background gradient
task.spawn(function()
	while loadingGui.Parent do
		bgGradient.Rotation = (bgGradient.Rotation + 0.3) % 360
		task.wait(0.03)
	end
end)

--==================================================
-- DECORATIVE GLOW CIRCLES
--==================================================

local function createGlow(position, size, transparency)
	local glow = Instance.new("Frame")
	glow.Parent = loadingBG
	glow.AnchorPoint = Vector2.new(0.5, 0.5)
	glow.Position = position
	glow.Size = UDim2.fromOffset(size, size)
	glow.BackgroundColor3 = Color3.fromRGB(255, 0, 170)
	glow.BackgroundTransparency = transparency
	glow.BorderSizePixel = 0
	glow.ZIndex = 1

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1, 0)
	corner.Parent = glow

	return glow
end

local glow1 = createGlow(UDim2.new(0.15, 0, 0.2, 0), 220, 0.88)
local glow2 = createGlow(UDim2.new(0.85, 0, 0.75, 0), 300, 0.90)
local glow3 = createGlow(UDim2.new(0.75, 0, 0.15, 0), 150, 0.92)

-- Glow animation
task.spawn(function()
	while loadingGui.Parent do
		TweenService:Create(
			glow1,
			TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Size = UDim2.fromOffset(270, 270)}
		):Play()

		TweenService:Create(
			glow2,
			TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Size = UDim2.fromOffset(350, 350)}
		):Play()

		task.wait(2.5)

		TweenService:Create(
			glow1,
			TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Size = UDim2.fromOffset(220, 220)}
		):Play()

		TweenService:Create(
			glow2,
			TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Size = UDim2.fromOffset(300, 300)}
		):Play()

		task.wait(2.5)
	end
end)

--==================================================
-- CENTER CONTAINER
--==================================================

local center = Instance.new("Frame")
center.Parent = loadingBG
center.AnchorPoint = Vector2.new(0.5, 0.5)
center.Position = UDim2.new(0.5, 0, 0.5, 0)
center.Size = UDim2.fromOffset(520, 330)
center.BackgroundTransparency = 1
center.ZIndex = 10

--==================================================
-- LOGO / TITLE
--==================================================

local logo = Instance.new("TextLabel")
logo.Parent = center
logo.AnchorPoint = Vector2.new(0.5, 0.5)
logo.Position = UDim2.new(0.5, 0, 0.30, 0)
logo.Size = UDim2.new(1, 0, 0, 80)
logo.BackgroundTransparency = 1
logo.Text = "GHEMS HUB"
logo.Font = Enum.Font.GothamBlack
logo.TextSize = 55
logo.TextColor3 = Color3.fromRGB(255, 255, 255)
logo.TextStrokeColor3 = Color3.fromRGB(255, 0, 170)
logo.TextStrokeTransparency = 0.15
logo.ZIndex = 12

-- Pink gradient on title
local logoGradient = Instance.new("UIGradient")
logoGradient.Parent = logo
logoGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.45, Color3.fromRGB(255, 80, 200)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 140))
})

--==================================================
-- SUBTITLE
--==================================================

local subtitle = Instance.new("TextLabel")
subtitle.Parent = center
subtitle.AnchorPoint = Vector2.new(0.5, 0.5)
subtitle.Position = UDim2.new(0.5, 0, 0.48, 0)
subtitle.Size = UDim2.new(1, 0, 0, 30)
subtitle.BackgroundTransparency = 1
subtitle.Text = "INITIALIZING GHEMS HUB..."
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextSize = 16
subtitle.TextColor3 = Color3.fromRGB(230, 140, 210)
subtitle.ZIndex = 12

--==================================================
-- LOADING BAR BACKGROUND
--==================================================

local barBG = Instance.new("Frame")
barBG.Parent = center
barBG.AnchorPoint = Vector2.new(0.5, 0.5)
barBG.Position = UDim2.new(0.5, 0, 0.65, 0)
barBG.Size = UDim2.fromOffset(390, 12)
barBG.BackgroundColor3 = Color3.fromRGB(45, 15, 45)
barBG.BorderSizePixel = 0
barBG.ZIndex = 12

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = barBG

-- Progress bar
local bar = Instance.new("Frame")
bar.Parent = barBG
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 0, 170)
bar.BorderSizePixel = 0
bar.ZIndex = 13

local barCorner2 = Instance.new("UICorner")
barCorner2.CornerRadius = UDim.new(1, 0)
barCorner2.Parent = bar

local barGradient = Instance.new("UIGradient")
barGradient.Parent = bar
barGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 140)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 80, 210)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 170))
})

--==================================================
-- PERCENTAGE
--==================================================

local percent = Instance.new("TextLabel")
percent.Parent = center
percent.AnchorPoint = Vector2.new(0.5, 0.5)
percent.Position = UDim2.new(0.5, 0, 0.76, 0)
percent.Size = UDim2.new(1, 0, 0, 25)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.Font = Enum.Font.GothamBold
percent.TextSize = 17
percent.TextColor3 = Color3.fromRGB(255, 100, 210)
percent.ZIndex = 12

--==================================================
-- STATUS
--==================================================

local status = Instance.new("TextLabel")
status.Parent = center
status.AnchorPoint = Vector2.new(0.5, 0.5)
status.Position = UDim2.new(0.5, 0, 0.86, 0)
status.Size = UDim2.new(1, 0, 0, 25)
status.BackgroundTransparency = 1
status.Text = "Please wait..."
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(130, 100, 130)
status.ZIndex = 12

--==================================================
-- LOADING ANIMATION
--==================================================

task.spawn(function()

	local steps = {
		{10, "Preparing interface..."},
		{25, "Loading GHEMS HUB..."},
		{40, "Initializing components..."},
		{55, "Loading visual effects..."},
		{70, "Preparing access panel..."},
		{85, "Almost ready..."},
		{100, "GHEMS HUB READY!"}
	}

	for _, data in ipairs(steps) do

		local target = data[1]
		local message = data[2]

		status.Text = message

		TweenService:Create(
			bar,
			TweenInfo.new(
				0.55,
				Enum.EasingStyle.Quint,
				Enum.EasingDirection.Out
			),
			{
				Size = UDim2.new(target / 100, 0, 1, 0)
			}
		):Play()

		-- Animate percentage
		local startPercent = tonumber(percent.Text:match("%d+")) or 0

		for i = startPercent, target do
			percent.Text = tostring(i) .. "%"
			task.wait(0.018)
		end

		task.wait(0.18)
	end

	task.wait(0.5)

	-- Fade everything
	for _, obj in ipairs(loadingGui:GetDescendants()) do
		if obj:IsA("Frame") then
			TweenService:Create(
				obj,
				TweenInfo.new(0.5),
				{BackgroundTransparency = 1}
			):Play()

		elseif obj:IsA("TextLabel") then
			TweenService:Create(
				obj,
				TweenInfo.new(0.5),
				{
					TextTransparency = 1,
					TextStrokeTransparency = 1
				}
			):Play()
		end
	end

	task.wait(0.55)

	loadingGui:Destroy()
end)

--==================================================
-- ACCESS PANEL
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "ScriptPanelUI"
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 9999

-- dark background
local bg = Instance.new("Frame")
bg.Parent = gui
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 0.35
bg.BorderSizePixel = 0

-- main frame
local main = Instance.new("Frame")
main.Parent = bg
main.Size = UDim2.new(0, 420, 0, 320)
main.Position = UDim2.new(0.5, -210, 0.5, -160)
main.BackgroundColor3 = Color3.fromRGB(12,8,13)
main.BorderSizePixel = 0

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,20)
corner.Parent = main

-- pink top line
local topLine = Instance.new("Frame")
topLine.Parent = main
topLine.Size = UDim2.new(1,0,0,5)
topLine.BackgroundColor3 = Color3.fromRGB(255,0,170)
topLine.BorderSizePixel = 0

local topGradient = Instance.new("UIGradient")
topGradient.Parent = topLine
topGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,140)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255,100,220)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,170))
})

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0,20)
topCorner.Parent = topLine

-- title
local title = Instance.new("TextLabel")
title.Parent = main
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,0,50)
title.Position = UDim2.new(0,0,0,10)
title.Text = "ACCESS PANEL"
title.Font = Enum.Font.GothamBold
title.TextSize = 30
title.TextColor3 = Color3.fromRGB(255,255,255)

-- subtitle
local sub = Instance.new("TextLabel")
sub.Parent = main
sub.BackgroundTransparency = 1
sub.Size = UDim2.new(1,-40,0,30)
sub.Position = UDim2.new(0,20,0,70)
sub.Text = "Link copied! Paste in browser 🔗"
sub.Font = Enum.Font.Gotham
sub.TextSize = 18
sub.TextColor3 = Color3.fromRGB(220,170,215)

-- instructions
local info = Instance.new("TextLabel")
info.Parent = main
info.BackgroundTransparency = 1
info.Size = UDim2.new(1,-60,0,120)
info.Position = UDim2.new(0,30,0,110)
info.TextXAlignment = Enum.TextXAlignment.Left
info.TextYAlignment = Enum.TextYAlignment.Top
info.Text = "1. Click JOIN SERVER\n2. Link will be copied to your clipboard\n3. Paste link in Chrome\n4. Join Server and enjoy your script"
info.Font = Enum.Font.Gotham
info.TextSize = 20
info.TextColor3 = Color3.fromRGB(255,255,255)

-- button
local button = Instance.new("TextButton")
button.Parent = main
button.Size = UDim2.new(0,300,0,55)
button.Position = UDim2.new(0.5,-150,0,215)
button.BackgroundColor3 = Color3.fromRGB(255,0,170)
button.Text = "JOIN SERVER"
button.Font = Enum.Font.GothamBold
button.TextSize = 24
button.TextColor3 = Color3.fromRGB(255,255,255)
button.AutoButtonColor = false

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0,18)
btnCorner.Parent = button

-- button gradient
local btnGradient = Instance.new("UIGradient")
btnGradient.Parent = button
btnGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,140)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255,80,200)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,170))
})

-- button hover
button.MouseEnter:Connect(function()
	TweenService:Create(
		button,
		TweenInfo.new(0.2),
		{Size = UDim2.new(0,310,0,58)}
	):Play()
end)

button.MouseLeave:Connect(function()
	TweenService:Create(
		button,
		TweenInfo.new(0.2),
		{Size = UDim2.new(0,300,0,55)}
	):Play()
end)

-- footer
local footer = Instance.new("TextLabel")
footer.Parent = main
footer.BackgroundTransparency = 1
footer.Size = UDim2.new(1,0,0,30)
footer.Position = UDim2.new(0,0,1,-35)
footer.Text = "Add gemma04921 in discord if you have any issues"
footer.Font = Enum.Font.Gotham
footer.TextSize = 16
footer.TextColor3 = Color3.fromRGB(120,90,120)

--==================================================
-- COPY FUNCTION
--==================================================

button.MouseButton1Click:Connect(function()

	if setclipboard then
		setclipboard(link)
	end

	button.Text = "COPIED!"

	task.wait(1.5)

	button.Text = "JOIN SERVER"
end)

--==================================================
-- DRAGGABLE
--==================================================

local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart

	main.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

main.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPos = main.Position

		input.Changed:Connect(function()

			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end

		end)
	end
end)

main.InputChanged:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then

		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)

	if input == dragInput and dragging then
		update(input)
	end
end)
