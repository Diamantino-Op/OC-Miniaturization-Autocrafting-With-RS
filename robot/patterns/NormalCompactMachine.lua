local component = require("component")
local robot = require("robot")
local os = require("os")
local invmgr = component.inventory_controller

local reqItems = {{"minecraft:ender_pearl", 1}, {"compactmachines3:wallbreakable", 26}, {"minecraft:gold_block", 1}}

ncm = {}

local layout = {
  {0, 0, 0, 0, 0,
   0, 1, 1, 1, 0,
   0, 1, 1, 1, 0,
   0, 1, 1, 1, 0,
   0, 0, 0, 0, 0},
  
  {0, 0, 0, 0, 0,
   0, 1, 1, 1, 0,
   0, 1, 2, 1, 0,
   0, 1, 1, 1, 0,
   0, 0, 0, 0, 0},
  
  {0, 0, 0, 0, 0,
   0, 1, 1, 1, 0,
   0, 1, 1, 1, 0,
   0, 1, 1, 1, 0,
   0, 0, 0, 0, 0},
  
  {0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0},
  
  {0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0}
}

function ncm.build()
  builder.moveToStart()
  
  builder.getItems(reqItems)
  
  builder.startBuilding(layout)
end
