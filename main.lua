-----------------------------------------------------------------------------------------
--
-- main.lua
-----------------------------------------------------------------------------------------
local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 25 ) 
physics.setDrawMode( "normal" )

local ivisibleWall = display.newRect( 0, display.contentHeight / 2, 1, display.contentHeight )

ivisibleWall.alpha = 0.0
physics.addBody( ivisibleWall, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local land = display.newImage( "./assets/sprites/land.png" )
land.x = 520
land.y = display.contentHeight
land.id = "the ground 1"
physics.addBody( land, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local land2 = display.newImage( "./assets/sprites/land.png" )
land2.x = 1520
land2.y = display.contentHeight
land2.id = "the ground 2"
physics.addBody( land2, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local landSquare = display.newImage( "./assets/sprites/landSquare.png" )
landSquare.x = 1520
landSquare.y = display.contentHeight - 1000
landSquare.id = "land Square"
physics.addBody( landSquare, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local deidara = display.newImage( "./assets/sprites/Deidara.png" )
deidara.x = display.contentCenterX - 200
deidara.y = display.contentCenterY
deidara.id = "deidara"
physics.addBody( deidara, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )
deidara.isFixedRotation = true

local dPad = display.newImage( "./assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 140
dPad.id = "d-pad"

local upArrow = display.newImage( "./assets/sprites/upArrow.png" )
upArrow.x = 150
upArrow.y = display.contentHeight - 250
upArrow.id = "up arrow"

local downArrow = display.newImage( "./assets/sprites/downArrow.png" )
downArrow.x = 150
downArrow.y = display.contentHeight - 30
downArrow.id = "down arrow"

local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 142
rightArrow.id = "right arrow"

local leftArrow = display.newImage( "./assets/sprites/leftArrow.png" )
leftArrow.x = 43
leftArrow.y = display.contentHeight - 142
leftArrow.id = "left arrow"

local jumpButton = display.newImage( "./assets/sprites/jumpButton.png" )
jumpButton.x = display.contentWidth - 80
jumpButton.y = display.contentHeight - 80
jumpButton.id = "jump button"
jumpButton.alpha = 0.5
 
local function deidaraCollision( self, event )
 
    if ( event.phase == "began" ) then
        print( self.id .. ": collision began with " .. event.other.id )
 
    elseif ( event.phase == "ended" ) then
        print( self.id .. ": collision ended with " .. event.other.id )
    end
end

function upArrow:touch( event )
    if ( event.phase == "ended" ) then

        transition.moveBy( deidara, { 
        	x = 0, 
        	y = -50,
        	time = 100 
        	} )
    end

    return true
end

function downArrow:touch( event )
    if ( event.phase == "ended" ) then
        
        transition.moveBy( deidara, { 
        	x = 0, 
        	y = 50, 
        	time = 100 
        	} )
    end

    return true
end

function leftArrow:touch( event )
    if ( event.phase == "ended" ) then
        
        transition.moveBy( deidara, { 
        	x = -50,
        	y = 0, 
        	time = 100 
        	} )
    end

    return true
end

function rightArrow:touch( event )
    if ( event.phase == "ended" ) then
        
        transition.moveBy( deidara, { 
        	x = 50, 
        	y = 0, 
        	time = 100
        	} )
    end

    return true
end

function jumpButton:touch( event )
    if ( event.phase == "ended" ) then
        
        deidara:setLinearVelocity( 0, -750 )
    end

    return true
end


function checkdeidaraPosition( event )
    
    if deidara.y > display.contentHeight + 500 then
        deidara.x = display.contentCenterX - 200
        deidara.y = display.contentCenterY
    end
end


upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
leftArrow:addEventListener( "touch", leftArrow )
rightArrow:addEventListener( "touch", rightArrow )
jumpButton:addEventListener( "touch", jumpButton )
Runtime:addEventListener( "enterFrame", checkdeidaraPosition )

deidara.collision = deidaraCollision
deidara:addEventListener( "collision" )
