from model_predict import ModelPredictor
import pandas as pd

predictor = ModelPredictor()

# Predict next 60 days
df = predictor.forecast_next_days(
    model_full_path="ml-ai-portfolio.taxi_forecasting.daily_arima_model",
    days=61
)

#Convert to datetime formar
df["forecast_date"] = df["forecast_timestamp"].dt.date

december_df = df[
    (df["forecast_date"] >= pd.to_datetime("2022-12-01").date()) &
    (df["forecast_date"] <= pd.to_datetime("2022-12-31").date())
]

print(december_df)
