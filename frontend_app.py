import streamlit as st
import pandas as pd
import plotly.express as px

# 🌐 Set Page Layout Configuration
st.set_page_config(page_title="Travel Booking System Dashboard", layout="wide", page_icon="✈️")

st.title("📊 Travel Booking System Management Portal")
st.markdown("Real-time metrics and analytical data visualization layers for an e-commerce platform backend.")
st.markdown("---")

# 📊 Production Data Layer (Embedded directly for seamless cloud scaling)
production_records = [
    {
        "UserID": 1,
        "Username": "Ewelina_Nicholson",
        "Airline": "American Airlines",
        "FlightPrice": 300.00,
        "HotelName": "Radisson",
        "StayDuration": 5,
        "TotalHotelCost": 750.00,
        "CarType": "Compact",
        "TotalCarCost": 250.00,
        "TotalBookingCost": 1300.00
    },
    {
        "UserID": 2,
        "Username": "Philip_Nicholson",
        "Airline": "United Airlines",
        "FlightPrice": 250.00,
        "HotelName": "Denver Premium",
        "StayDuration": 4,
        "TotalHotelCost": 480.00,
        "CarType": "SUV",
        "TotalCarCost": 320.00,
        "TotalBookingCost": 1050.00
    },
    {
        "UserID": 3,
        "Username": "Alice_Smith",
        "Airline": "British Airways",
        "FlightPrice": 450.00,
        "HotelName": "Radisson",
        "StayDuration": 7,
        "TotalHotelCost": 1050.00,
        "CarType": "Compact",
        "TotalCarCost": 350.00,
        "TotalBookingCost": 1850.00
    },
    {
        "UserID": 4,
        "Username": "Bob_Jones",
        "Airline": "American Airlines",
        "FlightPrice": 310.00,
        "HotelName": "Hilton",
        "StayDuration": 3,
        "TotalHotelCost": 600.00,
        "CarType": "Luxury",
        "TotalCarCost": 600.00,
        "TotalBookingCost": 1510.00
    }
]

df = pd.DataFrame(production_records)

# 📈 1. Key Performance Indicators (KPI Row)
col1, col2, col3, col4 = st.columns(4)
with col1:
    st.metric("Total Active Bookings", f"{len(df)}")
with col2:
    total_revenue = df['TotalBookingCost'].sum()
    st.metric("Gross Platform Revenue", f"£{total_revenue:,.2f}")
with col3:
    avg_stay = df['StayDuration'].mean()
    st.metric("Average Stay Duration", f"{avg_stay:.1f} Nights")
with col4:
    avg_cost = df['TotalBookingCost'].mean()
    st.metric("Average Basket Value", f"£{avg_cost:,.2f}")
    
st.markdown("---")

# 📊 2. Interactive Analytical Charts Row
left_chart, right_chart = st.columns(2)

with left_chart:
    st.subheader("✈️ Airline Performance Summary")
    fig_airline = px.bar(df, x='Airline', y='TotalBookingCost', color='Airline',
                         title="Revenue Distribution by Carrier Airline", barmode='group')
    st.plotly_chart(fig_airline, use_container_width=True)

with right_chart:
    st.subheader("🏨 Hotel Asset Performance")
    fig_hotel = px.pie(df, names='HotelName', values='TotalHotelCost', 
                       title="Total Spend Distribution Across Hotel Chains", hole=0.4)
    st.plotly_chart(fig_hotel, use_container_width=True)

st.markdown("---")

# 📋 3. Live Relational Data Records View
st.subheader("📥 Active Transactional Data Records (Live Data Layer)")
st.dataframe(df, use_container_width=True)
