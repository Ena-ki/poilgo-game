class_name PlayerClass
extends Node2D

@export var player_class_res : PlayerClassRes
 
# [함수 시그니처 수정]
# 스킬을 사용하는 주체(플레이어 노드)의 정보를 받아올 수 있도록
# 모든 스킬 함수에 player_node 파라미터를 추가합니다.

func use_ability_1(player_node: CharacterBody2D) -> bool:
  return true


func use_ability_2(player_node: CharacterBody2D) -> bool:
  return true


func use_ability_3(player_node: CharacterBody2D) -> bool:
  return true


func use_ability_4(player_node: CharacterBody2D) -> bool:
  return true
