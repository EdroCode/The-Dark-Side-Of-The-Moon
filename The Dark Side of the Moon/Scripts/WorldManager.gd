extends Node2D

var ui_visibility = true

var gameIsPaused = false
var playerIsDead = false

var oxygen
var heat
var condition


func _ready():
	$UI/Missile/RichTextLabel.text = "Missile Ready"


func _physics_process(delta):
	
	
	condition = $Player/HurtBox.health
	heat = $Player/HeatManager.cur_temp
	oxygen = $Player/Oxygen.oxygen
	
	# Manage UI
	
	$UI/Heat/TextureProgress.max_value = $Player.get_node("HeatManager").max_temp
	$UI/Heat/TextureProgress.value = $Player.get_node("HeatManager").cur_temp
	$UI/Condition/TextureProgress.max_value = $Player.get_node("HurtBox").max_health
	$UI/Condition/TextureProgress.value = $Player.get_node("HurtBox").health
	$UI/Oxygen/TextureProgress.value = $Player.get_node("Oxygen").oxygen
	
	
	$UI/Score/RichTextLabel2.text = str($ScoreManager.score)
	
	if Input.is_action_just_pressed("Show"):
		
		if ui_visibility == true:
			ui_visibility = false
		else:
			ui_visibility = true
		
		pass
	
	
	
	if ui_visibility == true:
		
		$UI.visible = true
		
	else:
		
		$UI.visible = false
	
	
	
	
	if playerIsDead == true:
		
		
		
		$WarningScreen/RichTextLabel2.text = "|CRITIC|"
		
		
		
		
		
		get_tree().paused = true
		$WarningScreen.visible = true
		$RepairStation/Timer.start()
		
	
	
	
	
	


	


func _on_Player_missel_launched():
	
	$UI/Missile/Missile/AnimationPlayer.play("Load")
	
	$UI/Missile/RichTextLabel.text = "Missile Launched"

func change_anim():
	
	$UI/Missile/Missile/AnimationPlayer.play("Idle")
	$UI/Missile/RichTextLabel.text = "Missile Ready"



func _on_Player_playerIsDead():
	
	playerIsDead = true


func _on_Timer_timeout():
	
	$RepairStation/Timer.stop()
	$RepairStation.visible = true
	
	
	
	
