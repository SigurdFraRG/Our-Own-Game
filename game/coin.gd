extends Area2D

signal collected

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	emit_signal("collected") # notify the spawner
	queue_free() # remove this coin
