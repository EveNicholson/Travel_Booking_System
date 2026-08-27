import streamlit as st
import pandas as pd
import plotly.express as px
from datetime import datetime

# 🌐 Set Page Layout Configuration
st.set_page_config(page_title="Travel Booking Engine", layout="wide", page_icon="🏨")

# Initialize persistent tracking data in the cloud session state
if 'bookings' not in st.session_state:
    st.session_state.bookings = [
        {"BookingID": 1, "Username": "Ewelina_Nicholson", "Airline": "American Airlines", "FlightPrice": 300.00, "HotelName": "Radison", "StayDuration": 5, "TotalHotelCost": 750.00, "CarType": "Compact", "TotalCarCost": 250.00, "TotalBookingCost": 1300.00},
        {"BookingID": 2, "Username": "Philip_Nicholson", "Airline": "United Airlines", "FlightPrice": 250.00, "HotelName": "Denver", "StayDuration": 4, "TotalHotelCost": 480.00, "CarType": "SUV", "TotalCarCost": 320.00, "TotalBookingCost": 1050.00},
        {"BookingID": 3, "Username": "Marta_Guzik", "Airline": "Delta Airlines", "FlightPrice": 180.00, "HotelName": "Blue Bay", "StayDuration": 3, "TotalHotelCost": 225.00, "CarType": "Economy", "TotalCarCost": 120.00, "TotalBookingCost": 525.00}
    ]

if 'hotels' not in st.session_state:
    st.session_state.hotels = [
        {"HotelName": "Radison", "PricePerNight": 150.00, "AvailableRooms": 50, "Rating": 4.5},
        {"HotelName": "Denver", "PricePerNight": 120.00, "AvailableRooms": 30, "Rating": 4.0},
        {"HotelName": "Blue Bay", "PricePerNight": 75.00, "AvailableRooms": 20, "Rating": 3.2},
        {"HotelName": "Stanton", "PricePerNight": 180.00, "AvailableRooms": 15, "Rating": 4.7},
        {"HotelName": "Caledonina", "PricePerNight": 130.00, "AvailableRooms": 40, "Rating": 4.3}
    ]

st.title("🏨 Interactive Travel Search & Booking Portal")
st.markdown("Search destinations, configure travel packages, and book instantly. Simulates real-time backend schema operations.")
st.markdown("---")

# 🧳 SIDEBAR: User Booking Interaction Panel
st.sidebar.header("✈️ Book a New Destination")
user_input = st.sidebar.text_input("Enter Your Username", "Guest_User")

# Dropdowns mapped directly to your SQL metadata models
selected_hotel_name = st.sidebar.selectbox("Choose a Hotel Accommodation", [h["HotelName"] for h in st.session_state.hotels])
selected_airline = st.sidebar.selectbox("Choose a Flight Carrier", ["American Airlines", "United Airlines", "Delta Airlines", "British Airways"])
selected_car = st.sidebar.selectbox("Choose a Vehicle Rental", ["Compact", "SUV", "Economy", "Luxury", "None"])

# Date inputs mirroring your datetime fields
check_in = st.sidebar.date_input("Hotel Check-In Date", datetime(2026, 10, 10))
check_out = st.sidebar.date_input("Hotel Check-Out Date", datetime(2026, 10, 15))

# Calculate variables internally
stay_days = (check_out - check_in).days

# Execute transactional cost processing simulation
hotel_base = next(h for h in st.session_state.hotels if h["HotelName"] == selected_hotel_name)
flight_cost = 300.00 if "American" in selected_airline else (250.00 if "United" in selected_airline else 200.00)
car_cost_per_day = {"Compact": 50.0, "SUV": 80.0, "Economy": 40.0, "Luxury": 120.0, "None": 0.0}[selected_car]

total_hotel_calc = hotel_base["PricePerNight"] * stay_days
total_car_calc = car_cost_per_day * stay_days
grand_total_calc = flight_cost + total_hotel_calc + total_car_calc

st.sidebar.markdown(f"""
**Booking Financial Breakdown:**
* Flight Base Price: £{flight_cost:.2f}
* Hotel Total Stay ({stay_days} nights): £{total_hotel_calc:.2f}
* Car Rental Total Cost: £{total_car_calc:.2f}
### **Grand Total Cost: £{grand_total_calc:.2f}**
""")

# 🔘 The Booking Transaction Execution Event
if st.sidebar.button("Confirm and Book Transaction 🚀"):
    if stay_days <= 0:
        st.sidebar.error("Error: Check-Out Date must be after Check-In Date!")
    elif hotel_base["AvailableRooms"] <= 0:
        st.sidebar.error(f"Error: No available rooms left at {selected_hotel_name}!")
    else:
        # 1. Update Hotel Inventory (Simulating your AFTER INSERT SQL Trigger)
        for h in st.session_state.hotels:
            if h["HotelName"] == selected_hotel_name:
                h["AvailableRooms"] -= 1
                
        # 2. Append the record to the session log grid
        new_id = len(st.session_state.bookings) + 1
        st.session_state.bookings.append({
            "BookingID": new_id, "Username": user_input, "Airline": selected_airline, "FlightPrice": flight_cost,
            "HotelName": selected_hotel_name, "StayDuration": stay_days, "TotalHotelCost": total_hotel_calc,
            "CarType": selected_car, "TotalCarCost": total_car_calc, "TotalBookingCost": grand_total_calc
        })
        st.sidebar.success(f"Success! Booking #{new_id} confirmed. Room count updated via trigger.")

# 📊 MAIN PANEL: Analytics Render Layers
df_bookings = pd.DataFrame(st.session_state.bookings)
df_hotels = pd.DataFrame(st.session_state.hotels)

# KPI Metrics Dashboard Section
col1, col2, col3 = st.columns(3)
with col1:
    st.metric("Total Platform Transactions", f"{len(df_bookings)}")
with col2:
    st.metric("Gross Revenue Performance", f"£{df_bookings['TotalBookingCost'].sum():,.2f}")
with col3:
    st.metric("Average User Basket Spend", f"£{df_bookings['TotalBookingCost'].mean():,.2f}")

st.markdown("---")

# Visual Graphs Row
left, right = st.columns(2)
with left:
    fig_air = px.bar(df_bookings, x='Airline', y='TotalBookingCost', color='Airline', title="Platform Revenue Split by Carrier")
    st.plotly_chart(fig_air, use_container_width=True)
with right:
    fig_inv = px.bar(df_hotels, x='HotelName', y='AvailableRooms', color='HotelName', title="Live Available Room Inventory Count")
    st.plotly_chart(fig_inv, use_container_width=True)

st.markdown("---")

# Data Presentation Tables Grid
left_tbl, right_tbl = st.columns([3, 2])
with left_tbl:
    st.subheader("📥 Active Client Transactions Log Layer")
    st.dataframe(df_bookings, use_container_width=True)
with right_tbl:
    st.subheader("🏨 Live Accommodation Asset Register")
    st.dataframe(df_hotels, use_container_width=True)
