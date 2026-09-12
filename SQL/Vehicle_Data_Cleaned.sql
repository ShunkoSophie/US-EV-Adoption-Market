#Already standardized data type in Excel
#IN SQL, I will rename and add columns 

SELECT * 
FROM vehicle_data;

#Rename the column name 

ALTER Table vehicle_data
RENAME Column `Electric (EV)` TO EV,
RENAME Column `Plug-In Hybrid Electric (PHEV)` TO PHEV,
RENAME Column `Hybrid Electric (HEV)` TO HEV,
RENAME Column `Ethanol/Flex (E85)` TO Ethanol,
RENAME Column `Compressed Natural Gas (CNG)` TO CNG;

#ADD Total Vehicle Column
ALTER TABLE vehicle_data
ADD column Total_Vehicle INT;

UPDATE vehicle_data
SET Total_Vehicle = (EV+PHEV+HEV+Biodiesel+Ethanol+CNG+Propane+Hydrogen+Methanol+Gasoline+Diesel+`Unknown Fuel`);