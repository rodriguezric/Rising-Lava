extends Control

onready var pause_screen = $CanvasLayer/PauseScreen
onready var win_screen = $CanvasLayer/WinScreen
onready var lose_screen = $CanvasLayer/LoseScreen
onready var win_default_button =  $CanvasLayer/WinScreen/VBoxContainer/CenterContainer2/VBoxContainer/QuitButton2
onready var lose_default_button = $CanvasLayer/LoseScreen/VBoxContainer/CenterContainer2/VBoxContainer/TryAgainButton
onready var pause_continue_button = $CanvasLayer/PauseScreen/VBoxContainer2/CenterContainer2/VBoxContainer/ContinueButton


signal try_again
signal unpause
signal quit

func can_show_pause():
	return win_screen.visible == false and lose_screen.visible == false


func hide_pause_screen():
	pause_screen.visible = false


func hide_win_screen():
	win_screen.visible = false


func hide_lose_screen():
	lose_screen.visible = false


func hide_screens():
	hide_win_screen()
	hide_lose_screen()
	hide_pause_screen()


func show_win_screen():
	hide_screens()
	win_default_button.grab_focus()
	win_screen.visible = true


func show_lose_screen():
	hide_screens()
	lose_default_button.grab_focus()
	lose_screen.visible = true


func show_pause_screen():
	if can_show_pause():
		pause_continue_button.grab_focus()
		pause_screen.visible = true


func _on_TryAgainButton_pressed():
	emit_signal("try_again")


func _on_QuitButton_pressed():
	emit_signal("quit")


func _on_ContinueButton_pressed():
	emit_signal("unpause")
