$_SPEC_SAMPLE_COUNT_ = 0

$_SPEC_TOTAL_SAMPLE_COUNT = 0
$_SPEC_TOTAL_FAILED_COUNT = 0

func describe($block)
	say($block)
	$_SPEC_SAMPLE_COUNT_ = 0
EndFunc

func it($does)
	say(indent('it ' & $does, 1))
	$_SPEC_SAMPLE_COUNT_ = 0
EndFunc

func log_spec_result($result)
	say(indent($_SPEC_SAMPLE_COUNT_ & ': ' & $result, 2))
	$_SPEC_SAMPLE_COUNT_ += 1
	$_SPEC_TOTAL_SAMPLE_COUNT += 1
EndFunc

func expect_equality($a, $b)
	if $a == $b then return log_spec_result('pass')
	$_SPEC_TOTAL_FAILED_COUNT += 1
	return log_spec_result('failed')
EndFunc

func expect_equal($a, $b)
	return expect_equality($a, $b)
EndFunc

func expect_not_equal($a, $b)
	if $a <> $b then return log_spec_result('pass')
	$_SPEC_TOTAL_FAILED_COUNT += 1
	return log_spec_result('failed')
EndFunc
