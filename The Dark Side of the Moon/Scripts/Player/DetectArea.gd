extends Area2D

var aim = preload("res://Scenes/Particles/Aim.tscn")
var enemy = null
var particle = null

func _physics_process(delta):
	pass

func _on_DetectArea_body_entered(body):
	var bodies = get_overlapping_bodies()
	var closest_distance = 9999999
	
	for body in bodies:
		if body.is_in_group("Enemy"):
			var distance = body.position.distance_to(get_parent().get_parent().get_node("Player").position)
			
			
			
			if distance < closest_distance:
				closest_distance = distance
				if enemy != body:
					if particle != null:
						particle.queue_free()
					particle = aim.instance()
					body.add_child(particle)
					enemy = body

func _on_DetectArea_body_exited(body):
	if body == enemy:
		particle.queue_free()
		particle = null
		enemy = null
