global $__PATH__

#include ".boot.au3"

; initializing goes here

func boot()
	$__PATH__ = @ScriptDir & '\'

	for $i = 1 to $CmdLine[0]
		if not startsWith($CmdLine[$i], '\') Then
			$__PATH__ = $CmdLine[$i]
			ExitLoop
		EndIf
	Next
EndFunc

func restart()
	au3_call(@ScriptFullPath, @ScriptDir)
	terminate()
EndFunc

func terminate()
	Exit
EndFunc

boot()
main(cli_setup())
