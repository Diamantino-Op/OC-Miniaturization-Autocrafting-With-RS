local robot = require("robot")
local component = require("component")
local sides = require("sides")
local invmgr = component.inventory_controller

local dropSlot = 9

local layout = {}

local dimensions = 0
local inventorySize = robot.inventorySize()

builder = {}

local function walk(steps)
    if steps > 0 then
        for _ = 1, steps do
            robot.forward()
        end
    elseif steps < 0 then
        for _ = steps, -1 do
            robot.back()
        end
    end
end

local boolToNum = {[true]=1, [false]=0}

local function getNrItems()
    local itemCounts = {}
    for z = 1, dimensions do
        for i = 1, #layout[z] do
            local itemNr = layout[z][i]
            if itemNr ~= 0 then
                local ic = itemCounts[itemNr]
                if ic ~= nil then
                    itemCounts[itemNr] = ic+1
                else
                    itemCounts[itemNr] = 1
                end
            end
        end
    end
    local ic = itemCounts[dropSlot]
    if ic ~= nil then
        itemCounts[dropSlot] = ic+1
    else
        itemCounts[dropSlot] = 1
    end
    return #itemCounts, itemCounts
end

local nrItems, itemCounts = getNrItems()

local function placeDown(slot)
    if slot == 0 then
        return true
    end
    robot.select(slot)
    return robot.placeDown()
end

local function buildOneLayer(layer, layerNr)
    for i = 1, #layer do
        if layerNr == 1 and i == math.ceil(#layer/2) then
            robot.select(inventorySize)
            robot.suckDown()
        end
        if not placeDown(layer[i]) then
            robot.select(layer[i]+nrItems)
            robot.transferTo(layer[i])
            placeDown(layer[i])
        end
        robot.forward()
        if i % dimensions == 0 and i ~= dimensions^2 then
            if i % (dimensions*2) == 0 then
                robot.turnLeft()
            else
                robot.turnRight()
            end
            robot.forward()
            if i % (dimensions*2) == 0 then
                robot.turnLeft()
            else
                robot.turnRight()
            end
            robot.forward()
        end
    end
end

local function buildLayers()
    for i = 1, dimensions do
        robot.turnAround()
        robot.up()
        robot.forward()
        buildOneLayer(layout[i], i)
    end
end

function builder.moveToStart()
	robot.turnAround()
	walk(8)
end

function builder.startBuilding(lyt)
	layout = lyt
	dimensions = #lyt
	
	robot.turnLeft()
	walk(3)
	robot.turnLeft()
	walk(6)
	robot.turnRight()
	walk(4)
	robot.turnLeft()
  buildLayers()
  robot.turnRight()
  walk(2)
  while not robot.detectDown() do robot.down() end
  robot.turnRight()
  robot.forward()
  robot.turnRight()
  robot.select(dropSlot)
  randomBeep()
  robot.drop(1)
	robot.back()
  robot.turnLeft()
  while not robot.detect() do robot.forward() end
end

function builder.getItems(reqItems)
	invSize = invmgr.getInventorySize(3)

	for n, m in pairs(reqItems) do
		requiredItem = ""
		requiredItemQnt = 0
		
		hasEnough = false

		for b, q in pairs(m) do
			if b == 1 then
				requiredItem = q
			elseif b == 2 then
				requiredItemQnt = q
			end
		end
		
		for i = 1, invSize, 1 do
			item = invmgr.getStackInSlot(3, i)
			
			itemInSlot = ""
			itemQntInSlot = 0
			
			toSuck = 0
			
			if item then
				for x, v in pairs(item) do
					if x == "name" then
						itemInSlot = v
					elseif x == "size" then
						itemQntInSlot = v
					end
				end
				
				if itemInSlot == requiredItem then
					if hasEnough == false then
						if itemQntInSlot >= requiredItemQnt then
							hasEnough = true
							toSuck = requiredItemQnt
						elseif itemQntInSlot < requiredItemQnt  then
							hasEnough = false
							requiredItemQnt = requiredItemQnt - itemQntInSlot
							toSuck = itemQntInSlot
						end
						
						if n == 1 then
							robot.select(9)
						else
							robot.select(n - 1)
						end
						
						invmgr.suckFromSlot(3, i, toSuck)
					else
						break
					end
				end
			end
		end
	end
end
