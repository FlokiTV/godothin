https://flokitvbr.itch.io/godothin

1

# Core Functions

```swift
func getNode(node: String) -> Node
```
bind to `this.get_node()`
Ex: `getNode("Sprite").position = Vector2(200, 200)`

### var this
Reference for `get_parent()` and root functions

```swift
func echo(msg: Any) -> void
```
Ex: `this.echo(getNode("Sprite"))` `this.echo(getNode("Sprite").position)`


# Object Functions

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