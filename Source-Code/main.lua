local widget = require( "widget" )

local runMode = true	-- for Pause/Resume button state
local started = true
local button1,button2,secondHand,angle
angle = 6

local back = display.newImage("carbonfiber.jpg")
back.x = display.contentCenterX
back.y = display.contentCenterY
back.xScale=2.5
back.yScale=3

local clock = display.newImage( "clock14.png" )
clock.x = display.contentCenterX
clock.y = display.contentCenterY
clock.xScale=2
clock.yScale=2

secondHand = display.newImageRect("clock-hands-hi.png", 412, 64)

secondHand.anchorX = 0.2257
secondHand.anchorY = 0.5

secondHand.x = display.contentCenterX 
secondHand.y = display.contentCenterY
secondHand.rotation = -90

timer.performWithDelay(1000, function() secondHand.rotation = secondHand.rotation + angle; end, 0)


local buttonHandler1 = function( event )

	if runMode then
		angle = 0
		button1:setLabel( "RESUME" )
		runMode = false
				
	else
		button1:setLabel( "PAUSE" )
		runMode = true
		angle = 6
		
	end
	
	if started == false then
		button1:setLabel( "PAUSE" )
		runMode = true
		angle = 6
		started = true
	end
end

-- Cancel timer
local buttonHandler2 = function( event )

	secondHand:removeSelf()
	secondHand = display.newImageRect("clock-hands-hi.png", 412, 64)

    secondHand.anchorX = 0.2257
    secondHand.anchorY = 0.5

    secondHand.x = display.contentCenterX 
    secondHand.y = display.contentCenterY
    secondHand.rotation = -90
    angle = 0

    button1:setLabel( "START" )
	started = false
		
end



button1 = widget.newButton
{
    id = "button1",
	defaultFile = "buttonRed.png",
	overFile = "buttonRed.png",
	label = "PAUSE",
	font = "Arial Black",
	labelColor = { default={ 1, 1, 1, 1}, over={ 1, 1, 1, 1} },
	fontSize = 30,
	emboss = true,
	onRelease = buttonHandler1,
}
button1.x=200
button1.y=1150
button1.yScale=2


button2 = widget.newButton
{
    id = "button2",
	defaultFile = "buttonBlue.png",
	overFile = "buttonBlue.png",
	label = "CANCEL",
	font = "Arial Black",
	labelColor = { default={ 1, 1, 1, 1}, over={ 1, 1, 1, 1} },
	fontSize = 30,
	emboss = true,
	onRelease = buttonHandler2,
}
button2.x=600
button2.y=1150
button2.yScale=2




