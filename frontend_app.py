import streamlit as st
import pandas as pd
import plotly.express as px
from datetime import datetime, date

# 🌐 Set Page Layout Configuration
st.set_page_config(page_title="Secure Travel Booking Management Portal", layout="wide", page_icon="🔒")

# 🔒 Initialize Session State Databases (Matching your exact SQL script values)
if 'bookings' not in st.session_state:
    st.session_state.bookings = [
        {"BookingID": 1, "Username": "Ewelina_Nicholson", "Airline": "American Airlines", "HotelName": "Radison", "StayDuration": 5, "CarType": "Compact", "CarDuration": 5, "TotalBookingCost": 1300.00, "Status": "Confirmed"},
        {"BookingID": 2, "Username": "Philip_Nicholson", "Airline": "United Airlines", "HotelName": "Denver", "StayDuration": 4, "CarType": "SUV", "CarDuration": 4, "TotalBookingCost": 1050.00, "Status": "Confirmed"},
        {"BookingID": 3, "Username": "Marta_Guzik", "Airline": "Delta Airlines", "HotelName": "Blue Bay", "StayDuration": 3, "CarType": "Economy", "CarDuration": 3, "TotalBookingCost": 525.00, "Status": "Confirmed"},
        {"BookingID": 4, "Username": "Jarek_Kuden", "Airline": "American Airlines", "HotelName": "Stanton", "StayDuration": 5, "CarType": "Luxury", "CarDuration": 5, "TotalBookingCost": 1820.00, "Status": "Confirmed"},
        {"BookingID": 5, "Username": "Dorota_Dybas", "Airline": "United Airlines", "HotelName": "Caledonina", "StayDuration": 8, "CarType": "Minivan", "CarDuration": 8, "TotalBookingCost": 1870.00, "Status": "Confirmed"}
    ]

if 'hotels' not in st.session_state:
    st.session_state.hotels = [
        {"HotelName": "Radison", "PricePerNight": 150.00, "AvailableRooms": 50, "Rating": 4.5},
        {"HotelName": "Denver", "PricePerNight": 120.00, "AvailableRooms": 30, "Rating": 4.0},
        {"HotelName": "Blue Bay", "PricePerNight": 75.00, "AvailableRooms": 20, "Rating": 3.2},
        {"HotelName": "Stanton", "PricePerNight": 180.00, "AvailableRooms": 15, "Rating": 4.7},
        {"HotelName": "Caledonina", "PricePerNight": 130.00, "AvailableRooms": 40, "Rating": 4.3}
    ]

if 'cars' not in st.session_state:
    st.session_state.cars = [
        {"CarType": "Compact", "PricePerDay": 50.00, "AvailableCars": 20},
        {"CarType": "SUV", "PricePerDay": 80.00, "AvailableCars": 15},
        {"CarType": "Economy", "PricePerDay": 40.00, "AvailableCars": 25},
        {"CarType": "Luxury", "PricePerDay": 120.00, "AvailableCars": 10},
        {"CarType": "Minivan", "PricePerDay": 70.00, "AvailableCars": 12},
        {"CarType": "None", "PricePerDay": 0.00, "AvailableCars": 999}
    ]

# User Authentication Dictionary (Mapping your SQL credentials)
user_credentials = {
    "admin": "Admin2026!",
    "Ewelina_Nicholson": "qwertyu",
    "Philip_Nicholson": "asdfghjjk",
    "Marta_Guzik": "zxcvbnmbn",
    "Jarek_Kuden": "sdfjhgfrr",
    "Dorota_Dybas": "poiuytre"
}

# 🔐 LOGIN CONTROL FLOW INTERFACE
if 'logged_in' not in st.session_state:
    st.session_state.logged_in = False
    st.session_state.username = ""
    st.session_state.is_admin = False

if not st.session_state.logged_in:
    st.title("🔒 Secure Portal Login")
    st.markdown("Please authenticate using your TravelBookingSystem user account credentials.")
    
    login_username = st.text_input("Username")
    login_password = st.text_input("Password", type="password")
    
    if st.button("Secure Login 🔑"):
        if login_username in user_credentials and user_credentials[login_username] == login_password:
            st.session_state.logged_in = True
            st.session_state.username = login_username
            st.session_state.is_admin = (login_username == "admin")
            st.success(f"Authentication verified. Welcome back, {login_username}!")
            st.rerun()
        else:
            st.error("Invalid username or password configuration.")
