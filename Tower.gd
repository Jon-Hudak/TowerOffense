extends StaticBody2D

@export var tower_resource: Tower
var is_preview: bool = true

@onready var collision = $CollisionShape2D

signal tower_built
# Called when the node enters the scene tree for the first time.
func _ready():
	#set_physics_process(false)
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if is_preview:
		#global_position=get_global_mouse_position()	
		#
	pass


func _on_area_2d_body_entered(body):
	
	if body.has_node("Hurtbox"):
		body.get_node("Hurtbox").on_hit({"damage":-100, "status":[{"name":"speed","amount":100, "duration":-1}]})
		

func build_tower():
	is_preview=false
	set_collision_layer_value(1, true)
	set_physics_process(true)
	tower_built.emit()
