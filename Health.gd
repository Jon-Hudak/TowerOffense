extends Component
var max_health: int 
var health: int 

signal health_depleated
# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health
	print(health, "/", max_health)


func change_health(health_diff: int):
	health-=health_diff #negative numbers heal
	if health>max_health:
		health=max_health
	if health<=0:
		health_depleated.emit()
	
func set_max_health(new_max: int):
	max_health = new_max
	
	
func set_health(new_health: int):
	health = new_health if new_health<=max_health else max_health
	
func change_max_health(diff):
	max_health+=diff
	health+=diff

func initialize_health(num):
	max_health = num
	health = num
	

