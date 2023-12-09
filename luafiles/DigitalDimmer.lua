-- set pin modes as follows
--- White LED (pin 5) to output
--- S2 (pin 3) to input
--  S3 (pin 4) to input
gpio.mode(5,gpio.OUTPUT)
gpio.mode(3,gpio.INPUT)
gpio.mode(4,gpio.INPUT)

--variable to hold current duty cycle
dutyCycle = 0

--setup the pwm output on pin 5 @ 10 duty cycle
pwm.setup(5,1000,0)
pwm.start(5)

--endless loop to read and set duty cycle 
--based on S2 (up) S3 (down)

repeat
 S2pin = gpio.read(3)
 S3pin = gpio.read(4)

 if (S2pin==0) and (dutyCycle > 0) then
     dutyCycle = dutyCycle - 1
 end

 if (S3pin==0) and (dutyCycle <1000) then
    dutyCycle = dutyCycle + 1
 end  
 pwm.setduty(5,dutyCycle)

 tmr.wdclr()
 tmr.delay(5000)
--exit if both S2 and S3 are pressed
until  (S2pin == 0) and (S3pin ==0)
--shutdown pwm output
pwm.stop(5)

