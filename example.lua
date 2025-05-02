-- Load the UI library
local UI = -- Or wherever you placed the UI script

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Main container (Background frame)
local mainFrame = UI:createFrame(screenGui, Vector2.new(600, 400), Vector2.new(50, 50), Color3.fromRGB(0, 0, 0), 0.8)

-- Title Bar (Header)
local titleBar = UI:createFrame(mainFrame, Vector2.new(600, 40), Vector2.new(0, 0), Color3.fromRGB(30, 30, 30))
local titleLabel = UI:createLabel(titleBar, Vector2.new(200, 30), Vector2.new(10, 5), "Ragebot", 18, Color3.fromRGB(255, 255, 255))

-- Left navigation buttons (Place these on the left side)
local navContainer = UI:createFrame(mainFrame, Vector2.new(120, 360), Vector2.new(10, 50), Color3.fromRGB(40, 40, 40))
local masterSwitchButton = UI:createButton(navContainer, Vector2.new(100, 30), Vector2.new(10, 10), "Master Switch", function() print("Master Switch clicked") end)
local batteryHelpButton = UI:createButton(navContainer, Vector2.new(100, 30), Vector2.new(10, 50), "Battery Help", function() print("Battery Help clicked") end)

-- Right-side settings container
local settingsContainer = UI:createFrame(mainFrame, Vector2.new(470, 360), Vector2.new(130, 50), Color3.fromRGB(40, 40, 40))

-- Sliders for settings (FOV slider as an example)
local fovSlider = UI:createSlider(settingsContainer, Vector2.new(200, 20), Vector2.new(10, 20), 0, 180, function(value)
    print("FOV set to: " .. value)
end)

-- You can add more sliders, labels, and buttons here for each setting in the UI
