extends Node2D

@onready var map: Node2D = $"."
@onready var map2: Node2D = $".."

func redirect()->Node2D:
	return map

func nao_redirect()->Node2D:
	return map2
