extends Control

@onready var chatLog = get_node("VBoxContainer/RichTextLabel")
@onready var inputLabel = get_node("VBoxContainer/HBoxContainer/Label")
@onready var inputField = get_node("VBoxContainer/HBoxContainer/LineEdit")

var groups = [
	{'name': 'Team', 'color': '#34c5f1'},
	{'name': 'Match', 'color': '#f1c234'},
	{'name': 'Global', 'color': '#ffffff'}
]

var group_index = 0
var username = "brownbookcover"

# Called when the node enters the scene tree for the first time.
func _ready():
	change_group(0)

func _process(_delta):
	if Input.is_action_just_pressed("chat"):
		inputField.grab_focus()
	if Input.is_action_just_pressed("release"):
		inputField.release_focus()
	if Input.is_action_just_pressed("switch_teams (MIGHT NOT BE USED)"):
		change_group(1)

func change_group(value):
	group_index += value
	if group_index > (groups.size() - 1):
		group_index = 0
	inputLabel.text = '[' + groups[group_index]['name'] + ']'
	inputLabel.set('theme_override_colors/font_color', Color(groups[group_index]['color']))
	

func add_message(username, text, group = 0):
	chatLog.text += '\n'
	chatLog.text += '[color=' +groups[group]['color'] + ']'
	chatLog.text += '[' + username + ']: '
	chatLog.text += text
	chatLog.text += '[/color]'
	'''
	Make the text in users color instead of teams like the tutorial did????
	chatLog.text += '\n'
	chatLog.text += '[' + username + ']: '
	chatLog.text += text
	chatLog.text += '[color= green] test [/color]'
	'''

func _on_line_edit_text_submitted(new_text):
	if new_text != '':
		print(new_text)
		add_message(username, new_text, group_index)
		inputField.text = ""
