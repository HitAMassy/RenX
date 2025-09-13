local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- 🔧 Load Luarmor API
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "cd2895d16f1bda4970eb2429e4f79266" -- replace with your Luarmor Script ID

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScreenGui"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Background (main container)
local background = Instance.new("Frame")
background.Name = "Background"
background.Parent = screenGui
background.AnchorPoint = Vector2.new(0.5, 0.5)
background.ClipsDescendants = true
background.AutomaticSize = Enum.AutomaticSize.Y
background.Size = UDim2.new(0, 350, 0, 0)
background.Position = UDim2.new(0.53212, -12, 0.46425, 35)
background.BackgroundColor3 = Color3.fromRGB(41, 41, 45)
background.BackgroundTransparency = 0.15
background.BorderSizePixel = 0

-- Inner frame (padding container)
local innerFrame = Instance.new("Frame")
innerFrame.Name = "InnerFrame"
innerFrame.Parent = background
innerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
innerFrame.Size = UDim2.new(0.95, 0, 0.95, 0)
innerFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
innerFrame.BackgroundTransparency = 1

-- Background UICorner
local bgUICorner = Instance.new("UICorner")
bgUICorner.CornerRadius = UDim.new(0, 13)
bgUICorner.Parent = background

-- Background UIGradient
local bgGradient = Instance.new("UIGradient")
bgGradient.Parent = background
bgGradient.Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0.000, 0),
	NumberSequenceKeypoint.new(0.500, 0.04375),
	NumberSequenceKeypoint.new(1.000, 0)
}
bgGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0.000, Color3.fromRGB(11, 12, 21)),
	ColorSequenceKeypoint.new(0.500, Color3.fromRGB(171, 86, 255)),
	ColorSequenceKeypoint.new(1.000, Color3.fromRGB(11, 12, 21))
}

-- LEFT: CanvasGroup container for left column
local leftGroup = Instance.new("CanvasGroup")
leftGroup.Name = "Left"
leftGroup.Parent = background
leftGroup.Size = UDim2.new(1, 0, 1, 0)
leftGroup.BackgroundTransparency = 1
leftGroup.BorderSizePixel = 0

-- Left: Padding
local leftPadding = Instance.new("UIPadding")
leftPadding.Parent = leftGroup
leftPadding.PaddingTop = UDim.new(0, 15)
leftPadding.PaddingRight = UDim.new(0, 15)
leftPadding.PaddingLeft = UDim.new(0, 15)
leftPadding.PaddingBottom = UDim.new(0, 15)

-- Left: UIListLayout (vertical)
local leftList = Instance.new("UIListLayout")
leftList.Parent = leftGroup
leftList.Padding = UDim.new(0, 10)
leftList.SortOrder = Enum.SortOrder.LayoutOrder

-- Title area (icon + text)
local titleIconFrame = Instance.new("Frame")
titleIconFrame.Name = "TitleIcon"
titleIconFrame.Parent = leftGroup
titleIconFrame.Size = UDim2.new(0, 100, 0, 20)
titleIconFrame.BackgroundTransparency = 1
titleIconFrame.BorderSizePixel = 0

local titleIconLayout = Instance.new("UIListLayout")
titleIconLayout.Parent = titleIconFrame
titleIconLayout.Padding = UDim.new(0, 8)
titleIconLayout.VerticalAlignment = Enum.VerticalAlignment.Center
titleIconLayout.SortOrder = Enum.SortOrder.LayoutOrder
titleIconLayout.FillDirection = Enum.FillDirection.Horizontal

local titleImage = Instance.new("ImageLabel")
titleImage.Name = "TitleImage"
titleImage.Parent = titleIconFrame
titleImage.Size = UDim2.new(0, 17, 0, 17)
titleImage.BackgroundTransparency = 1
titleImage.BorderSizePixel = 0
titleImage.Image = "rbxassetid://127452598176833"
titleImage.ImageColor3 = Color3.fromRGB(171, 86, 255)

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Parent = titleIconFrame
titleLabel.Text = "KEY SYSTEM"
titleLabel.TextSize = 11
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextColor3 = Color3.fromRGB(171, 86, 255)
titleLabel.AutomaticSize = Enum.AutomaticSize.X
titleLabel.BackgroundTransparency = 1
titleLabel.BorderSizePixel = 0
titleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

