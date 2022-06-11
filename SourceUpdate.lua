local Library = {} 

do --/Destroy East
    local ui = game:GetService("CoreGui"):FindFirstChild("East")
	if ui then ui:Destroy()
	end
end

function Library:CreateWindow()
	
	local East = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
    local Togglee = Instance.new("TextButton") 
    local UI = Instance.new("TextButton")
	local mainCorner = Instance.new("UICorner")
	local SideBar = Instance.new("Frame")
	local sideCorner = Instance.new("UICorner")
	local coverCorner = Instance.new("Frame")
	local allTabs = Instance.new("Frame")
	local tabListing = Instance.new("UIListLayout")
	local allPages = Instance.new("Frame")
	local mainCorner_2 = Instance.new("UICorner")

	East.Name = "East"
	East.Parent = game.CoreGui	
	East.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	East.ResetOnSpawn = false

    Togglee.Name = "Togglee"
    Togglee.Parent = East
    Togglee.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Togglee.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    Togglee.Size = UDim2.new(0, 50, 0, 50)
    Togglee.Font = Enum.Font.Gotham
    Togglee.Text = "UI"
    Togglee.TextColor3 = Color3.fromRGB(255, 0, 0)
    Togglee.TextScaled = true
    Togglee.MouseButton1Down:connect(function()
    MainFrame.Visible = false
    Togglee.Visible = false
    UI.Visible = true
    end)  

    UI.Name = "UI"
    UI.Parent = East
    UI.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    UI.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    UI.Size = UDim2.new(0, 50, 0, 50)
    UI.Font = Enum.Font.Gotham
    UI.Text = "UI"
    UI.TextColor3 = Color3.fromRGB(255, 0, 0)
    UI.TextScaled = true
    UI.MouseButton1Down:connect(function()
    MainFrame.Visible = true
    UI.Visible = false
    Togglee.Visible = true
    end) 

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = East
	MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	MainFrame.Position = UDim2.new(0.396969676, 0, 0.302184463, 0)
	MainFrame.Size = UDim2.new(0, 530, 0, 360)

	mainCorner.CornerRadius = UDim.new(0, 3)
	mainCorner.Name = "mainCorner"
	mainCorner.Parent = MainFrame

	SideBar.Name = "SideBar"
	SideBar.Parent = MainFrame
	SideBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	SideBar.BorderSizePixel = 0
	SideBar.Size = UDim2.new(0, 410, 0, 280)

	sideCorner.CornerRadius = UDim.new(0, 3)
	sideCorner.Name = "sideCorner"
	sideCorner.Parent = SideBar

	coverCorner.Name = "coverCorner"
	coverCorner.Parent = SideBar
	coverCorner.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	coverCorner.BorderSizePixel = 0
	coverCorner.Position = UDim2.new(0.943925261, 0, 0, 0)
	coverCorner.Size = UDim2.new(0, 6, 0, 160)

	allTabs.Name = "allTabs"
	allTabs.Parent = SideBar
	allTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	allTabs.BackgroundTransparency = 1.000
	allTabs.Position = UDim2.new(0.0500000007, 0, 0.0299999993, 0)
	allTabs.Size = UDim2.new(0, 398, 0, 246)

	tabListing.Name = "tabListing"
	tabListing.Parent = allTabs
	tabListing.SortOrder = Enum.SortOrder.LayoutOrder
	tabListing.Padding = UDim.new(0, 2)

	allPages.Name = "allPages"
	allPages.Parent = MainFrame
	allPages.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	allPages.Position = UDim2.new(0.274418592, 0, 0.0269230772, 0)
	allPages.Size = UDim2.new(0, 370, 0, 340)

	mainCorner_2.CornerRadius = UDim.new(0, 3)
	mainCorner_2.Name = "mainCorner"
	mainCorner_2.Parent = allPages

	local pagesFolder = Instance.new("Folder")

	pagesFolder.Name = "pagesFolder"
	pagesFolder.Parent = allPages

