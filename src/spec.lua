local createElement = require( 'Module:DeclarativeUI' )

-- You can create a simple element like this
createElement( 'div' ):render() -- <div/>

-- Add some attributes
createElement( 'div', { a = 'b' } ):render() -- <div a="b"/>

-- What about some text?
createElement( 'h1', nil, 'Scream!' ):render() -- <h1>Scream!</h1>

-- What about other elements?
local someElement = createElement( 'span', { style = 'color: red' }, 'Hello World' )
createElement( 'div', nil, 'This goes first', someElement ) -- <div>This goes first<span style="color: red">Hello World</span></div>

-- You can have as much children as you want
createElement( 'div', nil, 'a', 'b', 'c' ) -- <div>abc</div>
