-- set White LED (pin 5) to output 
gpio.mode(5,gpio.OUTPUT)


-- declare the event handler function
function toggleLED ()
 print("start toggleLED")
 WLedState = not WLedState
 if WLedState then
    gpio.write(5,gpio.HIGH)
   else 
    gpio.write(5,gpio.LOW)
  end
 print("end toggleLED")
end

--global variable to keep LED state 
WLedState = false

--create and attache a periodic timer to blink 
--every 1 second
tmr.alarm(1,1000,1,toggleLED)
