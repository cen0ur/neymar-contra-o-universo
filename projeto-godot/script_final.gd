extends Node2D

func ir_para_inicio() -> void:
	get_tree().change_scene_to_file("res://cena_inicio.tscn")


func _process(_delta: float) -> void:
	if scene_file_path == "res://cena_final.tscn" and get_node_or_null("Chefao/Chefao") == null:
		set_process(false)
		get_tree().call_deferred("change_scene_to_file", "res://cena_vitoria.tscn")
