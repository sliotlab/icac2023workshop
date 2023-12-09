-- set White LED (pin 5) to output 
-- set S3 (pin 4) & S2 (pin 3) to input
gpio.mode(5,gpio.OUTPUT)
gpio.mode(4,gpio.INPUT)
gpio.mode(3,gpio.INPUT)

--global variable to keep LED state 
WLedState = false

repeat
  s3Pin = gpio.read(4)
  s2Pin = gpio.read(3)

-- change teh state each time teh switch is pressed  
  if s3Pin==0 then
    WLedState = not WLedState
  end
-- drive LED baased on state variable
  if WLedState then
    gpio.write(5,gpio.HIGH)
   else 
    gpio.write(5,gpio.LOW)
  end

--a small delay to ensure that switch is read only once
--during teh bouncing period
  tmr.delay(500000)
  
  tmr.wdclr()
until (s2Pin==0) and (s3Pin==0) 