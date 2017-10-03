func s_times($str, $times = 1)
	$result = ''
	for $i = 1 to $times
		$result &= $str
	Next

	return $result
EndFunc

func line($str)
	return $str & @CRLF
EndFunc

func indent($str, $amount = 1)
	return s_times('  ', $amount) & $str
EndFunc

func indent_line($str, $amount = 1)
	return indent(line($str), $amount)
EndFunc

func split($string, $delimters, $flag = 0)
	$array = StringSplit($string, $delimters, $flag)
	shift($array)

	return $array
EndFunc

func join($array, $glue)
	$result = ""

	for $i = 0 to count($array)-1
		if($i > 0) then $result &= $glue
		$result &= $array[$i]
	Next

	return $result
EndFunc
