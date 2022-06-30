local component = require("component")
local m = component.modem
require("GetRunningTasks")

m.open(1)

m.broadcast(1, "Start Builder Bot")

os.sleep(6)

isMaking = false

function sendBuildRequest(item, qnt)
  if item == "Compact Machine Wall" then
    for i = 1, math.floor((qnt / 16) + 0.4), 1 do
      isMaking = true
      m.broadcast(1, "cmw")
      os.sleep(64)
    end
    
    isMaking = false
  elseif item == "Ender Pearl" then
    for i = 1, qnt, 1 do
      isMaking = true
      m.broadcast(1, "ep")
      os.sleep(75)
    end
    
    isMaking = false
  elseif item == "Normal Compact Machine" then
    for i = 1, qnt, 1 do
      isMaking = true
      m.broadcast(1, "ncm")
      os.sleep(93)
    end
    
    isMaking = false
  end
end

while true do
  if isMaking == false then
    tasks = runningTasks.getRunningTasks()
    
    for k, v in pairs(tasks) do
      qnt = 0
      itm = ""
      canMake = true
      
      for x, c in pairs(v) do
        if x == 3 then
          if c == false then
            canMake = true
            v[x] = true
          else
            canMake = false
          end
        elseif x == 2 and canMake == true then
          qnt = tonumber(c)
          print(c)
        elseif x == 1 then
          itm = c
          print(c)
        end
      end
      
      if canMake == true then
        sendBuildRequest(itm, tonumber(qnt))
      end
    end
  end
  
  os.sleep(5)
end
