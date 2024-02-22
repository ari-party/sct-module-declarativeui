local render = require( 'render' )

---@alias Element { component: string; attributes: table<string, any>; children: table, render?: function }

local function iterateChildren( child )
    local children = {}

    if type( child ) == 'table' and child[ 1 ] then
        for _, value in ipairs( iterateChildren( child ) ) do
            table.insert( children, value )
        end
    else
        table.insert( children, child )
    end

    return children
end

---@param component string HTML Tag
---@param attributes table<string, any>? HTML Attributes
---@param ... Element | Element[] | string
---@return Element
return function ( component, attributes, ... )
    local children = {}
    for _, child in ipairs( { ... } ) do
        for _, iteratedChild in ipairs( iterateChildren( child ) ) do
            table.insert( children, iteratedChild )
        end
    end

    local element = {
        component = component,
        attributes = attributes or {},
        children = children
    }

    function element:render()
        return render( element )
    end

    return element
end
