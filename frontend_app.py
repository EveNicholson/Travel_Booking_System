import streamlit as st
import pandas as pd
import plotly.express as px

# 🌐 Set Page Layout Configuration
st.set_page_config(page_title="Master Administrator Portal", layout="wide", page_icon="⚙️")

# 🔒 Initialize Session State Databases (Your Complete Database Records Matching SQL Layout)
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

# 📝 Complete Target Database User Directory (Sourced from your SQL script entries)
database_users = [
    "Ewelina_Nicholson",
    "Philip_Nicholson",
    "Marta_Guzik",
    "Jarek_Kuden",
    "Dorota_Dybas"
]

# 🔐 Clean Credentials Register (Restricting access exclusively to admin)
admin_credentials = {
    "admin": "Admin2026!"
}

# 🔐 LOGIN GATE CONTROL FLOW
if 'logged_in' not in st.session_state:
    st.session_state.logged_in = False
    st.session_state.username = ""

if not st.session_state.logged_in:
    st.title("🔒 Secure Executive Login")
    st.markdown("Please enter your Master Administrator authentication credentials.")
    
    login_username = st.text_input("Username")
    login_password = st.text_input("Password", type="password")
    
    if st.button("Secure Login 🔑", use_container_width=True):
        if login_username in admin_credentials and admin_credentials[login_username] == login_password:
            st.session_state.logged_in = True
            st.session_state.username = login_username
            st.rerun()
        else:
            st.error("Access Refused: Invalid administrative credentials or unauthorized profile mapping.")
else:
    # 🔓 AUTHENTICATED SYSTEM PORTAL INTERFACE (Admin Exclusive Workspace)
    st.sidebar.title(f"👤 Account: {st.session_state.username}")
    st.sidebar.markdown("⭐ **Role: System Administrator**")
    
    if st.sidebar.button("Logout 🚪"):
        st.session_state.logged_in = False
        st.session_state.username = ""
        st.rerun()

    df_bookings = pd.DataFrame(st.session_state.bookings)
    df_hotels = pd.DataFrame(st.session_state.hotels)

    st.title("⚙️ Master Administrator Booking Management System")
    st.markdown("Full transactional system access: View global corporate trends, manage operational data records, and run overrides.")
    st.markdown("---")
    
    # Administrative Performance KPIs
    col1, col2, col3 = st.columns(3)
    with col1: 
        st.metric("Total Active Platform Transactions", len(df_bookings))
    with col2: 
        st.metric("Gross Platform Revenue", f"£{df_bookings['TotalBookingCost'].sum():,.2f}")
    with col3:
        st.metric("Average Transaction Value", f"£{df_bookings['TotalBookingCost'].mean():,.2f}")
        
    st.markdown("---")
    
    # Booking Entry Override Management Form Panel
    st.subheader("➕ Administrative Override: Book a New Destination Package")
    form_col1, form_col2 = st.columns(2)
    with form_col1:
        # 👥 Dropdown containing your real database users list
        client_name = st.selectbox("Select Target Database Account", database_users)
        c_airline = st.selectbox("Assign Flight Carrier Line", ["American Airlines", "United Airlines", "Delta Airlines", "British Airways"])
    with form_col2:
        c_hotel = st.selectbox("Assign Destination Hotel Accommodation", [h["HotelName"] for h in st.session_state.hotels])
        stay_duration = st.number_input("Assign Stay Length (Nights)", min_value=1, max_value=30, value=5)
        
    if st.button("Execute Administrative Booking 🚀", use_container_width=True):
        hotel_base = next(h for h in st.session_state.hotels if h["HotelName"] == c_hotel)
        f_price = 300.00 if "American" in c_airline else 250.00
        h_total = hotel_base["PricePerNight"] * stay_duration
        t_cost = f_price + h_total
        
        # Simulating SQL trigger room reductions
        for h in st.session_state.hotels:
            if h["HotelName"] == c_hotel: h["AvailableRooms"] -= 1
            
        st.session_state.bookings.append({
            "BookingID": len(st.session_state.bookings) + 1,
            "Username": client_name,
            "Airline": c_airline,
            "FlightPrice": f_price,
            "HotelName": c_hotel,
            "StayDuration": stay_duration,
            "TotalHotelCost": h_total,
            "TotalBookingCost": t_cost
        })
        st.success(f"Administrative override successful. Transacted booking logged for user '{client_name}'.")
        st.rerun()
        
    st.markdown("---")
    
    # Visual Matrix Trends Grid Summary Section
    left_ch, right_ch = st.columns(2)
    with left_ch:
        fig_rev = px.bar(df_bookings, x='Airline', y='TotalBookingCost', color='Airline', title="Platform Revenue Split by Flight Carrier")
        st.plotly_chart(fig_rev, use_container_width=True)
    with right_ch:
        fig_inv = px.bar(df_hotels, x='HotelName', y='AvailableRooms', color='HotelName', title="Live Available Room Inventory Status")
        st.plotly_chart(fig_inv, use_container_width=True)
        
    st.markdown("---")
    
    # Core Global Master Data Log Grid (Displays everything sequentially)
    st.subheader("📋 Core Data Registry: Global Master Transaction Log")
    st.dataframe(df_bookings, use_container_width=True)
