extends CharacterBody2D
 
@export var speed = 200
# var velocity = Vector2()
var mouse_position = null
var distance = 0;

func _process(_delta):
	if Input.is_action_just_released("left_click"):
		print("done")

func _physics_process(_delta):
	
	# Reset the player's velocity
	velocity = Vector2(0, 0)
	mouse_position = get_global_mouse_position()
 
	# This input will need to be created in the input map
	if Input.is_action_pressed("forward"):
		var direction = (mouse_position - position).normalized()
		velocity = (direction * speed)
		distance = (position - mouse_position).length()
		if distance >= 10:
			move_and_slide()
			look_at(mouse_position)
			print("hello", distance)
	


