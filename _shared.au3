Func au3_call($sFilePath, $sWorkingDir = "")
    Return Run('"' & @AutoItExe & '" /AutoIt3ExecuteScript "' & $sFilePath & '"', $sWorkingDir, @SW_SHOW, 0x10)
EndFunc   ;==>_RunAU3

Func au3wait_call($sFilePath, $sWorkingDir = "")
    Return RunWait('"' & @AutoItExe & '" /AutoIt3ExecuteScript "' & $sFilePath & '"', $sWorkingDir, @SW_SHOW, 0x10)
EndFunc   ;==>_RunAU3

Func au3_run($sFilePath, $sWorkingDir = "")
	return Run('"C:\Program Files (x86)\AutoIt3\AutoIt3.exe" "C:\Program Files (x86)\AutoIt3\SciTE\AutoIt3Wrapper\AutoIt3Wrapper.au3" /run /prod /ErrorStdOut /in "' & $sFilePath & '" /UserParams')
EndFunc

func mkdir($folder)
	DirCreate($folder)
EndFunc   ;==>mkdir

Func IsDir($sFilePath)
	Return Int(FileExists($sFilePath) And StringInStr(FileGetAttrib($sFilePath), 'D', Default, 1) > 0)
EndFunc   ;==>IsDir

Func IsFile($sFilePath)
	return FileExists($sFilePath) AND not IsDir($sFilePath)
EndFunc

Func startsWith($str, $end)
	return StringLeft($str, StringLen($end)) == $end
endfunc

Func endsWith($str, $end)
	return StringRight($str, StringLen($end)) == $end
endfunc
