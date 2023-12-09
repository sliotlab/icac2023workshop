--set WHITE LED pin to output mode
gpio.mode(5,gpio.OUTPUT)

-- repeat blinking the LED forever
repeat
 gpio.write(5,gpio.HIGH)
 tmr.delay(100000)
 gpio.write(5,gpio.LOW)
 tmr.delay(100000)
 tmr.wdclr()
until false