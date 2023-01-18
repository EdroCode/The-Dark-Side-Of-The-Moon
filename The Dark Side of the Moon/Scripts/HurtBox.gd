extends Area2D


var health : int = 100
var max_health : int = 100

var explode_scene = preload("res://Scenes/Particles/ExplodeParticles.tscn")


func _physics_process(delta):
	
	
	pass



func dicrease_health(value):
	
	health -= value


#===========
#  SIGNALS
#===========

func _on_HurtBox_body_entered(body):
	
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body.is_in_group("Walls"):
			explode_particles()
		if body.is_in_group("Enemy"):
			explode_particles()

func _on_HurtBox_body_exited(body):
	
	body = null


#==========
#   VFX
#==========

func explode_particles():
	
	
	var explosion = explode_scene.instance()
	explosion.position = get_parent().global_position
	get_parent().get_parent().add_child(explosion)

