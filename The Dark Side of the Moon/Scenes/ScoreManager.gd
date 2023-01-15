extends Node2D


var min_score : int = 0
var score : int = 0


func _ready():
	pass # Replace with function body.


func change_score(value):
	
	score += value
