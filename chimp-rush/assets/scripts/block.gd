extends Area2D

@onready var map: Node2D = $".."

func _physics_process(delta: float) -> void:
	#var banana: int = get_tree().get_first_node_in_group(map).bananas
	if is_instance_valid(map)==true:
		
		if map.get_name()=="map":
			var velocity = -300-(5*map.bananas)
			position.x += velocity * delta
		else:
			if map.redirect().get_name()=="map":
				var velocity = -300-(5*map.redirect().bananas)
				position.x += velocity * delta
			else:
				if map.nao_redirect().get_name()=="map":
					var velocity = -300-(5*map.nao_redirect().bananas)
					position.x += velocity * delta
	else:
		print("não")

func _on_body_entered(body: Node2D) -> void:
	if map.get_name()=="map":
		map.game_over()
	else:
		if map.redirect().get_name()=="map":
			map.redirect().game_over()
		else:
			if map.nao_redirect().get_name()=="map":
				map.nao_redirect().game_over()
