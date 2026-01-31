-- Data range
SELECT 
  MIN(trip_date), 
  MAX(trip_date), 
  COUNT(*) AS num_days
FROM `ml-ai-portfolio.taxi_forecasting.aggregated_daily_2022`;


-- Weekend Trend
SELECT
  trip_date,
  total_trips,
  FORMAT_DATE('%A', trip_date) AS weekday
FROM `ml-ai-portfolio.taxi_forecasting.aggregated_daily_2022`
WHERE FORMAT_DATE('%A', trip_date) IN ('Saturday' , 'Sunday')
ORDER BY trip_date;


-- Average trip per day
SELECT
  FORMAT_DATE('%A', trip_date) AS weekday,
  AVG(total_trips) AS avg_trips
FROM `ml-ai-portfolio.taxi_forecasting.aggregated_daily_2022`
GROUP BY weekday
ORDER BY avg_trips DESC;


-- All days Trend
SELECT *
FROM `ml-ai-portfolio.taxi_forecasting.aggregated_daily_2022`
ORDER BY trip_date;