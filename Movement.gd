extends Component

var speed: int :
	get:
		return speed
	set(value):
		if value>=0:
			speed = value 
		else:
			pass
			#print("Speed value " + str(value) + " less than zero. Assignment ignored.")
var speed_modifiers: Array = []
var modified_speed: int 
# Called when the node enters the scene tree for the first time.

func move(direction):
	get_parent().velocity = direction * modified_speed
	
	get_parent().move_and_slide()

func set_modified_speed() -> void:
	var speed_diff = 0
	for modifier in speed_modifiers:
		speed_diff += modifier.amount
		
	modified_speed = speed_diff + speed
	
		

