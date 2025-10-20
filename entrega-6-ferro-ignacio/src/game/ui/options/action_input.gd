@tool
extends Panel

@onready var input: Label = $"HBoxContainer/Panel/Input"
@onready var action: Label = $"HBoxContainer/Action"

@export var action_input: String 
@export var action_name: String

func _ready() -> void:
	
	input.text = action_input
	action.text = action_name

func _set_action_input(inp: String) -> void:
	action_input = inp
	if Engine.is_editor_hint() && has_node("HBoxContainer/Panel/Input"):
		$"HBoxContainer/Panel/Input".text = inp

func _set_action_name(name: String) -> void:
	action_name = name
	if Engine.is_editor_hint() && has_node("HBoxContainer/Action"):
		$"HBoxContainer/Action".text = name
