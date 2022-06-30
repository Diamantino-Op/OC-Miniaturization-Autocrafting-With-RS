local component = require("component")
local event = require("event")
local m = component.modem

require("patterns/Patterns")

while true do
  local _, _, _, _, _, message = event.pull("modem_message")
  patterns.buildPattern(tostring(message))
end
