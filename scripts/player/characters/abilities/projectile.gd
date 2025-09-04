extends Area2D
class_name Projectile

# Base class for all projectiles.
# (모든 발사체의 부모 클래스)
# Manages common logic like movement, lifetime, and basic collision.
# (이동, 수명, 충돌 등 공통 로직 관리)

# --- Internal Properties ---
var speed: float = 300.0
var lifetime: float = 3.0 # Projectile will be destroyed after this many seconds. (이 시간(초) 후에 자동 파괴)

# Set by the node that creates the projectile.
# (발사체를 생성하는 노드가 설정해 줌)
var direction: Vector2 = Vector2.ZERO
# The entity that fired this projectile. Used to prevent self-collision.
# (발사한 주체. 자기 자신과 충돌 방지용)
var shooter: Node2D = null


func _ready() -> void:
	# Connect the collision signal to our handler.
	# (충돌 시그널을 핸들러에 연결)
	body_entered.connect(_on_body_entered)
	
	# Set up a timer to destroy the projectile when its lifetime expires.
	# (수명이 다하면 자동 파괴되도록 타이머 설정)
	var lifetime_timer = Timer.new()
	lifetime_timer.wait_time = lifetime
	lifetime_timer.one_shot = true
	lifetime_timer.timeout.connect(queue_free)
	add_child(lifetime_timer)
	lifetime_timer.start()


func _physics_process(delta: float) -> void:
	# Standard projectile movement.
	# (기본적인 발사체 이동)
	position += direction * speed * delta


func _on_body_entered(body: Node) -> void:
	# Ignore collision with the entity that fired this projectile.
	# (발사한 주체와의 충돌은 무시)
	if body == shooter:
		return

	# By default, the projectile is destroyed on any impact.
	# (기본적으로는 어떤 물체든 부딪히면 파괴됨)
	# This can be overridden in child classes for custom effects (e.g. explosions).
	# (자식 클래스에서 이 함수를 오버라이드해서 폭발 같은 커스텀 효과 가능)
	queue_free()
