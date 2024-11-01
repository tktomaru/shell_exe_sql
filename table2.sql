psql -U postgres -d mydatabase -t -q -c "insert  into	users ( name, email )	values(	'table2aaa'	,	'22@gmail.com'	)  RETURNING id"
