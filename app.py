import streamlit
import pandas
import requests
import snowflake.connector
from urllib.error import URLError

streamlit.title("Rate Forecast Table")

df = pandas.DataFrame(columns=["fcst_period", "fcst_rate"])
streamlit.dataframe(df)

conn = snowflake.connector.connect(**streamlit.secrets["snowflake"])
