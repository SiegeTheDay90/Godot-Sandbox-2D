extends Node2D

func _on_start_pressed():
	get_tree().change_scene_to_file("res://test_level_1/test_level_1.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://test_level_2/Test_Level_2.tscn")
