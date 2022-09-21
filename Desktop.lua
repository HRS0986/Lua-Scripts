function OnEvent(event, arg)
	-- Debug mode : if true does not perform any action --
	debug = false

	-- Disable this button in Logitech control panel 
	upButton = 8
	downButton = 7
	muteButton = 9
	gButton = 6
	midButton = 3
	fwdButton = 5
	bckButton = 4
	left = 11
	right = 10

	mediaButtonDelta = 350  -- Time to register a long click
	spotifyDelta = 1000
	gButtonDeltaShutdown = 1000 -- Time to register a very long click


      -- Volume Up and Next Track
	if arg == upButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			mediaButtonStartUp = GetRunningTime()
			mediaButtonDurationUp = nil
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			mediaButtonDurationUp = GetRunningTime() - mediaButtonStartUp 
	
			if mediaButtonDurationUp >= mediaButtonDelta then
				-- Next Track
				OutputLogMessage("Short click (".. mediaButtonDurationUp /1000 .."s) : Next Track\n")
				if not debug then
					PlayMacro("Next Track")
				end
			else
				-- Volume Up
				OutputLogMessage("Long click (".. mediaButtonDurationUp /1000 .."s) : Volume Up \n")
				if not debug then
					PlayMacro("Volume Up")
				end
			end
		end

		return	
	
	-- Volume Down and Previous Track
	elseif arg == downButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			mediaButtonStartDown = GetRunningTime()
			mediaButtonDurationDown = nil
			
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			mediaButtonDurationDown  = GetRunningTime() - mediaButtonStartDown 
	
			if mediaButtonDurationDown >= mediaButtonDelta then
				-- Next Track
				OutputLogMessage("Short click (".. mediaButtonDurationDown /1000 .."s) : Previous Track\n")
				if not debug then
					PlayMacro("Previous Track")
				end
			else
				-- Volume Up
				OutputLogMessage("Long click (".. mediaButtonDurationDown /1000 .."s) : Volume Down\n")
				if not debug then
					PlayMacro("Volume Down")
				end
			end
		end

		return
	
	-- Scroll Left and Copy
	--[[elseif arg == left then
		if event == "MOUSE_BUTTON_PRESSED" then
			leftButtonStartDown = GetRunningTime()
			leftButtonDurationDown = nil			
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			leftButtonDurationDown = GetRunningTime() - leftButtonStartDown 
	
			if leftButtonDurationDown < mediaButtonDelta then
				-- Next Track
				OutputLogMessage("Short click (".. leftButtonDurationDown /1000 .."s) : Copied \n")
				if not debug then
					PlayMacro("Copy")
				end
			else
				-- Volume Up
				OutputLogMessage("Long click (".. leftButtonDurationDown /1000 .."s) : Scroll Left\n")
				if not debug then
					PlayMacro("Scroll Left")
				end
			end
		end

		return]]--
			
	-- Play/Pause and Mute
	elseif arg == muteButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			mediaButtonStartMute = GetRunningTime()
			mediaButtonDurationMute = nil
			
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			mediaButtonDurationMute = GetRunningTime() - mediaButtonStartMute 
			
			if mediaButtonDurationMute >= spotifyDelta then
			       -- Open Spotify
			       OutputLogMessage("Too Long click (".. mediaButtonDurationMute /1000 .."s) : Opening Spotify\n")
			       if not debug then
			             PlayMacro("Open Spotify")
			       end
	
			elseif mediaButtonDurationMute < mediaButtonDelta then
				-- Next Track
				OutputLogMessage("Short click (".. mediaButtonDurationMute /1000 .."s) : Play-Pause\n")
				if not debug then
					PlayMacro("Play/Pause")
				end				
			else
				-- Volume Up
				OutputLogMessage("Long click (".. mediaButtonDurationMute /1000 .."s) : Volume Up\n")
				if not debug then
					PlayMacro("Mute")
				end
			end
		end

		return
		
	-- Open WebStorm
	elseif arg == midButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			midButtonStart = GetRunningTime()
			midButtonDuration = nil
			
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			midButtonDuration = GetRunningTime() - midButtonStart 
	
			if midButtonDuration >= mediaButtonDelta then				
				-- Open WebStorm
				OutputLogMessage("Long click (".. midButtonDuration /1000 .."s) : Opening WebStorm\n")
				if not debug then
					PlayMacro("Open WebStorm")
				end
			end
		end

		return	
		
	-- Open Chrome
	elseif arg == bckButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			bckButtonStart = GetRunningTime()
			bckButtonDuration = nil
			
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			bckButtonDuration = GetRunningTime() - bckButtonStart 
	
			if bckButtonDuration >= mediaButtonDelta then				
				-- Open Chrome
				OutputLogMessage("Long click (".. bckButtonDuration /1000 .."s) : Opening Chrome\n")
				if not debug then
					PlayMacro("Open Chrome")
				end
			end
		end

		return
	
	
	-- Foward and Take SS
	elseif arg == fwdButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			fwdButtonStart = GetRunningTime()
			fwdButtonDuration = nil
			
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			fwdButtonDuration = GetRunningTime() - fwdButtonStart 
	
			if fwdButtonDuration >= mediaButtonDelta then				
				-- Open WebStorm
				OutputLogMessage("Long click (".. fwdButtonDuration /1000 .."s) : Take Screenshot\n")
				if not debug then
					PlayMacro("Take SS")
				end
			end
		end

		return
		
	-- Shutdown and Open VS and Rider
	elseif arg == gButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			gButtonStart = GetRunningTime()
			gButtonDuration = nil
			
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			gButtonDuration = GetRunningTime() - gButtonStart
	
			if gButtonDuration >= gButtonDeltaShutdown then
				-- Shutdown
				OutputLogMessage("Too Long click (".. gButtonDuration /1000 .."s) : Shutting Down\n")
				if not debug then
					PlayMacro("Shutdown")
				end
			elseif gButtonDuration <= mediaButtonDelta then
				-- VS
				OutputLogMessage("Short click (".. gButtonDuration /1000 .."s) : Opening Visual Studio As Admin\n")
				if not debug then
					PlayMacro("Open Visual Studio Admin")
				end
			else
			       OutputLogMessage("Long click (".. gButtonDuration /1000 .."s) : Opening Rider\n")
				if not debug then
					PlayMacro("Open Rider")
				end
			end
		end

		return
	end


end