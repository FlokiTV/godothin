extends Node

#
# General Object Runtime functions
#

func _ready():
	pass # Replace with function body.
	
func setX(x:float)->void:
	self.position = Vector2(x, self.position.y)
func setY(y:float)->void:
	self.position = Vector2(self.position.x, y)
func setPos(x:float,y:float)->void:
	self.position = Vector2(x,y)
