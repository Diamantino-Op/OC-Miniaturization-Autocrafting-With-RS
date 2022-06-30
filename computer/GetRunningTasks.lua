local component = require("component")
local rs = component.block_refinedstorage_interface

runningTasks = {}

isMaking = false

function runningTasks.getRunningTasks()
  tasks = {}
  
  for i, x in ipairs(rs.getTasks()) do
    task = {}
    qt = 0
    it = ""
    qEP = 0
    qCMW = 0
    
    ct = rs.getTasks()[i]
    
    for l, v in pairs(x) do
      if l == "quantity" then
        qt = v
        print(v)
      elseif l == "pattern" then
        for k, z in pairs(v) do
          if k == "inputs" then
            for t, y in pairs(z) do
              if t ~= "n" then
                for h, j in pairs(y) do
                  hasEp = false
                  hasCmw = false
                  
                  if h ~= "n" then
                    for qw, qe in pairs(j) do
                      if qw == "name" then
                        if qe == "minecraft:ender_pearl" then
                          hasEp = true
                        elseif qe == "compactmachines3:wallbreakable" then
                          hasCmw = true
                        else
                          hasEp = false
                          hasCmw = false
                        end
                      elseif qw == "size" then
                        print("Has EP: " .. tostring(hasEp) .. " HasCmw: " .. tostring(hasCmw))
                        
                        if hasEp == true then
                          qEP = qEP + qe
                          
                          hasEp = false
                        elseif hasCmw == true then
                          qCMW = qCMW + qe
                          
                          hasCmw = false
                        end
                      end
                    end
                  end
                end
              end
            end
          elseif k == "outputs" then
            for t, y in pairs(z) do
              if t == 1 then
                for s, a in pairs(y) do
                  if s == "label" then
                    it = a
                    print(it)
                  end
                end
              end
            end
          end
        end
      end
    end
  
    if qEP > 0 then
      tskEP = {}
      
      table.insert(tskEP, "Ender Pearl")
      table.insert(tskEP, tonumber(qEP) * 2)
      table.insert(tskEP, isMaking)
    end
  
    if qCMW > 0 then
      tskCMW = {}
      
      table.insert(tskCMW, "Compact Machine Wall")
      table.insert(tskCMW, tonumber(qCMW) * 2)
      table.insert(tskCMW, isMaking)
    end
  
    table.insert(task, it)
    table.insert(task, qt)
    table.insert(task, isMaking)
    
    table.insert(tasks, task)
  end
  
  return tasks
end
