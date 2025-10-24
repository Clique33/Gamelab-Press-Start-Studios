extends ParallaxBackground

@onready var map: Node2D = $".."

func _process(delta: float) -> void:
	if is_instance_valid(map)==true:
		if map.get_name()=="map":
			var velocity = -300-(5*map.bananas)
			scroll_offset.x += velocity * delta
		else:
			print("pois é")
	else:
		print("não")
