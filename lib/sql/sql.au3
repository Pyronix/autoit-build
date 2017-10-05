#include <SQLite.au3>

$_SQL_STARTED_ = False
$_SQL_VERBOSE_ = True

func sql_startup()
	if not $_SQL_STARTED_ then
		$sSQliteDll = _SQLite_Startup()
		if @error <> 0 then
			if $_SQL_VERBOSE_ then say('"SQLite3.dll failed to load" (' & @error & ')')
			return False
		EndIf

		$_SQL_STARTED_ = True

		if $_SQL_VERBOSE_ then say('"SQLite3.dll loaded" ' & $sSQliteDll & " (" & _SQLite_LibVersion() & ")")

		return True
	EndIf

	return False
EndFunc

func sql_shutdown()
	if $_SQL_STARTED_ then
		_SQLite_Shutdown()
		if @error <> 0 then
			if $_SQL_VERBOSE_ then say('"SQLite3.dll failed to unload" (' & @error & ')')
			return False
		EndIf

		$_SQL_STARTED_ = False

		if $_SQL_VERBOSE_ then say('SQLite3.dll unloaded')

		return True
	EndIf

	return False
EndFunc

func sql_open($path)
	sql_startup()
	Return _SQLite_Open($path)
EndFunc

func sql_close($handle = -1)
	$result = _SQLite_Close($handle)
	if $result <> $SQLITE_OK then return $result

	return sql_shutdown()
EndFunc

func sql_sanitize($str)
	; ToDo
	return $str
EndFunc

func sql_safe_insert($query, $params = Null)
	if $params <> Null Then
		for $i = 0 to count($params)-1
			;$query = StringFormat($query, $params[$i])
			$query = StringReplace($query, '%s', $params[$i], 1)
		Next
	EndIf

	return $query
EndFunc

func sql_exec($query, $handle = -1, $callback = '')
	if $_SQL_VERBOSE_ then say('Query: ' & $query)
	return _SQLite_Exec($handle, $query, $callback)
EndFunc

func sql_create_table($name, $columns, $handle = -1)
	$col_query = join(a_times('%s', count($columns)), ', ')
	$col_query = sql_safe_insert($col_query, $columns)

	return sql_exec(sql_safe_insert('CREATE TABLE %s (%s);', a($name, $col_query)), $handle)
EndFunc

func sql_insert($table, $record, $handle = -1)
	$column_sql = join(a_times('%s', count($record)), ',')
	$value_sql = join(a_times("'%s'", count($record)), ',')

	$column_sql = sql_safe_insert($column_sql, hget_keys($record))
	$value_sql = sql_safe_insert($value_sql, hget_values($record))

	return sql_exec(sql_safe_insert('INSERT INTO %s (%s) VALUES (%s)', a($table, $column_sql, $value_sql)), $handle)
EndFunc

func sql_update($table, $record, $handle = -1)
	$rowid = hget($record, 'rowid')
	$set_sql = join(a_times('%s', count($record)-1), ', ')

	$sets = a()

	for $i = 0 to count($record)-1
		$key = hget_key($record, $i)
		if $key == 'rowid' then ContinueLoop

		$value = hget_value($record, $i)

		push($sets, sql_safe_insert("%s = '%s'", a($key, $value)))
	Next

	$set_sql = sql_safe_insert($set_sql, $sets)

	return sql_exec(sql_safe_insert('UPDATE %s SET %s WHERE rowid = %s', a($table, $set_sql, $rowid)), $handle)
EndFunc

func sql_query($query, byref $records, $handle = -1)
	local $hQuery, $keys, $aRow

	if $_SQL_VERBOSE_ then say('Query: ' & $query)

	$status = _SQLite_Query($handle, $query, $hQuery)
	if $status <> $SQLITE_OK then return $status

	$status = _SQLite_FetchNames($hQuery, $keys)
	if $status <> $SQLITE_OK then return $status

	$records = a()

	While _SQLite_FetchData($hQuery, $aRow, False, False) = $SQLITE_OK ; Read Out the next Row
		$record = h()

		for $i = 0 to count($aRow)-1
			hset($record, $keys[$i], $aRow[$i])
		Next

		push($records, $record)
	WEnd

	return _SQLite_QueryFinalize($hQuery)
EndFunc


