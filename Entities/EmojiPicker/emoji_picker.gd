extends Control

@export var player: Player

@onready var grid_container: GridContainer = $GridContainer

var emojis = Dictionary()	# Dictionary<String, Texture2D>


func _ready():
	var path = "res://Entities/EmojiPicker/Emojis/"
	for file_name in DirAccess.get_files_at(path):
		var extension: String = file_name.split(".")[-1]
		var emoji_name = file_name.substr(0, file_name.length() - extension.length() - 1)
		if extension == "svg" or extension == "png":
			emojis[emoji_name] = load(path + file_name)
			
			var emoji_button = EmojiButton.create(emoji_name, emojis[emoji_name])
			emoji_button.emoji_pressed.connect(_on_emoji_pressed)
			grid_container.add_child(emoji_button)


func _on_emoji_pressed(emoji_name: String):
	if player:
		player.set_emoji(emojis[emoji_name])


class EmojiButton extends TextureButton:
	signal emoji_pressed(emoji_name: String)
	
	static func create(name: String, texture: Texture2D) -> EmojiButton:
		var result = EmojiButton.new()
		
		result.name = name
		result.texture_normal = texture
		
		return result
	
	func _ready():
		pressed.connect(func(): emoji_pressed.emit(name))
