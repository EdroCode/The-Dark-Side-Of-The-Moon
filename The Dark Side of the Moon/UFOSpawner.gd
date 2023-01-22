extends Node2D

var ufo = preload("res://Scenes/Enemys/UFOEnemy.tscn")






func spawn():
	
	
	
	var ufo_spawn = ufo.instance()
	ufo_spawn.position = $Position2D.global_position
	get_parent().add_child(ufo_spawn)
	






func _on_Timer_timeout():
	
	print("ufo spawned")
	spawn()
