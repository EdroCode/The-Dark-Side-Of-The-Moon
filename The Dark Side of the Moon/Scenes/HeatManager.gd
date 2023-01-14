extends Node2D


var cur_temp : int
var max_temp : int

# Called when the node enters the scene tree for the first time.
func _ready():
	
	max_temp = 100
	cur_temp = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _physics_process(delta):
	
	print(cur_temp)
	
	if cur_temp >= max_temp:
		
		cur_temp = max_temp
		
	elif cur_temp <= 0:
		
		cur_temp = 0
		
		
		
	
	
	if cur_temp <= 50:
		
		$CoolTempTimer.wait_time = .5
		
	else:
		
		$CoolTempTimer.wait_time = 2
	
	
	

	


func increase_temp(value):
	
	cur_temp += value


func _on_CoolTempTimer_timeout():
	
	
	increase_temp(-2)
