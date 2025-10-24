extends Area2D

@onready var map: Node2D = $".."



func _physics_process(delta: float) -> void:
	if is_instance_valid(map)==true:
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
	body.collected() 
	$banan.play("fade")

func _on_banan_animation_finished() -> void:
	if $banan.animation == "fade":
		queue_free()
