local arguments = {}

function arguments.getNumericalArgument(index, args)
    return tonumber(args[index])
end

-- Returns a nil value if X or Y is invalid.
function arguments.getXY(args)
    local x = arguments.getNumericalArgument(1, args)
    local y = arguments.getNumericalArgument(2, args)
    return x, y
end

return arguments

