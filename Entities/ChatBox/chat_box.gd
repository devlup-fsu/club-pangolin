extends Control

@export var id: int

@onready var chatLog = get_node("VBoxContainer/RichTextLabel")


@rpc("any_peer", "call_local")
func add_message(id: int, text: String):
	var player = %Level.get_player(id)
	if not player:
		return

	chatLog.text += '\n'
	chatLog.text += '[color=' + player.get_color().to_html(false) + ']'
	chatLog.text += '[' + player.get_nickname() + ']: '
	chatLog.text += text
	chatLog.text += '[/color]'


func _on_line_edit_text_submitted(new_text):
	if new_text != '':
		add_message.rpc(id, new_text)
		%ChatLineEdit.text = ""
