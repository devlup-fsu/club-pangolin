extends MultiplayerSynchronizer

@export var direction: Vector2


func _ready():
	set_process(get_multiplayer_authority() == multiplayer.get_unique_id())


func _process(_delta):
	if get_node("/root/Game/UserInterface/ChatBox").is_focused():
		direction = Vector2.ZERO
	else:
		direction = Input.get_vector("player_left", "player_right", "player_up", "player_down")
