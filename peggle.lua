
--PEGGLE




local scene = composer.newScene()
local physics = require "physics"
local widget = require "widget"
counter = 0

_W = display.contentWidth
_H = display.contentHeight
-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.

   -- Qui puoi creare il tuo pulsante

-- egg è già stata dichiarata come forward reference in testa al sorgente


-- Inserisci lo sfondo in sceneGroup
 

  -- Inserisci il pulsante in sceneGroup (che si riferisce a scene.view)


end

-- "scene:show()"
function scene:show( event )
physics.start( )
   local sceneGroup = self.view
   local phase = event.phase
 local wallsx = display.newRect( 0, _H/2, 0 ,_H )
 wallsx:setFillColor( 0.5,0.5,0.5 )
 local walldx = display.newRect( _W, _H, _W ,0 )
 walldx:setFillColor( 0.5,0.5,0.5 )
 local wallbm = display.newRect( _W/2, _H, _W, 0 )
 wallbm:setFillColor( 0.5,0.5,0.5 )
 physics.addBody( wallsx,"kinematic")
 physics.addBody( walldx,"kinematic")
 physics.addBody( wallbm,"kinematic")
 --physics.setDrawMode( "debug" )
   if ( phase == "will" ) then
    bg = display.newImage("background2.png",_W/2,_H/2)
   bg.width=_W bg.height=_H
   bt2 = widget.newButton({x= 90, y = 25 ,width = 180, height = 50, defaultFile = "back1.png",
    overFile = "back2.png", id = "2" , onRelease = function() physics.stop( ) composer.gotoScene("menu") end})  
    cerchietti = {}          -- create the matrix
    for i=1,10 do cerchietti[i] = {}     -- create a new row
    	for j=1,10 do cerchietti[i][j] = 0 end end
    i=1 j=1 for i = 1, 10 do for j = 1, 10 do
   	cerchietti[i][j] = display.newCircle( _W/2 -400 + i*60 , _H/2 - 200 + j*40 , 10 )
   
   end end
      
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
   	--composer.removeScene("menu")
    -- Called when the scene is now on screen.
      -- Insert code heto make th alive.
      -- Example: start timers, begin animation, play audio, etc.
end sceneGroup:insert(bg)
      sceneGroup:insert(bt2)

      --collisione pallina->cerchietto
      function collisione(event)
      	event.target:removeSelf( ) 
      	counter = counter + 1
      end 
 mx,my = 0,0 -- = event.x,event.y
 angle = 0-- = math.atan2(my - (cerchiof.y + 16), mx - (cerchiof.x +16))
 vx,vy = 0,0-- = math.cos(angle), math.sin(angle)
    function predict(event)

cerchiof = display.newCircle(_W/2,30, 10)
  	physics.addBody(cerchiof,{radius=10,bounce=0.5})
  	mx,my = event.x,event.y
  	sceneGroup:insert(cerchiof)
angle = math.atan2(my - (cerchiof.y + 16), mx - (cerchiof.x +16))
vx,vy = math.cos(angle), math.sin(angle)

  	 cerchiof:applyForce(vx*2,vy*2,cerchiof.x,cerchiof.y)
    print( "fase evento " .. event.phase )

    end
function shoot(event)
-- local mx,my -- = event.x,event.y
-- local angle -- = math.atan2(my - (cerchiof.y + 16), mx - (cerchiof.x +16))
-- local vx,vy -- = math.cos(angle), math.sin(angle)
if event.phase == "moved" then
	predict(event)
	bg:removeEventListener("touch", shoot)
end
if event.phase == "ended" then
    cerchio = display.newCircle(_W/2,30, 10)
    physics.addBody(cerchio,{radius=10,bounce=0.5})
    sceneGroup:insert(cerchio)
   -- cerchio:addEventListener( "collision", collisione )
   -- transition.to(cerchio, { time=500,  x=event.x, y=event.y } )
  mx,my = event.x,event.y
  angle = math.atan2(my - (cerchio.y + 16), mx - (cerchio.x +16))
  vx,vy = math.cos(angle), math.sin(angle)
 cerchio:applyForce(vx*2,vy*2,cerchio.x,cerchio.y)
    print( event.phase )
    bg:removeEventListener( "touch", shoot ) 
end end
  
  bg:addEventListener("touch",shoot)

      i=1 j=1
       for i=1,10 do
      for j=1,10 do
      	physics.addBody( cerchietti[i][j], "static", {radius=10} )
        sceneGroup:insert(cerchietti[i][j])
       cerchietti[i][j]:addEventListener( "collision", collisione )
        end
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
   --display.remove(bt1)
   -- qui dichiaro nil la sua reference, per non lasciarne strascichi nella memoria
   --bt1 = nil
end

--------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

--------------------------------------------------------------------------------

return scene