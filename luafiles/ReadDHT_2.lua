--Load the dht sensor library from device storage
DHT= require("dht_lib")

function showDHT ()
--read sensor and get temp / humidity
  DHT.read(2)
  tmr.delay(500000)
  t = DHT.getTemperature()
  h = DHT.getHumidity()
  --print results of temp conversion
  if (t ~= nil) and (h~=nil) then
    print("temperature : "..(t/10).."."..(t-10*(t/10)).."C")
    print("Humidity    : "..(h/10).."."..(h-10*(h/10)).."%")
   else
    print("waiting for sensor readings .....")
  end   
end

--setup timer to print every 3 seconds
tmr.alarm(1,3000,1,showDHT)
