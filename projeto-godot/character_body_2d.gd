extends CharacterBody2D

var direcao_inimigo = 1

func _process(delta: float) -> void:
	
	velocity.y += 20
	move_and_slide()
	
	
	
	if $RayCast2D.get_collider()!=null && $RayCast2D.get_collider().name == "Personagem":
		$AnimationPlayer.play("atacando")
	else:
		$AnimationPlayer.play("parado")
	
	#get_tree().root.print_tree()
	var personagem = get_tree().root.get_node("Fase/Jogador/Personagem")	
	var personagem_pos_x = personagem.global_position.x
	
	if global_position.x < personagem_pos_x:
		$Monica.flip_h = false
		$Marker2D.position.x = abs($Marker2D.position.x)
		direcao_inimigo = 1
	else:
		$Monica.flip_h = true
		$Marker2D.position.x = -abs($Marker2D.position.x)
		direcao_inimigo = -1


func atirar_cartao():
	var cena_coelho = preload("res://cena_coelho.tscn")
	var obj_coelho  = cena_coelho.instantiate()
	get_parent().add_child(obj_coelho)
	obj_coelho.get_node("CharacterBody2D").direcao = direcao_inimigo
	obj_coelho.global_position = $Marker2D.global_position
	
