import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

st.title("Project1")
st.header("Part A - The Top Stories API")
st.markdown("This app uses the Top Stories API to display the most common words used in the top current \
        articles based on a specified topic selected by the user. The data is displayed as line chart \
        and as a wordcloud image.")

st.subheader("I - Topic Selection")
name = st.text_input("Please enter your name")
topic = st.selectbox(
    "Select a topic of your interest",
    ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home",
     "insider", "magazine", "movies", "nyregion", "obituaries", "opinion", "politics",
     "realestate", "science", "sports", "sundayreview", "technology", "theater", "t-magazine",
     "travel", "upshot", "us", "world"]
)

if 'automobiles' in topic:
    st.write("Hi " + name + ", you selected the " + topic + " topic.")

    api_calls.top_stories_api('automobiles')

    st.subheader("II - Frequency Distribution")
    if st.checkbox("Click here to generate frequency distribution"):
        chart_data = pd.DataFrame(
            api_calls.line_graph(),
            columns=['Words', 'Count']
        )
        chart_data = chart_data.set_index('Words')
        st.line_chart(chart_data)

    st.subheader("III - WordCloud")
    if st.checkbox("Click here to generate wordcloud"):
        api_calls.wordcloud()
        st.markdown("<p style='text-align: center;'>Wordcloud generated for " + topic + " topic.",
                    unsafe_allow_html=True)

###############################################################
df = pd.read_csv("C:/Users/user/Desktop/Data In/SampleSuperstore.csv")
st.write("### Data Preview", df.head())
st.write("### Dataset Summary")
st.write(df.describe())

# Group by Category and calculate total Sales and Quantity
sales_by_category = df.groupby('Category')['Sales'].sum().reset_index()
quantity_by_category = df.groupby('Category')['Quantity'].sum().reset_index()

# Create charts with the aggregated data
st.write("### Sales by Category")
st.bar_chart(data=sales_by_category.set_index('Category'))

st.write("### Quantity by Category")
st.bar_chart(data=quantity_by_category.set_index('Category'))

# For line chart, we can show trend by setting index
st.write("### Sales Trend by Category")
st.line_chart(df.pivot_table(index='Category', values='Sales', aggfunc='sum'))
#Region	Category	Sub-Category	Sales	Quantity






