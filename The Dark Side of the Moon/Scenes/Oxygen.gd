extends Node2D


var oxygen := 100


func _ready():
	pass






func _physics_process(delta):
	
	
	if get_parent().rest_point == Vector2(391, 164):
		
		print("oxygen colocated")