else:
    # 🔓 AUTHENTICATED SYSTEM PORTAL INTERFACE
    st.sidebar.title(f"👤 Account: {st.session_state.username}")
    if st.session_state.is_admin:
        st.sidebar.markdown("⭐ **Role: System Administrator**")
    else:
        st.sidebar.markdown("👤 **Role: Standard Customer**")
        
    if st.sidebar.button("Logout 🚪"):
        st.session_state.logged_in = False
        st.session_state.username = ""
        st.session_state.is_admin = False
        st.rerun()

    # 📈 COMPOSITE DATA SETUPS
    df_bookings = pd.DataFrame(st.session_state.bookings)
    df_hotels = pd.DataFrame(st.session_state.hotels)
    df_cars = pd.DataFrame(st.session_state.cars)

    # ==========================================
    # 👑 MODE A: ADMINISTRATOR EXECUTIVE VIEW
    # ==========================================
    if st.session_state.is_admin:
        st.title("⚙️ Master Administrator Booking Management System")
        st.markdown("Full transactional system access: View global corporate trends, run inventory auditing, and manual user override registrations.")
        st.markdown("---")
        
        # Admin KPI Dashboard Panel
        col1, col2, col3 = st.columns(3)
        with col1:
            st.metric("Total Global Platform Transactions", f"{len(df_bookings)}")
        with col2:
            st.metric("Gross Platform Revenue Assets", f"£{df_bookings['TotalBookingCost'].sum():,.2f}")
        with col3:
            st.metric("Global Average Ticket Value", f"£{df_bookings['TotalBookingCost'].mean():,.2f}")
            
        st.markdown("---")
        
        # Admin Booking Entry Management Form Panel
        st.subheader("➕ Administrative Override: Book on Behalf of a Customer")
        form_col1, form_col2, form_col3 = st.columns(3)
        with form_col1:
            target_user = st.selectbox("Select Target Client Account", [u for u in user_credentials.keys() if u != 'admin'])
            selected_airline = st.selectbox("Assign Flight Carrier", ["American Airlines", "United Airlines", "Delta Airlines", "British Airways"])
            selected_hotel = st.selectbox("Assign Hotel Property", [h["HotelName"] for h in st.session_state.hotels])
        with form_col2:
            selected_car = st.selectbox("Assign Vehicle Rental Type", [c["CarType"] for c in st.session_state.cars])
            admin_in_date = st.date_input("Hotel Check-In Date", date.today(), key="admin_in")
            admin_out_date = st.date_input("Hotel Check-Out Date", date.today(), key="admin_out")
        with form_col3:
            admin_car_start = st.date_input("Car Rental Start Date", date.today(), key="admin_car_in")
            admin_car_end = st.date_input("Car Rental End Date", date.today(), key="admin_car_out")
            
            stay_days = (admin_out_date - admin_in_date).days
            car_days = (admin_car_end - admin_car_start).days if selected_car != "None" else 0
            
            st.markdown(f"<b>Computed Hotel Stay:</b> {stay_days} Nights", unsafe_allow_html=True)
            st.markdown(f"<b>Computed Car Rental:</b> {car_days} Days", unsafe_allow_html=True)
            
            if st.button("Execute Administrative Booking 🚀", use_container_width=True):
                if stay_days <= 0:
                    st.error("Hotel Check-Out must be after Check-In!")
                elif selected_car != "None" and car_days <= 0:
                    st.error("Car Rental End Date must be after Start Date!")
                else:
                    hotel_base = next(h for h in st.session_state.hotels if h["HotelName"] == selected_hotel)
                    car_base = next(c for c in st.session_state.cars if c["CarType"] == selected_car)
                    
                    flight_cost = 300.00 if "American" in selected_airline else 250.00
                    hotel_total = hotel_base["PricePerNight"] * stay_days
                    car_total = car_base["PricePerDay"] * car_days
                    total_cost_calc = flight_cost + hotel_total + car_total
                    
                    # Update Inventory Counts
                    for h in st.session_state.hotels:
                        if h["HotelName"] == selected_hotel: h["AvailableRooms"] -= 1
                    if selected_car != "None":
                        for c in st.session_state.cars:
                            if c["CarType"] == selected_car: c["AvailableCars"] -= 1
                            
                    # Append Master Row Record
                    st.session_state.bookings.append({
                        "BookingID": len(st.session_state.bookings) + 1, "Username": target_user,
                        "Airline": selected_airline, "HotelName": selected_hotel, "StayDuration": stay_days,
                        "CarType": selected_car, "CarDuration": car_days, "TotalBookingCost": total_cost_calc, "Status": "Confirmed"
                    })
                    st.success(f"Administrative override complete. Assigned to user '{target_user}'.")
                    st.rerun()

        st.markdown("---")
        
        # Master Global View Data Grid (Admin Exclusive)
        st.subheader("📋 Core Data Registry: Global Master Transaction Log")
        st.dataframe(df_bookings, use_container_width=True)

    # ==========================================
    # 👤 MODE B: STANDARD ISOLATED CUSTOMER VIEW
    # ==========================================
    else:
        st.title(f"✈️ Welcome to Your Travel Portal, {st.session_state.username}")
        st.markdown("Configure packages, check scheduled flight itineraries, and audit your personal reservation records.")
        st.markdown("---")
        
        # SECURE ROW ISOLATION FILTER: Dynamic slice matching logged in profile tag
        user_isolated_df = df_bookings[df_bookings['Username'] == st.session_state.username]
        
        # User Specific Visual Summaries
        col1, col2 = st.columns(2)
        with col1:
            st.metric("Your Total Active Trips", f"{len(user_isolated_df)}")
        with col2:

