extends Node2D

const TERRAIN = preload("res://Scene/terrain.tscn")
@onready var coins = $CanvasLayer/Coins

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	coins.text = "Coins: " + str(OxygenManager.coins)

func _on_button_pressed():
	$CanvasLayer/Result.text = "Loading..."
	SceneManager.change_scene(TERRAIN)
