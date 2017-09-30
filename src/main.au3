func preProcessInput($input)
	if $input == 'exit' then Exit
	return $input
EndFunc

func main($cli)
	while True
		say('> ' & $__PATH__)
		print('$ ')
		$in = scan()

		$args = split($in, ' ')
		$cmd = shift($args)

		switch $cmd
			case 'exit'
				Exit
			case 'q'
				Exit
			case 'cd'
				if count($args) < 1 Then
					say('No input')
				Else
					$arg = join($args, ' ')

					if not startsWith($arg, '/') Then
						$arg = $__PATH__ & $arg
					EndIf

					$__PATH__ = normalizePath($arg)
				EndIf
			case 'build'
				build()
			case 'compile'
				compile()
			case 'make'
				build()
				compile()
			case 'restart'
				au3_call(@ScriptDir & '/../start.au3', @ScriptDir & '/..')
				Exit
			case 'r'
				au3_call(@ScriptDir & '/../start.au3', @ScriptDir & '/..')
				Exit
			case 'run'
				build()
				say('Running...')
				au3_call($__PATH__ & '/.run.au3', $__PATH__)
			case 'start'
				build()
				compile()
				say('Starting...')
				au3_call($__PATH__ & '/dist/main.au3', $__PATH__)
			case 'exec'
				say(Execute(join($args, ' ')))
			case 'help'
				say('- cd' & @TAB & @TAB & '"Navigates" to dir')
				say('- build' & @TAB & @TAB & 'Builds the current dir')
				say('- compile' & @TAB & 'Compiles the current dir')
				say('- make' & @TAB & @TAB & 'Builds & Compiles the current dir')
				say('- run' & @TAB & @TAB & 'Builds the current dir & runs the uncompiled script')
				say('- start' & @TAB & @TAB & 'Makes the current dir & starts the compiled script')
				say('- restart, r' & @TAB & 'Restarts this console here (for code changes)')
				say('- exit, q' & @TAB & 'Closes the console')
				say('- exec' & @TAB & @TAB & 'Execute something (AutoIt)')
			Case Else
				say('Soory, do not know how to do "'& $cmd &'"')
				say('Run "help" to show a list of commands')
		EndSwitch

		say('')
	WEnd
Endfunc