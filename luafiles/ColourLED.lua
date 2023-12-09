-- set RGB LED (pin 6-8) to output 
gpio.mode(6,gpio.OUTPUT)
gpio.mode(7,gpio.OUTPUT)
gpio.mode(8,gpio.OUTPUT)


-- declare the event handler functions
function toggleRED ()
 REDState = not REDState
 if REDState then
    gpio.write(8,gpio.HIGH)
   else 
    gpio.write(8,gpio.LOW)
  end
end

function toggleGREEN ()
 GREENState = not GREENState
 if GREENState then
    gpio.write(7,gpio.HIGH)
   else 
    gpio.write(7,gpio.LOW)
  end
end

function toggleBLUE ()
 BLUEState = not BLUEState
 if BLUEState then
    gpio.write(6,gpio.HIGH)
   else 
    gpio.write(6,gpio.LOW)
  end
end

--global variable to keep LED state 
REDState = false
GREENState = false
BLUEState = false

--create and attache a periodic timer to blink 
--every 1 second
tmr.alarm(1,1000,1,toggleRED)
tmr.alarm(2,2000,1,toggleGREEN)
tmr.alarm(4,4000,1,toggleBLUE)
