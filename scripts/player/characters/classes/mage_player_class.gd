extends PlayerClass

@export var player_class_animated_sprite2D : AnimatedSprite2D 

func _ready():
  player_class_animated_sprite2D.sprite_frames = player_class_res.player_class_sprite_frames

# The player_node parameter is passed in from the Player script.
# (player_node 파라미터는 Player 스크립트에서 넘겨받음)
func use_ability_1(player_node: CharacterBody2D) -> bool:
  
  # Find the Muzzle node within the player scene.
  # (플레이어 씬에서 Muzzle 노드를 찾음)
  var muzzle = player_node.find_child("Muzzle")
  
  # Safety check in case the Muzzle node is missing.
  # (Muzzle 노드가 없을 경우를 대비한 안전 장치)
  if not muzzle:
    printerr("Player scene is missing a 'Muzzle' node!")
    return false
  
  # Instantiate the projectile scene.
  # (발사체 씬을 인스턴스화)
  var ability_1_instance = player_class_res.ability_1_scene.instantiate()
  
  # Force the projectile to be independent of parent's movement.
  # (발사체가 부모의 움직임에 영향을 받지 않도록 독립시킴)
  # This prevents player movement from affecting projectile speed.
  # (플레이어의 움직임이 발사체 속도에 영향을 주는 것을 방지)
  ability_1_instance.top_level = true
  
  # Set the projectile's direction based on the player's facing direction.
  # (플레이어가 바라보는 방향으로 발사체 방향을 설정)
  ability_1_instance.direction = player_node.facing_direction
  
  # Let the projectile know who fired it to prevent self-collision.
  # (자기 자신과 충돌하지 않도록, 누가 쐈는지 알려줌)
  ability_1_instance.shooter = player_node
  
  # Spawn the projectile at the Muzzle's location to solve timing issues.
  # (타이밍 문제를 해결하기 위해, Muzzle의 위치에서 발사체를 생성)
  ability_1_instance.global_position = muzzle.global_position
  
  # Add the projectile to the main scene tree.
  # (생성된 발사체를 메인 씬 트리에 추가)
  get_tree().current_scene.add_child(ability_1_instance)
  
  return true


func use_ability_2(player_node: CharacterBody2D) -> bool:
  return true


func use_ability_3(player_node: CharacterBody2D) -> bool:
  return true


func use_ability_4(player_node: CharacterBody2D) -> bool:
  return true


func on_process() -> void:
  pass


func on_physics_process() -> void:
  pass