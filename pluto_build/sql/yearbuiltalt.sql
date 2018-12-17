-- clean up year values by making them valid years
-- yearbuilt
UPDATE pluto_allocated
SET yearbuilt = (CASE 
	WHEN LEFT(yearbuilt,1) = '1' THEN '20'||RIGHT(yearbuilt,2)
	ELSE '1'||yearbuilt
	END)
WHERE length(yearbuilt) = 3
AND yearbuilt::integer > 0;

UPDATE pluto_allocated
SET yearbuilt = '19'||yearbuilt
WHERE length(yearbuilt) = 2
AND yearbuilt::integer > 0;

UPDATE pluto_allocated
SET yearbuilt = '0'
WHERE yearbuilt IS NULL 
OR yearbuilt::integer = 0;

-- yearalter1
UPDATE pluto_allocated
SET yearalter1 = (CASE 
	WHEN LEFT(yearalter1,1) = '1' THEN '20'||RIGHT(yearalter1,2)
	ELSE '1'||yearalter1
	END)
WHERE length(yearalter1) = 3
AND yearalter1::integer > 0;

UPDATE pluto_allocated
SET yearalter1 = '19'||yearalter1
WHERE length(yearalter1) = 2
AND yearalter1::integer > 0;

UPDATE pluto_allocated
SET yearalter1 = '0'
WHERE yearalter1 IS NULL
OR yearalter1::integer = 0;

-- yearalter2
UPDATE pluto_allocated
SET yearalter2 = (CASE 
	WHEN LEFT(yearalter2,1) = '1' THEN '20'||RIGHT(yearalter2,2)
	ELSE '1'||yearalter2
	END)
WHERE length(yearalter2) = 3
AND yearalter2::integer > 0;

UPDATE pluto_allocated
SET yearalter2 = '19'||yearalter2
WHERE length(yearalter2) = 2
AND yearalter2::integer > 0;

UPDATE pluto_allocated
SET yearalter2 = '0'
WHERE yearalter2 IS NULL
OR yearalter2::integer = 0;