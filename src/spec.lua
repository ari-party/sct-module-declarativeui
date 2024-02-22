local createElement = require( 'createElement' )

print( createElement( 'div', nil ):render() )
print( createElement( 'div', { style = 'display: none' }, 'Hello World' ):render() )