-- Ads frame & text
local adsFrame = Instance.new("Frame")
adsFrame.Name = "AdsFrame"
adsFrame.Parent = leftGroup
adsFrame.AutomaticSize = Enum.AutomaticSize.Y
adsFrame.Size = UDim2.new(1, 0, 0, 0)
adsFrame.BackgroundTransparency = 1
adsFrame.BorderSizePixel = 0
adsFrame.LayoutOrder = 1

local adsLabel = Instance.new("TextLabel")
adsLabel.Name = "Ads"
adsLabel.Parent = adsFrame
adsLabel.Text = "WELCOME TO,\n<font color='rgb(170, 85, 255)'>Anonymous Hub</font>"
adsLabel.RichText = true
adsLabel.TextWrapped = true
adsLabel.TextSize = 22
adsLabel.TextXAlignment = Enum.TextXAlignment.Left
adsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
adsLabel.BackgroundTransparency = 1
adsLabel.AutomaticSize = Enum.AutomaticSize.Y
adsLabel.Size = UDim2.new(1, 0, 1, 0)
adsLabel.BorderSizePixel = 0
adsLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)



-- KeyFrame container (contains label + key input)
local keyFrame = Instance.new("Frame")
keyFrame.Name = "KeyFrame"
keyFrame.Parent = leftGroup
keyFrame.AutomaticSize = Enum.AutomaticSize.Y
keyFrame.Size = UDim2.new(1, 0, 0, 0)
keyFrame.BackgroundTransparency = 1
keyFrame.BorderSizePixel = 0
keyFrame.LayoutOrder = 2

local keyFrameList = Instance.new("UIListLayout")
keyFrameList.Parent = keyFrame
keyFrameList.Padding = UDim.new(0, 5)
keyFrameList.SortOrder = Enum.SortOrder.LayoutOrder

local keyLabel = Instance.new("TextLabel")
keyLabel.Name = "KeyLabel"
keyLabel.Parent = keyFrame
keyLabel.Text = "License Key"
keyLabel.TextSize = 12
keyLabel.TextXAlignment = Enum.TextXAlignment.Left
keyLabel.TextTransparency = 0.2
keyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
keyLabel.BackgroundTransparency = 1
keyLabel.Size = UDim2.new(1, 0, 0, 20)
keyLabel.BorderSizePixel = 0
keyLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)


-- small indicator frame on the key label (rounded)
local keyLabelIndicator = Instance.new("Frame")
keyLabelIndicator.Name = "KeyLabelIndicator"
keyLabelIndicator.Parent = keyLabel
keyLabelIndicator.Size = UDim2.new(0, 18, 0, 18)
keyLabelIndicator.AnchorPoint = Vector2.new(1, 0.5)
keyLabelIndicator.Position = UDim2.new(1, 0, 0.5, 0)
keyLabelIndicator.BackgroundColor3 = Color3.fromRGB(171, 86, 255)
keyLabelIndicator.BackgroundTransparency = 0.56
keyLabelIndicator.BorderSizePixel = 0

local keyLabelIndicatorCorner = Instance.new("UICorner")
keyLabelIndicatorCorner.Parent = keyLabelIndicator
keyLabelIndicatorCorner.CornerRadius = UDim.new(1, 0)

local keyLabelIndicatorImage = Instance.new("ImageLabel")
keyLabelIndicatorImage.Name = "KeyLabelIndicatorImage"
keyLabelIndicatorImage.Parent = keyLabelIndicator
keyLabelIndicatorImage.Size = UDim2.new(0, 12, 0, 12)
keyLabelIndicatorImage.AnchorPoint = Vector2.new(0.5, 0.5)
keyLabelIndicatorImage.Position = UDim2.new(0.5, 0, 0.5, 0)
keyLabelIndicatorImage.BackgroundTransparency = 1
keyLabelIndicatorImage.BorderSizePixel = 0
keyLabelIndicatorImage.Image = "rbxassetid://13868333926"

local keyLabelIndicatorClick = Instance.new("TextButton")
keyLabelIndicatorClick.Name = "Click" -- placeholder clickable
keyLabelIndicatorClick.Parent = keyLabelIndicator
keyLabelIndicatorClick.Size = UDim2.new(1, 0, 1, 0)
keyLabelIndicatorClick.BackgroundTransparency = 1
keyLabelIndicatorClick.BorderSizePixel = 0
keyLabelIndicatorClick.Text = ""

