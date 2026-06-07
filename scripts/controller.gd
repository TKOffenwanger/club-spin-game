extends Node3D

@onready var dialogue_prompt: Node3D = $"Dialogue Area/Dialogue Prompt"
@onready var dialogue_area: Area3D = $"Dialogue Area"


func _unhandled_input(event):
	if(event.is_action("ui_accept") and dialogue_area.has_overlapping_bodies()):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/test_dialogue.dialogue"), "start")

func _on_dialogue_area_body_entered(body):
	dialogue_prompt.visible = true


func _on_dialogue_area_body_exited(body):
	dialogue_prompt.visible = false
