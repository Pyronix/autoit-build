func cli_setup()
	dim $cli[1]

	$cli[0] = $CmdLine

	return $cli
EndFunc

func cli_param($cli, $n)

EndFunc

func print($something)
	return Cout($something)
EndFunc

func scan()
	$s = ''
	Cin($s)
	return $s
EndFunc

func say($something)
	return print($something & @CRLF)
EndFunc

func ask($something)
	say($something)
	return scan()
EndFunc
