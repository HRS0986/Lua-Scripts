FirstClickTimeStamp, SecondClickTimeStamp = 0, 0
DoubleClickDuration = 0




function OnEvent(event, arg)    
    debug = false
    
    -- Disable All These Buttons In GHub
    Buttons = {
        Foward = 5,
        Bacward = 4,
        Up = 8,
        Down = 7,
        LeftScroll = 11,
        RightScroll = 10,
        G = 6,
        Profile = 9,
        Mid = 3
    }

    SHORT_DELAY = 350
    LONG_DELAY = 1000
    DOUBLE_CLICK_DELAY = 200

    MOUSE_CLICK = "MOUSE_BUTTON_PRESSED"
    MOUSE_RELEASED = "MOUSE_BUTTON_RELEASED"

    if arg == Buttons.G then
        if event == MOUSE_CLICK then
            PressedTime = GetRunningTime()
            ClickDuration = nil
        elseif event == MOUSE_RELEASED then
            ClickDuration = GetRunningTime() - PressedTime

            -- Find All
            if ClickDuration < SHORT_DELAY then
                PlayMacro("Find All")
            
            -- Shutdown
            elseif ClickDuration >= LONG_DELAY then
                PlayMacro("Shutdown")
                
            -- Take SS
            else
                PlayMacro("Take SS")
            end
        end
        return

    elseif arg == Buttons.Profile then
        if event == MOUSE_CLICK then
            PressedTime = GetRunningTime()
            ClickDuration = nil
        elseif event == MOUSE_RELEASED then
            ClickDuration = GetRunningTime() - PressedTime

            -- Format Code
            if ClickDuration < SHORT_DELAY then
                PlayMacro("Format Code")
            
                -- Mute
            elseif ClickDuration >= LONG_DELAY then
                PlayMacro("Mute")
                
            -- Play / Pause
            else
                PlayMacro("Play/Pause")
            end
        end
        return

    elseif arg == Buttons.Mid then
        if event == MOUSE_CLICK then
            PressedTime = GetRunningTime()
            ClickDuration = nil
        elseif event == MOUSE_RELEASED then
            ClickDuration = GetRunningTime() - PressedTime

            -- Goto Implementation
            if ClickDuration < SHORT_DELAY then
                PlayMacro("Goto Implementation")        
            
            -- Goto Overriding
            else
                PlayMacro("Goto Overriding")
            end
        end
        return

    elseif arg == Buttons.Foward then
        if event == MOUSE_CLICK then
            PressedTime = GetRunningTime()
            ClickDuration = nil
        elseif event == MOUSE_RELEASED then
            ClickDuration = GetRunningTime() - PressedTime

            -- Go Foward
            if  ClickDuration < SHORT_DELAY then
                PlayMacro("Go Foward")
            
            -- Copy
            else
                PlayMacro("Copy")
            end
        end
        return

    elseif arg == Buttons.Bacward then
        if event == MOUSE_CLICK then
            PressedTime = GetRunningTime()
            ClickDuration = nil
        elseif event == MOUSE_RELEASED then
            ClickDuration = GetRunningTime() - PressedTime

            -- Go Back
            if ClickDuration < SHORT_DELAY then
                PlayMacro("Go Back")

            -- Paste
            else
                PlayMacro("Paste")
            end
        end
        return

    elseif arg == Buttons.Up then
        if event == MOUSE_CLICK then
            PressedTime = GetRunningTime()
            ClickDuration = nil
        elseif event == MOUSE_RELEASED then
            IsDoubleClicked = IsDoubleClick()
            if IsDoubleClicked then
                PlayMacro("Find Files")
            else
                ClickDuration = GetRunningTime() - PressedTime
    
                -- Comment Code
                if ClickDuration < SHORT_DELAY then
                    PlayMacro("Comment")
    
                -- Next Track
                else
                    PlayMacro("Next Track")
                end
            end

        end
        return

    elseif arg == Buttons.Down then
        if event == MOUSE_CLICK then
            PressedTime = GetRunningTime()
            ClickDuration = nil
        elseif event == MOUSE_RELEASED then
            ClickDuration = GetRunningTime() - PressedTime

            -- Duplicate Selection
            if ClickDuration < SHORT_DELAY then
                PlayMacro("Duplicate Selection")

            -- Previous Track
            else
                PlayMacro("Previous Track")
            end
        end
        return
    end
end

function IsDoubleClick()
    OutputLogMessage("Short click : Next Track\n")

    local isDoubleClicked = false
    if FirstClickTimeStamp == 0 then
        FirstClickTimeStamp = GetRunningTime()
    else
        SecondClickTimeStamp = GetRunningTime()
        DoubleClickDuration = SecondClickTimeStamp - FirstClickTimeStamp
        isDoubleClicked = DoubleClickDuration <= DOUBLE_CLICK_DELAY
        DoubleClickDuration, FirstClickTimeStamp, SecondClickTimeStamp = 0, 0, 0
    end
    return isDoubleClicked
end