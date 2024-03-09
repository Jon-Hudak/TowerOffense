extends StaticBody2D

@export var creep = preload("res://creep.tscn")
@onready var spawn_timer = $SpawnTimer

signal creep_spawning

func _process(delta):
	pass

func _on_spawn_timer_timeout():
	spawn_creep()
	
func spawn_creep():
	var new_creep = creep.instantiate()
	new_creep.global_position = global_position
	creep_spawning.emit(new_creep)
	
	
