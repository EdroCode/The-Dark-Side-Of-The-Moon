extends Node2D

var total_objects = 0
onready var player = get_parent().get_node("Player")

var oxygen_full = false
var heat_full = false
var condition_full = false


var isVisible = false

# Signal

signal playerIsAlive



func _ready():
	
	pass
	



func _physics_process(delta):
	
	$TextureRect/OxygenBar.value = player.oxygen
	$TextureRect/ConditionBar.value = player.condition
	$TextureRect/HeatBar.value = player.heat
	
	Physics2DServer.set_active(true)
	
	#print($HeatArea/CollisionShape2D.disabled)
	
	
	
	
	if total_objects <= 0:
		
		total_objects = 0
	
	if visible == false:
		
		isVisible = false
		total_objects = 0
		
	else:
		
		get_parent().get_node("WarningScreen").visible = false
		isVisible = true
		
	
	
	
	
	if total_objects == 3:
		
		emit_signal("playerIsAlive")
		
		$Object.global_position = $Position2D.global_position
		$Object2.global_position = $Position2D2.global_position
		$Object3.global_position = $Position2D3.global_position
		
		
		
		get_tree().paused = false
		visible = false
		get_parent().get_node("WarningScreen").visible = false
		total_objects = 0
		
		
		var particles = get_tree().get_nodes_in_group("Particle")
		for particle in particles:
			particle.queue_free()
		
		var enemys = get_tree().get_nodes_in_group("Enemy")
		for enemy in enemys:
			enemy.queue_free()
		
		
		
		get_parent().get_node("Player").get_node("HurtBox").health = 100
		get_parent().get_node("Player").get_node("Oxygen").oxygen = 100
		get_parent().get_node("Player").get_node("HeatManager").cur_temp = 0
		
		
		
		
	
	
	






func _on_HeatArea_area_entered(area):
	
	
	if area.is_in_group("Object"):
		heat_full = true
		total_objects += 1
		$HeatArea/ColorRect2.visible = true
		print("Entered Heat")


func _on_HeatArea_area_exited(area):
	
	heat_full = false
	total_objects -= 1
	$HeatArea/ColorRect2.visible = false

func _on_ConditionArea_area_entered(area):
	
	if area.is_in_group("Object"):
		condition_full = true
		total_objects += 1
		$ConditionArea/ColorRect.visible = true
		print("Entered Cond")
 
func _on_ConditionArea_area_exited(area):
	
	
	condition_full = false
	total_objects -= 1
	$ConditionArea/ColorRect.visible = false

func _on_OxygenArea_area_entered(area):
	
	if area.is_in_group("Object"):
		oxygen_full = true
		total_objects += 1
		$OxygenArea/ColorRect2.visible = true
		print("Entered O2")
 

func _on_OxygenArea_area_exited(area):
	
	oxygen_full = false
	total_objects -= 1
	$OxygenArea/ColorRect2.visible = false


func _on_Timer_timeout():
	
	pass


func _on_Timer2_timeout():
	
	print($OxygenArea/CollisionShape2D.disabled)
	print("Visible: " + str(visible))
	print("Paused: " + str(get_tree().paused))
	
	
