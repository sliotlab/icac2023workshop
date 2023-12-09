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
    print("-------------New request ------------")
    print(payload)
end
   

function ListEvent(conn) 
    conn:on("receive",procRequest)
    dht.read(2)
    temp = dht.getTemperature()
    hum = dht.getHumidity()
    if (temp ~=nil) then
      tempDisp = (temp / 10).."."..(temp - 10*(temp/10)).." C"
     else
      tempDisp = "Waiting"
     end 
    
    if (hum ~=nil) then
      humDisp = (hum / 10).."."..(hum - 10*(hum/10)).." %"
     else
      humDisp = "Waiting"
    end  

 -- send response
    conn:send(HTMLTop)
    conn:send("<td>")
    conn:send(tempDisp)
    conn:send("</td> <td>")
    conn:send(humDisp)
    conn:send("</td>")
    conn:send(HTMLMid1)
    conn:send(HTMLBottom)
end

function timerEvent()
 if wifi.sta.getip() ~= nil then
  print("NodeMcu's IP Address:"..wifi.sta.getip())
  tmr.stop(1)
  srv=net.createServer(net.TCP) 
  srv:listen(80,ListEvent) 
 else
  print("Waiting for access point connection")
 end
end


wifi.sta.config("YOUR_SSID","YOUR_SSID_PASSWORD")
wifi.sta.connect()
--dht = require("dht_lib")


tmr.alarm(1,1000,1,timerEvent)
