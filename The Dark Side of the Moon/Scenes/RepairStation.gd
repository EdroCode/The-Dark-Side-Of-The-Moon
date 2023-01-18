extends Node2D

var objects_in_area = 0
onready var player = get_parent().get_node("Player")



func _ready():
	pass


func _on_Area2D_area_entered(area):
	
	if area.is_in_group("Object"):
		
		objects_in_area += 1


func _on_Area2D_area_exited(area):
	
	if area.is_in_group("Object"):
		
		objects_in_area -= 1



func _physics_process(delta):
	
	#$TextureRect/OxygenBar.value = player.oxygen
	#$TextureRect/HeatBar.value = player.condition
	#$TextureRect/HeatBar.value = player.heat
	
	
	pass


