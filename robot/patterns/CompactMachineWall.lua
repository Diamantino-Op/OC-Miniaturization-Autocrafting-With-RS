local component = require("component")
local robot = require("robot")
local os = require("os")
local invmgr = component.inventory_controller

local reqItems = {{"minecraft:redstone", 1}, {"minecraft:iron_block", 1}, {"minecraft:redstone", 1}}

cmw = {}

local layout = {
  {0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 1, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0},
  
  {0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 2, 0, 0,
   0, 0, 0, 0, 0,
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
   0, 0, 0, 0, 0},
  
  {0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0}
}

function cmw.build()
  builder.moveToStart()
  
  builder.getItems(reqItems)
  
  builder.startBuilding(layout)
end
