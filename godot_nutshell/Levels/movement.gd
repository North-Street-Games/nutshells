extends CharacterBody2D

@export var speed = 200
var mouse_position = null
var distance = 0
var moving = false	

func _input(event: InputEvent):
	
	if event.is_action_pressed("left_click"):
		
		print("done")
		
		$Timer.stop()
		
		moving = true
		mouse_position = get_global_mouse_position()
		
		# Start timer
		$Timer.wait_time = 2
		$Timer.start()
		

func _physics_process(_delta):
	
	# Reset the player's velocity
	if moving:
		move_to_last_mouse_pos()
	
func move_to_last_mouse_pos():
	
	velocity = Vector2(0, 0)
	# amouse_position = get_global_mouse_position()
 
	# This input will need to be created in the input map
	# if Input.is_action_pressed("forward"):
	
	var direction = (mouse_position - position).normalized()
	velocity = (direction * speed)
	distance = (position - mouse_position).length()
	if distance >= 10:
		move_and_slide()


func _on_timer_timeout():
	moving = false
