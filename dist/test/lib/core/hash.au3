func hash()
	return _a_create('hash')
EndFunc

func h()
	return hash()
EndFunc

func hget_index($hash, $key)
	for $i = 0 to count($hash)-1
		$pair = aget($hash, $i)

		if aget($pair, 0) == $key Then
			return $i
		EndIf
	Next

	return Null
EndFunc

func hget_key($hash, $index)
	if $index >= count($hash) then return Null
	$pair = aget($hash, $index)

	return aget($pair, 0)
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
	$pair = aget($hash, $index)

	return aget($pair, 1)
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
		$pair = aget($hash, $index)
		return aget($pair, 1)
	EndIf

	return $default
EndFunc

func hset(byref $hash, $key, $value)
	$index = hget_index($hash, $key)

	if $index <> Null then
		$pair = aget($hash, $index)
		aset($pair, 1, $value)
		aset($hash, $index, $pair)

		return $hash
	EndIf

	$pair = array()
	push($pair, $key)
	push($pair, $value)

	push($hash, $pair)

	return $hash
EndFunc

func hhas($hash, $key)
	return hget_index($hash, $key) <> Null
EndFunc

func h_to_string($hash)
	$str = ''

	$str &= indent_line('{', 0)
	$entries = a()

	for $i = 0 to count($hash)-1
		$key = hget_key($hash, $i)
		$value = to_string(hget_value($hash, $i))

		push($entries, indent($key & ': ' & $value, 1))
	Next

	$str &= join($entries, ',' & @CRLF) & @CRLF

	$str &= indent('}', 0)

	return $str
EndFunc











