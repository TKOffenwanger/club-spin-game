extends Node3D

@onready var dialogue_prompt: Node3D = $"Dialogue Area/Dialogue Prompt"
@onready var dialogue_area: Area3D = $"Dialogue Area"
@export var dialogue_UI: Control
@export var player_character: CharacterBody3D
var _game_state = 1 #1 play, 2 dialogue


func _input(event):
	if(_game_state == 1 and event.is_action_pressed("dialogue") and dialogue_area.has_overlapping_bodies()):
		#print("Start Dialogue")
		_game_state = 2
		player_character.set_process_input(false)
		player_character.set_physics_process(false)
		dialogue_UI.visible = true
		dialogue_UI.start()

func _on_dialogue_area_body_entered(body):
	dialogue_prompt.visible = true
func _on_dialogue_area_body_exited(body):
	dialogue_prompt.visible = false

func _on_dialogue_ui_dialogue_end():
	_game_state = 1
	player_character.set_process_input(true)
	player_character.set_physics_process(true)
	print("End Dialogue")
	#Re-enable player control
