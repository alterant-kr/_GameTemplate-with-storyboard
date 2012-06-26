-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- include Corona's "widget" library
--local widget = require "widget"

local radlib = require "radlib"
local ui = require("ui")
-------------------------------------------


-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- display a background image
	local background = display.newImageRect( "res/bk_default.png", display.contentWidth, display.contentHeight )
	background:setReferencePoint( display.TopLeftReferencePoint )
	background.x, background.y = 0, 0
	
	
	-- Menu Buttons - Start	
	local playButton = nil
	local function onPlayPressed ( event )
		if event.phase == "ended" and playButton.isActive then
		  storyboard.gotoScene( "play", "fade", 500 )
		end
	end
	playButton = ui.newButton(
		radlib.table.merge(
		  _G.buttons['play'],
		  { onRelease = onPlayPressed }
		)
	)
	playButton.x = 160
	playButton.y = 80
	playButton.isActive = true
	
	local settingsButton = nil
	local function onSettingsPressed ( event )
		if event.phase == "ended" and settingsButton.isActive then
		  --director:changeScene("settings", "fade", "green")
		  storyboard.gotoScene( "settings", "fade", 500 )
		end
	end
	settingsButton = ui.newButton(
		radlib.table.merge(
		  _G.buttons['settings'],
		  { onRelease = onSettingsPressed }
		)
	)
	settingsButton.x = 160
	settingsButton.y = 130
	settingsButton.isActive = true
	
	local helpButton = nil
	local function onHelpPressed ( event )
		if event.phase == "ended" and helpButton.isActive then
		  --director:changeScene("help", "overFromTop")
		  storyboard.gotoScene( "help", "fromTop", 500 )
		end
	end
	helpButton = ui.newButton(
		radlib.table.merge(
		  _G.buttons['help'],
		  { onRelease = onHelpPressed }
		)
	)
	helpButton.x = 160
	helpButton.y = 180
	helpButton.isActive = true
	
	local aboutButton = nil
	local function onAboutPressed ( event )
		if event.phase == "ended" and aboutButton.isActive then
		  --director:changeScene("about", "moveFromLeft")
		  storyboard.gotoScene( "about", "fromLeft", 500 )
		end
	end
	aboutButton = ui.newButton(
		radlib.table.merge(
		  _G.buttons['about'],
		  { onRelease = onAboutPressed }
		)
	)
	aboutButton.x = 160
	aboutButton.y = 230
	aboutButton.isActive = true
	-- Menu Buttons - End
		
		
	-- all display objects must be inserted into group
	group:insert( background )
	group:insert( playButton )
	group:insert( settingsButton )
	group:insert( helpButton )
	group:insert( aboutButton )
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene