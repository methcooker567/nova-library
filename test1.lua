local UI = {}

-- Function to create a frame
function UI:createFrame(parent, size, position, backgroundColor, transparency)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, size.X, 0, size.Y)
    frame.Position = UDim2.new(0, position.X, 0, position.Y)
    frame.BackgroundColor3 = backgroundColor or Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = transparency or 0
    frame.Parent = parent
    return frame
end

-- Function to create a label
function UI:createLabel(parent, size, position, text, textSize, textColor)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, size.X, 0, size.Y)
    label.Position = UDim2.new(0, position.X, 0, position.Y)
    label.Text = text
    label.TextSize = textSize or 14
    label.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = parent
    return label
end

-- Function to create a button (for navigation or actions)
function UI:createButton(parent, size, position, text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, size.X, 0, size.Y)
    button.Position = UDim2.new(0, position.X, 0, position.Y)
    button.Text = text
    button.TextSize = 18
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Parent = parent

    -- Set up click functionality
    button.MouseButton1Click:Connect(function()
        callback()
    end)

    return button
end

-- Function to create a slider
function UI:createSlider(parent, size, position, min, max, callback)
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(0, size.X, 0, size.Y)
    slider.Position = UDim2.new(0, position.X, 0, position.Y)
    slider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    slider.Parent = parent

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 10, 1, 0)
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = slider

    local valueLabel = UI:createLabel(slider, Vector2.new(40, 20), Vector2.new(size.X + 5, 0), "FOV: 0", 14, Color3.fromRGB(255, 255, 255))

    -- Update function
    local function updateSlider(x)
        local value = math.clamp((x - slider.Position.X.Offset) / size.X, 0, 1)
        button.Position = UDim2.new(value, 0, 0, 0)
        local valueNum = math.floor(min + (max - min) * value)
        valueLabel.Text = "FOV: " .. valueNum
        callback(valueNum)
    end

    button.MouseButton1Down:Connect(function()
        local mouseMoveConnection
        mouseMoveConnection = game:GetService("UserInputService").InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                updateSlider(input.Position.X)
            end
        end)

        button.MouseButton1Up:Connect(function()
            mouseMoveConnection:Disconnect()
        end)
    end)

    return slider
end

return UI
