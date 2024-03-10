extends StaticBody2D

@export var creep = preload("res://creep.tscn")
@export var base_spawn_rate: float = 5
@export var level = 1
@export var resource: CreepResource

@onready var menu_panel = $MenuPanel
@onready var popup_menu = $PopupMenu
@onready var panel_cont = $PanelCont

@onready var spawn_timer = $SpawnTimer

signal creep_spawning

func _ready():
	spawn_timer.start(get_spawn_rate())
	print(Globals.souls, "souls")
	

	
func _process(delta):
	pass
		
	

func _on_spawn_timer_timeout():
	spawn_creep()
	spawn_timer.start(get_spawn_rate())
	
func spawn_creep():
	var new_creep = creep.instantiate()
	new_creep.level = level
	new_creep.global_position = global_position
	creep_spawning.emit(new_creep)
	
	
func get_spawn_rate():
	return resource.spawn_rate/level
	
	


func upgrade_spawner():
	level+=1

func on_id_pressed(id):
	if id == 0: #0 is upgrade button
		
		upgrade_spawner()


func _on_input_event(viewport, event, shape_idx):
	if event.button_mask==1:
		panel_cont.visible=true
	



func _on_upgrade_button_pressed():
	upgrade_spawner()
