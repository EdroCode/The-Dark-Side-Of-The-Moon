extends RigidBody2D


var explode_scene2 = preload("res://Scenes/Particles/RetroExplosionParticle.tscn")
var explode_scene = preload("res://Scenes/Particles/ExplodeParticles.tscn")
var damage : int
var explosion
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
	explosion = explode_scene.instance()
	explosion.position = global_position
	explosion.scale = Vector2(2.5,2.5)
	
	get_parent().add_child(explosion)


func _on_Area2D_body_entered(body):
	
	if body.is_in_group("Walls"):
		explode_particles2()
		queue_free()
	elif body.is_in_group("Enemy"):
		
		explode_particles2()
		queue_free()
		body.get_node("Health").change_health(-20)
		get_parent().get_node("ScoreManager").change_score(10)
		

func explode_particles2():
	var explosion = explode_scene2.instance()
	explosion.position = global_position
	explosion.scale = Vector2(2.5,2.5)
	get_parent().add_child(explosion)

	

func _on_Area2D_body_exited(body):
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
