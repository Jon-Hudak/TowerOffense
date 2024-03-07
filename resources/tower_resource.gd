extends Resource
class_name Tower

# tower stats
@export_category("Tower Stats")
@export var fire_rate: float = 1
@export var range: int = 300

@export_category("On Hit")
# on-hit effects
@export var atk_up: float = 0
@export var def_up: float = 0
@export var speed_up: int = 0
@export var stats = {"atk":10,"def":1,"speed":100}

@export_category("Damage")
@export var damage: int = 0 #

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_damage():
	return damage

func get_buffs():
	pass
