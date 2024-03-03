extends Node2D
@onready var nav_region = $NavigationRegion2D
@export var tower_scene : PackedScene
@export var selected_tower : Tower
@onready var base = $Base/Marker2D
@onready var main_nav_agent = $Marker2D/NavigationAgent2D
@onready var spawn_marker = $Marker2D
var DIRECTIONS: Array = [Vector2.UP,Vector2.DOWN,Vector2.LEFT,Vector2.RIGHT] 

# Called when the node enters the scene tree for the first time.
func _ready():
	main_nav_agent.target_position = base.global_position
	_flood_fill(Vector2.ZERO)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	print("main nav",main_nav_agent.is_target_reachable())
	if Input.is_action_just_pressed("left_click"):
		place_tower(get_global_mouse_position())

func place_tower(tower_position: Vector2):
	var existing_towers = get_tree().get_nodes_in_group("tower")
	for tower in existing_towers:
		if tower.global_position.distance_to(tower_position)<3 :
			return
	var new_tower = tower_scene.instantiate()
	new_tower.global_position = tower_position
	new_tower.tower_resource = selected_tower
	$NavigationRegion2D.add_child(new_tower)
	$NavigationRegion2D.bake_navigation_polygon()
	#if !main_nav_agent.is_target_reachable():
		#$NavigationRegion2D.remove_child(new_tower)
		#$NavigationRegion2D.bake_navigation_polygon()


func _flood_fill(cell: Vector2) -> Array:
	var array = []
	var stack = [cell]
	while !stack.size()==0 :
		print(stack)
		var current = stack.pop_back()

		var difference: Vector2 = (current - cell).abs()
		var distance: int = (difference.x + difference.y)

		array.append(current)
		for direction in DIRECTIONS:
			
			var coordinates: Vector2 = current + direction
			if coordinates in array:
				continue

			stack.append(coordinates)
	return array
