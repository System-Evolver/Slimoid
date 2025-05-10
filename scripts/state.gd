extends Node

class_name State

# Export variables
@export var can_move : bool = true

# Hard variables
var character : CharacterBody2D
var playback : AnimationNodeStateMachinePlayback
var next_state : State

@warning_ignore("unused_parameter")
func state_process(delta):
	pass

@warning_ignore("unused_parameter")
func state_input(event : InputEvent):
	pass

func on_enter():
	pass

func on_exit():
	pass
