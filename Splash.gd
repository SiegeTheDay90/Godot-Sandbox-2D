extends Node2D

func _on_start_pressed():
	get_tree().change_scene_to_file("res://level_1_platforms_test/test_level_1.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://level_2_physics_polygon_test/Test_Level_2.tscn")


func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://level_3_lighting_test/test_level_3.tscn")


func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://jam_26_v0.1/jam26_level_1.tscn")
	pass # Replace with function body.
