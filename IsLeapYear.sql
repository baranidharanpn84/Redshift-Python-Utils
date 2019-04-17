

---------------------------------------------------------------------------------------------------------------------
 
DROP FUNCTION reporting.isleapyear(integer) CASCADE;

create function reporting.isleapyear (a integer)
returns integer
stable
as $$
	if a % 4 == 0 and (a % 100 != 0 or a % 400 == 0):
		return 1
	return 0
$$ language plpythonu;

select reporting.isleapyear(2015)

select reporting.isleapyear(2016)

select reporting.isleapyear(400)

---------------------------------------------------------------------------------------------------------------------
