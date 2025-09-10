class_name Died extends State

func enter():
  owner.is_alive = false
  owner.get_parent().velocity = Vector2.ZERO
#change sprite
#can't move
#can't cast spells
