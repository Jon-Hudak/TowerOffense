extends CharacterBody2D

@onready var base= $"../Base/Marker2D"

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D 
@export var speed: float = 300
@export var max_health: int = 100
@export var attack_rate: float = 1.0
@export var damage: int = 20



func _ready():
	make_path()
	$Health.set_health(max_health)
	print($Health.health)
	
func _physics_process(_delta) ->void:
	$RayCast2D.target_position = to_local(base.global_position)
	
	
	#var direction = get_global_mouse_position().normalized()
	var direction = Vector2.ZERO
	
	if $RayCast2D.is_colliding():	
		direction = to_local(nav_agent.get_next_path_position()).normalized()
		
	else:
		direction = global_position.direction_to(base.global_position)
	
	velocity = direction * speed
	
	move_and_slide()
	
func make_path() -> void:
	nav_agent.target_position = base.global_position


func _on_timer_timeout():
	make_path()
	
func tower_shot(effect):
	pass


func _on_hurtbox_hit_by_attack(attack_info):
	$Health.change_health(attack_info.damage)
