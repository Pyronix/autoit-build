Func is($something)
	if $something then return True
	return False
EndFunc

func _or($a, $b)
	if is($a) then return $a
	return $b
EndFunc
