local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

local gui = Instance.new("ScreenGui")
gui.Name = "BrainrotHub"
gui.ResetOnSpawn = false
gui.Parent = lp:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 300, 0, 520)
main.Position = UDim2.new(0, 20, 0.5, -260)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
main.BorderSizePixel = 0
main.Active = true
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local top = Instance.new("Frame")
top.Size = UDim2.new(1, 0, 0, 34)
top.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
top.BorderSizePixel = 0
top.Parent = main
Instance.new("UICorner", top).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Brainrot-Delta"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.Parent = top

local hide = Instance.new("TextButton")
hide.Size = UDim2.new(0, 24, 0, 24)
hide.Position = UDim2.new(1, -28, 0, 5)
hide.Text = "-"
hide.TextSize = 20
hide.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
hide.TextColor3 = Color3.new(1,1,1)
hide.BorderSizePixel = 0
hide.Parent = top
Instance.new("UICorner", hide).CornerRadius = UDim.new(0, 6)

local list = Instance.new("Frame")
list.Size = UDim2.new(1, -20, 1, -44)
list.Position = UDim2.new(0, 10, 0, 40)
list.BackgroundTransparency = 1
list.Parent = main

local function mkBtn(txt, y, cb)
\tlocal b = Instance.new("TextButton")
\tb.Size = UDim2.new(1, 0, 0, 30)
\tb.Position = UDim2.new(0, 0, 0, y)
\tb.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
\tb.TextColor3 = Color3.fromRGB(255, 255, 255)
\tb.BorderSizePixel = 0
\tb.Text = txt
\tb.Font = Enum.Font.Gotham
\tb.TextSize = 13
\tb.Parent = list
\tInstance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
\tb.MouseButton1Click:Connect(cb)
\treturn b
end

local speedOn = false
local speedValue = 60
local infJumpOn = false
local semiInvisibleOn = false
local espOn = false
local antiRagdollOn = false
local antiBeeOn = false
local antiSentryOn = false

local function notify(t, tx)
\tStarterGui:SetCore("SendNotification", {Title = t, Text = tx, Duration = 3})
end

mkBtn("Speed: OFF", 0, function()
\tspeedOn = not speedOn
\tnotify("Speed", speedOn and "ON" or "OFF")
end)

mkBtn("Speed +", 38, function()
\tspeedValue = math.min(speedValue + 10, 300)
\tnotify("Speed", tostring(speedValue))
end)

mkBtn("Speed -", 76, function()
\tspeedValue = math.max(speedValue - 10, 16)
\tnotify("Speed", tostring(speedValue))
end)

mkBtn("Inf Jump: OFF", 114, function()
\tinfJumpOn = not infJumpOn
\tnotify("Inf Jump", infJumpOn and "ON" or "OFF")
end)

mkBtn("Desync", 152, function()
\troot.CFrame = root.CFrame * CFrame.new(0, 0, -4)
\tnotify("Desync", "Done")
end)

mkBtn("ESP Best Brainrot: OFF", 190, function()
\tespOn = not espOn
\tnotify("ESP", espOn and "ON" or "OFF")
\tfor _, v in ipairs(Workspace:GetDescendants()) do
\t\tif v:IsA("BillboardGui") and v.Name == "BrainrotESP" then
\t\t\tv:Destroy()
\t\tend
\tend
\tif espOn then
\t\tfor _, obj in ipairs(Workspace:GetDescendants()) do
\t\t\tif obj:IsA("Model") and obj.Name:lower():find("brainrot") and obj:FindFirstChild("Head") then
\t\t\t\tlocal bb = Instance.new("BillboardGui")
\t\t\t\tbb.Name = "BrainrotESP"
\t\t\t\tbb.Adornee = obj.Head
\t\t\t\tbb.Size = UDim2.new(0, 200, 0, 30)
\t\t\t\tbb.StudsOffset = Vector3.new(0, 2, 0)
\t\t\t\tbb.AlwaysOnTop = true
\t\t\t\tlocal tl = Instance.new("TextLabel")
\t\t\t\ttl.Size = UDim2.new(1, 0, 1, 0)
\t\t\t\ttl.BackgroundTransparency = 1
\t\t\t\ttl.Text = "BEST BRAINROT"
\t\t\t\ttl.TextColor3 = Color3.fromRGB(255, 80, 80)
\t\t\t\ttl.TextStrokeTransparency = 0
\t\t\t\ttl.Font = Enum.Font.GothamBold
\t\t\t\ttl.TextSize = 14
\t\t\t\ttl.Parent = bb
\t\t\t\tbb.Parent = obj.Head
\t\t\tend
\t\tend
\tend
end)

