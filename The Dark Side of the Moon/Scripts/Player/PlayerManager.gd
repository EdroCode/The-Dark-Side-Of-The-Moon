extends KinematicBody2D




#Variables

var velocity = Vector2()
var acceleration = 100
var rotation_speed = 5
var deceleration = 2
var test = Vector2.ZERO
var bullet_speed = 500
var has_shot = false
var has_shot_missile = false

signal missel_launched

# Preload Scenes
var bullet_scene = preload("res://Scenes/Bullet.tscn")
var explode_scene = preload("res://Scenes/Particles/ExplodeParticles.tscn")
var missile_scene = preload("res://Scenes/Missile.tscn")
var missile_trail = preload("res://Scenes/Particles/MissileTrailRED.tscn")


# Suport Variables

var oxygen
var heat
var condition


# Signals

signal playerIsDead


func _ready():
	
	#Variables & Particles set
	
	
	$BoostParticles.emitting = false



func _physics_process(delta):
	
	
	
	# Variable Check
	
	oxygen = $Oxygen.oxygen
	heat = get_node("HeatManager").cur_temp
	condition = get_node("HurtBox").health
	
	GameManager.oxygen = oxygen
	
	

	# Movement
	
	if Input.is_action_pressed("Up"):
		velocity += Vector2(acceleration, 0).rotated(rotation) * delta
	
	if Input.is_action_pressed("Boost"):
		
		
		$BoostParticles.emitting = true
		
		acceleration +=5
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
	
	look_at(get_global_mouse_position())
	
	
	
	# Collision
	
	test = move_and_collide(velocity*delta)
	
	if test:
		
		$HurtBox.dicrease_health(5)
		velocity -= velocity * deceleration * delta * 40
		
	
	# Shoot
	
	if has_shot == false:
		
		
		if Input.is_action_pressed("Fire"):
			shoot_bullet()
			has_shot = true
			$ShotDelay.start()
	
	
	if $DetectArea.enemy != null:
		
		if has_shot_missile == false:
			
			if Input.is_action_just_pressed("Missile"):
				
				
				emit_signal("missel_launched")
				
				has_shot_missile = true
				$MissileDelay.start()
				shoot_missile()
				
				
		


func shoot_bullet():
	
	# Instantiate the Bullet
	
	var bullet = bullet_scene.instance()
	
	bullet.position = get_node("shotPos").global_position
	bullet.rotation_degrees = rotation_degrees + rad2deg(45)
	bullet.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_parent().add_child(bullet)
	
	# Increase temperature
	
	$HeatManager.increase_temp(1)

func shoot_missile():
	
	# Instantiate the Bullet
	
	var missile = missile_scene.instance()
	
	missile.position = get_node("shotPos").global_position
	missile.rotation_degrees = rotation_degrees + rad2deg(45)
	get_parent().add_child(missile)
	
	
	
	
	
	# Increase temperature
	
	$HeatManager.increase_temp(20)






# Signals


func _on_ShotDelay_timeout():
	
	has_shot = false


func _on_MissileDelay_timeout():
	
	has_shot_missile = false


func _on_O2Timer_timeout():
	pass # Replace with function body.
