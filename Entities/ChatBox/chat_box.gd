extends Control

@export var player: Player

@onready var chatLog = get_node("VBoxContainer/RichTextLabel")


func add_message(text):
	chatLog.text += '\n'
	chatLog.text += '[color=' + player.get_color().to_html(false) + ']'
	chatLog.text += '[' + player.get_nickname() + ']: '
	chatLog.text += text
	chatLog.text += '[/color]'


func _on_line_edit_text_submitted(new_text):
	if new_text != '':
		add_message(new_text)
		%ChatLineEdit.text = ""
