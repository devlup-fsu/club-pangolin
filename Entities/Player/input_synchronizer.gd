extends MultiplayerSynchronizer

@export var direction: Vector2


func _ready():
	set_process(get_multiplayer_authority() == multiplayer.get_unique_id())


func _process(_delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
