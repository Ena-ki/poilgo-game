extends Projectile
class_name MageAbility1

# A specific implementation of a Projectile.
# (발사체의 특정 구현체)
# All core logic is handled by the parent Projectile class.
# (모든 핵심 로직은 부모인 Projectile 클래스가 처리함)
# This script exists for future specialization.
# (이 스크립트는 향후 특화를 위해 존재함)


# Example: Override _on_body_entered for custom impact effects.
# (예시: 커스텀 충돌 효과를 위해 _on_body_entered를 오버라이드)
#
# func _on_body_entered(body: Node) -> void:
#     # Spawn a fire explosion effect.
#     # (폭발 이펙트 생성)
#     var explosion = load("res://effects/fire_explosion.tscn").instantiate()
#     get_parent().add_child(explosion)
#     explosion.global_position = global_position
#
#     # Call the parent's function to ensure the projectile is still destroyed.
#     # (부모 함수를 호출해서 발사체 파괴 로직은 그대로 실행)
#     super(body)