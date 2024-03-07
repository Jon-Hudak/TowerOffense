extends Component
@export var health_component: Component
@export var status_receiver: Component

signal hit_by_attack


	

#func _on_body_entered(body):
	#hit_by_attack.emit({"damage":-100, "speed":300})
	#if health_component:
		#health_component.change_health()

func on_hit(data):
	health_component.change_health(data.damage)
	status_receiver.add_statuses(data.status)
	
