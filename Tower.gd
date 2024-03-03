extends StaticBody2D

@export var tower_resource: Tower
var is_preview: bool = true

signal tower_built
# Called when the node enters the scene tree for the first time.
func _ready():
	
	#set_physics_process(false)

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_preview:
		global_position=get_global_mouse_position()	
		



func _on_area_2d_body_entered(body):
	if body.has_node("Hurtbox"):
		body.get_node("Hurtbox").on_hit(100)
		print("working")

func build_tower():
	is_preview=false
	set_physics_process(true)
	tower_built.emit()
