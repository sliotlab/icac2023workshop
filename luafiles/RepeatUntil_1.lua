-- set S2 pin to input mode
gpio.mode(3,gpio.INPUT)
gpio.mode(5,gpio.OUTPUT)

--repeat reading and printing forever!!!
repeat
 gpio.write(5,gpio.HIGH)
 tmr.delay(100000)
 gpio.write(5,gpio.LOW)
 tmr.delay(100000)
until false
