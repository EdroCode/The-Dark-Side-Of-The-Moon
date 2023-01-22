extends KinematicBody2D

var speed = 0.5
var direction = 1
var bullet_speed = 700


var bullet_scene = preload("res://Scenes/BulletArc.tscn")

onready var player := get_parent().get_node("Player")



func _ready():
	
	
	pass
	
	
	

func _physics_process(delta):
	
	
	var velocity = Vector2(speed * direction, 0)
	velocity = move_and_slide(velocity)
	if is_colliding() or is_at_edge():
		direction *= -1
	
	

func is_colliding():
	
	var collision = move_and_collide(Vector2(speed * direction, 0))
	return collision != null

func is_at_edge():
	
	var pos = get_position()
	var screen_size = get_viewport().get_size()
	return pos.x < 0 or pos.x > screen_size.x


func shoot_bullet():
	
	# Instantiate the Bullet
	
	var bullet = bullet_scene.instance()
	
	bullet.position = get_node("LazerPos").global_position
	bullet.rotation_degrees = rotation_degrees
	bullet.apply_impulse(Vector2(), Vector2(0, bullet_speed).rotated(rotation))
	get_parent().add_child(bullet)





func _on_Timer_timeout():
	
	
	shoot_bullet()