-- Keybox (where TextBox is placed)
local keybox = Instance.new("Frame")
keybox.Name = "Keybox"
keybox.Parent = keyFrame
keybox.Size = UDim2.new(1, 0, 0, 35)
keybox.LayoutOrder = 1
keybox.BackgroundColor3 = Color3.fromRGB(171, 86, 255)
keybox.BackgroundTransparency = 0.76
keybox.BorderSizePixel = 0

local keyboxCorner = Instance.new("UICorner")
keyboxCorner.Parent = keybox
keyboxCorner.CornerRadius = UDim.new(0, 4)

local keyboxStroke = Instance.new("UIStroke")
keyboxStroke.Parent = keybox
keyboxStroke.Transparency = 0.64
keyboxStroke.Thickness = 1.2
keyboxStroke.Color = Color3.fromRGB(171, 86, 255)

local keyboxPadding = Instance.new("UIPadding")
keyboxPadding.Parent = keybox
keyboxPadding.PaddingRight = UDim.new(0, 10)
keyboxPadding.PaddingLeft = UDim.new(0, 10)

local keyTextBox = Instance.new("TextBox")
keyTextBox.Name = "KeyTextBox"
keyTextBox.Parent = keybox
keyTextBox.Size = UDim2.new(1, 0, 1, 0)
keyTextBox.Text = ""
keyTextBox.PlaceholderText = "XXXXXXXXXXXXXXXXXXX"
keyTextBox.ClearTextOnFocus = false
keyTextBox.TextSize = 12
keyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTextBox.PlaceholderColor3 = Color3.fromRGB(135, 135, 135)
keyTextBox.BackgroundTransparency = 1
keyTextBox.BorderSizePixel = 0
keyTextBox.TextXAlignment = Enum.TextXAlignment.Left
keyTextBox.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

local keyTextBoxInnerLabel = Instance.new("TextLabel")
keyTextBoxInnerLabel.Parent = keyTextBox
keyTextBoxInnerLabel.Size = UDim2.new(1, 0, 1, 0)
keyTextBoxInnerLabel.Text = ""
keyTextBoxInnerLabel.BackgroundTransparency = 1
keyTextBoxInnerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTextBoxInnerLabel.TextSize = 12
keyTextBoxInnerLabel.TextTransparency = 1
keyTextBoxInnerLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

-- Redeem frame (button + support link)
local redeemFrame = Instance.new("Frame")
redeemFrame.Name = "RedeemFrame"
redeemFrame.Parent = leftGroup
redeemFrame.AutomaticSize = Enum.AutomaticSize.Y
redeemFrame.Size = UDim2.new(1, 0, 0, 0)
redeemFrame.BackgroundTransparency = 1
redeemFrame.BorderSizePixel = 0
redeemFrame.LayoutOrder = 3

local redeemList = Instance.new("UIListLayout")
redeemList.Parent = redeemFrame
redeemList.HorizontalAlignment = Enum.HorizontalAlignment.Center
redeemList.Padding = UDim.new(0, 10)
redeemList.SortOrder = Enum.SortOrder.LayoutOrder

-- Redeem button (frame+shadow+text+image+click)
local redeemButton = Instance.new("Frame")
redeemButton.Name = "RedeemButton"
redeemButton.Parent = redeemFrame
redeemButton.Size = UDim2.new(1, 0, 0, 35)
redeemButton.BackgroundColor3 = Color3.fromRGB(171, 86, 255)
redeemButton.BorderSizePixel = 0

local redeemButtonCorner = Instance.new("UICorner")
redeemButtonCorner.Parent = redeemButton
redeemButtonCorner.CornerRadius = UDim.new(0, 6)

