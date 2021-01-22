extends Node2D

const PIECE_HEIGHT = -232
onready var screens = $UI/Screens
export var victory : String = "WIN"

export var use_generator: bool = false
export(int, 1, 4, 1) var number_of_pieces: int = 1
export(int, 1, 4, 1) var start_piece: int = 1
export(int, 1, 4, 1) var end_piece: int = 1

var rng: RandomNumberGenerator

func get_random_piece():
	return rng.randi_range(start_piece, end_piece)


func get_piece_height(nth_piece: int):
	return nth_piece * PIECE_HEIGHT


func _ready():
	rng = RandomNumberGenerator.new()
	if use_generator:
		for i in range(number_of_pieces):
			print(i)
			var piece_number = get_random_piece()
			var piece_height = get_piece_height(i)
			
			var piece_scene = load("res://scenes/level_pieces/"+str(piece_number)+".tscn")
			var piece_instance = piece_scene.instance()
			add_child(piece_instance)
			piece_instance.position.y = piece_height


func _input(event):
	if event.is_action_pressed("start"):
		if get_tree().paused == false:
			get_tree().paused = true
			screens.show_pause_screen()


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
			body.queue_free()
			screens.show_win_screen()
		else:
			get_tree().change_scene("res://scenes/"+victory+".tscn")


func _on_Screens_unpause():
	get_tree().paused = false
	screens.hide_pause_screen()
