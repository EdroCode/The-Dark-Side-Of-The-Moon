extends Node2D


var cur_temp : int
var max_temp : int
var boosting = false


func _ready():
	
	$CoolTimer.start()
	max_temp = 100
	cur_temp = 0



func _physics_process(delta):
	
	if cur_temp >= max_temp:
		cur_temp = max_temp
		
	elif cur_temp <= 0:
		cur_temp = 0
		
	
	if Input.is_action_just_pressed("Boost"):
		
		boost()
		
	elif Input.is_action_just_released("Boost"):
		
		$HeatTimer.stop()
		
	
	if cur_temp <= 50:
		
		get_parent().get_node("HeatParticles").emitting = false
		
	else:
		get_parent().get_node("HeatParticles").emitting = true
		
	
	


func increase_temp(value):
	
	cur_temp += value


func boost():
	
	
	$HeatTimer.start()


func _on_HeatTimer_timeout():
	
	increase_temp(5)


func _on_CoolTimer_timeout():
	
	if cur_temp <= 50:
		increase_temp(-10)
	else:
		increase_temp(-5)
