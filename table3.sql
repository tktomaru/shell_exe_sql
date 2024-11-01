psql -U postgres -d mydatabase -t -q -c "insert  into	others ( number1, number2 )	values(	[replaceA]	,	[replaceB]	)  RETURNING id"
