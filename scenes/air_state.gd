extends State

class_name AirState

# Export variables
@export var landing_state : State
@export var air_jump_velocity : float = -150.0
@export var air_jump_animation : String = "air_jump"
@export var landing_animation : String = "landing"

# Hard variables
var has_air_jumped = false

@warning_ignore("unused_parameter")
func state_process(delta):
	if(character.is_on_floor()):
		next_state = landing_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump") && !has_air_jumped):
		air_jump()

func on_exit():
	if(next_state == landing_state):
		playback.travel(landing_animation)
		has_air_jumped = false

func air_jump():
	character.velocity.y = air_jump_velocity
	playback.travel(air_jump_animation)
	has_air_jumped = true
