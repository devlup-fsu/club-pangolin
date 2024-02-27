extends Camera2D

var time: float = 0


func _process(delta):
	time += delta
	rotation = sin(time / 2) * 0.05
