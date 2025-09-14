local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ✅ Key system config
local CorrectKey = "BAYBAYDIEM"
local GetKeyLink = "https://direct-link.net/1395310/AW4AzFHMtNkY"

-- Blur cho KeySystem
local blur = Instance.new("BlurEffect", game.Lighting)
blur.Enabled = true
blur.Size = 20

-- 🔑 Key System UI
local keyGui = Instance.new("ScreenGui", PlayerGui)
keyGui.Name = "KeySystemUI"
keyGui.ResetOnSpawn = false

local keyFrame = Instance.new("Frame", keyGui)
keyFrame.Size = UDim2.new(0, 300, 0, 160)
keyFrame.Position = UDim2.new(0.5, -150, 0.5, -80)
keyFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", keyFrame)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "🔑 Key System"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local linkBtn = Instance.new("TextButton", keyFrame)
linkBtn.Size = UDim2.new(0.8, 0, 0, 30)
linkBtn.Position = UDim2.new(0.1, 0, 0, 50)
linkBtn.Text = "🌐 Get Key"
linkBtn.Font = Enum.Font.GothamBold
linkBtn.TextSize = 14
linkBtn.TextColor3 = Color3.fromRGB(255,255,255)
linkBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
Instance.new("UICorner", linkBtn).CornerRadius = UDim.new(0, 6)

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.new(0.8, 0, 0, 30)
keyBox.Position = UDim2.new(0.1, 0, 0, 90)
keyBox.PlaceholderText = "Enter Key..."
keyBox.Text = ""
keyBox.Font = Enum.Font.GothamBold
keyBox.TextSize = 14
keyBox.TextColor3 = Color3.fromRGB(255,255,255)
keyBox.BackgroundColor3 = Color3.fromRGB(70,70,70)
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 6)

local submitBtn = Instance.new("TextButton", keyFrame)
submitBtn.Size = UDim2.new(0.8, 0, 0, 30)
submitBtn.Position = UDim2.new(0.1, 0, 0, 130)
submitBtn.Text = "✅ Submit"
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 14
submitBtn.TextColor3 = Color3.fromRGB(255,255,255)
submitBtn.BackgroundColor3 = Color3.fromRGB(0,200,100)
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0, 6)

-- 🌐 Get Key button
linkBtn.MouseButton1Click:Connect(function()
    setclipboard(GetKeyLink)
    StarterGui:SetCore("SendNotification", {
        Title = "Get Key",
        Text = "Link copied! Paste into browser.",
        Duration = 5
    })
end)

