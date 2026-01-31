from google.cloud import bigquery

class BigQueryClient:
    def __init__(self):
        self.client = bigquery.Client()

    def run_query(self, query: str):
        try:
            query_job = self.client.query(query)
            return query_job.result()
        except Exception as e:
            print(f"Error running query: {e}")
            return None

    def to_dataframe(self, query: str):
        try:
            df = self.client.query(query).to_dataframe()
            return df
        except Exception as e:
            print(f"Error converting query result to DataFrame: {e}")
            return None