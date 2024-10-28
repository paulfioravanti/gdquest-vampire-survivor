class_name Gun
extends Area2D


const _BULLET: Resource = preload("res://bullet.tscn")

func shoot():
    var new_bullet: Variant = _BULLET.instantiate()
    new_bullet.global_position = %ShootingPoint.global_position
    new_bullet.global_rotation = %ShootingPoint.global_rotation
    %ShootingPoint.add_child(new_bullet)


# Override
func _physics_process(_delta: float) -> void:
    var enemies_in_range: Array[Node2D] = self.get_overlapping_bodies()

    if enemies_in_range.size() > 0:
        var target_enemy: Node2D = enemies_in_range.front()
        self.look_at(target_enemy.global_position)


# Override
func _on_timer_timeout() -> void:
    shoot()
