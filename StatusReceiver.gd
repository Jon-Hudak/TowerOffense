extends Component
@export var max_health: int = 100
var health: int 
# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health


func change_health(health_diff):
	health-=health_diff #negative numbers heal
	if health>max_health:
		health=max_health

	
