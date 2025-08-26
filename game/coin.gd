extends Area2D
# Reference to the collectible scene itself (so we can respawn it)
@export var coin_scene: PackedScene
# Area where collectibles can spawn
@export var spawn_area: Rect2 = Rect2(Vector2.ZERO, Vector2(1000, 600))

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
		queue_free() # remove current collectible
		_spawn_new_coin()

func _spawn_new_coin():
	if coin_scene:
		var new_one = coin_scene.instantiate()
		var spawn_pos = Vector2(
			randi_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
			randi_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
		)
		new_one.position = spawn_pos
		get_tree().current_scene.add_child(new_one)
