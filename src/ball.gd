extends RigidBody2D

var velocity: Vector2 = Vector2(300, 300)

func _ready() -> void:
	position = get_viewport_rect().size / 2
	position.y -= 100
	
	
func _physics_process(delta: float) -> void:
	var bodies = get_colliding_bodies()
	# FIXME: Contact not working fine
	print(get_contact_count())
	for body in get_colliding_bodies():
		if body.is_in_group('bricks'):
			body.queue_free()
		
	var collision_info = move_and_collide(velocity * delta * 1.5)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
