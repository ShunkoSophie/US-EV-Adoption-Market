SELECT *
FROM vehicle_data;

SELECT
	SUM(Biodiesel) AS Total_Biodiesel,
	SUM(Ethanol) AS Total_Ethanol,
	SUM(Hydrogen) AS Total_Hydrogen,
    SUM(Total_Vehicle) AS Total_Vehicle
FROM
	vehicle_data;

SELECT
	ROUND(SUM(Biodiesel) * 100 / SUM(Total_Vehicle), 4) AS Pct_Biodiesel,
    ROUND(SUM(Ethanol) * 100 / SUM(Total_Vehicle), 4) AS Pct_Ethanol,
    ROUND(SUM(Hydrogen) * 100 / SUM(Total_Vehicle), 4) AS Pct_Hydrogen
FROM
	vehicle_data;
    
WITH alt_fuels_cte AS(
	SELECT 
		'Biodiesel' AS Fuels_Category,
        SUM(Biodiesel) AS Total_Volume,
		ROUND(SUM(Biodiesel) * 100 / SUM(Total_Vehicle), 4) AS Pct_Market
	FROM vehicle_data

	UNION ALL
    
    SELECT 
		'Ethanol_Flex' AS Fuels_Category,
        SUM(Ethanol) AS Total_Volume,
        ROUND(SUM(Ethanol) * 100 / SUM(Total_Vehicle), 4) AS Pct_Market
	FROM vehicle_data
    
    UNION ALL
    
    SELECT 
		'Hydrogen' AS Fuels_Category,
        SUM(Hydrogen) AS Total_Volume,
        ROUND(SUM(Hydrogen) * 100 / SUM(Total_Vehicle), 4) AS Pct_Market
	FROM vehicle_data
)

SELECT
	Fuels_Category,
    Total_Volume,
    Pct_Market,
    CASE
		WHEN Pct_Market >= 0.01 THEN 'Meaningful Presence'
        ELSE 'Niche Usage'
	END AS Status_
FROM 
	alt_fuels_cte;
    