local function DGZPFEN_fake_script() -- MainFrame.LocalScript 
	local script = Instance.new('LocalScript', MainFrame)

	local players = game:service('Players');
	local player = players.LocalPlayer;
	local mouse = player:GetMouse();
	local run = game:service('RunService');
	local stepped = run.Stepped;
	draggable = function(obj)
		spawn(function()
			obj.Active = true;
			local minitial;
			local initial;
			local isdragging;
			obj.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					isdragging = true;
					minitial = input.Position;
					initial = obj.Position;
					local con;
					con = stepped:Connect(function()
						if isdragging then
							local delta = Vector3.new(mouse.X, mouse.Y, 0) - minitial;
							obj.Position = UDim2.new(initial.X.Scale, initial.X.Offset + delta.X, initial.Y.Scale, initial.Y.Offset + delta.Y);
						else
							con:Disconnect();
						end;
					end);
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							isdragging = false;
						end;
					end);
				end;
			end);
		end)
	end;
	
	draggable(script.Parent)
end
coroutine.wrap(DGZPFEN_fake_script)()
	
	local TabHandler = {}
	
	function TabHandler:CreateTab(tabname)
		tabname = tabname or "New Tab"
		local tabButton = Instance.new("TextButton")
		local tabCorner = Instance.new("UICorner")
		local newPage = Instance.new("ScrollingFrame") 
		local elementsListing = Instance.new("UIListLayout") 

		local elementsPadding = Instance.new("UIPadding")

		elementsPadding.Name = "elementsPadding"
		elementsPadding.Parent = newPage
		elementsPadding.PaddingRight = UDim.new(0, 5)
		elementsPadding.PaddingTop = UDim.new(0, 5)
		
		tabButton.Name = "tabButton"
		tabButton.Parent = allTabs
		tabButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
		tabButton.Size = UDim2.new(0, 106, 0, 20)
		tabButton.Font = Enum.Font.Gotham
		tabButton.Text = tabname -- Displays our custom text
		tabButton.TextColor3 = Color3.fromRGB(10, 10, 10)
		tabButton.TextSize = 14.000
		tabButton.AutoButtonColor = false	
		tabButton.MouseButton1Click:Connect(function()
			for i,v in next, pagesFolder:GetChildren() do -- We get all the pages that we added
				v.Visible = false	-- then we make them invisible 
			end 
			newPage.Visible = true	-- We make current page visible but not others
			
			--Animations Below  -- Optional
			for i,v in next, allTabs:GetChildren() do	-- We get all the elements inside the frame
				if v:IsA("TextButton") then -- We can't animate UIListLayout, so we check if its a TextButton
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- We animate other Tab Buttons and making the current one seem Checked
					}):Play()
				end
			end
			game.TweenService:Create(tabButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundColor3 = Color3.fromRGB(230, 0, 0) -- We animate other Tab Buttons and making the current one seem Checked
			}):Play()
		end)

		tabCorner.CornerRadius = UDim.new(0, 3)
		tabCorner.Name = "sideCorner"
		tabCorner.Parent = tabButton
		
		newPage.Name = "newPage"
		newPage.Parent = pagesFolder
		newPage.Active = true
		newPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		newPage.BackgroundTransparency = 1.000
		newPage.Size = UDim2.new(1, 0, 1, 0)
		newPage.ScrollBarThickness = 10
		newPage.Visible = false
		newPage.ZIndex = 99

		elementsListing.Name = "elementsListing"
		elementsListing.Parent = newPage
		elementsListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
		elementsListing.SortOrder = Enum.SortOrder.LayoutOrder
		elementsListing.Padding = UDim.new(0, 3)
		
		local ElementHandler = {}
		
function ElementHandler:CreateNotification(text, desc, durat)
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

