extends KinematicBody2D

# Preload Scenes
var bullet_scene = preload("res://Scenes/Bullet.tscn")


# Variables
var speed = 100
var velocity = Vector2.ZERO
var bullet_speed = 400

onready var enemy := get_parent().get_node("EnemyShip")
onready var player := get_parent().get_node("Player")


var patrol = true
var shoot = false
var has_shoot = false


func _ready():
	
	pass
	

func _process(delta):
	
	if player:  
		var angle_to_player = (player.position - position).angle()
		rotation = angle_to_player


func _physics_process(delta):
	
	velocity = Vector2.ZERO
	if player:
		
		if patrol == true:
			velocity = position.direction_to(player.position) * speed
		
		look_at(player.position)
		
	
	
	var distance = enemy.position.distance_to(player.position)
	velocity = move_and_slide(velocity)
	
	if distance <= 100:
		
		patrol = false
		shoot = true
		
	elif distance >= 270:
		
		patrol = true
		shoot = false
	
	if has_shoot == false:
		
		if shoot == true:
			
			shoot()
			$ShootInterval.start()
			has_shoot = true
			
		
	



func shoot():
	
	var bullet = bullet_scene.instance()
	bullet.position = get_node("shotPos").global_position
	bullet.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_parent().add_child(bullet)
	






func _on_Area2D_body_entered(body):
	
	if body.is_in_group("Player"):
		
		player = body


func _on_Area2D_body_exited(body):
	
	if player == body:
		player = null


func _on_ShootInterval_timeout():
	
	has_shoot = false
