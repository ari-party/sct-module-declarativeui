---@param input table<string, any>
---@return table<string> attributes
return function ( input )
    local attributes = {}

    for key, value in pairs( input ) do
        table.insert( attributes,
            key .. '="' .. string.gsub( tostring( value ), '"', '\\"' ) .. '"' )
    end

    return attributes
end
