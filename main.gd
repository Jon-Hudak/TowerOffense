extends Node2D
@onready var nav_region = $NavigationRegion2D
@export var tower_scene : PackedScene
@export var selected_tower : Tower

@onready var base = $Base/Marker2D
@onready var main_nav_agent = $Marker2D/NavigationAgent2D
@onready var spawn_marker = $Marker2D
@onready var tile_map = $NavigationRegion2D/TileMap

var building_tower
var can_build_here: bool = false
var is_building: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	main_nav_agent.target_position = base.global_position
	#$Creep.target=$NavigationRegion2D/TileMap.local_to_map($Base.global_position)
	$Creep.target=base.global_position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if is_building:
		#print($Marker2D/NavigationAgent2D.is_target_reachable())
		#bake_nav()
		var tile_coords=tile_map.local_to_map(get_global_mouse_position())
		building_tower.global_position = tile_map.map_to_local(tile_coords)
		var tile:TileData=tile_map.get_cell_tile_data(0,tile_coords)
		
		
		
		
		
		if tile:
			var tile_data: bool = tile.get_custom_data("can_build")
			can_build_here = tile_data
			print(tile, " " , tile_data)
			
		if Input.is_action_just_pressed("left_click") && can_build_here:
			is_building=false
			building_tower.build_tower()
			tile.set_custom_data("can_build", false)
			

#func place_tower(tower_position: Vector2):
	#var existing_towers = get_tree().get_nodes_in_group("tower")
	#for tower in existing_towers:
		#if tower.global_position.distance_to(tower_position)<75 :
			#return
	#var new_tower = tower_scene.instantiate()
	#new_tower.global_position = tower_position
	#new_tower.tower_resource = selected_tower
	#new_tower.connect("tower_built", on_tower_built)
	#$NavigationRegion2D.add_child(new_tower)
	#bake_nav()
	#



func _on_turret_button_pressed():
	#var existing_towers = get_tree().get_nodes_in_group("tower")
	#for tower in existing_towers:
		#if tower.global_position.distance_to(tower_position)<75 :
			#return
	if is_building==true:
		return
		
	
	building_tower = tower_scene.instantiate()
	building_tower.global_position = $NavigationRegion2D/TileMap.map_to_local($NavigationRegion2D/TileMap.local_to_map(get_local_mouse_position()))
	building_tower.tower_resource = selected_tower
	$NavigationRegion2D.add_child(building_tower)
	bake_nav()
	is_building=true
func bake_nav():
	$NavigationRegion2D.bake_navigation_polygon()
	
func on_tower_built():
	is_building=false
	
func tile_is_tower_base():
	var mouse_pos = get_global_mouse_position()
	var tile_pos = $NavigationRegion2D/TileMap.local_to_map(mouse_pos)
	
	var tile_data = $NavigationRegion2D/TileMap.get_cell_tile_data(0, tile_pos)
	if tile_data:
		return tile_data.get_custom_data("tower_base")  


func _on_tower_projectile_shot(projectile):
	print(projectile)
	add_child(projectile)


func _on_creep_spawner_creep_spawning(creep):
	add_child(creep)
