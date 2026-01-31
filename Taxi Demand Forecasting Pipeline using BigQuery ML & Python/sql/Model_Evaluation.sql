-- Diagnosis evaluation
SELECT *
FROM ML.EVALUATE(
  MODEL `ml-ai-portfolio.taxi_forecasting.daily_arima_model`
);





-- Forecast/Actual join table
CREATE OR REPLACE TABLE
  `ml-ai-portfolio.taxi_forecasting.actual_vs_forecast_nov2022` AS

WITH forecast AS (
  SELECT
    DATE(forecast_timestamp) AS forecast_date,
    forecast_value
  FROM
    ML.FORECAST(
      MODEL `ml-ai-portfolio.taxi_forecasting.daily_arima_model`,
      STRUCT(30 AS horizon)
    )
  WHERE
    forecast_timestamp BETWEEN '2022-11-01' AND '2022-11-30'
),

actual AS (
  SELECT
    trip_date AS actual_date,
    total_trips AS actual_value
  FROM
    `ml-ai-portfolio.taxi_forecasting.aggregated_daily_2022`
  WHERE
    trip_date BETWEEN '2022-11-01' AND '2022-11-30'
)

SELECT
  a.actual_date,
  a.actual_value,
  f.forecast_value,
  (a.actual_value - f.forecast_value) AS error,
  ABS(a.actual_value - f.forecast_value) AS abs_error
FROM actual a
JOIN forecast f
ON a.actual_date = f.forecast_date
ORDER BY actual_date;





-- Calcualtion evalaution metric
SELECT
  SQRT(AVG(POW(actual_value - forecast_value, 2))) AS RMSE,
  AVG(ABS(actual_value - forecast_value)) AS MAE,
  AVG(ABS((actual_value - forecast_value) / actual_value)) * 100 AS MAPE
FROM
  `ml-ai-portfolio.taxi_forecasting.actual_vs_forecast_nov2022`;