-- Shadow image under button (slice)
local redeemShadow = Instance.new("ImageLabel")
redeemShadow.Name = "Shadow"
redeemShadow.Parent = redeemButton
redeemShadow.Size = UDim2.new(1.05, 0, 1.5, 0)
redeemShadow.AnchorPoint = Vector2.new(0.5, 0.5)
redeemShadow.Position = UDim2.new(0.49968, 0, 0.49958, 0)
redeemShadow.BackgroundTransparency = 1
redeemShadow.BorderSizePixel = 0
redeemShadow.Image = "rbxassetid://1316045217"
redeemShadow.ImageTransparency = 0.8
redeemShadow.ScaleType = Enum.ScaleType.Slice
redeemShadow.SliceCenter = Rect.new(10, 10, 118, 118)
redeemShadow.ImageColor3 = Color3.fromRGB(171, 86, 255)
redeemShadow.Name = "Shadow"

local redeemTextHolder = Instance.new("Frame")
redeemTextHolder.Name = "Text"
redeemTextHolder.Parent = redeemButton
redeemTextHolder.Size = UDim2.new(1, 0, 1, 0)
redeemTextHolder.BackgroundTransparency = 1
redeemTextHolder.BorderSizePixel = 0

local redeemTextLayout = Instance.new("UIListLayout")
redeemTextLayout.Parent = redeemTextHolder
redeemTextLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
redeemTextLayout.VerticalAlignment = Enum.VerticalAlignment.Center
redeemTextLayout.FillDirection = Enum.FillDirection.Horizontal
redeemTextLayout.SortOrder = Enum.SortOrder.LayoutOrder

local redeemTextLabel = Instance.new("TextLabel")
redeemTextLabel.Parent = redeemTextHolder
redeemTextLabel.Text = "Redeem"
redeemTextLabel.TextSize = 12
redeemTextLabel.BackgroundTransparency = 1
redeemTextLabel.AutomaticSize = Enum.AutomaticSize.X
redeemTextLabel.BorderSizePixel = 0
redeemTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
redeemTextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

local redeemIcon = Instance.new("ImageLabel")
redeemIcon.Name = "Icon"
redeemIcon.Parent = redeemTextHolder
redeemIcon.Size = UDim2.new(0, 20, 0, 20)
redeemIcon.BackgroundTransparency = 1
redeemIcon.BorderSizePixel = 0
redeemIcon.Image = "rbxassetid://14938884688"
redeemIcon.LayoutOrder = 2

local redeemClick = Instance.new("TextButton")
redeemClick.Name = "Click"
redeemClick.Parent = redeemButton
redeemClick.Size = UDim2.new(1, 0, 1, 0)
redeemClick.BackgroundTransparency = 1
redeemClick.BorderSizePixel = 0
redeemClick.Text = ""

-- Support/Discord link label
local supportLabel = Instance.new("TextLabel")
supportLabel.Name = "SupportLabel"
supportLabel.Parent = redeemFrame
supportLabel.RichText = true
supportLabel.Text = "Need support? <font color='rgb(170, 85, 255)'>Join our Discord</font>"
supportLabel.TextSize = 12
supportLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
supportLabel.BackgroundTransparency = 1
supportLabel.BorderSizePixel = 0
supportLabel.TextTransparency = 0.5
supportLabel.AutomaticSize = Enum.AutomaticSize.XY
supportLabel.LayoutOrder = 2
supportLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

local supportClick = Instance.new("TextButton")
supportClick.Name = "Click"
supportClick.Parent = supportLabel
supportClick.Size = UDim2.new(1, 0, 1, 0)
supportClick.BackgroundTransparency = 1
supportClick.BorderSizePixel = 0
supportClick.Text = ""

-- Line separator
local separatorLine = Instance.new("Frame")
separatorLine.Name = "Line"
separatorLine.Parent = redeemFrame
separatorLine.Size = UDim2.new(1, 0, 0, 1)
separatorLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
separatorLine.BorderSizePixel = 0
separatorLine.BackgroundTransparency = 0.9
separatorLine.LayoutOrder = 4

-- TabList 
local tabList = Instance.new("Frame")
tabList.Name = "TabList"
tabList.Parent = leftGroup
tabList.Size = UDim2.new(1, 0, 0, 20)
tabList.BackgroundTransparency = 1
tabList.BorderSizePixel = 0
tabList.LayoutOrder = 4

