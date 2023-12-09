-- set pin modes to output
gpio.mode(8,gpio.OUTPUT)   -- RGB LED Red pin
gpio.mode(7,gpio.OUTPUT)   -- RGB LED green pin
gpio.mode(6,gpio.OUTPUT)   -- RGB LED blue pin
gpio.mode(1,gpio.OUTPUT)   -- Buzzer

-- turn on / off each colour at a time
gpio.write(8,gpio.HIGH)
tmr.delay(1000000)
gpio.write(8,gpio.LOW)

gpio.write(7,gpio.HIGH)
tmr.delay(1000000)
gpio.write(7,gpio.LOW)

gpio.write(6,gpio.HIGH)
tmr.delay(1000000)
gpio.write(6,gpio.LOW)

-- sound the buzzer one time
gpio.write(1,gpio.HIGH)
tmr.delay(1000000)
gpio.write(1,gpio.LOW)
