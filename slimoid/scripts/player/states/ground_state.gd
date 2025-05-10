extends State

class_name GroundState

# Export variables
@export var jump_velocity : float = -200.0
@export var air_state : State
@export var jump_animation : String = "jump"
@export var roll_state : State
@export var roll_node : String = "momentum_roll"
@export var attack_state : State
@export var melee_attack_node : String = "melee_attack1"

@warning_ignore("unused_parameter")
func state_process(delta):
	if(!character.is_on_floor()):
		next_state = air_state

func state_input(event: InputEvent):
	if(event.is_action_pressed("jump")):
		# Informs the jump function when to activate.
		jump()
	if(event.is_action("roll")):
		momentum_roll()
	if(event.is_action_pressed("melee_attack")):
		melee_attack()

func jump():
	# Handles ground jump.
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel("jump_start")

func momentum_roll():
	# Handles the moveing_attack/roll
	next_state = roll_state
	playback.travel(roll_node)

func melee_attack():
	# Handles melee attacks
	next_state = attack_state
	playback.travel(melee_attack_node)
