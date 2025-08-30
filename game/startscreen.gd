extends Control

func _ready():
	$StartButton.connect("pressed", Callable(self, "_on_start_pressed"))

func _on_start_pressed():
	# Replace "res://main.tscn" with your actual game scene
	get_tree().change_scene_to_file("res://main.tscn")
