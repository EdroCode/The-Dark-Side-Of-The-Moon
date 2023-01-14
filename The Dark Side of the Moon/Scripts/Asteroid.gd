extends KinematicBody2D

# Variáveis de controle de movimento
var speed = 0 # Velocidade atual do jato
var angle = 0 # Ângulo atual do jato
var max_speed = 10 # Velocidade máxima permitida

func _process(delta):
	# Controle de movimento
	# Se a tecla para cima estiver pressionada
	if Input.is_action_pressed("Up"): 
		# Se a velocidade atual for menor que a velocidade máxima permitida
		if speed < max_speed: 
			# Aumenta a velocidade do jato
			speed += 0.1
	# Se a tecla para baixo estiver pressionada
	if Input.is_action_pressed("Down"): 
		# Se a velocidade atual for maior que 0
		if speed > 0: 
			# Decrementa a velocidade do jato
			speed -= 0.1
	# Se a tecla para esquerda estiver pressionada
	if Input.is_action_pressed("Left"):
		# Decrementa o ângulo do jato
		angle -= 5
	# Se a tecla para direita estiver pressionada
	if Input.is_action_pressed("Right"):
		# Incrementa o ângulo do jato
		angle += 5
	
	# Atualização da posição do jato
	# Usando o método move_and_slide() para mover o jato e evitar colisões com outros objetos
	move_and_slide(Vector2(speed * math.cos(math.deg2rad(angle)), -speed * math.sin(math.deg2rad(angle))), Vector2(0,-1))
	
	# Rotação do jato
	rotation = angle
