extends Control


func _ready():
	pass


func _physics_process(delta):
	
	
	$RichTextLabel2.visible_characters += 1


func _on_Button_pressed():
	
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
