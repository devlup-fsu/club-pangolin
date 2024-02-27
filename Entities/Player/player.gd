class_name Player extends CharacterBody2D

const SPEED = 300.0

@onready var emoji: Sprite2D = $Emoji
@onready var bottom_sprite: Sprite2D = $BottomSprite
@onready var nickname_label: Label = $NicknameLabel


func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = direction * SPEED
	
	move_and_slide()


func set_nickname(value: String):
	nickname_label.text = value


func set_color(color: Color):
	bottom_sprite.material.set_shader_parameter("Color", color)


func set_emoji(texture: Texture2D):
	emoji.texture = texture
