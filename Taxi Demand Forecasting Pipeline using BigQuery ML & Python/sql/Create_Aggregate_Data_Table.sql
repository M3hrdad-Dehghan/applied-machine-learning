CREATE OR REPLACE TABLE
  `ml-ai-portfolio.taxi_forecasting.daily_2022` AS
SELECT
  DATE(pickup_datetime) AS trip_date,
  COUNT(*) AS total_trips
FROM 
  `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`
WHERE 
  pickup_datetime BETWEEN '2022-01-01' AND '2022-12-01'
GROUP BY 
  trip_date
ORDER BY 
  trip_date;
