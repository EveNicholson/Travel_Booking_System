import streamlit as st
import pandas as pd
import plotly.express as px

# 🌐 Set Page Layout Configuration
st.set_page_config(page_title="Travel Booking System", layout="wide", page_icon="✈️")

# 🔒 Initialize Session State Databases (Matching your exact original database script)
if 'bookings' not in st.session_state:
    st.session_state.bookings = [
        {"BookingID": 1, "Username": "Ewelina_Nicholson", "Airline": "American Airlines", "FlightPrice": 300.00, "HotelName": "Radison", "StayDuration": 5, "TotalHotelCost": 750.00, "TotalBookingCost": 1050.00},
        {"BookingID": 2, "Username": "Philip_Nicholson", "Airline": "United Airlines", "FlightPrice": 250.00, "HotelName": "Denver", "StayDuration": 4, "TotalHotelCost": 480.00, "TotalBookingCost": 730.00},
        {"BookingID": 3, "Username": "Marta_Guzik", "Airline": "Delta Airlines", "FlightPrice": 180.00, "HotelName": "Blue Bay", "StayDuration": 3, "TotalHotelCost": 225.00, "TotalBookingCost": 405.00},
        {"BookingID": 4, "Username": "Jarek_Kuden", "Airline": "American Airlines", "FlightPrice": 320.00, "HotelName": "Stanton", "StayDuration": 5, "TotalHotelCost": 900.00, "TotalBookingCost": 1220.00},
        {"BookingID": 5, "Username": "Dorota_Dybas", "Airline": "United Airlines", "FlightPrice": 270.00, "HotelName": "Caledonina", "StayDuration": 8, "TotalHotelCost": 1040.00, "TotalBookingCost": 1310.00}
    ]

if 'hotels' not in st.session_state:
    st.session_state.hotels = [
        {"HotelName": "Radison", "PricePerNight": 150.00, "AvailableRooms": 50},
        {"HotelName": "Denver", "PricePerNight": 120.00, "AvailableRooms": 30},
        {"HotelName": "Blue Bay", "PricePerNight": 75.00, "AvailableRooms": 20},
        {"HotelName": "Stanton", "PricePerNight": 180.00, "AvailableRooms": 15},
        {"HotelName": "Caledonina", "PricePerNight": 130.00, "AvailableRooms": 40}
    ]

# Original User Credentials Dictionary
user_credentials = {
    "admin": "Admin2026!",
    "Ewelina_Nicholson": "qwertyu",
    "Philip_Nicholson": "asdfghjjk",
    "Marta_Guzik": "zxcvbnmbn",
    "Jarek_Kuden": "sdfjhgfrr",
    "Dorota_Dybas": "poiuytre"
}

# 🔐 LOGIN PROFILE CONTROL FLOW
if 'logged_in' not in st.session_state:
    st.session_state.logged_in = False
    st.session_state.username = ""
    st.session_state.is_admin = False

if not st.session_state.logged_in:
    st.title("🔒 Secure Portal Login")
    st.markdown("Please authenticate using your TravelBookingSystem credentials.")
    
    login_username = st.text_input("Username")
    login_password = st.text_input("Password", type="password")
    
    if st.button("Secure Login 🔑"):
        if login_username in user_credentials and user_credentials[login_username] == login_password:
            st.session_state.logged_in = True
            st.session_state.username = login_username
            st.session_state.is_admin = (login_username == "admin")
            st.rerun()
        else:
            st.error("Invalid username or password.")
else:
    # 🔓 AUTHENTICATED WORKSPACE HOME
    st.sidebar.title(f"👤 Account: {st.session_state.username}")
    if st.sidebar.button("Logout 🚪"):
        st.session_state.logged_in = False
        st.session_state.username = ""
        st.session_state.is_admin = False
        st.rerun()

    df_bookings = pd.DataFrame(st.session_state.bookings)
    df_hotels = pd.DataFrame(st.session_state.hotels)

    # ==========================================
    # 👑 MODE A: ADMINISTRATOR VIEW (SEE ALL)
    # ==========================================
    if st.session_state.is_admin:
        st.title("⚙️ Master Administrator Booking Management System")
        st.markdown("---")
        
        # Admin Metrics cards
        col1, col2 = st.columns(2)
        with col1: st.metric("Total Global Bookings", len(df_bookings))
        with col2: st.metric("Gross Revenue", f"£{df_bookings['TotalBookingCost'].sum():,.2f}")
        
        st.markdown("---")
        st.subheader("📋 Core Data Registry: Global Master Transaction Log")
        st.dataframe(df_bookings, use_container_width=True)

    # ==========================================
    # 👤 MODE B: STANDARD CUSTOMER VIEW (SEE ALL BOOKINGS LAYOUT)
    # ==========================================
    else:
        st.title(f"✈️ Welcome to Your Travel Portal, {st.session_state.username}")
        st.markdown("---")
        
        # Form Layout fields stacked cleanly
        st.subheader("✈️ Reserve a New Holiday Package")
        c_airline = st.selectbox("Select Flight Carrier Line", ["American Airlines", "United Airlines", "Delta Airlines", "British Airways"])
        c_hotel = st.selectbox("Select Destination Hotel", [h["HotelName"] for h in st.session_state.hotels])
        stay_duration = st.number_input("Select Stay Duration (Nights)", min_value=1, max_value=30, value=5)
        
        if st.button("Confirm Package Booking 💳", use_container_width=True):
            hotel_base = next(h for h in st.session_state.hotels if h["HotelName"] == c_hotel)
            f_price = 300.00 if "American" in c_airline else 250.00
            h_total = hotel_base["PricePerNight"] * stay_duration
            t_cost = f_price + h_total
            
            st.session_state.bookings.append({
                "BookingID": len(st.session_state.bookings) + 1,
                "Username": st.session_state.username,
                "Airline": c_airline,
                "FlightPrice": f_price,
                "HotelName": c_hotel,
                "StayDuration": stay_duration,
                "TotalHotelCost": h_total,
                "TotalBookingCost": t_cost
            })
            st.success("Booking confirmed successfully!")
            st.rerun()
            
        st.markdown("---")
        
        # Original Table View: Shows all bookings as requested
        st.subheader("📥 Active Transactional Data Records (Live Data Layer)")
        st.dataframe(df_bookings, use_container_width=True)
