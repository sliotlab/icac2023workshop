-- set White LED (pin 5) to output 
-- set S3 (pin 4) to input
gpio.mode(5,gpio.OUTPUT)
gpio.mode(4,gpio.INPUT)

repeat
  s3Pin = gpio.read(4)

-- set pin 5 to HIGH if s3 is pressed 
-- or to LOW otherwise  
  if s3Pin==0 then
    gpio.write(5,gpio.HIGH)
   else
    gpio.write(5,gpio.LOW)
  end

  tmr.wdclr()
  s2Pin = gpio.read(3)
until (s2Pin==0) and (s3Pin==0) 
