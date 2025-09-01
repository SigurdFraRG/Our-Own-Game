extends Node2D

@export var coin_scene: PackedScene
@export var spawn_area: Rect2 = Rect2(Vector2(50,50), Vector2(1000, 550))
@onready var counter_label: Label = $CanvasLayer/Label
var coins_collected = 0

func _ready():
	_spawn_new_coin()
	$Music.play()

func _spawn_new_coin():
	if coin_scene:
		var new_coin = coin_scene.instantiate()
		var spawn_pos = Vector2(
			randi_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
			randi_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
		)
		new_coin.position = spawn_pos
		
		new_coin.connect("collected", Callable(self, "_on_coin_collected"))

		add_child(new_coin)
	else:
		push_error("coin_scene not set in Inspector!")

func _on_coin_collected():
	coins_collected += 1
	counter_label.text = "Coins Collected: %d" % coins_collected
	$"coinsound".play()
	_spawn_new_coin()
