extends KinematicBody2D

var velocity = Vector2()
var acceleration = 100
var rotation_speed = 5
var deceleration = 2

var bullet_speed = 500
var bullet_scene = preload("res://Scenes/Bullet.tscn")



func _ready():
	$BoostParticles.emitting = false

func _physics_process(delta):
	
	
	
	if Input.is_action_pressed("Up"):
		velocity += Vector2(acceleration, 0).rotated(rotation) * delta
	if Input.is_action_pressed("Boost"):
		acceleration += 20
		$BoostParticles.emitting = true
		if acceleration >= 300:
			acceleration = 300
	elif Input.is_action_just_released("Boost"):
		$BoostParticles.emitting = false
		acceleration -= 30
	#Check for down action to reduce velocity over time
	
	
	if Input.is_action_pressed("Down"):
		velocity -= velocity * deceleration * delta
	if Input.is_action_pressed("Left"):
		rotation -= rotation_speed * delta
	elif Input.is_action_pressed("Right"):
		rotation += rotation_speed * delta
	
	
	position += velocity * delta
	
	
	
	
	
	
	
	if Input.is_action_just_pressed("Fire"):
		shoot_bullet()
	
	


func shoot_bullet():
	
	var bullet = bullet_scene.instance()
	bullet.position = get_node("shotPos").global_position
	bullet.rotation_degrees = rotation_degrees
	bullet.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_parent().add_child(bullet)
	
	
	$HeatManager.increase_temp(1)
	
	
	
