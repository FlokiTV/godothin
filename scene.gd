extends Node2D

export var textAreaNode:NodePath
onready var textArea:TextEdit = get_node(textAreaNode) as TextEdit
onready var lg = $CanvasLayer/ConsoleContainer/Console
var evalTXT:String
var gt:Dictionary

func _ready():
	gt.core = load("res://godothin/gtCore.gd")
	gt.image = load("res://godothin/gtImage.gd")
	
func _on_Button_pressed():
	gt.core._eval(textArea.text, self, lg)

func echo(msg):
	gtCore.consoleLog(msg, lg)
