extends Control

func _ready() -> void:
	visible = false
	$HUD.visible=false
	
func game_over()->void:
	$HUD.visible=true
	visible=true
	
func _on_restart_button_pressed() -> void:
	get_tree().paused= false
	get_tree().reload_current_scene() #colocar o nome do diretório da cena do jogo

func _on_main_menu_button_pressed() -> void:
	get_tree().quit()
