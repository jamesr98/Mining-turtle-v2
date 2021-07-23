local movement = {}

local x = 0
local y = 0
local z = 0


function movement.forward()
    if turtle.forward() then
        z = z + 1
    end
end

function movement.back()
    if turtle.back() then
        z = z - 1
    end
end

function movement.up()
    if turtle.up() then
        y = y + 1
    end
end

function movement.down()
    local result = turtle.down()

    if result then
        y = y - 1
    end
    return result
end

function movement.left()
    turtle.turnLeft()
    local result = turtle.forward()
    turtle.turnRight()

    if result then
        x = x - 1
    end
end

function movement.right(dig)
    turtle.turnRight()
    if dig then
        turtle.dig()
    end
    local result = turtle.forward()

    turtle.turnLeft()

    if result then
        x = x + 1
    end
end

function movement.recursiveRight(count)
    for i = 1, count do
        movement.right(true)
    end 
end

function movement.recursiveForward(count)
    local retries = 0;
    while (z < 0 and retries ~= 25) do
        retries = retries + 1

        if (retries == 25) then
            movement.reverse()
            print("Failed to go forward. Terminated action")
        end

        turtle.dig()
        movement.forward()


    end
end

function movement.returnToSurface()
    for i = y, -1 do
        movement.up()
    end
end

function movement.reverse()
    if (y < 0) then
        --undo down actions
        for i = y, 0 do
            movement.up()
        end
    end

    if (z > 0) then
        --undo forwards actions
        for i = 1, z do
            movement.back()
        end
    end

    if (x > 0) then
        --undo right actions
        for i = 1, x do
            movement.left()
        end
    end

end

return movement

