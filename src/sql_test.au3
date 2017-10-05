Func sql_test()
	say('----------------------')
	say('Testing sql')
	say('----------------------')
	say(sql_open(':memory:'))
	say('----------------------')
	say(sql_create_table('users', array('name', 'email', 'password')) == $SQLITE_OK)

	say('----------------------')

	$nobby = hash()
	hset($nobby, 'name', 'Nobby')
	hset($nobby, 'email', 'test@web.de')
	hset($nobby, 'password', 'super_secret_1337')

	say(sql_insert('users', $nobby) == $SQLITE_OK)

	display_accounts()

	say('----------------------')

	$max = hash()
	hset($max, 'name', 'Max')
	hset($max, 'email', 'king_of_web@web.de')
	hset($max, 'password', '1337_kink_lolz')

	say(sql_insert('users', $max) == $SQLITE_OK)

	$accounts = display_accounts()

	say('----------------------')

	$max = $accounts[1]

	hset($max, 'name', 'Marlene')
	hset($max, 'password', 'changed_password')

	say(sql_update('users', $max) == $SQLITE_OK)

	display_accounts()

	say('----------------------')

	say(sql_close())

	Return getch()
EndFunc   ;==>sql_test


func display_accounts()
	local $accounts

	say('Displaying accounts...')
	say(sql_query('SELECT ROWID, * FROM users', $accounts) == $SQLITE_OK)

	say('Accounts: ' & count($accounts))

	for $i = 0 to count($accounts)-1
		say(h_to_string($accounts[$i]))
	Next

	return $accounts
EndFunc
