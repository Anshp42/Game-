extends CharacterBody2D
signal switching
var speed = 200
var angular_speed = PI * 2
var startOxygen = OxygenManager.startoxy
var oxygen
var coins
@onready var oxygenLabel = $OxygenLabel
@onready var CoinsLabel = $CoinsLabel
const SHOP = preload("res://Scene/shop.tscn")

func _ready():
	oxygen = startOxygen
	$Timer.start()

func _process(delta):
	CoinsLabel.text = "Coins: " + str(OxygenManager.coins)
	if Input.is_action_pressed("restart"):
		oxygen = 0
		print("Switching")
		SceneManager.change_scene(SHOP)
	
	
	
	oxygenLabel.text = "Oxygen: " + str(oxygen)
	var direction = 0
	if Input.is_action_pressed("left"):
		direction = -1
	if Input.is_action_pressed("right"):
		direction = 1

	rotation += angular_speed * direction * delta

	var velocity = Vector2.ZERO
	if Input.is_action_pressed("forward"):
		velocity = Vector2.UP.rotated(rotation) * speed

	position += velocity * delta


func _on_timer_timeout():
	print("Timeout")
	oxygen -= 1
	print(str(oxygen))
	if oxygen <= 0:
		print("Switching")
		switching.emit(self.position.x, self.position.y)
		#OxygenManager.coins += $Marker2D.position / 100
		SceneManager.change_scene(SHOP)
	else:
		print("Starting")
		$Timer.start()
