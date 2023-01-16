extends RigidBody2D

var explode_scene = preload("res://Scenes/Particles/ExplodeParticles.tscn")
var explode_scene2 = preload("res://Scenes/Particles/RetroExplosionParticle.tscn")
var damage : int

var enemy = null;

func get_enemy_node():
	
		if enemy == null:
			enemy = get_tree().get_nodes_in_group("enemy")
		if enemy == null:
			return null;
		else:
			return enemy;

func _physics_process(delta):
	pass

func _ready():
	
	$Timer.start()

#==========
#   VFX
#==========

func explode_particles():
	var explosion = explode_scene.instance()
	explosion.position = global_position
	explosion.scale = Vector2(2.5,2.5)
	get_parent().add_child(explosion)


func _on_Area2D_body_entered(body):
	
	if body.is_in_group("Walls"):
		explode_particles2()
		queue_free()
	elif body.is_in_group("Player"): 
		explode_particles2()
		queue_free()
		get_parent().get_node("Player").get_node("HurtBox").dicrease_health(5)
	

func _on_Area2D_body_exited(body):
	pass # Replace with function body.


func _on_Timer_timeout():
	explode_particles2()
	queue_free()



func explode_particles2():
	var explosion = explode_scene2.instance()
	explosion.position = global_position
	explosion.scale = Vector2(2.5,2.5)
	get_parent().add_child(explosion)









