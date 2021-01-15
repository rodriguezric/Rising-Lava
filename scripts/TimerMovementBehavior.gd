extends StaticBody2D


export var speed : int = 20
export(Array, String) var actions = ['wait', 'up', 'wait', 'down']
var current_action : int = 0
var motion : Vector2


func _ready():
	process_action()


func next_action():
	current_action = (current_action + 1) % len(actions)


func process_action():
	match actions[current_action]:
		'wait': 
			motion.x = 0
			motion.y = 0
		'up':
			motion.x = 0
			motion.y = -speed
		'down':
			motion.x = 0
			motion.y = speed
		'left':
			motion.x = -speed
			motion.y = 0
		'right':
			motion.x = speed
			motion.y = 0


func _physics_process(delta):
	move_local_x(delta * motion.x)
	move_local_y(delta * motion.y)


func _on_Timer_timeout():
	next_action()
	process_action()
