-- only allow numeric values in the lot depth field
UPDATE pluto a
SET lotdepth = NULL 
WHERE a.lotdepth ~ '[^0-9]'
AND lotdepth NOT LIKE '%.%';
-- only allow numeric values in the numfloors field
UPDATE pluto a
SET numfloors = NULL 
WHERE a.numfloors ~ '[^0-9]'
AND numfloors NOT LIKE '%.%';

-- add decimals
UPDATE pluto 
SET ct2010 = replace(ct2010, RIGHT(ct2010,2), '.'||RIGHT(ct2010,2))
WHERE ct2010 NOT LIKE '%.%';
UPDATE pluto 
SET tract2010 = replace(ct2010, RIGHT(ct2010,2), '.'||RIGHT(ct2010,2))
WHERE tract2010 NOT LIKE '%.%';
-- remove decimal places in ct2010 where it is only zero after decimal
UPDATE pluto a
SET ct2010 = trunc(a.ct2010::numeric) 
WHERE a.ct2010 ~ '[0-9]'
AND ct2010 LIKE '%.00';
UPDATE pluto a
SET ct2010 = a.ct2010::numeric
WHERE a.ct2010 ~ '[0-9]';
-- only allow numeric values in the ct2010 field
UPDATE pluto a
SET ct2010 = NULL 
WHERE a.ct2010 !~ '[0-9]';

-- remove end zeros for numbers with only zeros past decimal and pad to 4 characters
UPDATE pluto a
SET tract2010 = lpad(trunc(a.ct2010::numeric)::text,4,'0')
WHERE tract2010 LIKE '%.00';
-- remove decimal place and pad to 6 characters
UPDATE pluto a
SET tract2010 = lpad(replace(tract2010, '.', '')::text,6,'0')
WHERE tract2010 LIKE '%.%';
-- only allow numeric values in the tract2010 field
UPDATE pluto a
SET tract2010 = NULL 
WHERE a.tract2010 ~ '[^0-9]';

-- pad school district to 2 characters
UPDATE pluto a
SET schooldist = lpad(schooldist,2,'0');

--where sanborn is just spaces set to NULL
UPDATE pluto a
SET sanborn = NULL
WHERE a.sanborn !~ '[0-9]';

--where x/y cood is just spaces set to NULL
UPDATE pluto a
SET xcoord = NULL
WHERE a.xcoord !~ '[0-9]';
UPDATE pluto a
SET ycoord = NULL
WHERE a.ycoord !~ '[0-9]';

-- make appbbl a single 0 where it's zero
UPDATE pluto
SET appbbl = '0'
WHERE appbbl::numeric = 0;