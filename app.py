import streamlit as st
import pandas as pd
import requests


st.title("Rate Forecast Data")

conn = st.connection("streamlit_apps")
df = conn.query("select * from streamlit_apps.demo.fcst_rates")

st.dataframe(df)

