local component = require("component")
local robot = require("robot")
local os = require("os")
local invmgr = component.inventory_controller

local reqItems = {{"minecraft:redstone", 1}, {"minecraft:obsidian", 26}, {"minecraft:redstone_block", 1}}

ep = {}

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

function ep.build()
  builder.moveToStart()
  
  builder.getItems(reqItems)
  
  builder.startBuilding(layout)
end
