func array($len = 0)
	dim $array[$len]

	return $array
EndFunc

func count($array)
	return UBound($array)
EndFunc

func join($array, $glue)
	$result = ""

	for $i = 0 to count($array)-1
		if($i > 0) then $result &= $glue
		$result &= $array[$i]
	Next

	return $result
EndFunc

func split($string, $delimters, $flag = 0)
	$array = StringSplit($string, $delimters, $flag)
	shift($array)

	return $array
EndFunc

func push(byref $array, $element)
	$len = count($array)

	ReDim $array[$len + 1]

	$array[$len] = $element

	return $len + 1
EndFunc

func pop(byref $array)
	$len = count($array)
	if($len == 0) then return Null

	$element = $array[$len - 1]

	ReDim $array[$len - 1]

	return $element
EndFunc

func shift(byref $array)
	$len = count($array)
	if($len == 0) then return Null

	$element = $array[0]

	for $i = 0 to $len-2
		$array[$i] = $array[$i+1]
	Next

	redim $array[$len-1]

	return $element
EndFunc

func unshift(ByRef $array, $element)
	$len = count($array)

	redim $array[$len+1]

	for $i = $len to 1 Step -1
		$array[$i] = $array[$i - 1]
	Next

	$array[0] = $element

	return $len + 1
EndFunc