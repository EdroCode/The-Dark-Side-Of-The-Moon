extends KinematicBody2D


#Variables

var velocity = Vector2()
var acceleration = 100
var rotation_speed = 5
var deceleration = 2
var test = Vector2.ZERO
var bullet_speed = 500
var has_shot = false


# Preload Scenes
var bullet_scene = preload("res://Scenes/Bullet.tscn")
var explode_scene = preload("res://Scenes/ExplodeParticles.tscn")



func _ready():
	
	#Variables & Particles set
	
	$BoostParticles.emitting = false



func _physics_process(delta):
	
	
	# Movement
	
	if Input.is_action_pressed("Up"):
		velocity += Vector2(acceleration, 0).rotated(rotation) * delta
	
	if Input.is_action_pressed("Boost"):
		
		
		$BoostParticles.emitting = true
		
		acceleration += 20
		if acceleration >= 300:
			acceleration = 300
		
	elif Input.is_action_just_released("Boost"):
		
		$BoostParticles.emitting = false
		acceleration -= 30
	
	
	# Rotate
	
	if Input.is_action_pressed("Down"):
		velocity -= Vector2(acceleration, 0).rotated(rotation) * delta
	if Input.is_action_pressed("Stop"):
		velocity -= velocity * deceleration * delta
	if Input.is_action_pressed("Left"):
		rotation -= rotation_speed * delta
	elif Input.is_action_pressed("Right"):
		rotation += rotation_speed * delta
	
	
	# Collision
	
	test = move_and_collide(velocity*delta)
	
	if test:
		
		$HurtBox.dicrease_health(5)
		velocity -= velocity * deceleration * delta * 40
		
	
	# Shoot
	
	if has_shot == false:
		
		
		if Input.is_action_just_pressed("Fire"):
			shoot_bullet()
			has_shot = true
			$ShotDelay.start()
	


func shoot_bullet():
	
	# Instantiate the Bullet
	
	var bullet = bullet_scene.instance()
	
	bullet.position = get_node("shotPos").global_position
	bullet.rotation_degrees = rotation_degrees + rad2deg(45)
	bullet.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_parent().add_child(bullet)
	
	# Increase temperature
	
	$HeatManager.increase_temp(1)


# Signals


func _on_ShotDelay_timeout():
	
	has_shot = false
