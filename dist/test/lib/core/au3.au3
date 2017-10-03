Func au3_call($sFilePath, $sWorkingDir = "")
    Return Run('"' & @AutoItExe & '" /AutoIt3ExecuteScript "' & $sFilePath & '"', $sWorkingDir, @SW_SHOW, 0x10)
EndFunc   ;==>_RunAU3

Func au3wait_call($sFilePath, $sWorkingDir = "")
    Return RunWait('"' & @AutoItExe & '" /AutoIt3ExecuteScript "' & $sFilePath & '"', $sWorkingDir, @SW_SHOW, 0x10)
EndFunc   ;==>_RunAU3