extends State

# Export variables
@export var return_state : State
@export var return_animation_node : String = "move"
@export var melee_attack_name: String = "sword_swing1"
@export var followup_melee_attack_name : String = "sword_swing2"
@export var followup_melee_attack_node : String = "sword_swing2"

# Called variables
@onready var timer: Timer = $Timer
@onready var melee_weapon : Melee


func state_input(event : InputEvent):
	if(event.is_action_pressed("melee_attack")):
		timer.start()

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if(anim_name == melee_attack_name):
		if(timer.is_stopped()):
			next_state = return_state
			#playback.travel(return_animation_node)
		else:
			#playback.travel(followup_melee_attack_node)
			pass

	if(anim_name == followup_melee_attack_name):
		next_state = return_state
		#playback.travel(return_animation_node)
