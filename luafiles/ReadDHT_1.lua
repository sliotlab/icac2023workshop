--Load the dht sensor library from device storage
DHT= require("dht_lib")

--read sensor and get temp / humidity
  DHT.read(2)
  tmr.delay(500000)
  t = DHT.getTemperature()
  h = DHT.getHumidity()

--release memory used by library
DHT = nil

--print results of temp conversion
print("=====")
print("temperature : "..(t/10).."."..(t-10*(t/10)).."C")
print("Humidity    : "..(h/10).."."..(h-10*(h/10)).."%") 
print("=====")