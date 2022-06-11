-----
# EastHub UI Library
-----
# Picture of Ui
Link = https://ibb.co/4pJZb86
# Features :

- Dropdown
- Slider (  not for mobile  )
- Label
- Textbox
- Button
- Toggle
- Notification (  not mine!  )

# Source

- You can only get the source here
```html
https://raw.githubusercontent.com/Brineeee/EastHub-Script/main/SourceUpdate.lua
```
# Library - Window - Tab

- Creating a library window and tab
```html
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Brineeee/EastHub-Script/main/SourceUpdate.lua"))() 
local win = Library:CreateWindow()
local Tab1 = win:CreateTab("Tab 1")
```

# Notifications

- Creating a notification
```html
Tab1:CreateNotification("Notification Title", "Notification Description", 10)
```

# Button

- Creating a Button
```html
Tab1:Button("Example Button", function()
	print()
end)
```

# Toggle 

- Creating a Toggle
```html
Tab1:Toggle("Example Toggle", function(sssss)
	print(sssss)
end)
```

# Another Toggle

- Creating a Another Toggle
```html
Tab1:Toggle2("Example Toggle", function(sssss)
	print(sssss)
end)
```

# Textbox

- Creating a Textbox
```html
Tab1:Textbox("Example Textbox","Type", function() 
    print() 
end) 
```

# Dropdown

- Creating a Dropdown
```html
Tab1:Dropdown("Example Dropdown", {"Option1", "Option2"},function()
    print() 
end) 
```
# Slider

- Creating a Slider 
```html
Tab1:Slider("Example Slider", 1, 9, function() 
    print() 
end) 
```

# Keybind

- Creating a Keybind
```html
Tab1:Keybind("Keybind",Enum.KeyCode.F,function(bool)
    print(bool)
end) 
```
# Label

- Creating a Label
```html
Tab1:Label("Example Label")
```

# Full Lib

```html
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Brineeee/EastHub-Script/main/SourceUpdate.lua"))()

local win = Library:CreateWindow()
local Tab1 = win:CreateTab("Tab 1")

Tab1:Button("Example Notification", function() 
Tab1:CreateNotification("Notification Title", "Notification Description", 10)
end) 

Tab1:Button("Example Button", function()
	print()
end)

Tab1:Toggle("Example Toggle", function(sssss)
	print()
end)

Tab1:Toggle2("Example Another Toggle", function() 
        print()
end)
 
Tab1:Textbox("Example Textbox","Type", function() 
    print() 
end) 

Tab1:Dropdown("Example Dropdown", {"Option1", "Option2"},function()
    print() 
end) 

Tab1:Label("Example Label")
```
-----
 # Note

- The only creator is mech#0945 and Yamete#2273 
