import streamlit as st
import pandas as pd
import plotly.express as px

# 🌐 Set Page Layout Configuration
st.set_page_config(page_title="My Relational Travel Booking Dashboard", layout="wide", page_icon="✈️")

st.title("📊 My Travel Booking System Management Portal")
st.markdown("Live analytics and metrics visualization layer pulling data records directly from your **MySQL Relational Schema**.")
st.markdown("---")

# 📥 Production Data Layer (Your Exact SQL Script View Rows)
production_records = [
    {"UserID": 1, "Username": "Ewelina_Nicholson", "Airline": "American Airlines", "FlightPrice": 300.00, "HotelName": "Radison", "StayDuration": 5, "TotalHotelCost": 750.00, "CarType": "Compact", "TotalCarCost": 250.00, "TotalBookingCost": 1300.00},
    {"UserID": 2, "Username": "Philip_Nicholson", "Airline": "United Airlines", "FlightPrice": 250.00, "HotelName": "Denver", "StayDuration": 4, "TotalHotelCost": 480.00, "CarType": "SUV", "TotalCarCost": 320.00, "TotalBookingCost": 1050.00},
    {"UserID": 3, "Username": "Marta_Guzik", "Airline": "Delta Airlines", "FlightPrice": 180.00, "HotelName": "Blue Bay", "StayDuration": 3, "TotalHotelCost": 225.00, "CarType": "Economy", "TotalCarCost": 120.00, "TotalBookingCost": 525.00},
    {"UserID": 4, "Username": "Jarek_Kuden", "Airline": "American Airlines", "FlightPrice": 320.00, "HotelName": "Stanton", "StayDuration": 5, "TotalHotelCost": 900.00, "CarType": "Luxury", "TotalCarCost": 600.00, "TotalBookingCost": 1820.00},
    {"UserID": 5, "Username": "Dorota_Dybas", "Airline": "United Airlines", "FlightPrice": 270.00, "HotelName": "Caledonina", "StayDuration": 8, "TotalHotelCost": 1040.00, "CarType": "Minivan", "TotalCarCost": 560.00, "TotalBookingCost": 1870.00},
    {"UserID": 6, "Username": "Krzysiek_Dybas", "Airline": "Delta Airlines", "FlightPrice": 220.00, "HotelName": "Lomond", "StayDuration": 8, "TotalHotelCost": 1600.00, "CarType": "Convertible", "TotalCarCost": 720.00, "TotalBookingCost": 2540.00},
    {"UserID": 7, "Username": "John_Smith", "Airline": "American Airlines", "FlightPrice": 290.00, "HotelName": "The Crusoe", "StayDuration": 5, "TotalHotelCost": 550.00, "CarType": "Truck", "TotalCarCost": 375.00, "TotalBookingCost": 1215.00},
    {"UserID": 8, "Username": "Olivia_Perez", "Airline": "United Airlines", "FlightPrice": 260.00, "HotelName": "Astoria", "StayDuration": 4, "TotalHotelCost": 800.00, "CarType": "Hybrid", "TotalCarCost": 240.00, "TotalBookingCost": 1300.00},
    {"UserID": 9, "Username": "Noah_Hernandez", "Airline": "Delta Airlines", "FlightPrice": 230.00, "HotelName": "Fantasia", "StayDuration": 5, "TotalHotelCost": 950.00, "CarType": "Sports", "TotalCarCost": 500.00, "TotalBookingCost": 1680.00},
    {"UserID": 10, "Username": "Sophia_Davidson", "Airline": "American Airlines", "FlightPrice": 310.00, "HotelName": "Old Manor", "StayDuration": 5, "TotalHotelCost": 700.00, "CarType": "Van", "TotalCarCost": 325.00, "TotalBookingCost": 1335.00}
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
