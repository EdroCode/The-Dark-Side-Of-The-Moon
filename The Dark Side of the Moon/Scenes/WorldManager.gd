extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	
	
	
	
	
	$UI/TextureProgress.max_value = $Player.get_node("HeatManager").max_temp
	$UI/TextureProgress.value = $Player.get_node("HeatManager").cur_temp
	
	
	
	
	
	
	
	
	pass
