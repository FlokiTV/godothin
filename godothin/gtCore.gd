extends Node
class_name gtCore

static func consoleLog(msg, console):
	var type = typeof(msg)
	if type == TYPE_STRING:
		console.text = msg
	else:
		console.text = to_json(msg)
		
static func consoleError(error, console):
	match error:
		ERR_PARSE_ERROR:
			consoleLog("Parse error", console)
		_: consoleLog("Parse error: "+error, console)
		
static func _eval(input:String, target, console=false):
	var script = GDScript.new()
	script.source_code = """
extends Node
onready var this = get_parent()
onready var gt = this.gt
func getNode(name:String):
	return this.get_node(name)
func eval():
	{fn}
	""".format({"fn": input.replace("\n", "\n\t")})
	var error = script.reload()
	if error != OK:
		if console:
			consoleError(error, console)
		else: print(error)
	else:
		var obj = Node.new()
		obj.set_script(script)
		target.add_child(obj)
		var result = obj.eval()
		target.remove_child(obj)
		return result
		
static func evaluate(input:String):
	var script = GDScript.new()
	script.source_code = "func eval():\n\treturn " + input
	script.reload()
	var obj = Reference.new()
	obj.set_script(script)
	return obj.eval()
	
static func parse(expression:String, target):
	expression = expression.replace(" ", "")
	var ex = Expression.new()
	var error =  ex.parse(expression)
	if error != OK:
		print(ex.get_error_text())
	return ex.execute([], target, true)
			
#var script = GDScript.new()
#script.source_code = """extends Node\n func _process():\n\tif Input.is_key_pressed(KEY_W):\n\t\tthis.setY(this.position.x, this.position.y+1)
#"""
#script.reload()
#var obj = Node.new()
#this.add_child(obj)
#obj.set_script(script)


