extends Button
signal rollFinished

var num
var result
var price = 10
@onready var show = $"../Result"
const PLAYER = preload("res://Scene/player.tscn")
var amount

func _on_pressed():
	if OxygenManager.coins - price >= 0:
		OxygenManager.coins -= price
		print("playing")
		$AudioStreamPlayer2D.play()
		$Timer.start()
	else:
		show.text = "Not Enough Coins"
		print(str(OxygenManager.coins))


func _on_audio_stream_player_2d_finished():
	print("finished")
	
func _on_timer_timeout():
	print("looting")
	num = randf_range(0, 1)
	if num > 0.5:
		print("Common")
		result = "Common"
		amount = round(randf_range(1, 4))
		OxygenManager.add_oxygen(amount)
	elif num > 0.4:
		print("Rare")
		result = "Rare"
		amount = round(randf_range(4, 6))
		OxygenManager.add_oxygen(amount)
	elif num > 0.14:
		print("Epic")
		result = "Epic"
		amount = round(randf_range(8, 16))
		OxygenManager.add_oxygen(amount)
	elif num > 0.05:
		print("Legendary")
		result = "Legendary"
		amount = round(randf_range(16, 50))
		OxygenManager.add_oxygen(amount)
	elif num > 0.01:
		print("Mythic")
		result = "Mythic"
		amount = round(randf_range(50, 100))
		OxygenManager.add_oxygen(amount)
	
	if result == "Epic":
		show.text = "You got an " + result + " +" + str(amount) + " oxygen!"
	else:
		show.text = "You got a " + result + " +" + str(amount) + " oxygen!"
	
