extends Node2D


var enemy_list = [
	
	# SpaceShip Enemy
	preload("res://Scenes/Enemys/EnemyShip.tscn"),
	#preload("res://Scenes/Enemys/UFOEnemy.tscn")
	
]

var max_enemys : int = 1
var i : int



func _on_SpawnTimer_timeout():
	
	
	max_enemys += rand_range(0,1)
	i = rand_range(1,max_enemys)
	spawn()
	
	




func spawn():
	
	
	var enemy_spawn = rand_range(0,enemy_list.size())
	var scene = enemy_list[enemy_spawn].instance()
	scene.position = $Position2D.global_position
	get_parent().add_child(scene)
	
	
	pass




