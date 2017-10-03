#include <Array.au3>

func main($cli)
	say('Starting in: ' & @ScriptDir)
	say('Working in: ' & $__PATH__)
	return sql_test()

	while True
		say('> ' & $__PATH__)
		print('$ ')
		$in = scan()

		$args = split($in, ' ')
		$cmd = shift($args)

		do_action($cmd, $args)
	WEnd
EndFunc

func do_action($cmd, $args)
	switch $cmd
		case 'exit'
			terminate()
		case 'q'
			terminate()
		case 'restart'
			restart()
		case 'r'
			restart()
		case 'ls'
			ls()
		case 'cd'
			say('Not implemented')
		case 'exec'
			say('Not implemented')
		case 'test'
			say(1 or 2)
		case 'help'
			say('- cd' & @TAB & @TAB & '"Navigates" to dir')
			say('- ls' & @TAB & @TAB & 'Lists folders in current dir')
			say('- restart, r' & @TAB & 'Restarts this console here (for code changes)')
			say('- exit, q' & @TAB & 'Closes the console')
			say('- exec' & @TAB & @TAB & 'Execute something (AutoIt)')
		Case Else
			say('Soory, do not know how to do "'& $cmd &'"')
			say('Run "help" to show a list of commands')
	EndSwitch

	say('')
EndFunc

