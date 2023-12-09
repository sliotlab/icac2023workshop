--set WHITE LED pin to output mode and
--set S2 pin to input mode
gpio.mode(5,gpio.OUTPUT)
gpio.mode(3,gpio.INPUT)


-- repeat blinking the LED until S2 reads 0
repeat
 gpio.write(5,gpio.HIGH)
 tmr.delay(100000)
 gpio.write(5,gpio.LOW)
 tmr.delay(100000)
 tmr.wdclr()

 pinState = gpio.read(3)
until pinState==0