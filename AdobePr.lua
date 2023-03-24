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


      -- MultiSelect and Next Track
	if arg == upButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			mediaButtonStartUp = GetRunningTime()
			mediaButtonDurationUp = nil
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			mediaButtonDurationUp = GetRunningTime() - mediaButtonStartUp 
	
			if mediaButtonDurationUp >= mediaButtonDelta then
				-- Next Track
				if not debug then
					PlayMacro("Next Track")
				end
			else
				-- MultiSelect
				if not debug then
					PlayMacro("MultiSelect")
				end
			end
		end

		return	
	
	-- Nest and Previous Track
	elseif arg == downButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			mediaButtonStartDown = GetRunningTime()
			mediaButtonDurationDown = nil
			
		elseif event == "MOUSE_BUTTON_RELEASED" then
			mediaButtonDurationDown  = GetRunningTime() - mediaButtonStartDown 
	
			if mediaButtonDurationDown >= mediaButtonDelta then
				-- Next Track
				if not debug then
					PlayMacro("Previous Track")
				end
			else
				-- Nest
				if not debug then
					PlayMacro("Nest")
				end
			end
		end

		return
			
	-- Unlink / Adjustment Layer
	elseif arg == muteButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			mediaButtonStartMute = GetRunningTime()
			mediaButtonDurationMute = nil
			
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			mediaButtonDurationMute = GetRunningTime() - mediaButtonStartMute 
			
			if mediaButtonDurationMute >= mediaButtonDelta then
				-- Add Adjustment Layer To Timline
				if not debug then
						PlayMacro("Adj Layer")
				end			
			else
				-- Unlink
				if not debug then
					PlayMacro("Unlink")
				end
			end
		end

		return
		
	-- Play/Pause
	elseif arg == midButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			midButtonStart = GetRunningTime()
			midButtonDuration = nil
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			midButtonDuration = GetRunningTime() - midButtonStart 
	
			if midButtonDuration >= mediaButtonDelta then				
				-- Play/Pause
				if not debug then
					PlayMacro("Play/Pause")
				end
			end
		end

		return	
		
	-- Mark Out And Tail(W)
	elseif arg == bckButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			bckButtonStart = GetRunningTime()
			bckButtonDuration = nil
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			bckButtonDuration = GetRunningTime() - bckButtonStart 
	
			if bckButtonDuration < mediaButtonDelta then				
				-- Mark Out
				if not debug then
					PlayMacro("MarkOut")
				end
			else
				-- W (Tail)
				if not debug then
					PlayMacro("W")
				end
			end
		end

		return
	
	
	-- Mark In And Top(Q)
	elseif arg == fwdButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			fwdButtonStart = GetRunningTime()
			fwdButtonDuration = nil
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			fwdButtonDuration = GetRunningTime() - fwdButtonStart 
	
			if fwdButtonDuration < mediaButtonDelta then				
				-- Mark In
				if not debug then
					PlayMacro("MarkIn")
				end
			else
				if not debug then
					PlayMacro("Q")
				end
			end
		end

		return
		
	-- Split
	elseif arg == gButton then
		if event == "MOUSE_BUTTON_PRESSED" then
			gButtonStart = GetRunningTime()
			gButtonDuration = nil			
	
		elseif event == "MOUSE_BUTTON_RELEASED" then
			gButtonDuration = GetRunningTime() - gButtonStart
	
			if mediaButtonDelta < gButtonDeltaShutdown then
				-- Split
				if not debug then
					PlayMacro("Split")
				end
			else
				if not debug then
					PlayMacro("Trim All")
				end
			end
		end

		return
	end


end