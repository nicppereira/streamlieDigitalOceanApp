import streamlit as st


st.set_page_config(
    page_title="Hello World App",
    page_icon="👋",
    layout="wide"
)

# Main title
st.title("Hello World! 👋")

# Add a sidebar
st.sidebar.header("Settings")
name = st.sidebar.text_input("Enter your name", "World")

# Main content
st.header("Welcome to Streamlit")
st.write(f"Hello, {name}! This is a simple Streamlit app.")