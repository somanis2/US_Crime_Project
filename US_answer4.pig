file = load 'Crimes_-_2001_to_present.csv' using PigStorage (',') as (ID:int, Case_Number:chararray, Date:chararray, Block:chararray, IUCR:chararray, Primary_Type:chararray, Description:chararray, Location_Description:chararray, Arrest:chararray, Domestic:chararray, Beat:int, District:int, Ward:int, Community_Area:int, FBICode:chararray, X_Coordinate:int, Y_Coordinate:int, Year:int, Updated_On:chararray, Latitude:chararray, Longitude:chararray, Location:chararray);

select_column = foreach file generate Primary_Type, Arrest, District, Date;

date_limit = filter select_column by Date > '01/10/2014' and Date < '31/10/2015';  

filter_arrest = filter date_limit by Arrest matches 'true';

r1 = foreach filter_arrest generate 1 AS one:int;
r2 = group r1 by one;
r3 = foreach r2 generate group, COUNT(r1);

dump r3;