mkBtn("Auto Grab All", 228, function()
\tnotify("Auto Grab All", "Button pressed")
end)

mkBtn("Auto Grab To Best", 266, function()
\tnotify("Auto Grab To Best", "Button pressed")
end)

mkBtn("Auto Buy Brainrot", 304, function()
\tnotify("Auto Buy", "Button pressed")
end)

mkBtn("Auto Duel", 342, function()
\tnotify("Auto Duel", "Button pressed")
end)

mkBtn("Trade Finder", 380, function()
\tnotify("Trade Finder", "Button pressed")
end)

mkBtn("TP To Best", 418, function()
\tfor _, obj in ipairs(Workspace:GetDescendants()) do
\t\tif obj:IsA("Model") and obj.Name:lower():find("brainrot") and obj:FindFirstChild("Head") then
\t\t\troot.CFrame = obj:GetPivot() + Vector3.new(0, 3, 0)
\t\t\tbreak
\t\tend
\tend
end)

mkBtn("Auto Kick After Steal", 456, function()
\tlp:Kick("Auto Kick")
end)

mkBtn("Close", 494, function()
\tgui:Destroy()
end)

hide.MouseButton1Click:Connect(function()
\tlist.Visible = not list.Visible
\tmain.Size = list.Visible and UDim2.new(0, 300, 0, 520) or UDim2.new(0, 300, 0, 34)
end)

local dragging, dragStart, startPos
top.InputBegan:Connect(function(input)
\tif input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
\t\tdragging = true
\t\tdragStart = input.Position
\t\tstartPos = main.Position
\tend
end)

top.InputEnded:Connect(function(input)
\tif input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
\t\tdragging = false
\tend
end)

UIS.InputChanged:Connect(function(input)
\tif dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
\t\tlocal delta = input.Position - dragStart
\t\tmain.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
\tend
end)

UIS.JumpRequest:Connect(function()
\tif infJumpOn and hum and hum.FloorMaterial ~= Enum.Material.Air then
\t\thum:ChangeState(Enum.HumanoidStateType.Jumping)
\tend
end)

RunService.RenderStepped:Connect(function()
\tif speedOn and hum then
\t\thum.WalkSpeed = speedValue
\tend
\tif semiInvisibleOn then
\t\tfor _, v in ipairs(char:GetChildren()) do
\t\t\tif v:IsA("BasePart") and v ~= root then
\t\t\t\tv.Transparency = 0.8
\t\t\tend
\t\tend
\tend
\tif antiRagdollOn then
\t\tfor _, v in ipairs(char:GetDescendants()) do
\t\t\tif v:IsA("Constraint") and v.Name:lower():find("ragdoll") then
\t\t\t\tv:Destroy()
\t\t\tend
\t\tend
\tend
\tif antiBeeOn then
\t\tlocal bee = Workspace:FindFirstChild("BeeDiscoMode")
\t\tif bee then bee:Destroy() end
\tend
\tif antiSentryOn then
\t\tfor _, v in ipairs(Workspace:GetDescendants()) do
\t\t\tif v.Name:lower():find("sentry") then
\t\t\t\tpcall(function() v:Destroy() end)
\t\t\tend
\t\tend
\tend
end)

notify("Brainrot-Delta", "Loaded")
