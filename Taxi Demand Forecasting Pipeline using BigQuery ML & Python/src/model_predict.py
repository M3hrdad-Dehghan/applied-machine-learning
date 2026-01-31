from bq_client import BigQueryClient

class ModelPredictor:
    def __init__(self):
        self.bq = BigQueryClient()

    def forecast_next_days(self, model_full_path: str, days: int = 30):
        query = f"""
        SELECT
          forecast_timestamp,
          forecast_value
        FROM
          ML.FORECAST(
            MODEL `{model_full_path}`,
            STRUCT({days} AS horizon)
          )
        """

        df = self.bq.to_dataframe(query)
        return df
