extends CanvasLayer


func _ready():
	pass

var score := 0


func _physics_process(delta):
	
	
	$ColorRect/RichTextLabel3.text = str(score)


func _on_Button_pressed():
	
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
