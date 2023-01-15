extends KinematicBody2D

var speed = 400
var target
var impulse_duration = 1
var impulse_timer = 0
var direction

var explode_scene = preload("res://Scenes/ExplodeParticles.tscn")



func _ready():
	target = get_parent().get_node("Player").get_node("DetectArea").enemy

func _process(delta):
	# Move towards target
	if target != null:
		direction = (target.position - position).normalized()
	var velocity = direction * speed
	move_and_slide(velocity)
	look_at(target.position)


func _on_Area2D_body_entered(body):
	
	if body.is_in_group("Walls"):
		explode_particles()
		queue_free()
	elif body.is_in_group("Enemy"):
		explode_particles()
		queue_free()
		body.get_node("Health").change_health(-20)
		get_parent().get_node("ScoreManager").change_score(10)
	elif body.is_in_group("Player"): 
		explode_particles()
		queue_free()
		get_parent().get_node("Player").get_node("HurtBox").dicrease_health(5)


func _on_Area2D_body_exited(body):
	pass # Replace with function body.







func explode_particles():
	var explosion = explode_scene.instance()
	explosion.position = global_position
	explosion.scale = Vector2(2.5,2.5)
	get_parent().add_child(explosion)








