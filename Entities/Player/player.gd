class_name Player extends CharacterBody2D

const SPEED = 300.0

@onready var emoji: Sprite2D = $Emoji
@onready var bottom_sprite: Sprite2D = $BottomSprite
@onready var nickname_label: Label = $NicknameLabel

@export var is_groovin: bool = false
@export var color: Color

var time: float = 0

func _ready():
	set_color(color)


func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = direction * SPEED
	
	move_and_slide()


func set_nickname(value: String):
	nickname_label.text = value


func get_nickname() -> String:
	return nickname_label.text


func set_color(color: Color):
	self.color = color
	bottom_sprite.material.set_shader_parameter("Color", color)


func get_color() -> Color:
	return color


func set_emoji(texture: Texture2D):
	emoji.texture = texture


# groovin, baby
func _process(delta):
	time += delta
	if is_groovin:
		var groove = pow(sin(time * 7), 3) * 0.2
		for sprite in [%BottomSprite, %TopSprite]:
			sprite.scale.y = groove * -0.05 + 0.1
			sprite.position.y = groove * 20
