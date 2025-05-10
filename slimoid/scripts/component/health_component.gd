extends Node2D

class_name HealthComponent

# Export variables
@export var max_health := 10.0

# Hard variables
var health : float

func _ready():
	# Ensures all entites start at their max health.
	health = max_health

func damage(attack: Attack):
	health -= attack.attack_damage
	if health <= 0:
		get_parent().queue_free()
