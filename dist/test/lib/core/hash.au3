func hash()
	return array()
EndFunc

func h()
	return hash()
EndFunc

func hget_index($hash, $key)
	for $i = 0 to count($hash)-1
		$pair = $hash[$i]

		if $pair[0] == $key Then
			return $i
		EndIf
	Next

	return Null
EndFunc

func hget_key($hash, $index)
	if $index >= count($hash) then return Null
	$pair = $hash[$index]

	return $pair[0]
EndFunc

func hget_keys($hash)
	$a = a()
	for $i = 0 to count($hash)-1
		push($a, hget_key($hash, $i))
	Next

	return $a
EndFunc

func hget_value($hash, $index)
	if $index >= count($hash) then return Null
	$pair = $hash[$index]

	return $pair[1]
EndFunc

func hget_values($hash)
	$a = a()
	for $i = 0 to count($hash)-1
		push($a, hget_value($hash, $i))
	Next

	return $a
EndFunc

func hget($hash, $key, $default = Null)
	$index = hget_index($hash, $key)

	if $index <> Null then
		$pair = $hash[$index]
		return $pair[1]
	EndIf

	return $default
EndFunc

func hset(byref $hash, $key, $value)
	$index = hget_index($hash, $key)

	if $index <> Null then
		$pair = $hash[$index]
		$pair[1] = $value
		$hash[$index] = $pair

		return $hash
	EndIf

	$pair = array()
	push($pair, $key)
	push($pair, $value)

	push($hash, $pair)

	return $hash
EndFunc

func h_to_string($hash)
	$str = ''

	$str &= indent_line('{', 0)
	for $i = 0 to count($hash)-1
		$key = hget_key($hash, $i)
		$value = hget_value($hash, $i)

		$str &= indent_line($key & ': ' & $value, 1)
	Next

	$str &= indent_line('}', 0)

	return $str
EndFunc











