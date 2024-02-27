class_name Player extends CharacterBody2D

const SPEED = 300.0

@onready var emoji: Sprite2D = $Emoji


func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = direction * SPEED
	
	move_and_slide()


func set_emoji(texture: Texture2D):
	emoji.texture = texture
