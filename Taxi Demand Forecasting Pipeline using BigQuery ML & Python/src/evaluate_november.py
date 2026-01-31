from bq_client import BigQueryClient
from model_predict import ModelPredictor
import pandas as pd
import matplotlib.pyplot as plt

# ================================
# 1) Load Actual November Data
# ================================
def get_actual_november():
    bq = BigQueryClient()

    query = """
    SELECT
      trip_date AS actual_date,
      total_trips AS actual_value
    FROM
      `ml-ai-portfolio.taxi_forecasting.aggregated_daily_2022`
    WHERE
      trip_date BETWEEN '2022-11-01' AND '2022-11-30'
    ORDER BY actual_date;
    """

    df = bq.to_dataframe(query)
    return df


# ================================
# 2) Load Forecast November Data
# ================================
def get_forecast_november():
    predictor = ModelPredictor()

    df = predictor.forecast_next_days(
        model_full_path="ml-ai-portfolio.taxi_forecasting.daily_arima_model",
        days=30
    )

    df["forecast_date"] = df["forecast_timestamp"].dt.date
    df = df[["forecast_date", "forecast_value"]]

    return df


# ================================
# 3) Merge Actual and Forecast
# ================================
def merge_actual_forecast(actual_df, forecast_df):
    actual_df["actual_date"] = pd.to_datetime(actual_df["actual_date"])
    forecast_df["forecast_date"] = pd.to_datetime(forecast_df["forecast_date"])

    merged = pd.merge(
        actual_df,
        forecast_df,
        left_on="actual_date",
        right_on="forecast_date",
        how="inner"
    )

    return merged


# ================================
# 4) Plot Actual vs Forecast
# ================================
def plot_actual_vs_forecast(merged):
    plt.figure(figsize=(14, 6))
    
    plt.plot(merged["actual_date"], merged["actual_value"], label="Actual", marker="o")
    plt.plot(merged["forecast_date"], merged["forecast_value"], label="Forecast", marker="x")
    
    plt.title("Actual vs Forecast - November 2022")
    plt.xlabel("Date")
    plt.ylabel("Daily Trips")
    plt.xticks(rotation=45)
    plt.legend()
    plt.grid(True)
    plt.tight_layout()
    plt.show()


# ================================
# 5) MAIN
# ================================
if __name__ == "__main__":
    actual = get_actual_november()
    forecast = get_forecast_november()

    merged = merge_actual_forecast(actual, forecast)

    print(merged.head())
    print(merged.tail())

    plot_actual_vs_forecast(merged)
