-- define the user function.  Take time value (in milli sec)
-- and sound teh buzzer for that time

function soundBuzzer (timeInMS) 
      gpio.write(1,gpio.HIGH)
      tmr.delay(timeInMS * 1000) -- delay need time in uS
      gpio.write(1,gpio.LOW)
end 

-- main programme. call the functon as required
gpio.mode(1,gpio.OUTPUT)

print("A short Beep")
soundBuzzer(1000)
tmr.delay(2000000)
print("A longer Beep")
soundBuzzer(2000)
