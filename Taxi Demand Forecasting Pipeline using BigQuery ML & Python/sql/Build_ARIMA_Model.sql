CREATE OR REPLACE MODEL `ml-ai-portfolio.taxi_forecasting.daily_arima_model`
OPTIONS(
  MODEL_TYPE = 'ARIMA_PLUS',
  TIME_SERIES_TIMESTAMP_COL = 'trip_date',
  TIME_SERIES_DATA_COL = 'total_trips',
  AUTO_ARIMA = TRUE,
  HOLIDAY_REGION = 'US'
) AS
SELECT
  trip_date,
  total_trips
FROM
  `ml-ai-portfolio.taxi_forecasting.aggregated_daily_2022`
WHERE
  trip_date BETWEEN '2022-01-01' AND '2022-10-31'  
ORDER BY
  trip_date;
