extends VBoxContainer
@export var button_resources: Array[CreepResource]

signal spawner_built
# Called when the node enters the scene tree for the first time.
func _ready():
	for button in button_resources:
		button.sprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
