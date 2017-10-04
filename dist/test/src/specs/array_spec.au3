func array_spec()
	describe('array')
	it('should creates an array with the right size')
	$a = a(999, 'test')
	expect_equality(typeof($a), 'array')
	expect_equality(count($a), 2)

	it('should be pushable')
	push($a, 'maom')
	expect_equality(count($a), 3)
	expect_equality(aget($a, 0), 999)
	expect_equality(aget($a, 1), 'test')
	expect_equality(aget($a, 2), 'maom')

	it('should be popable')
	$element = pop($a)
	expect_equality(count($a), 2)
	expect_equality(aget($a, 0), 999)
	expect_equality(aget($a, 1), 'test')
	expect_equality($element, 'maom')

	it('should be shiftable')
	$element = shift($a)
	expect_equality(count($a), 1)
	expect_equality(aget($a, 0), 'test')
	expect_equality($element, 999)

	it('should be unshiftable')
	unshift($a, 'maom')
	expect_equality(count($a), 2)
	expect_equality(aget($a, 0), 'maom')
	expect_equality(aget($a, 1), 'test')
EndFunc
