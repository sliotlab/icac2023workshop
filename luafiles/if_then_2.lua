-- set Red LED (pin 8) & Green LED (pin 7) to output 
-- set S3 (pin 4) & S2 (pin 3) to input
gpio.mode(8,gpio.OUTPUT)
gpio.mode(7,gpio.OUTPUT)
gpio.mode(4,gpio.INPUT)
gpio.mode(3,gpio.INPUT)

repeat
  s3Pin = gpio.read(4)
  s2Pin = gpio.read(3)

-- set pin 8 to HIGH if s3 is pressed 
-- or to LOW otherwise  
  if s3Pin==0 then
    gpio.write(8,gpio.HIGH)
   else
    gpio.write(8,gpio.LOW)
  end

-- set pin 7 to HIGH if s3 is pressed 
-- or to LOW otherwise  
  if s2Pin==0 then
    gpio.write(7,gpio.HIGH)
   else
    gpio.write(7,gpio.LOW)
  end

  tmr.wdclr()
until (s2Pin==0) and (s3Pin==0) 