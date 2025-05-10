extends State

class_name GroundState

# Export variables
@export var jump_velocity : float = -200.0
@export var air_state : State
@export var jump_animation : String = "jump"

@warning_ignore("unused_parameter")
func state_process(delta):
	if(!character.is_on_floor()):
		next_state = air_state

func state_input(event: InputEvent):
	if(event.is_action_pressed("jump")):
		# Informs the jump function when to activate.
		jump()

func jump():
	# Handles ground jump.
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel("jump_start")
