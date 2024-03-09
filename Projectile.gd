extends Area2D
@export var speed: int = 800
var target: CharacterBody2D

var damage: int
var statuses: Array[Dictionary]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var direction = Vector2.RIGHT.rotated(rotation)
	if target:
		direction = global_position.direction_to(target.global_position)
	position += direction * speed * delta


func _on_body_entered(body):
	if body.has_node("Hurtbox"):
		body.get_node("Hurtbox").on_hit(damage, statuses)
		queue_free()
