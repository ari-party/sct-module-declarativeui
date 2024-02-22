local xmlAttributes = require( 'utils.attributes' )

---@param element Element
---@return string rendered Rendered HTML
local function render( element )
    local attributes = table.concat( xmlAttributes( element.attributes ), ' ' )

    local segments = {}

    table.insert( segments, '<' .. element.component ) -- Partial opening tag
    if string.len( attributes ) > 0 then table.insert( segments, ' ' .. attributes ) end

    if #element.children == 0 then
        table.insert( segments, '/>' ) -- Closing 'tag'
    else
        table.insert( segments, '>' )  -- Finish opening tag

        local children = {}

        for _, child in ipairs( element.children ) do
            if type( child ) == 'table' then
                table.insert( children, render( child ) )
            else
                table.insert( children, tostring( child ) )
            end
        end

        table.insert( segments, table.concat( children, '' ) )

        table.insert( segments, '</' .. element.component .. '>' ) -- Closing tag
    end

    return table.concat( segments, '' )
end

return render
