local arguments = require "arguments"
local args = {...}


local x,y = arguments.getXY(args)

if (x == nil or y == nil) then
    print("Invalid args.")
end
