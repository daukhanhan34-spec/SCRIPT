-- 🌟 Fancy Key System + Loading + Auto Run Script 🌟
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Config
local CORRECT_KEY = "ANHYEUEM1DAYS"
local LINKVERTISE_LINK = "https://direct-link.net/1395310/AW4AzFHMtNkY"
local SCRIPT_URL = "https://raw.githubusercontent.com/daukhanhan34-spec/99NIGHTBESTSCRIPT/refs/heads/main/FAKEDIMOND.lua"

-- 🌟 Key UI
local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "KeySystemUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 380, 0, 180)
frame.Position = UDim2.new(0.5, -190, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(0, 255, 255)

-- hiệu ứng viền đổi màu
task.spawn(function()
    while task.wait(0.2) do
        stroke.Color = Color3.fromRGB(math.random(100,255), math.random(100,255), math.random(100,255))
    end
end)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "🔑 Diamond Spoofer Key System"

local info = Instance.new("TextLabel", frame)
info.Size = UDim2.new(1, -20, 0, 20)
info.Position = UDim2.new(0, 10, 0, 45)
info.BackgroundTransparency = 1
info.Font = Enum.Font.Gotham
info.TextSize = 14
info.TextColor3 = Color3.fromRGB(200,200,200)
info.Text = "Click 'Get Key', open the link, then paste your key here."

local keyBox = Instance.new("TextBox", frame)
keyBox.Size = UDim2.new(0.85, 0, 0, 36)
keyBox.Position = UDim2.new(0.075, 0, 0, 75)
keyBox.PlaceholderText = "Enter key..."
keyBox.Font = Enum.Font.GothamBold
keyBox.TextSize = 16
keyBox.TextColor3 = Color3.fromRGB(255,255,255)
keyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0,6)

local getBtn = Instance.new("TextButton", frame)
getBtn.Size = UDim2.new(0.45, -5, 0, 34)
getBtn.Position = UDim2.new(0.05, 0, 0, 125)
getBtn.Text = "🌐 Get Key"
getBtn.Font = Enum.Font.GothamBold
getBtn.TextSize = 14
getBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
getBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", getBtn).CornerRadius = UDim.new(0,6)

local applyBtn = Instance.new("TextButton", frame)
applyBtn.Size = UDim2.new(0.45, -5, 0, 34)
applyBtn.Position = UDim2.new(0.5, 5, 0, 125)
applyBtn.Text = "✅ Apply Key"
applyBtn.Font = Enum.Font.GothamBold
applyBtn.TextSize = 14
applyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
applyBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", applyBtn).CornerRadius = UDim.new(0,6)

-- helper: notify
local function notify(t)
    StarterGui:SetCore("SendNotification", {Title = "Key System", Text = t, Duration = 4})
end

-- copy link
getBtn.MouseButton1Click:Connect(function()
    local ok = pcall(function() setclipboard(LINKVERTISE_LINK) end)
    if ok then
        notify("Link copied to clipboard!")
    else
        notify("Open this link: "..LINKVERTISE_LINK)
    end
end)

-- apply key
applyBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == CORRECT_KEY then
        notify("Key Accepted! Loading...")
        gui:Destroy()

        -- 🌟 Loading UI
        local loadingGui = Instance.new("ScreenGui", PlayerGui)
        loadingGui.Name = "LoadingScreen"
        loadingGui.ResetOnSpawn = false

        local loadFrame = Instance.new("Frame", loadingGui)
        loadFrame.Size = UDim2.new(0, 260, 0, 100)
        loadFrame.Position = UDim2.new(0.5, -130, 0.5, -50)
        loadFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0, 8)

        local loadText = Instance.new("TextLabel", loadFrame)
        loadText.Size = UDim2.new(1, 0, 0, 40)
        loadText.Text = "Loading... 0%"
        loadText.Font = Enum.Font.GothamBold
        loadText.TextSize = 16
        loadText.TextColor3 = Color3.fromRGB(255,255,255)
        loadText.BackgroundTransparency = 1

        local barBack = Instance.new("Frame", loadFrame)
        barBack.Size = UDim2.new(0.9, 0, 0, 20)
        barBack.Position = UDim2.new(0.05, 0, 0.6, 0)
        barBack.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        Instance.new("UICorner", barBack).CornerRadius = UDim.new(0,6)

        local barFill = Instance.new("Frame", barBack)
        barFill.Size = UDim2.new(0, 0, 1, 0)
        barFill.BackgroundColor3 = Color3.fromRGB(0,200,255)
        Instance.new("UICorner", barFill).CornerRadius = UDim.new(0,6)

        task.spawn(function()
            for i = 1,100 do
                barFill.Size = UDim2.new(i/100,0,1,0)
                loadText.Text = "Loading... "..i.."%"
                task.wait(0.03)
            end
            loadingGui:Destroy()

            -- chạy script chính sau khi load xong
            local ok, res = pcall(function()
                return game:HttpGet(SCRIPT_URL)
            end)
            if ok and res then
                local fn = loadstring(res)
                if fn then fn() end
            else
                notify("Failed to load script from URL.")
            end
        end)
    else
        notify("❌ Wrong key!")
    end
end)