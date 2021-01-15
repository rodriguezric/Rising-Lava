extends Node2D

onready var screens = $UI/Screens
export var victory : String = "WIN"

func _on_Screens_quit():
	get_tree().quit()


func _on_Screens_try_again():
	get_tree().reload_current_scene()


func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.queue_free()
		screens.show_lose_screen()


func _on_Goal_body_entered(body):
	if body.name == "Player":
		if victory == "WIN":
			screens.show_win_screen()
		else:
			get_tree().change_scene("res://scenes/"+victory+".tscn")
