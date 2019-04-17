

CREATE OR REPLACE FUNCTION from_unixtime(epoch BIGINT)
  RETURNS TIMESTAMP  AS
'import datetime

return datetime.datetime.fromtimestamp(epoch)
'
LANGUAGE plpythonu IMMUTABLE;

--

select people.from_unixtime(1469012744000)

select people.from_unixtime(1469012744)

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------

DROP FUNCTION people.epoch2date(VARCHAR);

CREATE OR REPLACE FUNCTION people.epoch2date(date_string VARCHAR)
  RETURNS TIMESTAMP  AS
'import datetime
str_replace_1 = date_string.replace("/Date(", "")
str_replace_2 = str_replace_1.replace(")/", "")
str_replace_3 = str_replace_2.replace("+0000", "")
return datetime.datetime.fromtimestamp(long(str_replace_3)/1000)
'
LANGUAGE plpythonu IMMUTABLE;

--


select people.epoch2date('/Date(-2208988800000)/')

select people.epoch2date('/Date(1326297599000+0000)/')

-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------