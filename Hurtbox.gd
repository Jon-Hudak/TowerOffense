extends Component
@export var health_component: Component
@export var status_receiver: Component

signal hit_by_attack


	

func _on_body_entered(body):
	hit_by_attack.emit({"damage":-100, "speed":300})

func on_hit(damage):
	health_component.change_health(damage)
