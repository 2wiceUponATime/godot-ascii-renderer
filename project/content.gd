extends SubViewport

func _process(delta: float) -> void:
	$Icon.rotate(delta * PI)
