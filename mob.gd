class_name Mob
extends CharacterBody2D


const _SMOKE_SCENE: Resource = preload(
    "res://smoke_explosion/smoke_explosion.tscn"
)
const _MOB_VELOCITY: float = 300.0

var health: int = 3

@onready var player: Node = self.get_node("/root/Game/Player")

func take_damage():
    health -= 1
    %Slime.play_hurt()

    if health == 0:
        self.queue_free()

    var smoke: Variant = _SMOKE_SCENE.instantiate()
    self.get_parent().add_child(smoke)
    smoke.global_position = self.global_position


# Override
func _ready() -> void:
    %Slime.play_walk()


# Override
func _physics_process(_delta: float) -> void:
    var direction: Vector2 = global_position.direction_to(player.global_position)
    self.velocity = direction * _MOB_VELOCITY
    self.move_and_slide()
