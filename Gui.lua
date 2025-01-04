--[[
Rayfield Interface Suite
by Easy

easy | Designing + Programming
Preston | Programming
Max   | Programming
]]

local InterfaceBuild = '1VEX'
local Release = "Build 1.55"
local RayfieldFolder = "Rayfield"
local ConfigurationFolder = RayfieldFolder.."/Configurations"
local ConfigurationExtension = ".rfld"

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local function getExecutor()
    local name, version
    if identifyexecutor then
        name, version = identifyexecutor()
    end
    return { Name = name or "", Version = version or "" }
end

local RayfieldLibrary = {
    Flags = {},
    Theme = {
        Default = {
            TextColor = Color3.fromRGB(240, 240, 240),
            Background = Color3.fromRGB(25, 25, 25),
            Topbar = Color3.fromRGB(34, 34, 34),
            Shadow = Color3.fromRGB(20, 20, 20),
            NotificationBackground = Color3.fromRGB(20, 20, 20),
            NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
            TabBackground = Color3.fromRGB(80, 80, 80),
            TabStroke = Color3.fromRGB(85, 85, 85),
            TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
            TabTextColor = Color3.fromRGB(240, 240, 240),
            SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
            ElementBackground = Color3.fromRGB(35, 35, 35),
            ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
            SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
            ElementStroke = Color3.fromRGB(50, 50, 50),
            SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
            SliderBackground = Color3.fromRGB(50, 138, 220),
            SliderProgress = Color3.fromRGB(50, 138, 220),
            SliderStroke = Color3.fromRGB(58, 163, 255),
            ToggleBackground = Color3.fromRGB(30, 30, 30),
            ToggleEnabled = Color3.fromRGB(0, 146, 214),
            ToggleDisabled = Color3.fromRGB(100, 100, 100),
            ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
            ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
            ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
            ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
            DropdownSelected = Color3.fromRGB(40, 40, 40),
            DropdownUnselected = Color3.fromRGB(30, 30, 30),
            InputBackground = Color3.fromRGB(30, 30, 30),
            InputStroke = Color3.fromRGB(65, 65, 65),
            PlaceholderColor = Color3.fromRGB(178, 178, 178)
        }
    }
}

local function CreateInterfaceWindow(title)
    local Window = Instance.new("Frame")
    Window.Size = UDim2.new(0, 400, 0, 300)
    Window.BackgroundColor3 = RayfieldLibrary.Theme.Default.Background
    Window.BorderSizePixel = 0
    Window.Name = title
    Window.Parent = game.CoreGui

    local Topbar = Instance.new("Frame")
    Topbar.Size = UDim2.new(1, 0, 0, 30)
    Topbar.BackgroundColor3 = RayfieldLibrary.Theme.Default.Topbar
    Topbar.Parent = Window

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = title
    TitleLabel.Size = UDim2.new(1, 0, 1, 0)
    TitleLabel.TextColor3 = RayfieldLibrary.Theme.Default.TextColor
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextScaled = true
    TitleLabel.Parent = Topbar

    return Window
end

local function SaveConfiguration(name, data)
    local configData = HttpService:JSONEncode(data)
    local filePath = ConfigurationFolder.."/"..name..ConfigurationExtension
    if not isfolder(ConfigurationFolder) then
        makefolder(ConfigurationFolder)
    end
    writefile(filePath, configData)
end

local function LoadConfiguration(name)
    local filePath = ConfigurationFolder.."/"..name..ConfigurationExtension
    if isfile(filePath) then
        local configData = readfile(filePath)
        return HttpService:JSONDecode(configData)
    else
        return nil
    end
end

return RayfieldLibrary
