func hash_spec()
	describe('Hash')
	it('creates an hash')
	$h = h()
	expect_equality(typeof($h), 'hash')

	it('can hold and return data')
	hset($h, 'test', 123)
	expect_equality(hhas($h, 'test'), true)
	expect_equality(hget($h, 'test'), 123)

	it('can overwrite old data (with same key)')
	hset($h, 'test', 'def')
	expect_equality(hhas($h, 'test'), true)
	expect_equality(hget($h, 'test'), 'def')

	it('can hold even more data')
	hset($h, 'city', 'paris')
	expect_equality(hhas($h, 'city'), true)
	expect_equality(hget($h, 'city'), 'paris')
	expect_equality(hhas($h, 'test'), true)
	expect_equality(hget($h, 'test'), 'def')

	it('can return all keys')
	$keys = hget_keys($h)
	expect_equality(count($keys), 2)
	expect_equality(aget($keys, 0), 'test')
	expect_equality(aget($keys, 1), 'city')

	it('can return all values')
	$values = hget_values($h)
	expect_equality(count($values), 2)
	expect_equality(aget($values, 0), 'def')
	expect_equality(aget($values, 1), 'paris')

EndFunc