Notification:Notify(
    {Title = text, Description = desc},
    {OutlineColor = Color3.fromRGB(150, 0, 0),Time = durat, Type = "default"}
)
end

		function ElementHandler:Button(btnText, callback)
			btnText = btnText or "Text Button"
			callback = callback or function() end	
			
			local TextButton = Instance.new("TextButton")
			local buttonCorner = Instance.new("UICorner")
			
			TextButton.Parent = newPage
			TextButton.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
			TextButton.Position = UDim2.new(0.0245098043, 0, 0, 0)
			TextButton.Size = UDim2.new(0, 350, 0, 28)
			TextButton.AutoButtonColor = true
			TextButton.Font = Enum.Font.Gotham
			TextButton.Text = btnText
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			TextButton.ZIndex = 1
			TextButton.MouseButton1Click:Connect(function()
				callback()
			end)

			buttonCorner.CornerRadius = UDim.new(0, 7)
			buttonCorner.Name = "buttonCorner"
			buttonCorner.Parent = TextButton
		end
		
        function ElementHandler:Toggle(Name,Callback)
            local Name = Name or "Toggle"
            local Callback = Callback or function() end
            local ToggleEnabled = false
            local ToggleFrame = Instance.new("Frame")
            local ToggleName = Instance.new("TextLabel")
            local ToggleNamePadding = Instance.new("UIPadding")
            local ToggleFrameCorner = Instance.new("UICorner")
            local ToggleCorner = Instance.new("UICorner")
            local ToggleCircle = Instance.new("ImageLabel")
            local ToggleButton = Instance.new("TextButton")
            local ToggleF = Instance.new("Frame")

            ToggleFrame.Name = tostring(Name).."_Toggle"
            ToggleFrame.Parent = newPage
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
            ToggleFrame.BorderSizePixel = 0
            ToggleFrame.Size = UDim2.new(0, 350, 0, 32)

            ToggleName.Name = "ToggleName"
            ToggleName.Parent = ToggleFrame
            ToggleName.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            ToggleName.BackgroundTransparency = 1.000
            ToggleName.BorderSizePixel = 0
            ToggleName.Size = UDim2.new(0, 347, 0, 35)
            ToggleName.Font = Enum.Font.Gotham
            ToggleName.Text = Name
            ToggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleName.TextSize = 14.000
            ToggleName.TextXAlignment = Enum.TextXAlignment.Left

            ToggleNamePadding.Name = "ToggleNamePadding"
            ToggleNamePadding.Parent = ToggleName
            ToggleNamePadding.PaddingLeft = UDim.new(0, 10)

            ToggleFrameCorner.Name = "ToggleFrameCorner"
            ToggleFrameCorner.Parent = ToggleFrame

            ToggleF.Name = "ToggleF"
            ToggleF.Parent = ToggleFrame
            ToggleF.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            ToggleF.BackgroundTransparency = 0
            ToggleF.BorderSizePixel = 0
            ToggleF.Position = UDim2.new(0.867647052, 0, 0.142857149, 0)
            ToggleF.Size = UDim2.new(0, 45, 0, 23)

            ToggleCorner.CornerRadius = UDim.new(0, 25)
            ToggleCorner.Name = "ToggleCorner"
            ToggleCorner.Parent = ToggleF

            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = ToggleF
            ToggleButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            ToggleButton.BackgroundTransparency = 1
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Size = UDim2.new(0, 45, 0, 23)
            ToggleButton.Font = Enum.Font.SourceSans
            ToggleButton.Text = ""
            ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButton.TextSize = 14.000

            ToggleCircle.Name = "ToggleCircle"
            ToggleCircle.Parent = ToggleF
            ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleCircle.BackgroundTransparency = 1.000
            ToggleCircle.Position = UDim2.new(0.093, 0,0.153, 0)
            ToggleCircle.Size = UDim2.new(0, 17, 0, 17)
            ToggleCircle.Image = "rbxassetid://3570695787"
            ToggleCircle.ScaleType = Enum.ScaleType.Slice
            ToggleCircle.SliceCenter = Rect.new(100, 100, 100, 100)
            ToggleCircle.SliceScale = 0.120

            ToggleButton.MouseButton1Down:Connect(function()
                ToggleEnabled = not ToggleEnabled
                if ToggleEnabled then 
                    game:GetService("TweenService"):Create(ToggleF, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play() 
                    game:GetService("TweenService"):Create(ToggleCircle, TweenInfo.new(0.3), {Position = UDim2.new(0.559, 0,0.153, 0)}):Play() 
                else
                    game:GetService("TweenService"):Create(ToggleF, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(150, 0, 0)}):Play() 
                    game:GetService("TweenService"):Create(ToggleCircle, TweenInfo.new(0.3), {Position = UDim2.new(0.093, 0,0.153, 0)}):Play() 
                end
                pcall(Callback,ToggleEnabled)
            end)
        end 

		function ElementHandler:Toggle2(togInfo, callback)
			togInfo = togInfo or "Toggle"
			callback = callback or function() end	

			local toggleButton = Instance.new("TextButton")
			local toggleButtonCover = Instance.new("UICorner")
			local toggle = Instance.new("Frame")
			local toggleCorner = Instance.new("UICorner")
			local toggleInfo = Instance.new("TextLabel")

			toggleButton.Name = "toggleButton"
			toggleButton.Parent = newPage
			toggleButton.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
			toggleButton.Position = UDim2.new(0.0245098043, 0, 0, 0)
			toggleButton.Size = UDim2.new(0, 350, 0, 32)
			toggleButton.AutoButtonColor = false
			toggleButton.Font = Enum.Font.Gotham
			toggleButton.Text = ""
			toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			toggleButton.TextSize = 14.000

			toggleButtonCover.CornerRadius = UDim.new(0, 7)
			toggleButtonCover.Name = "toggleButtonCover"
			toggleButtonCover.Parent = toggleButton

			toggle.Name = "toggle"
			toggle.Parent = toggleButton
			toggle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
			toggle.Position = UDim2.new(0.0240549836, 0, 0.15625, 0)
			toggle.Size = UDim2.new(0, 22, 0, 22)

			toggleCorner.CornerRadius = UDim.new(0, 10)
			toggleCorner.Name = "toggleCorner"
			toggleCorner.Parent = toggle

			toggleInfo.Name = "toggleInfo"
			toggleInfo.Parent = toggleButton
			toggleInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggleInfo.BackgroundTransparency = 1.000
			toggleInfo.Position = UDim2.new(0.130584195, 0, 0, 0)
			toggleInfo.Size = UDim2.new(0, 230, 0, 32)
			toggleInfo.Font = Enum.Font.Gotham
			toggleInfo.Text = togInfo --- We set our custom text here
			toggleInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
			toggleInfo.TextSize = 14.000
			toggleInfo.TextXAlignment = Enum.TextXAlignment.Left
			
			local tog = false
			
			toggleButton.MouseButton1Click:Connect(function()
				tog = not tog
				callback(tog) -- Callbacks whenever we toggle
				if tog then 
					game.TweenService:Create(toggle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(150, 0, 0)
					}):Play()
					--- We put our animation here when the toggle is on
				else
					game.TweenService:Create(toggle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(200, 200, 200)
					}):Play()
					---We Put our animation here when the toggle is off
				end
			end)
		end

