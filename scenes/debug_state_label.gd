extends Label

@export var state_machine : CharacterStateMachine

@warning_ignore("unused_parameter")
func _process(delta):
	text = "State : " + state_machine.current_state.name
