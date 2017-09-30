func normalizePath($path, $isDir = true)
	$parts = split($path, '/\')
	$result_parts = array()

	for $i = 0 to count($parts) - 1
		if($parts[$i] == '.') Then ContinueLoop
		if($parts[$i] == '..') Then
			if(count($result_parts) > 0) Then
				pop($result_parts)
			Else
				push($result_parts, $parts[$i])
			EndIf
		Else
			push($result_parts, $parts[$i])
		EndIf
	Next

	if $isDir then
		if count($result_parts == 0) Then
			push($result_parts, '.')
			push($result_parts, '')
		ElseIf($result_parts[count($result_parts)-1] <> '') Then
			push($result_parts, '')
		EndIf
	EndIf

	return join($result_parts, '/')
EndFunc