function ElementHandler:Label(labelText)
		    labelText = labelText or "Text Label"
			
			local TextLabel = Instance.new("TextLabel")
			local labelCorner = Instance.new("UICorner")
			
			TextLabel.Parent = newPage
			TextLabel.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
			TextLabel.Position = UDim2.new(0.0245098043, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 350, 0, 32)
			TextLabel.Font = Enum.Font.Gotham
			TextLabel.Text = labelText
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.ZIndex = 1

			labelCorner.CornerRadius = UDim.new(0, 7)
			labelCorner.Name = "labelCorner"
			labelCorner.Parent = TextLabel
end 

        function ElementHandler:Textbox(Name,Default,Callback)
            local Name = Name or "Textbox"
            local Default = Default or ""
            local Callback = Callback or function() end
            local TextboxFrame = Instance.new("Frame")
            local TextboxFrameCorner = Instance.new("UICorner")
            local TextboxName = Instance.new("TextLabel")
            local TextboxNamePadding = Instance.new("UIPadding")
            local Textbox = Instance.new("TextBox")
            local TextboxCorner = Instance.new("UICorner")

            TextboxFrame.Name = tostring(Name).."_Textbox"
            TextboxFrame.Parent = newPage
            TextboxFrame.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
            TextboxFrame.Size = UDim2.new(0, 350, 0, 32)

            TextboxFrameCorner.Name = "TextboxFrameCorner"
            TextboxFrameCorner.Parent = TextboxFrame

            TextboxName.Name = "TextboxName"
            TextboxName.Parent = TextboxFrame
            TextboxName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxName.BackgroundTransparency = 1.000
            TextboxName.BorderSizePixel = 0
            TextboxName.Size = UDim2.new(0, 340, 0, 32)
            TextboxName.Font = Enum.Font.Gotham
            TextboxName.Text = Name
            TextboxName.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextboxName.TextSize = 14.000
            TextboxName.TextXAlignment = Enum.TextXAlignment.Right

            TextboxNamePadding.Name = "TextboxNamePadding"
            TextboxNamePadding.Parent = TextboxName
            TextboxNamePadding.PaddingLeft = UDim.new(0, 0)

            Textbox.Name = "Textbox"
            Textbox.Parent = TextboxFrame
            Textbox.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            Textbox.BorderSizePixel = 0
            Textbox.Position = UDim2.new(0.0245098043, 0, 0.12, 0)
            Textbox.Size = UDim2.new(0, 60, 0, 23)
            Textbox.Font = Enum.Font.Gotham
            Textbox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            Textbox.PlaceholderText = Default
            Textbox.Text = ""
            Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
            Textbox.TextSize = 14.00

            TextboxCorner.Name = "TextboxCorner"
            TextboxCorner.Parent = Textbox

            Textbox.Focused:Connect(function()
                game:GetService("TweenService"):Create(Textbox, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                }):Play()
            end)

            Textbox.FocusLost:Connect(function()
                game:GetService("TweenService"):Create(Textbox, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                }):Play()
                Callback(Textbox.Text)
            end)
        end
		
        function ElementHandler:Slider(Name,Min,Max,Callback)
            local Name = Name or "Slider"
            local Callback = Callback or function() end
            local Max = Max or 500
            local Min = Min or 16
            local SliderFrame = Instance.new("Frame")
            local SliderFrameCorner = Instance.new("UICorner")
            local SliderButton = Instance.new("TextButton")
            local SliderButtonCorner = Instance.new("UICorner")
            local SliderTrail = Instance.new("Frame")
            local SliderTrailCorner = Instance.new("UICorner")
            local SliderName = Instance.new("TextLabel")
            local SliderNamePadding = Instance.new("UIPadding")
            local SliderValue = Instance.new("TextLabel")
            local SliderValuePadding = Instance.new("UIPadding")

            SliderFrame.Name = tostring(Name).."_Slider"
            SliderFrame.Parent = newPage
            SliderFrame.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
            SliderFrame.Size = UDim2.new(0, 350, 0, 32)

            SliderFrameCorner.Name = "SliderFrameCorner"
            SliderFrameCorner.Parent = SliderFrame

            SliderButton.Name = "SliderButton"
            SliderButton.Parent = SliderFrame
            SliderButton.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
            SliderButton.BorderSizePixel = 0
            SliderButton.Position = UDim2.new(0.0, 0, 0.7, 0)
            SliderButton.Size = UDim2.new(0, 350, 0, 10)
            SliderButton.Font = Enum.Font.Gotham
            SliderButton.Text = ""
            SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderButton.TextSize = 14.000

            SliderButtonCorner.Name = "SliderButtonCorner"
            SliderButtonCorner.Parent = SliderButton

            SliderTrail.Name = "SliderTrail"
            SliderTrail.Parent = SliderButton
            SliderTrail.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            SliderTrail.Size = UDim2.new(0, 0, 0, 0)
            SliderTrail.BorderSizePixel = 0

            SliderTrailCorner.Name = "SliderTrailCorner"
            SliderTrailCorner.Parent = SliderTrail

            SliderName.Name = "SliderName"
            SliderName.Parent = SliderFrame
            SliderName.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
            SliderName.BackgroundTransparency = 1.000
            SliderName.BorderSizePixel = 0
            SliderName.Size = UDim2.new(0, 350, 0, 26)
            SliderName.Font = Enum.Font.Gotham
            SliderName.Text = Name
            SliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderName.TextSize = 14.000
            SliderName.TextXAlignment = Enum.TextXAlignment.Left

            SliderNamePadding.Name = "SliderNamePadding"
            SliderNamePadding.Parent = SliderName
            SliderNamePadding.PaddingLeft = UDim.new(0, 10)

            SliderValue.Name = "SliderValue"
            SliderValue.Parent = SliderFrame
            SliderValue.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.BorderSizePixel = 0
            SliderValue.TextTransparency = 1.000
            SliderValue.Position = UDim2.new(0.702061796, 0, 0.12, 0)
            SliderValue.Size = UDim2.new(0, 80, 0, 29)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.Text = "Value"
            SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextSize = 14.000
            SliderValue.TextXAlignment = Enum.TextXAlignment.Right

            SliderValuePadding.Name = "SliderValuePadding"
            SliderValuePadding.Parent = SliderValue
            SliderValuePadding.PaddingRight = UDim.new(0, 10)

            local ms = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")
            local Value
            local mouse = game:GetService("Players").LocalPlayer:GetMouse();

            SliderButton.MouseButton1Down:Connect(function()
                game:GetService("TweenService"):Create(SliderValue, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    TextTransparency = 0
                }):Play()
                Value = math.floor((((tonumber(Max) - tonumber(Min)) / 389) * SliderTrail.AbsoluteSize.X) + tonumber(Min)) or 0
                pcall(function()
                    Callback(Value)
                end)
                SliderTrail:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderTrail.AbsolutePosition.X, 0, 389), 0, 10), "InOut", "Linear", 0.05, true)
                moveconnection = mouse.Move:Connect(function()
                    SliderValue.Text = Value
                    Value = math.floor((((tonumber(Max) - tonumber(Min)) / 389) * SliderTrail.AbsoluteSize.X) + tonumber(Min))
                    pcall(function()
                        Callback(Value)
                    end)
                    SliderTrail:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderTrail.AbsolutePosition.X, 0, 389), 0, 10), "InOut", "Linear", 0.05, true)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(Max) - tonumber(Min)) / 389) * SliderTrail.AbsoluteSize.X) + tonumber(Min))
                        pcall(function()
                            Callback(Value)
                        end)
                        SliderValue.Text = Value
                        game:GetService("TweenService"):Create(SliderValue, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            TextTransparency = 1
                        }):Play()
                        SliderTrail:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderTrail.AbsolutePosition.X, 0, 389), 0, 10), "InOut", "Linear", 0.05, true)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
        end                    

   function ElementHandler:Dropdown(dropInfo, list, callback)
                                    callback = callback or function() end
                                    list = list or {}
                                    dropInfo = dropInfo or ""
        
                                    local isDropped1 = false
                                    local DropDownFrame = Instance.new("Frame")
                                    local dropdownFrame = Instance.new("Frame")
                                    local UICorner = Instance.new("UICorner")
                                    local dropdownFrameMain = Instance.new("Frame")
                                    local UICorner_2 = Instance.new("UICorner")
                                    local expand_more = Instance.new("ImageButton")
                                    local dropdownItem1 = Instance.new("TextLabel")
                                    local UIListLayout = Instance.new("UIListLayout")
                                    local UIListLayout_2 = Instance.new("UIListLayout")
                                    local UIListLayout_3 = Instance.new("UIListLayout")

                                    local DropYSize = 36

                                    DropDownFrame.Name = "DropDownFrame"
                                    DropDownFrame.Parent = newPage
                                    DropDownFrame.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
                                    DropDownFrame.BackgroundTransparency = 1.000
                                    DropDownFrame.Position = UDim2.new(0.0209973752, 0, 0.439849585, 0)
                                    DropDownFrame.Size = UDim2.new(0, 350, 0, 32)
                                    DropDownFrame.ClipsDescendants = true

                                    dropdownFrame.Name = "dropdownFrame"
                                    dropdownFrame.Parent = DropDownFrame
                                    dropdownFrame.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
                                    dropdownFrame.Size = UDim2.new(1, 0, 1, 0)
                                    dropdownFrame.ZIndex = 2

                                    UICorner.CornerRadius = UDim.new(0, 7)
                                    UICorner.Parent = dropdownFrame

                                    dropdownFrameMain.Name = "dropdownFrameMain"
                                    dropdownFrameMain.Parent = dropdownFrame
                                    dropdownFrameMain.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
                                    dropdownFrameMain.Size = UDim2.new(0, 350, 0, 32)
                                    dropdownFrameMain.ZIndex = 2

                                    UICorner_2.CornerRadius = UDim.new(0, 7)
                                    UICorner_2.Parent = dropdownFrameMain

                                    expand_more.Name = "expand_more"
                                    expand_more.Parent = dropdownFrameMain
                                    expand_more.BackgroundTransparency = 1.000
                                    expand_more.Position = UDim2.new(0.91900003, 0, 0.138999999, 0)
                                    expand_more.Size = UDim2.new(0, 25, 0, 25)
                                    expand_more.ZIndex = 2
                                    expand_more.Image = "rbxassetid://3926305904"
                                    expand_more.ImageColor3 = Color3.fromRGB(150, 0, 0)
                                    expand_more.ImageRectOffset = Vector2.new(564, 284)
                                    expand_more.ImageRectSize = Vector2.new(36, 36)
                                    expand_more.MouseButton1Click:Connect(function()
                                        if isDropped1 then
                                            isDropped1 = false
                                            DropDownFrame:TweenSize(UDim2.new(0, 350, 0, 32), "In", "Quint", 0.10)
                                            game.TweenService:Create(expand_more, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                                                Rotation = 0
                                            }):Play()
                                            wait(0.10)
                                            sectionFrame:TweenSize(UDim2.new(1,0, 0, sectionInnerList.AbsoluteContentSize.Y + 5), "In", "Quint", 0.10)
                                            wait(0.10)
                                            UpdateSize()
                                        else
                                            isDropped1 = true
                                            DropDownFrame:TweenSize(UDim2.new(0, 350, 0, DropYSize), "In", "Quint", 0.10)
                                            game.TweenService:Create(expand_more, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                                                Rotation = 180
                                            }):Play()
                                            wait(0.10)
                                            sectionFrame:TweenSize(UDim2.new(1,0, 0, sectionInnerList.AbsoluteContentSize.Y + 5), "In", "Quint", 0.10)
                                            wait(0.10)
                                            UpdateSize()
                                        end
                                    end)

                                    dropdownItem1.Name = "dropdownItem1"
                                    dropdownItem1.Parent = dropdownFrameMain
                                    dropdownItem1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    dropdownItem1.BackgroundTransparency = 1.000
                                    dropdownItem1.Position = UDim2.new(0.0250000004, 0, 0.0933333358, 0)
                                    dropdownItem1.Size = UDim2.new(0, 350, 0, 32)
                                    dropdownItem1.ZIndex = 2
                                    dropdownItem1.Font = Enum.Font.Gotham
                                    dropdownItem1.Text = dropInfo
                                    dropdownItem1.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    dropdownItem1.TextSize = 14.000
                                    dropdownItem1.TextXAlignment = Enum.TextXAlignment.Left

                                    UIListLayout.Parent = dropdownFrame
                                    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                                    UIListLayout.Padding = UDim.new(0, 7)

                                    UIListLayout_2.Parent = optionBtnFrame
                                    UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                                    UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

                                    UIListLayout_3.Parent = DropDownFrame
                                    UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
                                    UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                    UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
                                    UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center

                                    for i,v in next, list do
                                        local optionBtnFrame = Instance.new("Frame")
                                        local optionBtn1 = Instance.new("TextButton")
                                        local UICorner_3 = Instance.new("UICorner")

                                        optionBtnFrame.Name = "optionBtnFrame"
                                        optionBtnFrame.Parent = dropdownFrame
                                        optionBtnFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        optionBtnFrame.BackgroundTransparency = 1.000
                                        optionBtnFrame.BorderSizePixel = 0
                                        optionBtnFrame.Size = UDim2.new(0, 350, 0, 32)
    
                                        optionBtn1.Name = "optionBtn1"
                                        optionBtn1.Parent = optionBtnFrame
                                        optionBtn1.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
                                        optionBtn1.Size = UDim2.new(0, 350, 0, 32)
                                        optionBtn1.ZIndex = 2
                                        optionBtn1.AutoButtonColor = false
                                        optionBtn1.Font = Enum.Font.Gotham
                                        optionBtn1.Text = "  "..v
                                        optionBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        optionBtn1.TextSize = 14.000
                                        optionBtn1.TextXAlignment = Enum.TextXAlignment.Left
    
                                        UICorner_3.CornerRadius = UDim.new(0, 7)
                                        UICorner_3.Parent = optionBtn1

                                        DropYSize = DropYSize + 40
                                        optionBtn1.MouseButton1Click:Connect(function()
                                            callback(v)
                                            dropdownItem1.Text = v
                                            DropDownFrame:TweenSize(UDim2.new(0, 350, 0, 32), "In", "Quint", 0.10)
                                            wait()
                                            isDropped = false
                                            wait(0.10)
                                            sectionFrame:TweenSize(UDim2.new(1,0, 0, sectionInnerList.AbsoluteContentSize.Y + 5), "In", "Quint", 0.10)
                                            wait(0.10)
                                            UpdateSize()
                                            game.TweenService:Create(expand_more, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                                                Rotation = 0
                                            }):Play()
                                        end)
                                        optionBtn1.MouseButton1Down:Connect(function()
                                            optionBtn1:TweenSize(UDim2.new(0, 350,0, 32), "InOut", "Quint", 0.12, true)
                                            game.TweenService:Create(optionBtn1, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                                                BackgroundColor3 = Color3.fromRGB(21,21,21),
                                                TextColor3 = Color3.fromRGB(180, 180, 180)
                                            }):Play()
                                        end)
                                        
                                        optionBtn1.MouseButton1Up:Connect(function()
                                            optionBtn1:TweenSize(UDim2.new(0, 350,0, 32), "InOut", "Quint", 0.12, true)
                                            game.TweenService:Create(optionBtn1, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                                                BackgroundColor3 = Color3.fromRGB(101, 168, 157),
                                                TextColor3 = Color3.fromRGB(0,0,0)
                                            }):Play()
                                        end)
                                        
                                        optionBtn1.MouseEnter:Connect(function()
                                            game.TweenService:Create(optionBtn1, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                                                BackgroundColor3 = Color3.fromRGB(44, 48, 53),
                                                TextColor3 = Color3.fromRGB(250,250,250)
                                            }):Play()
                                        end)
                                        
