import streamlit as st
import pandas as pd
import plotly.express as px
from datetime import date

st.set_page_config(page_title="Master Administrator Portal", layout="wide", page_icon="⚙️")

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

if 'user_registry' not in st.session_state:
    st.session_state.user_registry = [
        {"Username": "Ewelina_Nicholson", "Email": "ewelina@gmail.com", "FirstName": "Ewelina", "LastName": "Nicholson", "Address": "123 St. Ninians Road, Edinburgh", "PhoneNumber": "123-456-7890", "PaymentInformation": "0x6A723E1F98"},
        {"Username": "Philip_Nicholson", "Email": "philip@gyahoo.com", "FirstName": "Philip", "LastName": "Nicholson", "Address": "432 Morisson Road, Edinburgh", "PhoneNumber": "987-654-3210", "PaymentInformation": "0x5A723B1F98"},
        {"Username": "Marta_Guzik", "Email": "marta@gmail.com", "FirstName": "Marta", "LastName": "Guzik", "Address": "207 Southhouse Drive, Edinburgh", "PhoneNumber": "934-632-3245", "PaymentInformation": "0x8Z723J1F58"},
        {"Username": "Jarek_Kuden", "Email": "jarek@yahoo.com", "FirstName": "Jarek", "LastName": "Kuden", "Address": "56 Gilmerton Drive, Edinburgh", "PhoneNumber": "432-567-3987", "PaymentInformation": "0x1Z926J1K58"},
        {"Username": "Dorota_Dybas", "Email": "dorota@gmail.com", "FirstName": "Dorota", "LastName": "Dybas", "Address": "987 Cakemuir Drive, Edinburgh", "PhoneNumber": "324-543-8765", "PaymentInformation": "0x1Q926J1J09"}
    ]

admin_credentials = {"admin": "Admin2026!"}

if 'logged_in' not in st.session_state:
    st.session_state.logged_in = False
    st.session_state.username = ""

if not st.session_state.logged_in:
    st.title("🔒 Secure Executive Login")
    st.markdown("Please enter your Master Administrator credentials.")
    login_username = st.text_input("Username")
    login_password = st.text_input("Password", type="password")
    if st.button("Secure Login 🔑", use_container_width=True):
        if login_username in admin_credentials and admin_credentials[login_username] == login_password:
            st.session_state.logged_in = True
            st.session_state.username = login_username
            st.rerun()
        else:
            st.error("Access Refused: Invalid administrative credentials.")
else:
    st.sidebar.title(f"👤 Account: {st.session_state.username}")
    st.sidebar.markdown("⭐ **Role: System Administrator**")
    if st.sidebar.button("Logout 🚪"):
        st.session_state.logged_in = False
        st.session_state.username = ""
        st.rerun()

    df_bookings = pd.DataFrame(st.session_state.bookings)
    df_hotels = pd.DataFrame(st.session_state.hotels)
    df_users = pd.DataFrame(st.session_state.user_registry)

    st.title("⚙️ Master Administrator Booking Management System")
    st.markdown("---")

    st.subheader("🆕 Register a New Customer Profile (SQL Schema Format)")
    with st.form("user_registration_form", clear_on_submit=True):
        r_col1, r_col2 = st.columns(2)
        with r_col1:
            u_name = st.text_input("Username", placeholder="e.g. John_Doe")
            u_pass = st.text_input("Password", type="password", placeholder="Password string")
            u_email = st.text_input("Email Address", placeholder="name@domain.com")
            u_first = st.text_input("First Name")
        with r_col2:
            u_last = st.text_input("Last Name")
            u_addr = st.text_input("Physical Residential Address")
            u_phone = st.text_input("Phone Number")
            u_pay = st.text_input("Payment Information", placeholder="e.g. 0x9L912J1...")
            
        submit_user = st.form_submit_button("Commit User to Database Matrix 👤", use_container_width=True)
        if submit_user:
            if not u_name or not u_email or not u_first:
                st.error("Validation Error: Username, Email, and First Name cannot be blank!")
            elif u_name in [user['Username'] for user in st.session_state.user_registry]:
                st.warning(f"Constraint Violation: Username '{u_name}' already exists!")
            else:
                st.session_state.user_registry.append({
                    "Username": u_name, "Email": u_email, "FirstName": u_first, 
                    "LastName": u_last, "Address": u_addr, "PhoneNumber": u_phone, "PaymentInformation": u_pay
                })
                st.success(f"SQL Simulation: INSERT INTO User info logged successfully for '{u_name}'!")
                st.rerun()

    st.markdown("---")
    st.subheader("➕ Administrative Override: Book a New Destination Package")
    form_col1, form_col2 = st.columns(2)
    with form_col1:
        client_name = st.selectbox("Select Target Database Account", [user['Username'] for user in st.session_state.user_registry])
        c_airline = st.selectbox("Assign Flight Carrier Line", ["American Airlines", "United Airlines", "Delta Airlines", "British Airways"])
    with form_col2:
        c_hotel = st.selectbox("Assign Destination Hotel Accommodation", [h['HotelName'] for h in st.session_state.hotels])
        stay_duration = st.number_input("Assign Stay Length (Nights)", min_value=1, max_value=30, value=5)
        
    if st.button("Execute Administrative Booking 🚀", use_container_width=True):
        hotel_base = next(h for h in st.session_state.hotels if h['HotelName'] == c_hotel)
        f_price = 300.00 if "American" in c_airline else 250.00
        h_total = hotel_base['PricePerNight'] * stay_duration
        t_cost = f_price + h_total
        for h in st.session_state.hotels:
            if h['HotelName'] == c_hotel: h['AvailableRooms'] -= 1
        st.session_state.bookings.append({
            "BookingID": len(st.session_state.bookings) + 1, "Username": client_name,
            "Airline": c_airline, "FlightPrice": f_price, "HotelName": c_hotel,
            "StayDuration": stay_duration, "TotalHotelCost": h_total, "TotalBookingCost": t_cost
        })
        st.success(f"Override logged for user '{client_name}'.")
        st.rerun()
        
    st.markdown("---")
    left_ch, right_ch = st.columns(2)
    with left_ch:
        st.subheader("📋 Registered Users Ledger")
        st.dataframe(df_users, use_container_width=True)
    with right_ch:
        st.subheader("🏨 Room Inventory Levels")
        fig_inv = px.bar(df_hotels, x='HotelName', y='AvailableRooms', color='HotelName')
        st.plotly_chart(fig_inv, use_container_width=True)
        
    st.markdown("---")
    st.subheader("📋 Core Data Registry: Global Master Transaction Log")
    st.dataframe(df_bookings, use_container_width=True)