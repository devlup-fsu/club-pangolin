extends Control

@export var player: Player

@onready var chatLog = get_node("VBoxContainer/RichTextLabel")
@onready var inputLabel = get_node("VBoxContainer/HBoxContainer/Label")
@onready var inputField = get_node("VBoxContainer/HBoxContainer/LineEdit")

func _process(_delta):
	if Input.is_action_just_pressed("chat"):
		inputField.grab_focus()
	if Input.is_action_just_pressed("release"):
		inputField.release_focus()

func set_player(player: Player):
	self.player = player
	inputLabel.text = player.get_nickname()
	inputLabel.set('theme_override_colors/font_color', player.get_color().to_html(false))

func add_message(text):
	chatLog.text += '\n'
	chatLog.text += '[color=' + player.get_color().to_html(false) + ']'
	chatLog.text += '[' + player.get_nickname() + ']: '
	chatLog.text += text
	chatLog.text += '[/color]'
	#Make the text in users color instead of teams like the tutorial did????


func _on_line_edit_text_submitted(new_text):
	if new_text != '':
		print(new_text)
		add_message(new_text)
		inputField.text = ""
