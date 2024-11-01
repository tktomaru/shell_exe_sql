psql -U postgres -d mydatabase -t -q -c "insert  into	users ( name, email )	values(	'table1aaa'	,	'12gmail.com'	)  RETURNING id"
