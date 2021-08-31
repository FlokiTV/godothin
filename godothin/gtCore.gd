extends Node

func evaluate(input:String):
	var script = GDScript.new()
	script.source_code = "func eval():\n\treturn " + input
	script.reload()
	var obj = Reference.new()
	obj.set_script(script)
	return obj.eval()
	
func parse(expression:String):
	expression = expression.replace(" ", "")
	var ex = Expression.new()
	var error =  ex.parse(expression)
	if error != OK:
		print(ex.get_error_text())
	return ex.execute([], self, true)
