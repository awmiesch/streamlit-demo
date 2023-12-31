import streamlit as st
import pandas as pd
import requests


def get_data():
    conn = st.connection("STREAMLIT_APPS")
    df = conn.query("select * from streamlit_apps.demo.fcst_rates")
    return df


st.title("Rate Forecast Data")

st.dataframe(get_data())

