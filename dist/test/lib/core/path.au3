#include <File.au3>

func path_normalize($path, $isDir = true)
	$parts = split($path, '/\')
	$result_parts = array()

	for $i = 0 to count($parts) - 1
		if($parts[$i] == '.' or $parts[$i] == '') Then ContinueLoop
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

func path_join($a, $b)
	return path_normalize($a & '/' & $b)
EndFunc

Func is_dir($sFilePath)
	Return Int(FileExists($sFilePath) And StringInStr(FileGetAttrib($sFilePath), 'D', Default, 1) > 0)
EndFunc

Func is_file($sFilePath)
	return FileExists($sFilePath) AND not is_dir($sFilePath)
EndFunc

func list_files($path, $filter = '*', $flag = $FLTA_FILESFOLDERS, $bReturnPath = False)
	$files = _FileListToArray($path, $filter, $flag, $bReturnPath)
	shift($files)

	if $flag <> $FLTA_FILES Then
		unshift($files, '.')
		unshift($files, '..')
	EndIf

	return $files
EndFunc

func ls($path = null)
	$path = _or($path, $__PATH__)
	$files = list_files($path)

	for $i = 0 to count($files)-1
		$file = $files[$i]
		$file_path = path_join($path, $file)

		if is_dir($file_path) then
			say('Dir:' & @TAB & $file)
		Else
			say('File:' & @TAB & $file)
		EndIf
	Next
EndFunc

func cd($path)

EndFunc
