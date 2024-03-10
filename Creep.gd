extends CharacterBody2D


@onready var base= $"../Base/Marker2D"

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D 
@export var resource: CreepResource
@export var speed: float = 300
@export var max_health: int = 100
@export var attack_rate: float = 1.0
@export var damage: int = 20
@export var target: Vector2
@export var level: int = 1

@onready var movement = $Movement
@onready var hurtbox = $Hurtbox
@onready var attack = $Attack
@onready var pathfinding = $Pathfinding
@onready var health = $Health
@onready var status_receiver = $StatusReceiver




func _ready():
	target=base.global_position
	$Icon2.texture=resource.sprite
	make_path()
	
	initialize_stats()
	
	
	
func _physics_process(_delta) ->void:
	$RayCast2D.target_position = to_local(target)
	
	
	#var direction = get_global_mouse_position().normalized()
	var direction = Vector2.ZERO
	
	if global_position.distance_to(target)>16:
		direction = to_local(nav_agent.get_next_path_position()).normalized()
		
	movement.move(direction)
	
func make_path() -> void:
	nav_agent.target_position = target


func _on_timer_timeout():
	make_path()
	
func tower_shot(effect):
	pass

func initialize_stats():
	health.initialize_health(resource.max_health + (20*level))
	movement.speed=resource.speed
	movement.set_modified_speed()


func _on_status_receiver_status_received(status):
	match status.name:
		"speed":
			movement.speed_modifiers.push_back(status)
			movement.set_modified_speed()
			
			


func _on_health_health_depleated():
	queue_free()
