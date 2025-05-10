extends Area2D

class_name HitBoxComponent

# Export variables
@export var health_component : HealthComponent

func dmaage(attack: Attack):
	if health_component:
		health_component.damage(attack)
