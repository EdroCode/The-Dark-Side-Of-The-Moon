extends Control


var isPuased = false setget set_is_paused

func _unhandled_input(event):
	
	
	if event.is_action_pressed("Pause"):
		
		self.isPuased = !isPuased


func set_is_paused(value):
	
	isPuased = value
	get_tree().paused = isPuased
	visible = isPuased
	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	
	
	get_node("ColorRect/RichTextLabel3").text = str(get_parent().get_node("ScoreManager").score)