local tabListLayout = Instance.new("UIListLayout")
tabListLayout.Parent = tabList
tabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabListLayout.Padding = UDim.new(0, 8)
tabListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
tabListLayout.FillDirection = Enum.FillDirection.Horizontal
tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Function for tabs
local function createTab(parent, imageId, text, visible)
	local tab = Instance.new("Frame")
	tab.Parent = parent
	tab.Size = UDim2.new(0, 25, 0, 25)
	tab.AutomaticSize = Enum.AutomaticSize.X
	tab.BackgroundColor3 = Color3.fromRGB(171, 86, 255)
	tab.BorderSizePixel = 0
	tab.Name = "Tab"
	tab.Visible = (visible ~= false)

	local tabFrame = Instance.new("Frame")
	tabFrame.Parent = tab
	tabFrame.Size = UDim2.new(1, 0, 1, 0)
	tabFrame.BackgroundTransparency = 1

	local tabListLayout = Instance.new("UIListLayout")
	tabListLayout.Parent = tabFrame
	tabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	tabListLayout.Padding = UDim.new(0, 6)
	tabListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	tabListLayout.FillDirection = Enum.FillDirection.Horizontal

	local tabPadding = Instance.new("UIPadding")
	tabPadding.Parent = tabFrame
	tabPadding.PaddingRight = UDim.new(0, 8)
	tabPadding.PaddingLeft = UDim.new(0, 8)

	local tabImage = Instance.new("ImageLabel")
	tabImage.Parent = tabFrame
	tabImage.Size = UDim2.new(0, 15, 0, 15)
	tabImage.BackgroundTransparency = 1
	tabImage.BorderSizePixel = 0
	tabImage.Image = imageId

	local tabText = Instance.new("TextLabel")
	tabText.Parent = tabFrame
	tabText.Text = text or ""
	tabText.TextSize = 13
	tabText.TextXAlignment = Enum.TextXAlignment.Left
	tabText.BackgroundTransparency = 1
	tabText.BorderSizePixel = 0
	tabText.AutomaticSize = Enum.AutomaticSize.X
    tabText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tabText.TextColor3 = Color3.fromRGB(255,255,255)

	local tabCorner = Instance.new("UICorner")
	tabCorner.Parent = tab
	tabCorner.CornerRadius = UDim.new(1, 0)

	local tabGradient = Instance.new("UIGradient")
	tabGradient.Parent = tab
	tabGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(169,169,169))
	}

	local tabClick = Instance.new("TextButton")
	tabClick.Parent = tab
	tabClick.Size = UDim2.new(1, 0, 1, 0)
	tabClick.BackgroundTransparency = 1
	tabClick.BorderSizePixel = 0
	tabClick.Text = ""
	tabClick.Name = "Click"

	return tab
end

-- Create tabs
createTab(tabList, "rbxassetid://122637139040192", "Linkvertise", false)
createTab(tabList, "rbxassetid://73945068764478", "Work.Ink", true)
createTab(tabList, "rbxassetid://14924054039", "Rinku.pro", false)

-- Explain area
local explainFrame = Instance.new("Frame")
explainFrame.Name = "Explain"
explainFrame.Parent = leftGroup
explainFrame.AutomaticSize = Enum.AutomaticSize.Y
explainFrame.Size = UDim2.new(1, 0, 0, 0)
explainFrame.BackgroundTransparency = 1
explainFrame.BorderSizePixel = 0
explainFrame.LayoutOrder = 4

local explainLayout = Instance.new("UIListLayout")
explainLayout.Parent = explainFrame
explainLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
explainLayout.Padding = UDim.new(0, 8)
explainLayout.VerticalAlignment = Enum.VerticalAlignment.Center
explainLayout.SortOrder = Enum.SortOrder.LayoutOrder

local explainLine = Instance.new("Frame")
explainLine.Name = "Line"
explainLine.Parent = explainFrame
explainLine.Size = UDim2.new(1, 0, 0, 1)
explainLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
explainLine.BackgroundTransparency = 0.9
explainLine.BorderSizePixel = 0
explainLine.LayoutOrder = -1

