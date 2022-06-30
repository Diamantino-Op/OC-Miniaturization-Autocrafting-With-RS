require("patterns/CompactMachineWall")
require("patterns/EnderPearl")
require("patterns/NormalCompactMachine")

patterns = {}

function patterns.buildPattern(r)
  if r == "cmw" then
    cmw.build()
  elseif r == "ep" then
    ep.build()
  elseif r == "ncm" then
    ncm.build()
  end
end
