class_name SurvivorsGame
extends Node2D


const _MOB: Resource = preload("res://mob.tscn")

func spawn_mob():
    var mob: Variant = _MOB.instantiate()
    %PathFollow2D.progress_ratio = randf()
    mob.global_position = %PathFollow2D.global_position
    self.add_child(mob)


# Override
func _on_timer_timeout() -> void:
    spawn_mob()


# Override
func _on_player_health_depleted() -> void:
    %GameOver.visible = true
    self.get_tree().paused = true