-- Explanation steps
local function createExplainRow(parent, numberText, contentText)
	local row = Instance.new("Frame")
	row.Parent = parent
	row.AutomaticSize = Enum.AutomaticSize.Y
	row.Size = UDim2.new(1, 0, 0, 0)
	row.BackgroundTransparency = 1
	row.BorderSizePixel = 0

	local rowLayout = Instance.new("UIListLayout")
	rowLayout.Parent = row
	rowLayout.Padding = UDim.new(0, 10)
	rowLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	rowLayout.SortOrder = Enum.SortOrder.LayoutOrder
	rowLayout.FillDirection = Enum.FillDirection.Horizontal

	local numFrame = Instance.new("Frame")
	numFrame.Parent = row
	numFrame.Size = UDim2.new(0, 18, 0, 18)
	numFrame.BackgroundColor3 = Color3.fromRGB(171, 86, 255)
	numFrame.BackgroundTransparency = 0.70153
	numFrame.BorderSizePixel = 0

	local numCorner = Instance.new("UICorner")
	numCorner.Parent = numFrame
	numCorner.CornerRadius = UDim.new(1, 0)

	local numLabel = Instance.new("TextLabel")
	numLabel.Parent = numFrame
	numLabel.Size = UDim2.new(1, 0, 1, 0)
	numLabel.BackgroundTransparency = 1
	numLabel.Text = tostring(numberText)
	numLabel.TextSize = 13
	numLabel.TextColor3 = Color3.fromRGB(171, 86, 255)
	numLabel.BorderSizePixel = 0
	numLabel.AutomaticSize = Enum.AutomaticSize.X
    numLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

	local contentLabel = Instance.new("TextLabel")
	contentLabel.Parent = row
	contentLabel.Text = contentText or ""
	contentLabel.TextSize = 11
	contentLabel.TextXAlignment = Enum.TextXAlignment.Left
	contentLabel.TextWrapped = true
	contentLabel.TextTransparency = 0.3
	contentLabel.BackgroundTransparency = 1
	contentLabel.Size = UDim2.new(0, 292, 0, 11)
	contentLabel.BorderSizePixel = 0
	contentLabel.AutomaticSize = Enum.AutomaticSize.Y
	contentLabel.Position = UDim2.new(0.0875, 0, 0.19444, 0)
    contentLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    contentLabel.TextColor3 = Color3.fromRGB(255,255,255)

	return row
end

createExplainRow(explainFrame, 1, "Choose your Authorization System")
createExplainRow(explainFrame, 2, "Complete ads ( 2 Checkpoint )")
createExplainRow(explainFrame, 3, "Copy and paste key here!!")

-- UIDragDetector
local dragDetector = Instance.new("UIDragDetector")
dragDetector.Parent = background
dragDetector.DragUDim2 = UDim2.new(0, 37, 0, -56)

-- Notify container at bottom of background
local keyTextBox = background.Left.KeyFrame.Keybox.KeyTextBox
local redeemClick = background.Left.RedeemFrame.RedeemButton.Click

-- Notify container at bottom of background
local notify = Instance.new("Frame")
notify.Name = "Notify"
notify.Parent = background
notify.AnchorPoint = Vector2.new(0.5, 1)
notify.Position = UDim2.new(0.5, 0, 1, 0)
notify.Size = UDim2.new(0, 100, 0, 30)
notify.BackgroundTransparency = 1

local notifyList = Instance.new("UIListLayout")
notifyList.Parent = notify
notifyList.HorizontalAlignment = Enum.HorizontalAlignment.Center
notifyList.VerticalAlignment = Enum.VerticalAlignment.Bottom
notifyList.SortOrder = Enum.SortOrder.LayoutOrder

