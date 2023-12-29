import streamlit
import pandas
import requests
import snowflake.connector
from urllib.error import URLError


def get_data():
    conn = snowflake.connector.connect(**streamlit.secrets["snowflake"])
    cur = conn.cursor()
    cur.execute("select * from streamlit_apps.demo.fcst_rates")
    rows = cur.fetchall()
    return rows


streamlit.title("Rate Forecast Data")

streamlit.header("Current Data:")

streamlit.dataframe(get_data())

#my_cur = my_cnx.cursor()
#my_cur.execute("select * from fruit_load_list")
#my_data_rows = my_cur.fetchall()
#streamlit.header("The fruit list contains:")
#streamlit.dataframe(my_data_rows)
