on run {phone, messageText}
    tell application "Messages"
        set isAppRunning to false
        tell application "System Events"
            if (exists process "Messages") then
                set isAppRunning to true
            end if
        end tell

        if isAppRunning is false then
            activate
        end if

        tell application "System Events" to tell process "Messages"
            click menu item "New Message" of menu 1 of menu bar item "File" of menu bar 1
            set outputString to phone
            set len to length of outputString
            delay 1
            repeat with i from 1 to len
                set x to character i of outputString
                keystroke x
            end repeat
            tell application "System Events"
                key code 36
            end tell

            keystroke messageText

            tell application "System Events"
                key code 36
            end tell

        end tell
        delay 2
        set miniaturized of window 1 to true
    end tell
end run