-- Notification handler
local function createNotifyRow(parent, name, color, iconId, text)
    local notifyShadow = Instance.new("ImageLabel")
    notifyShadow.Name = "Shadow" .. name
    notifyShadow.Parent = parent
    notifyShadow.Image = "rbxassetid://1316045217"
    notifyShadow.ImageTransparency = 1 -- start invisible
    notifyShadow.BackgroundTransparency = 1
    notifyShadow.AutomaticSize = Enum.AutomaticSize.XY
    notifyShadow.SliceCenter = Rect.new(10,10,118,118)
    notifyShadow.ScaleType = Enum.ScaleType.Slice
    notifyShadow.ImageColor3 = color

    local notifyTemple = Instance.new("Frame")
    notifyTemple.Name = "NotifyTemple" .. name
    notifyTemple.Parent = notifyShadow
    notifyTemple.AnchorPoint = Vector2.new(0.5, 0.5)
    notifyTemple.AutomaticSize = Enum.AutomaticSize.X
    notifyTemple.Size = UDim2.new(0, 0, 0, 20)
    notifyTemple.Position = UDim2.new(0.5, 0, 0.5, 0)
    notifyTemple.BackgroundColor3 = color
    notifyTemple.BackgroundTransparency = 0.4
    notifyTemple.BorderSizePixel = 0

    local notifyTemplePadding = Instance.new("UIPadding")
    notifyTemplePadding.Parent = notifyTemple
    notifyTemplePadding.PaddingRight = UDim.new(0, 10)
    notifyTemplePadding.PaddingLeft = UDim.new(0, 10)

    local notifyTempleCorner = Instance.new("UICorner")
    notifyTempleCorner.Parent = notifyTemple
    notifyTempleCorner.CornerRadius = UDim.new(1, 0)

    local notifyTempleStroke = Instance.new("UIStroke")
    notifyTempleStroke.Parent = notifyTemple
    notifyTempleStroke.Color = color

    local innerFrame = Instance.new("Frame")
    innerFrame.Parent = notifyTemple
    innerFrame.Size = UDim2.new(1, 0, 1, 0)
    innerFrame.BackgroundTransparency = 1

    local icon = Instance.new("ImageLabel")
    icon.Parent = innerFrame
    icon.Size = UDim2.new(0, 15, 0, 15)
    icon.BackgroundTransparency = 1
    icon.Image = iconId

    local label = Instance.new("TextLabel")
    label.Parent = innerFrame
    label.Text = text
    label.TextSize = 13
    label.BackgroundTransparency = 1
    label.AutomaticSize = Enum.AutomaticSize.X
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")

    local innerLayout = Instance.new("UIListLayout")
    innerLayout.Parent = innerFrame
    innerLayout.FillDirection = Enum.FillDirection.Horizontal
    innerLayout.Padding = UDim.new(0, 6)
    innerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    innerLayout.VerticalAlignment = Enum.VerticalAlignment.Center

    local outerLayout = Instance.new("UIListLayout")
    outerLayout.Parent = notifyShadow
    outerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    outerLayout.VerticalAlignment = Enum.VerticalAlignment.Center

    local padding = Instance.new("UIPadding")
    padding.Parent = notifyShadow
    padding.PaddingTop = UDim.new(0, 8)
    padding.PaddingBottom = UDim.new(0, 8)
    padding.PaddingLeft = UDim.new(0, 8)
    padding.PaddingRight = UDim.new(0, 8)

    -- Animations
    notifyShadow.Position = UDim2.new(0.5, 0, 1, 30) 
    TweenService:Create(
        notifyShadow,
        TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        { Position = UDim2.new(0.5, 0, 1, 0), ImageTransparency = 0.9 }
    ):Play()

    
    task.delay(3, function()
        local tweenOut = TweenService:Create(
            notifyShadow,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            { Position = UDim2.new(0.5, 0, 1, -30), ImageTransparency = 1 }
        )
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            notifyShadow:Destroy()
        end)
    end)

    return notifyShadow
end

redeemClick.MouseButton1Click:Connect(function()
    local key = keyTextBox.Text
    if key == "" then
        createNotifyRow(notify, "Invalid", Color3.fromRGB(255, 38, 18), "rbxassetid://14943813832", "Please enter a key")
        return
    end

    local status = api.check_key(key)

    if status.code == "KEY_VALID" then
        createNotifyRow(notify, "Valid", Color3.fromRGB(0, 255, 82), "rbxassetid://14939475472", "Key Valid")
        getgenv().script_key = key
        api.load_script()
    elseif status.code == "KEY_HWID_LOCKED" then
        createNotifyRow(notify, "Invalid", Color3.fromRGB(255, 38, 18), "rbxassetid://14943813832", "Key linked to another HWID")
    elseif status.code == "KEY_INCORRECT" then
        createNotifyRow(notify, "Invalid", Color3.fromRGB(255, 38, 18), "rbxassetid://14943813832", "Key is Invalid")
    else
        createNotifyRow(notify, "Invalid", Color3.fromRGB(255, 38, 18), "rbxassetid://14943813832", status.message)
    end
end)

	if status.code == "KEY_VALID" then
		wait(2)
		ScreenGui:Destroy()
	end
