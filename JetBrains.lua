function OnEvent(event, arg)    
    debug = false
    
    -- Disable All These Buttons In GHub
    Buttons = {
        Foward = 5,
        Bacward = 4,
        up = 8,
        Down = 7,
        LeftScroll = 11,
        RightScroll = 10,
        G = 6,
        Profile = 9,
        Mid = 3
    }

    ShortClickDelay = 350
    LongClickDelay = 1000

    MOUSE_CLICK = "MOUSE_BUTTON_PRESSED"
    MOUSE_RELEASED = "MOUSE_BUTTON_RELEASED"

    if arg == Buttons.G then
        if event == MOUSE_CLICK then
            PressedTime = GetRunningTime()
            ClickDuration = nil
        elseif event == MOUSE_RELEASED then
            ClickDuration = GetRunningTime() - PressedTime

            -- Find All
            if ClickDuration < ShortClickDelay then
                PlayMacro("Find All")
            
            -- Shutdown
            elseif ClickDuration >= LongClickDelay then
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
            if ClickDuration < ShortClickDelay then
                PlayMacro("Format Code")
            
                -- Mute
            elseif ClickDuration >= LongClickDelay then
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
            if ClickDuration < ShortClickDelay then
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
            if  ClickDuration < ShortClickDelay then
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
            if ClickDuration < ShortClickDelay then
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
            ClickDuration = GetRunningTime() - PressedTime

            -- Comment Code
            if ClickDuration < ShortClickDelay then
                PlayMacro("Comment")

            -- Next Track
            else
                PlayMacro("Next Track")
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
            if ClickDuration < ShortClickDelay then
                PlayMacro("Duplicate Selection")

            -- Previous Track
            else
                PlayMacro("Previous Track")
            end
        end
        return
    end
end