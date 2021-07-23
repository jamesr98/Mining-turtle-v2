local movement = require "movement"
local dropper = require "dropper"

function excavate(maxX, maxY)
    for x=1, maxX do
        movement.recursiveRight((x -1))

        for y=1, maxY do
            turtle.dig()
            movement.forward()

            local canMoveDown = true

            while canMoveDown do
                turtle.digDown()
                canMoveDown = movement.down()
            end
            movement.returnToSurface()
        end

        movement.reverse()
        dropper.dropOff()

    end

    print("Job completed.")
end



if dropper.isChestBelow() == false then
    print("Chest not present below.")
else
    excavate(1, 3)
end
