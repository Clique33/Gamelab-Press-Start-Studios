extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/map.tscn") #colocar o nome do diretório

func _on_quit_pressed() -> void:
	get_tree().quit()
