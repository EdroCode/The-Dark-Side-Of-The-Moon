extends Control


func _ready():
	pass

var music_bus = AudioServer.get_bus_index("Master")


func _on_Button_pressed():
	
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")



func _on_HSlider_value_changed(value):
	set_bus_volume(3, value)


func set_bus_volume(bus_index: int, value: float):
	
	AudioServer.set_bus_volume_db(bus_index, linear2db(value))
	AudioServer.set_bus_mute(bus_index, value < 0.01)
	pass


