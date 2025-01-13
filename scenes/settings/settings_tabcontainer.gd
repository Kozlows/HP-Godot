extends Control

@onready var tab_container: TabContainer = $TabContainer

var currTab : int = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if currTab == 0 and Input.is_action_just_pressed("ui_left"):
		print("left end")
	if currTab == 3 and Input.is_action_just_pressed("ui_right"):
		print("right end")


func _on_tab_container_tab_selected(tab: int) -> void:
	currTab = tab
