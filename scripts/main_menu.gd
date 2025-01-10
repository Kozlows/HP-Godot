extends Control

func _ready() -> void:
	$MarginContainer/VBoxContainer/Host.grab_focus()

func _on_host_pressed() -> void:
	print("Start Hosting")
	#get_tree().change_scene_to_file("res://scenes/game.tscn")



func _on_join_pressed() -> void:
	print("Ask for ip")
	#get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")



func _on_quit_pressed() -> void:
	get_tree().quit()
