#include <File.au3>

global $__PATH__

func create_require($path)
	return FileOpen($path & '/.require.au3', 10)
EndFunc

func require_line($f, $str)
	FileWriteLine($f, $str)
EndFunc

func require_file($f, $file)
	require_line($f, '#in' & 'clude "./' & $file & '"')

	return $f
EndFunc

func require_dir($f, $dir)
	require_file($f, $dir & '/.require.au3')

	return $f
EndFunc

func save_require($f)
	FileClose($f)
EndFunc

func buildDir($path)
	$path = normalizePath($path)

	say('Build: ' & $path)

	mkdir($path)

	$req = create_require($path)
	require_line($req, '#include-once')

	$files = _FileListToArray($path)

	if IsArray($files) Then
		for $i = 1 to $files[0]
			if NOT IsDir($path & '/' & $files[$i]) AND endsWith($files[$i], '.au3') Then
				if NOT startsWith($files[$i], '.') Then
					require_file($req, $files[$i])
				EndIf
			EndIf
		Next

		for $i = 1 to $files[0]
			if IsDir($path & '/' & $files[$i]) Then
				require_dir($req, $files[$i])
			EndIf
		Next
	EndIf

	save_require($req)

	return $files
EndFunc

func buildSrc($path)
	$files = buildDir($path)

	if IsArray($files) Then
		for $i = 1 to $files[0]
			if IsDir($path & '/' & $files[$i]) Then
				buildSrc($path & '/' & $files[$i])
			EndIf
		Next
	EndIf

	return $files
EndFunc

func build()
	buildDir($__PATH__ & './vendor')

	buildSrc($__PATH__ & './lib')
	buildSrc($__PATH__ & './src')
	; buildSrc($__PATH__ & './dist')

	; Todo:
	; build other stuff
	; start
EndFunc

;no-compile

#include '_shared.au3'
#include 'lib/core/array.au3'
#include 'lib/core/path.au3'

func say($something)
	ConsoleWrite($something & @CRLF)
EndFunc


func boot()
	if $CmdLine[0] = 1 Then
		$__PATH__ = $CmdLine[1] & '/'
	Else
		$__PATH__ = @ScriptDir & '/'
	EndIf
EndFunc


boot()
build()
