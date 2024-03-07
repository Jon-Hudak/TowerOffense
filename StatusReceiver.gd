extends Component

signal status_received
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func add_statuses(statuses):
	for status in statuses:
		status_received.emit(status)
