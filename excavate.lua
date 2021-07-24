local movement = require "movement"
local dropper = require "dropper"
local arguments = require "arguments"

local args = {...}

function excavate(maxX, maxY)
    for x=1, maxX do
        movement.recursiveRight((x -1))


        for y=1, maxY do
            turtle.dig()
            movement.forward()

            movement.digToBottom()
            movement.returnToSurface()
        end

        movement.reverse()
        dropper.dropOff()

    end

    print("Job completed.")
end



if dropper.isChestBelow() == false then
    print("Chest not present below.")
    return
end

local x, y = arguments.getXY(args)

if (x == nil or y == nil) then
    print("Invalid XY coordinates. Terminating.")
    return
end

excavate(x, y)
