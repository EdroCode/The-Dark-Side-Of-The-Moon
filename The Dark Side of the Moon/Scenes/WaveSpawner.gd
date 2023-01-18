extends Node2D



var spaceship = preload("res://Scenes/Enemys/EnemyShip.tscn")
var ufo = preload("res://Scenes/Enemys/UFOEnemy.tscn")



var max_enemys : int = 1
var i : int



func _on_SpawnTimer_timeout():
	
	
	max_enemys += rand_range(0,1)
	i = rand_range(1,max_enemys)
	spawn()
	
	




func spawn():
	
	
	print("Enemys Spawned")
	
	var enemy_spawn = spaceship.instance()
	enemy_spawn.position = $Position2D.global_position
	get_parent().add_child(enemy_spawn)
	
	#var ufo_spawn = ufo.instance()
	#ufo_spawn.position = $Position2D2.global_position
	#get_parent().add_child(ufo_spawn)
	pass




