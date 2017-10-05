func session_spec()
	describe('Session')
	it('allows us to add and retrieve a session')

	new_session('nobby.eta.s1', 'connect_no', 'session_no') ; creates a sesson hash inside a global $_SESSIONS_ hash {key => {connect => connect, session => session}}

	expect_equal(has_session('nobby.eta.s1'), true)

	; access with getter
	expect_equal(get_session_connect('nobby.eta.s1'), 'connect_no')
	expect_equal(get_session_session('nobby.eta.s1'), 'session_no')

	; access via hash
	$session_hash = get_session('nobby.eta.s1') ; get a session hash

	expect_not_equal($session_hash, null)
	expect_equal(hget($session_hash, 'connect'), 'connect_no')
	expect_equal(hget($session_hash, 'session'), 'session_no')

	it('allows us to overwrite a previous session')

	new_session('nobby.eta.s1', 'number2', 'number3')

	; access with getter
	expect_equal(get_session_connect('nobby.eta.s1'), 'number2')
	expect_equal(get_session_session('nobby.eta.s1'), 'number3')
EndFunc
