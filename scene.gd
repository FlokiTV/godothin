extends Node2D

export var textAreaNode:NodePath
var evalTXT:String
onready var textArea:TextEdit = get_node(textAreaNode) as TextEdit
onready var gt = preload("res://godothin/gtCore.gd")
onready var lg = $CanvasLayer/RichTextLabel
func _on_Button_pressed():
	_eval(textArea.text)

func echo(msg):
	var type = typeof(msg)
	if type == TYPE_STRING:
		lg.text = msg
	else:
		lg.text = to_json(msg)
func _eval(input:String):
	var script = GDScript.new()
	script.source_code = """
extends Node
onready var gt = get_parent()

func getNode(name:String):
	return gt.get_node(name)
func eval():
	{fn}
	""".format({"fn": input.replace("\n", "\n\t")})
	var error = script.reload()
	if error != OK:
		print(error)
	else:
		var obj = Node.new()
		obj.set_script(script)
		add_child(obj)
		var ret_val = obj.eval()
		remove_child(obj)
		return ret_val
