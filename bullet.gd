class_name Bullet
extends Area2D


const _SPEED: float = 1000.0
const _MAX_RANGE: float = 1200.0

var travelled_distance: float = 0.0

# Override
func _physics_process(delta: float) -> void:
    var direction: Vector2 = Vector2.RIGHT.rotated(self.rotation)
    self.position += direction * _SPEED * delta
    travelled_distance += _SPEED * delta

    if travelled_distance > _MAX_RANGE:
        self.queue_free()


# Override
func _on_body_entered(body: Node2D) -> void:
    self.queue_free()
    if body.has_method("take_damage"):
        body.take_damage()
