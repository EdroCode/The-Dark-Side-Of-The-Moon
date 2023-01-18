extends Node2D

var max_oxygen := 100
var oxygen := 100



func _ready():
	pass


func dicrease_oxygen(value):
	
	
	oxygen -= value



func _on_O2Timer_timeout():
	
	dicrease_oxygen(5)
