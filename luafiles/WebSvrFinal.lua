HTMLTop=[[<html><head><meta http-equiv="refresh" content="10">
<style type="text/css">
#customers {font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
  width:100%;   border-collapse:collapse;   }
#customers td, #customers th  { font-size:1em;  border:1px solid #98bf21;
  padding:3px 7px 2px 7px; }
#customers th  {  font-size:1.1em;   text-align:left;   padding-top:5px;
  padding-bottom:4px;   background-color:#A7C942;   color:#ffffff;   }
#customers tr.alt td   {   color:#000000;   background-color:#EAF2D3;   }
.auto-style1 { text-align: center; }
.auto-style2 { color: #000080; }
.auto-style3 { background-color: #15E11D; }
.auto-style4 { background-color: #F59040; }
</style> </head>
<body> <div class="auto-style1"> <span class="auto-style2"><strong>Remote
    Temperature and Humudity</strong></span> </div>
<table id="customers"> <tr> <th>Input Source</th> <th>Temperature</th> <th>Humidity</th> </tr>
<tr> <td>Sensor readings</td> ]]

--

HTMLMid1 = [[</tr> </table> ]]
HTMLMid2 = [[<p>Remote&nbsp; control </p> <form method="get">
    <input name="SwitchON" type="submit" value="Switch ON" class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="SwitchOFF" type="submit" value="Switch OFF" class="auto-style4"></form> ]]

HTMLBottom = [[</body></html>]]


function procRequest(conn,payload) 
    gpio.write(7,gpio.HIGH)
    print(payload)
--  switch on LED if "ON" button is clicked
    i,j = string.find(payload,"SwitchON")
    if (i~=nil) then
     if (i < 50) then
      gpio.write(5,gpio.HIGH)
      gpio.write(0,gpio.HIGH)
     end
    end
--  switch off LED if "OFF" button is clicked
    i,j = string.find(payload,"SwitchOFF")
    if (i~=nil) then
     if (i < 50) then
      gpio.write(5,gpio.LOW)
      gpio.write(0,gpio.LOW)
     end
    end    
    gpio.write(7,gpio.LOW)
end
   

function ServerEvent (conn) 
    conn:on("receive",procRequest)

    dht.read(2)
    temp = dht.getTemperature()
    hum = dht.getHumidity()
    if (temp ~=nil) then
      tempDisp = (temp / 10).."."..(temp - 10*(temp/10)).." C"
     else
      tempDisp = "Waiting"
     end 
    print("Temperature : "..tempDisp)
    
    if (hum ~=nil) then
      humDisp = (hum / 10).."."..(hum - 10*(hum/10)).." %"
     else
      humDisp = "Waiting"
    end  
    print("Humidity : "..humDisp)

    print(node.heap())

    
 -- send response
    conn:send(HTMLTop)
    conn:send("<td>")
    conn:send(tempDisp)
    conn:send("</td> <td>")
    conn:send(humDisp)
    conn:send("</td>")
    conn:send(HTMLMid1)
    conn:send(HTMLMid2)
    conn:send(HTMLBottom)
    
end

function timerEvent()
 if wifi.sta.getip() ~= nil then
  print("NodeMcu's IP Address:"..wifi.sta.getip())
  tmr.stop(1) -- stop timer for creating server again
  gpio.write(1,gpio.HIGH)
  tmr.delay(500000)
  gpio.write(1,gpio.LOW)
  gpio.write(8,gpio.LOW) -- indicate wifi connectivity
  srv=net.createServer(net.TCP) 
  srv:listen(80,ServerEvent) 
 else
  print("Cound not connect to access point")
 end
end

gpio.mode(5,gpio.OUTPUT)
gpio.mode(0,gpio.OUTPUT)
gpio.mode(8,gpio.OUTPUT)
gpio.mode(7,gpio.OUTPUT)
gpio.mode(1,gpio.OUTPUT)

--- start initialization
gpio.write(8,gpio.HIGH)
tmr.delay(1000000)
wifi.setmode(wifi.STATION)
wifi.sta.config("YOUR_SSID","YOUR_SSID_PASSWORD")
wifi.sta.connect()
dht = require("dht_lib")

tmr.alarm(1,10000,1,timerEvent)
