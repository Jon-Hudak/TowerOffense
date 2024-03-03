extends Resource
class_name Tower

# tower stats
@export var fire_rate: float = 1
@export var range: int = 300

# on-hit effects
@export var atk_up: float = 0
@export var def_up: float = 0
@export var speed_up: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
