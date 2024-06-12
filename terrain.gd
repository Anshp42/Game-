extends Node2D

const width = 1000
const height = 1000
@onready var bubbles = $bubbles

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var fnl = FastNoiseLite.new() 
	fnl.seed = randi_range(0, 500) 
	fnl.noise_type = FastNoiseLite.TYPE_SIMPLEX
	fnl.fractal_octaves = 2

	for x in range(width): 
		for y in range(height): 
			var noise = floor(abs(fnl.get_noise_2d(x,y)*4)) 
			if noise > 0: 
				$TileMap.set_cell(0, Vector2(x,y),0,Vector2(0,0))
	bubbles.play()



func _on_player_switching(x, y):
	var xdiff = $StartPos.position.x - x
	var ydiff = $StartPos.position.y - y
	var diff = xdiff + ydiff
	OxygenManager.coins += round(abs(diff / 100))


func _on_bubbles_finished():
	bubbles.play()

