extends StaticBody2D

@export var tower_resource: Tower

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.has_node("Hurtbox"):
		body.get_node("Hurtbox").on_hit(100)
		print("working")
