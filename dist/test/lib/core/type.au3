func typeof($var)
	if IsArray($var) Then
		if UBound($var) == 0 then return 'undefined'
		if $var[0] == 'hash' then return 'hash'
		if $var[0] == 'array' then return 'array'
		return 'undefined'
	Elseif IsString($var) Then
		return 'string'
	ElseIf IsNumber($var) Then
		return 'number'
	ElseIf IsBool($var) Then
		return 'boolean'
	EndIf

	return 'undefined'
EndFunc

func to_string($var)
	switch typeof($var)
		case 'undefined'
			return 'undefined'
		case 'hash'
			return h_to_string($var)
		case 'array'
			return a_to_string($var)
		case 'number'
			return String($var)
		case 'string'
			return "'"&String($var)&"'"
		Case Else
			return String($var)
	EndSwitch
EndFunc
