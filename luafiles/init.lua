
gpio.mode(4,gpio.INPUT)
gpio.mode(1,gpio.OUTPUT)

repeat
  status, temp, humi, temp_dec, humi_dec = dht.read(2)

  print("temperature : "..temp.."."..temp_dec..",  humidity    : "..humi.."."..humi_dec)

  if temp >=29 then
   gpio.write(1,gpio.HIGH)
  else
   gpio.write(1,gpio.LOW)
  end  
   
  tmr.delay(1000000)
   
  s2Pin = gpio.read(4)
until s2Pin==0

