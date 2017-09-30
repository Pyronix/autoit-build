global $__PATH__

func boot()
	if $CmdLine[0] = 1 Then
		$__PATH__ = $CmdLine[1] & '/'
	Else
		$__PATH__ = @ScriptDir & '/'
	EndIf
EndFunc

Func _au3_call($sFilePath, $sWorkingDir = "", $iShowFlag = @SW_SHOW, $iOptFlag = 0)
    Return Run('"' & @AutoItExe & '" /AutoIt3ExecuteScript "' & $sFilePath & '"', $sWorkingDir, $iShowFlag, 0x10)
EndFunc   ;==>_RunAU3

Func _au3wait_call($sFilePath, $sWorkingDir = "", $iShowFlag = @SW_SHOW, $iOptFlag = 0)
    Return RunWait('"' & @AutoItExe & '" /AutoIt3ExecuteScript "' & $sFilePath & '"', $sWorkingDir, $iShowFlag, 0x10)
EndFunc   ;==>_RunAU3

Func _au3_run($sFilePath, $sWorkingDir = "")
	return Run('"C:\Program Files (x86)\AutoIt3\AutoIt3.exe" "C:\Program Files (x86)\AutoIt3\SciTE\AutoIt3Wrapper\AutoIt3Wrapper.au3" /run /prod /ErrorStdOut /in "' & $sFilePath & '" /UserParams')
EndFunc


Func main()
	_au3wait_call($__PATH__ & 'build.au3', $__PATH__)
	_au3wait_call($__PATH__ & 'compile.au3', $__PATH__)
	_au3_run($__PATH__ & '/dist/main.au3', $__PATH__)
EndFunc

boot()
main()