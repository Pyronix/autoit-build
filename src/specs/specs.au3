func specs()
	say('-------------------------')
	say('Running specs')

	say('########')
	say('Testing array')
	say('########')
	array_spec()

	say('########')
	say('Testing hash')
	say('########')
	hash_spec()


	say('########')
	say('Testing session')
	say('########')
	session_spec()

	say('Finished specs: ' & $_SPEC_TOTAL_SAMPLE_COUNT & ' total sample count, ' & $_SPEC_TOTAL_FAILED_COUNT & ' failed')
	say('-------------------------')
EndFunc
