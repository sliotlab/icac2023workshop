-- set White LED (pin 5) to output 
-- set S2 to input event mode
gpio.mode(5,gpio.OUTPUT)
gpio.mode(4,gpio.INT)

-- declare the event handler function
function toggleLED ()
 WLedState = not WLedState
 if WLedState then
    gpio.write(5,gpio.HIGH)
   else 
    gpio.write(5,gpio.LOW)
  end
-- make a short beep  
  gpio.write(1,gpio.HIGH)
  tmr.delay(100000)
  gpio.write(1,gpio.LOW)
end

--global variable to keep LED state 
WLedState = false

-- attach event handler to input pin 
gpio.trig(4,"up",toggleLED)
