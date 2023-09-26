CREATE TABLE "Airbnb_Data" (
    "id" TEXT ,
	"Name" TEXT,
    "Borough" VARCHAR,
    "Neighbourhood" VARCHAR,
    "Lat" Float ,
    "Lon" Float ,
    "Instant_Booking" VARCHAR ,
    "Cancellation_Policy" VARCHAR,
    "Room_Type" VARCHAR ,
    "Construction_Year" Float,
    "Price_Per_Night" Float,
    "Rating" Float,
	"House_Rules" VARCHAR
);

--Neighborhoods with 4 star ratings
SELECT "Neighbourhood","Rating"
FROM "Airbnb_Data"
WHERE "Rating" = 4;

--Number of total listings in each Borough
SELECT "Borough", COUNT("id") AS "Total Listings"
FROM "Airbnb_Data"
WHERE "Borough" IN ('Queens','Manhattan','Brooklyn','Staten Island','Bronx')
GROUP BY "Borough"
ORDER BY "Total Listings" DESC

---Location Price Per Night $500-600
SELECT "id", "Borough","Neighbourhood", "Price_Per_Night"
FROM "Airbnb_Data"
WHERE
	"Price_Per_Night" >=500
	AND "Price_Per_Night" <=600
	AND "Borough" IN ('Queens','Manhattan','Brooklyn','Staten Island','Bronx')

--Avg Price Per Night Based on Borough
SELECT "Borough", AVG("Price_Per_Night") AS "Avg Price"
FROM "Airbnb_Data"
WHERE "Borough" IN ('Queens','Manhattan','Brooklyn','Staten Island','Bronx')
GROUP BY "Borough"
ORDER BY "Avg Price" DESC;
	
--Number of Property Types by Borough and Average Rating 
SELECT "Borough", "Room_Type", COUNT("Room_Type") AS "Count_Property_Types", AVG("Rating") AS "Avg Rating"
FROM "Airbnb_Data"
WHERE "Borough" IN ('Queens','Manhattan','Brooklyn','Staten Island','Bronx')
GROUP BY "Borough" , "Room_Type"
ORDER BY "Count_Property_Types" DESC

--Average Rating of Property Types by Borough
SELECT "Borough", "Room_Type", AVG("Rating") AS "Avg Rating"
FROM "Airbnb_Data"
WHERE "Borough" IN ('Queens','Manhattan','Brooklyn','Staten Island','Bronx')
GROUP BY "Borough","Room_Type"


--Property Type vary by Neighborhood and Borough
SELECT "Borough","Neighbourhood","Room_Type", COUNT("Room_Type") AS "Property_Type"
FROM "Airbnb_Data"
GROUP BY "Borough", "Neighbourhood", "Room_Type"
ORDER BY "Property_Type" DESC;

--Listing Details Based on Rating/Borough/Instant Booking/Room Type Preference
SELECT "id","Name", "Neighbourhood"
FROM "Airbnb_Data"
WHERE
	"Rating" = 4
	AND "Borough"='Queens'
	AND "Instant_Booking"='TRUE'
	AND "Room_Type"='Entire home/apt'
	
--Number of Neighborhoods in Each Borough
SELECT "Borough", COUNT(DISTINCT "Neighbourhood") AS "Number_of_Neighborhoods"
FROM "Airbnb_Data"
WHERE "Borough" IN ('Queens','Manhattan','Brooklyn','Staten Island','Bronx')
GROUP BY "Borough"
ORDER BY "Number_of_Neighborhoods" DESC

--Number of Listings
SELECT COUNT("id")
FROM "Airbnb_Data"


SELECT * FROM "Airbnb_Data"
DROP TABLE "Airbnb_Data"