optionBtn1.MouseLeave:Connect(function()
                                            game.TweenService:Create(optionBtn1, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                                                BackgroundColor3 = Color3.fromRGB(44, 48, 53),
                                                TextColor3 = Color3.fromRGB(255, 255, 255)
                                            }):Play()
                                        end)
                                end

function ElementHandler:Keybind(Name,xKey,Callback)
            local Name = Name or "Keybind"
            local Callback = Callback or function() end
            local Keyx = xKey.Name
            local KeybindFrame = Instance.new("Frame")
            local KeybindFrameCorner = Instance.new("UICorner")
            local KeybindName = Instance.new("TextLabel")
            local KeybindNamePadding = Instance.new("UIPadding")
            local KeybindButton = Instance.new("TextButton")
            local KeybindButtonCorner = Instance.new("UICorner")

            KeybindFrame.Name = tostring(Name).."_Keybind"
            KeybindFrame.Parent = newPage
            KeybindFrame.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
            KeybindFrame.BorderSizePixel = 0
            KeybindFrame.Size = UDim2.new(0, 350, 0, 32)
            
            KeybindFrameCorner.Name = "KeybindFrameCorner"
            KeybindFrameCorner.Parent = KeybindFrame
            
            KeybindName.Name = "KeybindName"
            KeybindName.Parent = KeybindFrame
            KeybindName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindName.BackgroundTransparency = 1.000
            KeybindName.BorderSizePixel = 0
            KeybindName.Size = UDim2.new(0, 235, 0, 35)
            KeybindName.Font = Enum.Font.Gotham
            KeybindName.Text = Name
            KeybindName.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindName.TextSize = 14.000
            KeybindName.TextXAlignment = Enum.TextXAlignment.Left
            
            KeybindNamePadding.Name = "KeybindNamePadding"
            KeybindNamePadding.Parent = KeybindName
            KeybindNamePadding.PaddingLeft = UDim.new(0, 10)
            
            KeybindButton.Name = "KeybindButton"
            KeybindButton.Parent = KeybindFrame
            KeybindButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            KeybindButton.Position = UDim2.new(0.810294104, 0, 0.171428576, 0)
            KeybindButton.Size = UDim2.new(0, 50, 0, 23)
            KeybindButton.Font = Enum.Font.Gotham
            KeybindButton.Text = Keyx
            KeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindButton.TextSize = 14.000
            KeybindButton.ZIndex = 2
            
            KeybindButtonCorner.Name = "KeybindButtonCorner"
            KeybindButtonCorner.Parent = KeybindButton

            KeybindButton.MouseButton1Click:connect(function() 
                game.TweenService:Create(KeybindButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                }):Play()
                KeybindButton.Text = ". . ."
                local v1, v2 = game:GetService('UserInputService').InputBegan:wait();
                if v1.KeyCode.Name ~= "Unknown" then
                    game.TweenService:Create(KeybindButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                    }):Play()
                    KeybindButton.Text = v1.KeyCode.Name
                    Keyx = v1.KeyCode.Name;
                end
            end)
    
            game:GetService("UserInputService").InputBegan:connect(function(a, gp) 
                if not gp then 
                    if a.KeyCode.Name == Keyx then 
                        Callback()
                    end
                end
            end)
        end 

                            end
          return ElementHandler
        end
	return TabHandler
end 
return Library
