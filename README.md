# Travel Booking System Database

A relational MySQL database schema designed to manage an online travel agency platform. It handles users, flight bookings, hotel reservations, car rentals, locations, and customer reviews.

## 📌 Core Features
* **Automated Inventory:** Decrements hotel room availability instantly when a booking is made.
* **Auto-Status Updates:** A scheduled event runs every hour to switch past trips to "Completed".
* **Dynamic Cost Calculation:** A built-in database function automatically calculates total trip costs by combining flight prices, hotel night totals, and daily car rental fees.

---

## 🏗️ Database Structure

The database consists of 7 primary tables:
1. **User:** Profile details, credentials, and encrypted payment tokens.
2. **Location:** Destinations with descriptions, average temperatures, and local currencies.
3. **Hotel:** Property info, available rooms, amenities, nightly rates, and ratings.
4. **Flight:** Airlines, departure/arrival schedules, seat availability, and ticket prices.
5. **CarRental:** Vehicle types, daily rental rates, and key features per location.
6. **Booking:** Core transaction table linking users to their selected flights, hotels, and cars.
7. **ReviewAndRating:** User feedback and scores for individual hotels.

---

## 🚀 Quick Setup Guide

### 1. Prerequisites
Ensure you have **MySQL Server** installed and running on your machine.

### 2. Installation & Deployment
Open your command terminal or MySQL workbench and execute the script:

```sql
-- 1. Create and select the database
CREATE DATABASE TravelBookingSystem;
USE TravelBookingSystem;

-- 2. Run the provided SQL script to generate tables and insert sample records.
```

### 3. Verification
Run this quick query to confirm the database setup is populated with mock data:
```sql
SELECT * FROM BookingSummary;
```

---

## 🛠️ Key Stored Features Example

### Calculate Booking Cost
```sql
-- Get the total combined invoice amount for Booking ID #7
SELECT CalculateTotalBookingCost(7); 
```

### Fetch Booking Details
```sql
-- Retrieve all hotel, car, and flight info for Booking ID #9
CALL GetBookingDetails(9);
```
