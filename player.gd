class_name Player
extends CharacterBody2D


signal health_depleted

const _PIXELS_PER_SECOND: int = 600
const _DAMAGE_RATE: float = 5.0
const _MIN_HEALTH: float = 0.0

var health: float = 100.0

# Override
func _physics_process(delta: float) -> void:
    var moving: Vector2 = Input.get_vector(
        "move_left",
        "move_right",
        "move_up",
        "move_down"
    )

    self.velocity = moving * _PIXELS_PER_SECOND
    self.move_and_slide()

    if self.velocity:
        %HappyBoo.play_walk_animation()
    else:
        %HappyBoo.play_idle_animation()

    var overlapping_mobs: Array[Node2D] = %HurtBox.get_overlapping_bodies()
    if overlapping_mobs.size() > 0:
        health -= _DAMAGE_RATE * overlapping_mobs.size() * delta
        %ProgressBar.value = health
        if health <= _MIN_HEALTH:
            health_depleted.emit()
