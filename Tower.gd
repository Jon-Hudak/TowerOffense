extends StaticBody2D

@export var tower_resource: Tower
@onready var collision = $CollisionShape2D
@onready var fire_rate_timer = $fire_rate_timer

var is_preview: bool = true

const projectile: PackedScene = preload("res://projectile.tscn")


@export var fire_rate: float = 0.5
@export var damage: int = 100
@export var statuses: Array[Dictionary] = [{"name":"speed","amount":100}]

signal tower_built
signal projectile_shot
# Called when the node enters the scene tree for the first time.
func _ready():
	#set_physics_process(false)
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if is_preview:
		#global_position=get_global_mouse_position()	
		#
	if $Area2D.has_overlapping_bodies():
		var target=$Area2D.get_overlapping_bodies()[0]
		if target.is_in_group("creep"):
			look_at(target.global_position)
		if fire_rate_timer.time_left <= 0:
			shoot_projectile(target)
			fire_rate_timer.start(fire_rate)


func _on_area_2d_body_entered(body):
	
	pass

func build_tower():
	is_preview=false
	set_collision_layer_value(1, true)
	set_physics_process(true)
	tower_built.emit()

func shoot_projectile(target):
	
	var new_projectile = projectile.instantiate()
	new_projectile.rotation=rotation
	new_projectile.global_position=global_position
	new_projectile.damage = damage
	new_projectile.statuses = statuses
	new_projectile.target = target
	projectile_shot.emit(new_projectile)
	
	
