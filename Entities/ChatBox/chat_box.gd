extends Control

@export var id: int = 1

@onready var chatLog = get_node("VBoxContainer/RichTextLabel")


@rpc("any_peer", "call_local")
func add_message(id: int, text: String):
	var player = get_node("/root/Game/Level").get_player(id)
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


func _input(event: InputEvent):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		var evLocal = make_input_local(event)
		if !Rect2(Vector2(0,0), %ChatLineEdit.size).has_point(evLocal.position):
			%ChatLineEdit.release_focus()


func is_focused() -> bool:
	return %ChatLineEdit.has_focus()
