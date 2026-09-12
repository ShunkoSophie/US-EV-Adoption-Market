SELECT * 
FROM vehicle_data;

#Calculate the percentage of EVs, PHEVs, HEVs, and Gasoline vehicles for each state.

SELECT State, 
Total_Vehicle, 
ROUND(((EV/Total_Vehicle)*100),2) AS EV_Percent,
ROUND(((PHEV/Total_Vehicle)*100),2) AS PHEV_Percent,
ROUND(((HEV/Total_Vehicle)*100),2) AS HEV_Percent,
ROUND(((Gasoline/Total_Vehicle)*100),2) AS Gasoline_Percent
FROM vehicle_data;

#Which states have the highest EV adoption rates, and which states lag behind?

SELECT State, Total_Vehicle, ROUND(((EV/Total_Vehicle)*100),2) AS Highest_EV_Adoption_Rate
FROM vehicle_data
ORDER BY Highest_EV_Adoption_Rate DESC
LIMIT 5;

SELECT State, Total_Vehicle, ROUND(((EV/Total_Vehicle)*100),2) AS Lowest_EV_Adoption_Rate
FROM vehicle_data
ORDER BY Lowest_EV_Adoption_Rate ASC
LIMIT 5;

#Compare EV adoption in California Vs Texas, Florida, New York

SELECT State, Total_Vehicle, ROUND(((EV/Total_Vehicle)*100),2) AS EV_Adoption_Rate
FROM vehicle_data
WHERE State IN ('Texas','California','Florida','New York');