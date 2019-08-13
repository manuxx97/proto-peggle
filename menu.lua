-- menu.lua


local scene = composer.newScene() 

---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here

local bt1
---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.

   -- Qui puoi creare il tuo pulsante
    background = display.newImage("background.png",_W/2,_H/2)
    background.width = _W background.height = _H

-- egg è già stata dichiarata come forward reference in testa al sorgente
  bt1 = widget.newButton({x=_W/2,y=_H/2,width = 180,height = 50,defaultFile = "play1.png",
     overFile = "play2.png", id = "1" , onRelease = function() composer.gotoScene("peggle") end})

-- Inserisci lo sfondo in sceneGroup
  sceneGroup:insert(background)

  -- Inserisci il pulsante in sceneGroup (che si riferisce a scene.view)
  sceneGroup:insert(bt1)

end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then

      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
      
   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view

   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
   
   -- qui elimino il displayObject
   
   -- qui dichiaro nil la sua reference, per non lasciarne strascichi nella memoria
  
end

--------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

--------------------------------------------------------------------------------

return scene