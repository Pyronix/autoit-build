$_SESSIONS_ = h()

func new_session($key, $connect, $session)
	$sub_hash = hash()
	hset($sub_hash, 'connect', $connect)
	hset($sub_hash, 'session', $session)

	hset($_SESSIONS_, $key, $sub_hash)
EndFunc

func has_session($key)
	return hhas($_SESSIONS_, $key)
EndFunc

func get_session($key)
	return hget($_SESSIONS_, $key)
EndFunc

func get_session_connect($key)
	$session = get_session($key)
	if $session == null then return Null
	return hget($session, 'connect')
EndFunc

func get_session_session($key)
	$session = get_session($key)
	if $session == null then return Null
	return hget($session, 'session')
EndFunc
