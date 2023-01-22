extends KinematicBody2D

var player
var speed = 100


func _ready():
	
	$Sprites.frame = rand_range(2,8)
	player = get_parent().get_node("Player")


func _physics_process(delta):
	var direction = (player.position - position).normalized()
	position += direction * speed * delta


