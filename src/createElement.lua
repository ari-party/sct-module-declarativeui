local render = require( 'render' )

---@alias Element { component: string; attributes: table<string, any>; children: table, render?: function }

---@param component string HTML Tag
---@param attributes table<string, any>? HTML Attributes
---@param ... Element | string
---@return Element
return function ( component, attributes, ... )
    local element = {
        component = component,
        attributes = attributes or {},
        children = { ... }
    }

    function element:render()
        return render( element )
    end

    return element
end
