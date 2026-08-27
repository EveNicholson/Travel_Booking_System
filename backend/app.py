from flask import Flask, jsonify

app = Flask(__name__)

# 📊 Mock Data Object mirroring your TravelBookingSystem views layout
mock_booking_summary = [
    {
        "UserID": 1,
        "Username": "Ewelina_Nicholson",
        "Airline": "American Airlines",
        "FlightPrice": 300.00,
        "HotelName": "Radison",
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
        "HotelName": "Denver",
        "StayDuration": 4,
        "TotalHotelCost": 480.00,
        "CarType": "SUV",
        "TotalCarCost": 320.00,
        "TotalBookingCost": 1050.00
    }
]

@app.route('/api/health', methods=['GET'])
def health_check():
    return jsonify({"status": "online", "message": "Travel Booking API layer is functional"}), 200

@app.route('/api/bookings/summary', methods=['GET'])
def get_booking_summary():
    # Returns the structured objects mapping directly to your analytics layer definitions
    return jsonify({
        "total_records": len(mock_booking_summary),
        "data": mock_booking_summary
    }), 200

@app.route('/api/bookings/<int:booking_id>', methods=['GET'])
def get_single_booking(booking_id):
    # Matches individual reference query strings
    user_record = [b for b in mock_booking_summary if b["UserID"] == booking_id]
    if not user_record:
        return jsonify({"message": f"Booking ID {booking_id} not found"}), 404
    return jsonify({"booking_details": user_record[0]}), 200

if __name__ == '__main__':
    app.run(debug=True, port=8080)
