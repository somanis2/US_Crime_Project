file = load 'Crimes_-_2001_to_present.csv' using PigStorage (',') as (ID:int, Case_Number:chararray, Date:chararray, Block:chararray, IUCR:chararray, Primary_Type:chararray, Description:chararray, Location_Description:chararray, Arrest:chararray, Domestic:chararray, Beat:int, District:int, Ward:int, Community_Area:int, FBICode:chararray, X_Coordinate:int, Y_Coordinate:int, Year:int, Updated_On:chararray, Latitude:chararray, Longitude:chararray, Location:chararray);

select_column = foreach file generate Primary_Type, Arrest, District;

filter_theft = filter select_column by Primary_Type matches 'THEFT';

filter_arrest = filter filter_theft by Arrest matches 'true';

grp_district = group filter_arrest by District;

result1 = foreach grp_district generate group,COUNT(filter_arrest);

dump result1;
