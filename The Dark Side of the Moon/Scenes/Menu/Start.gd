extends Control


func _ready():
	pass



func _process(delta):
	
	$ColorRect/RichTextLabel.visible_characters += 1
	$ColorRect/RichTextLabel2.visible_characters += 1
	$ColorRect/RichTextLabel3.visible_characters += 1
	$ColorRect/RichTextLabel4.visible_characters += 1
	$ColorRect/RichTextLabel5.visible_characters += 1
	$ColorRect/RichTextLabel6.visible_characters += 1


func _on_Timer_timeout():
	
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
