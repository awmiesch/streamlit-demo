import streamlit as st


st.title("Rate Forecast Data")

conn = st.connection("snowflake")
df = conn.query("select * from streamlit_apps.demo.fcst_rates")

st.dataframe(df)

