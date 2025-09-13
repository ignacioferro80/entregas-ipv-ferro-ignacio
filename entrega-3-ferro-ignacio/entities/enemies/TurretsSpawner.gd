extends Node

@export var turret_scene: PackedScene

func _ready():
	call_deferred("initialize")

func initialize() -> void:
	var visible_rect: Rect2 = get_viewport().get_visible_rect()
	
	
	var turret1_instance: Node2D = turret_scene.instantiate()
	var turret1_pos: Vector2 = Vector2(2969, 189)
	add_child(turret1_instance)
	turret1_instance.initialize(self, turret1_pos, self)
	
	var turret2_instance: Node2D = turret_scene.instantiate()
	var turret2_pos: Vector2 = Vector2(3969, 189)
	add_child(turret2_instance)
	turret2_instance.initialize(self, turret2_pos, self)
	
	var turret3_instance: Node2D = turret_scene.instantiate()
	var turret3_pos: Vector2 = Vector2(4269, 189)
	add_child(turret3_instance)
	turret3_instance.initialize(self, turret3_pos, self)
