https://godothin.herokuapp.com/

# Built-in Functions

You can use this functions directly on scope of your script

```swift
func getNode(node: String) -> Node
```
bind to `this.get_node()`
Ex: `getNode("Sprite").position = Vector2(200, 200)`

## scope variables 

### this
Reference for `get_parent()` and root functions

```swift
func echo(msg: Any) -> void
```
Ex: `this.echo(getNode("Sprite"))` `this.echo(getNode("Sprite").position)`

### gt
Reference for all godothin classes
```js
gt.core     //core functions
gt.image    //image functions
```

# gtCore

Run GDScript on Node
`console (optional)` Text element to output errors

```swift
static func _eval(input:String, target:Node, console=false) -> any
```

# gtImage

Set Node target to append HTTPRequest
```swift
func setTarget(node:Node) -> any
```
Download Image and apply as texture
ps.: running on html can be cors error
```swift
func downloadPng(url:String) -> any
```

Example:
```swift
var src = "https://i.imgur.com/BUnYvol.png"
var img = gtImage.new()
img.setTarget(getNode("Sprite"))
img.downloadPng(src)
```

# Object Functions - gtObject

```swift
func setX(x: float) -> void
```
```swift
func setY(x: float) -> void
```
```swift
func setPos(x: float) -> void
```

Ex: `getNode("Sprite").setX(250)` `getNode("Sprite").setPos(250, 500)`