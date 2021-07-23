local dropper = {}

local chestType = "ironchest:iron_chest"


function dropper.isChestBelow()
    local isBlockBelow, data = turtle.inspectDown()

    if isBlockBelow then
        if data.name == chestType then
            return true
        end
    end
    return false
end

function dropper.dropOff()
    if dropper.isChestBelow() then
        for i=1, 16 do
            turtle.select(i)
            turtle.dropDown()
        end
    else
        print("ERROR: Could not detect the drop-off chest.")
    end
end

return dropper

