extends Control

@onready var keybinds : Keybinds = preload("res://scripts/keybinds.tres")

const configPath : String = "user://config.cfg"

func load_config() -> void:
	var config = ConfigFile.new()
	
	if config.load(configPath) != OK:
		print("Something went wrong when loading file")
	elif not config.get_sections():
		print("File is empty")
		config = default_config(config)  # set config to default values
	else:
		print("Succeeded in loading file")
	
	print(config.get_sections())
	setup_settings(config)


func default_config(configFile : ConfigFile) -> ConfigFile:
	# configure default options here
	configFile.set_value("Test", "testKey", "testValue")
	configFile.save(configPath)
	return configFile
	

func setup_settings(configFile : ConfigFile) -> void:
	# get all the values from the config, and display them under the
	# corresponding tabs
	pass

func _ready() -> void:
	load_config()
	$MarginContainer/Options/Back.grab_focus()



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
