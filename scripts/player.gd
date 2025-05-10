extends CharacterBody2D

# Export variables
@export var speed : float = 300.0

# Called variables
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine

# Hard variables
var direction : Vector2 = Vector2.ZERO

func _ready():
	# Active animation_tree.
	animation_tree.active = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	@warning_ignore("shadowed_variable")
	var direction := Input.get_vector("left", "right", "up", "down")
	# Handle movement.
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

# Functions ran every physics process.
	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
	# Switchs between the idle and walk animations.
	animation_tree.set("parameters/Move/blend_position", direction.x)

func update_facing_direction():
	# Updates the sprite to align with movement direction.
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
