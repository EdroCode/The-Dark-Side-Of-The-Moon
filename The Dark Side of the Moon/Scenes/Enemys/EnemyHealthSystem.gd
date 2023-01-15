extends Node2D



export var health: int
export var max_health : int

var explode_scene = preload("res://Scenes/ExplodeParticlesRED.tscn")


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	
	if health <= 0:
		
		health = 0
		explode()
		
	
	if health >= max_health:
		
		health = 100
	





func change_health(value):
	
	health += value
	


func explode():
	
	var explosion = explode_scene.instance()
	explosion.position = global_position
	explosion.scale = Vector2(4,4)
	get_parent().get_parent().add_child(explosion)
	get_parent().queue_free()