-- ✅ Check Key
submitBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == CorrectKey then
        StarterGui:SetCore("SendNotification", {
            Title = "Key Accepted!",
            Text = "Loading Diamonds UI...",
            Duration = 4
        })
        keyGui:Destroy()
        blur:Destroy()

        -- 🟢 Loading UI
        local loadingGui = Instance.new("ScreenGui", PlayerGui)
        loadingGui.ResetOnSpawn = false
        local loadFrame = Instance.new("Frame", loadingGui)
        loadFrame.Size = UDim2.new(0, 250, 0, 100)
        loadFrame.Position = UDim2.new(0.5, -125, 0.5, -50)
        loadFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0, 8)

        local loadText = Instance.new("TextLabel", loadFrame)
        loadText.Size = UDim2.new(1, 0, 0, 40)
        loadText.Text = "Loading... 0%"
        loadText.Font = Enum.Font.GothamBold
        loadText.TextSize = 16
        loadText.TextColor3 = Color3.fromRGB(255, 255, 255)
        loadText.BackgroundTransparency = 1

        local barBack = Instance.new("Frame", loadFrame)
        barBack.Size = UDim2.new(0.9, 0, 0, 20)
        barBack.Position = UDim2.new(0.05, 0, 0.6, 0)
        barBack.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        Instance.new("UICorner", barBack).CornerRadius = UDim.new(0, 6)

        local barFill = Instance.new("Frame", barBack)
        barFill.Size = UDim2.new(0, 0, 1, 0)
        barFill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 6)

        -- progress animation
        task.spawn(function()
            for i = 1, 100 do
                barFill.Size = UDim2.new(i/100, 0, 1, 0)
                loadText.Text = "Loading... " .. i .. "%"
                task.wait(0.02)
            end
            loadingGui:Destroy()

            -- 🔥 Diamonds UI (fake)
            local diamonds = 0

            local function applyToLabel(obj)
                if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                    if string.find(obj.Text, "%d") then
                        obj.Text = tostring(diamonds)
                    end
                end
            end

            for _, obj in ipairs(PlayerGui:GetDescendants()) do
                applyToLabel(obj)
            end
            PlayerGui.DescendantAdded:Connect(applyToLabel)

            local screenGui = Instance.new("ScreenGui", PlayerGui)
            screenGui.ResetOnSpawn = false

            local frame = Instance.new("Frame", screenGui)
            frame.Size = UDim2.new(0, 220, 0, 150)
            frame.Position = UDim2.new(0.5, -110, 1.5, 0)
            frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            frame.Active = true
            frame.Draggable = true
            Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

            local title = Instance.new("TextLabel", frame)
            title.Size = UDim2.new(1, 0, 0, 30)
            title.Text = "💎 Diamonds"
            title.Font = Enum.Font.GothamBold
            title.TextSize = 18
            title.TextColor3 = Color3.fromRGB(255, 255, 255)
            title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            local stroke = Instance.new("UIStroke", title)
            stroke.Thickness = 2

            task.spawn(function()
                while task.wait(0.1) do
                    stroke.Color = Color3.fromRGB(math.random(150,255), math.random(150,255), math.random(150,255))
                end
            end)

            local textBox = Instance.new("TextBox", frame)
            textBox.Size = UDim2.new(0.8, 0, 0, 30)
            textBox.Position = UDim2.new(0.1, 0, 0, 45)
            textBox.PlaceholderText = "Enter number..."
            textBox.Text = ""
            textBox.Font = Enum.Font.GothamBold
            textBox.TextSize = 14
            textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            textBox.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)

            local button = Instance.new("TextButton", frame)
            button.Size = UDim2.new(0.8, 0, 0, 30)
            button.Position = UDim2.new(0.1, 0, 0, 85)
            button.Text = "Apply"
            button.Font = Enum.Font.GothamBold
            button.TextSize = 14
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

            -- Toggle Button
            local toggleButton = Instance.new("TextButton", screenGui)
            toggleButton.Size = UDim2.new(0, 50, 0, 25)
            toggleButton.Position = UDim2.new(0, 10, 0, 10)
            toggleButton.Text = "UI"
            toggleButton.Font = Enum.Font.GothamBold
            toggleButton.TextSize = 14
            toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 200)
            Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0, 6)

            -- Blur effect
            local blurUI = Instance.new("BlurEffect", game.Lighting)
            blurUI.Size = 0
            blurUI.Enabled = false

            -- Sound effects
            local clickSound = Instance.new("Sound", SoundService)
            clickSound.SoundId = "rbxassetid://12221967"
            clickSound.Volume = 1

            local bgMusic = Instance.new("Sound", SoundService)
            bgMusic.SoundId = "rbxassetid://1843528071"
            bgMusic.Volume = 0.5
            bgMusic.Looped = true

            local function playClick()
                clickSound:Play()
            end

            -- Apply button
            button.MouseButton1Click:Connect(function()
                playClick()
                local num = tonumber(textBox.Text)
                if num then
                    diamonds = num
                    for _, obj in ipairs(PlayerGui:GetDescendants()) do
                        applyToLabel(obj)
                    end
                    StarterGui:SetCore("SendNotification", {
                        Title = "Diamonds Updated!",
                        Text = "New amount: " .. tostring(diamonds),
                        Duration = 4
                    })
                else
                    StarterGui:SetCore("SendNotification", {
                        Title = "Error",
                        Text = "Please enter a valid number!",
                        Duration = 4
                    })
                end
            end)

            -- Toggle UI
            local uiVisible = false
            toggleButton.MouseButton1Click:Connect(function()
                playClick()
                uiVisible = not uiVisible
                if uiVisible then
                    blurUI.Enabled = true
                    TweenService:Create(blurUI, TweenInfo.new(0.5), {Size = 20}):Play()
                    TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        Position = UDim2.new(0.5, -110, 0.5, -75)
                    }):Play()
                    bgMusic:Play()
                else
                    TweenService:Create(blurUI, TweenInfo.new(0.5), {Size = 0}):Play()
                    task.delay(0.5, function() blurUI.Enabled = false end)
                    TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                        Position = UDim2.new(0.5, -110, 1.5, 0)
                    }):Play()
                    bgMusic:Stop()
                end
            end)

            -- Thông báo khi bật script
            StarterGui:SetCore("SendNotification", {
                Title = "Script Loaded!",
                Text = "Made by Khánh An ✨ Diamonds ready!",
                Duration = 6
            })
        end)
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Wrong Key",
            Text = "Please try again!",
            Duration = 4
        })
    end
end)