extends Control

signal dialogue_end
var _pos_in_dialogue:int = 0
var _tween :Tween = null
@export var dialogue_text_box:RichTextLabel
@export var continue_button:Button

var dialogue_1:String = "Can you help me?"
var dialogue_2:String = "I'm being attacked by these Nasty [Progress Reports]. If you could \"Handle\" them I would be grateful."

func start():
	_pos_in_dialogue = 1
	continue_button.visible = false
	typewriter_text(dialogue_1, 1.0)

#func display_dialogue_options(text_1:String, text_2:String = "", text_3:String = ""):
	#var num_option = 1
	#if text_2 != "": num_option += 1
	#if text_3 != "": num_option += 1
	#print(num_option + " number of options")
	#pass

func _input(event):
	if event.is_action_pressed("dialogue") and _tween != null and _tween.is_running():
		_tween.custom_step(20)

func _display_button():
	continue_button.visible = true
	

func typewriter_text(text: String, seconds_to_full_text:float):
	dialogue_text_box.text = text
	_tween = create_tween()
	_tween.tween_property(dialogue_text_box, "visible_ratio", 1.0, seconds_to_full_text).from(0.0)
	_tween.tween_callback(_display_button)
	

func _on_button_pressed():
	#Handle Dialogue Logic
	match _pos_in_dialogue:
		1:
			typewriter_text(dialogue_2, 3)
			_pos_in_dialogue = 2
		2:
			dialogue_end.emit()
			visible = false
