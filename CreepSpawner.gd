extends StaticBody2D

@export var creep = preload("res://creep.tscn")
@export var base_spawn_rate: float = 5
@export var level = 1
@onready var menu_panel = $MenuPanel
@onready var popup_menu = $PopupMenu

@onready var spawn_timer = $SpawnTimer

signal creep_spawning

func _ready():
	spawn_timer.start(get_spawn_rate())
	popup_menu.connect("id_pressed", on_id_pressed)

	
	
func _process(delta):
	
	pass
	

func _on_spawn_timer_timeout():
	spawn_creep()
	spawn_timer.start(get_spawn_rate())
	
func spawn_creep():
	var new_creep = creep.instantiate()
	new_creep.global_position = global_position
	creep_spawning.emit(new_creep)
	
func get_spawn_rate():
	return base_spawn_rate/level
	
	


func _on_upgrade_button_pressed():
	level+=1



func _on_input_event(viewport, event, shape_idx):
	if event.button_mask == 1:
		menu_panel.set_visible(true)

func on_id_pressed(id):
	print(id)
