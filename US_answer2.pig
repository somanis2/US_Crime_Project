file = load 'Crimes_-_2001_to_present.csv' using PigStorage (',') as (ID:int, Case_Number:chararray, Date:chararray, Block:chararray, IUCR:chararray, Primary_Type:chararray, Description:chararray, Location_Description:chararray, Arrest:chararray, Domestic:chararray, Beat:int, District:int, Ward:int, Community_Area:int, FBICode:chararray, X_Coordinate:int, Y_Coordinate:int, Year:int, Updated_On:chararray, Latitude:chararray, Longitude:chararray, Location:chararray);

fbi_code = group file by FBICode;

result1 = foreach fbi_code generate group,COUNT(file);

filter_result1 = filter result1 by group matches '32';

dump filter_result1;
