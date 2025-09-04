extends CharacterBody2D

@export var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
@export var player_class : PlayerClass
@export var input_component : InputComponent

# Caches the last non-zero direction for aiming purposes.
# (에임 목적으로 마지막 방향을 저장함)
# Defaults to RIGHT at the start of the game.
# (게임 시작 시 기본 방향은 오른쪽)
var facing_direction: Vector2 = Vector2.RIGHT


func _ready():
  # Use the exported player_number instead of hardcoding to PLAYER_1.
  # (1P로 하드코딩하는 대신, export된 player_number 값을 사용)
  # This allows for multiplayer support.
  # (이렇게 해야 다인용 지원 가능)
  input_component.set_player_number(player_number)


func _physics_process(delta: float) -> void:

  var direction = input_component.get_movement_vector()

  # If the player is moving, update the facing_direction.
  # (플레이어가 움직이고 있으면, 바라보는 방향을 업데이트)
  if direction != Vector2.ZERO:
    facing_direction = direction

  velocity = direction * player_class.player_class_res.speed * 500

  if input_component.is_ability_1_pressed():
    # Pass `self` (this player node) to the ability function.
    # (스킬 함수에 `self`(이 플레이어 노드)를 넘겨줌)
    player_class.use_ability_1(self)


  move_and_slide()