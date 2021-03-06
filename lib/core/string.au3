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
	$lines = split($str, @CRLF, $STR_ENTIRESPLIT)

	for $i = 0 to count($lines)-1
		aset($lines, $i, s_times('  ', $amount) & aget($lines, $i))
	Next

	$str = join($lines, @CRLF)
	return $str
EndFunc

func indent_line($str, $amount = 1)
	return indent(line($str), $amount)
EndFunc

func split($string, $delimters, $flag = 0)
	$array = StringSplit($string, $delimters, $flag)
	; make it to an 'array'
	$array[0] = 'array'

	return $array
EndFunc

func join($array, $glue)
	$result = ""

	for $i = 0 to count($array)-1
		if($i > 0) then $result &= $glue
		$result &=aget($array, $i)
	Next

	return $result
EndFunc

Func starts_with($str, $end)
	return StringLeft($str, StringLen($end)) == $end
endfunc

Func ends_with($str, $end)
	return StringRight($str, StringLen($end)) == $end
endfunc
