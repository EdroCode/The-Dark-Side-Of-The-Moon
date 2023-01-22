extends Control


func _ready():
	
	$RichTextLabel.visible_characters = 0



func _process(delta):
	
	$RichTextLabel.visible_characters += 1






func _on_StartButton_pressed():
	print("Change Scene")
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_OptionsButton_pressed():
	
	get_tree().change_scene("res://Scenes/Menu/Options.tscn")


func _on_CreditsButton_pressed():
	
	get_tree().change_scene("res://Scenes/Menu/Credits.tscn")


func _on_QuitButton_pressed():
	pass # Replace with function body.
