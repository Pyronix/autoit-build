#include <File.au3>
#include <Array.au3>

global $__PATH__

func findIncludes($str)
	return StringRegExp($str, "\#in" & "clude *['" & '"' & "]([^'" & '"' & "]*)['" & '"' & "]", $STR_REGEXPARRAYGLOBALFULLMATCH )
EndFunc

func filesDir($file)
	$parts = StringSplit($file, '\/')
	if $parts[0] < 2 then return '.'

	$dir = $parts[1]
	for $i = 2 to $parts[0]-1
		$dir &= '/' & $parts[$i]
	Next

	return $dir
EndFunc

func loadFile($file)
	$path = $file

	$f = FileOpen($file)
	$raw = FileRead($f)
	FileClose($f)

	return $raw
EndFunc

func trimNoCompile($str)
	return StringRegExpReplace($str, ";" & "no-compile([^.]|[.])*", '')
endfunc


func compileFile($file)
	$file = normalizePath($file, false)

	say('Compiling File: ' & $file)

	$raw = trimNoCompile(loadFile($file))

	$path = filesDir($file)
	$includes = findIncludes($raw)

	if IsArray($includes) then
		for $i = 0 to UBound($includes)-1
			$include = $includes[$i]

			$full = $include[0]
			$include_path = $include[1]

			if not startsWith($include_path, '/') Then
				$include_path = $path & '/' & $include_path
			endif

			$raw = StringReplace($raw, $full, compileFile($include_path), 1)
		Next
	EndIf

	return $raw
EndFunc

func compile()
	$fileData = compileFile($__PATH__ & '.run.au3')

	mkdir($__PATH__ & 'dist')

	$f = FileOpen($__PATH__ & 'dist/main.au3', 10)
	FileWrite($f, $fileData)
	FileClose($f)
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
compile()