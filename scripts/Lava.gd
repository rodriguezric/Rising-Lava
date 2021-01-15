extends Area2D


export var speed : int = 20

func _physics_process(delta):
	move_local_y(delta * (-speed))
