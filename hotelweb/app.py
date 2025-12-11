from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)


DB_CONFIG = {
    "host": "localhost",
    "user": "your_user",
    "password": "your_password",
    "database": "LastResortHotel",
}


def get_db_connection():
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        return conn
    except mysql.connector.Error:
        return None


def load_data():
    conn = get_db_connection()

    if conn is not None:
        cur = conn.cursor(dictionary=True)

        q1_sql = """
            SELECT st.serviceName,
                   ROUND(SUM(c.price * c.quantity), 2) AS totalRevenue
            FROM Charge c
            JOIN ServiceType st ON c.serviceTypeID = st.serviceTypeID
            GROUP BY st.serviceName
            ORDER BY totalRevenue DESC;
        """
        cur.execute(q1_sql)
        q1_results = cur.fetchall()

        q2_sql = """
            SELECT rt.typeName,
                   ROUND(AVG(DATEDIFF(rsv.endDate, rsv.startDate)), 1) AS avgStayDays
            FROM Reservation rsv
            JOIN Room rm ON rsv.roomID = rm.roomID
            JOIN RoomType rt ON rm.roomTypeID = rt.roomTypeID
            GROUP BY rt.typeName
            ORDER BY avgStayDays DESC;
        """
        cur.execute(q2_sql)
        q2_results = cur.fetchall()

        q3_sql = """
            SELECT rm.roomNumber,
                   ROUND(
                       SUM(TIMESTAMPDIFF(HOUR, eru.actualStart, eru.actualEnd)) /
                       SUM(TIMESTAMPDIFF(HOUR, eru.scheduledStart, eru.scheduledEnd)) * 100,
                       2
                   ) AS utilizationRate
            FROM EventRoomUsage eru
            JOIN Room rm ON eru.roomID = rm.roomID
            GROUP BY rm.roomNumber
            ORDER BY utilizationRate DESC;
        """
        cur.execute(q3_sql)
        q3_results = cur.fetchall()

        q4_sql = """
            SELECT g.firstName,
                   g.lastName,
                   SUM(c.price * c.quantity) AS totalSpend
            FROM Charge c
            JOIN Guest g ON c.guestID = g.guestID
            GROUP BY g.guestID, g.firstName, g.lastName
            ORDER BY totalSpend DESC
            LIMIT 10;
        """
        cur.execute(q4_sql)
        q4_results = cur.fetchall()

        q5_sql = """
            SELECT g.guestID,
                   g.firstName,
                   g.lastName,
                   ROUND(
                       SUM(c.price * c.quantity) / COUNT(DISTINCT c.chargeID),
                       2
                   ) AS avgRevenuePerCharge
            FROM Guest g
            JOIN Charge c ON g.guestID = c.guestID
            GROUP BY g.guestID, g.firstName, g.lastName
            ORDER BY avgRevenuePerCharge DESC
            LIMIT 10;
        """
        cur.execute(q5_sql)
        q5_results = cur.fetchall()

        q6_sql = """
            SELECT b.buildingName,
                   ROUND(AVG(DATEDIFF(r.endDate, r.startDate)), 1) AS avgStayDays
            FROM Reservation r
            JOIN Room rm ON r.roomID = rm.roomID
            JOIN Floor f ON rm.floorID = f.floorID
            JOIN Wing w ON f.wingID = w.wingID
            JOIN Building b ON w.buildingID = b.buildingID
            GROUP BY b.buildingName
            ORDER BY avgStayDays DESC;
        """
        cur.execute(q6_sql)
        q6_results = cur.fetchall()

        q7_sql = """
            SELECT e.hostID,
                   COUNT(e.eventID) AS totalEvents
            FROM Event e
            GROUP BY e.hostID
            ORDER BY totalEvents DESC
            LIMIT 10;
        """
        cur.execute(q7_sql)
        q7_results = cur.fetchall()

        q8_sql = """
            SELECT DATE_FORMAT(r.startDate, '%Y-%m') AS month,
                   COUNT(r.reservationID) AS totalReservations
            FROM Reservation r
            GROUP BY DATE_FORMAT(r.startDate, '%Y-%m')
            ORDER BY month;
        """
        cur.execute(q8_sql)
        q8_results = cur.fetchall()

        cur.close()
        conn.close()
        data_source = "live"

    else:
        q1_results = [
            {"serviceName": "Room Night", "totalRevenue": 102150.00},
            {"serviceName": "Room Rental", "totalRevenue": 14850.00},
            {"serviceName": "Wellness Bath", "totalRevenue": 2880.00},
            {"serviceName": "Car Space", "totalRevenue": 2700.00},
            {"serviceName": "Late Bites", "totalRevenue": 1800.00},
            {"serviceName": "Snack Tray", "totalRevenue": 690.00},
        ]

        q2_results = [
            {"typeName": "Brightening Suite", "avgStayDays": 4.5},
            {"typeName": "Cozy Queen", "avgStayDays": 3.0},
            {"typeName": "Grand King", "avgStayDays": 2.0},
        ]

        q3_results = [
            {"roomNumber": "E204", "utilizationRate": 96.67},
            {"roomNumber": "E201", "utilizationRate": 93.33},
            {"roomNumber": "E202", "utilizationRate": 86.67},
            {"roomNumber": "E203", "utilizationRate": 83.33},
        ]

        q4_results = [
            {"firstName": "Guest19", "lastName": "LRH19", "totalSpend": 4980.00},
            {"firstName": "Guest9", "lastName": "LRH9", "totalSpend": 4950.00},
            {"firstName": "Guest49", "lastName": "LRH49", "totalSpend": 3280.00},
            {"firstName": "Guest29", "lastName": "LRH29", "totalSpend": 3280.00},
            {"firstName": "Guest79", "lastName": "LRH79", "totalSpend": 3280.00},
            {"firstName": "Guest39", "lastName": "LRH39", "totalSpend": 3280.00},
            {"firstName": "Guest59", "lastName": "LRH59", "totalSpend": 3280.00},
            {"firstName": "Guest69", "lastName": "LRH69", "totalSpend": 3280.00},
            {"firstName": "Guest5", "lastName": "LRH5", "totalSpend": 3075.00},
            {"firstName": "Guest15", "lastName": "LRH15", "totalSpend": 3075.00},
        ]

        q5_results = [
            {"guestID": 79, "firstName": "Guest79", "lastName": "LRH79", "avgRevenuePerCharge": 1640.00},
            {"guestID": 39, "firstName": "Guest39", "lastName": "LRH39", "avgRevenuePerCharge": 1640.00},
            {"guestID": 29, "firstName": "Guest29", "lastName": "LRH29", "avgRevenuePerCharge": 1640.00},
            {"guestID": 69, "firstName": "Guest69", "lastName": "LRH69", "avgRevenuePerCharge": 1640.00},
            {"guestID": 59, "firstName": "Guest59", "lastName": "LRH59", "avgRevenuePerCharge": 1640.00},
            {"guestID": 49, "firstName": "Guest49", "lastName": "LRH49", "avgRevenuePerCharge": 1640.00},
            {"guestID": 19, "firstName": "Guest19", "lastName": "LRH19", "avgRevenuePerCharge": 1245.00},
            {"guestID": 9, "firstName": "Guest9", "lastName": "LRH9", "avgRevenuePerCharge": 1237.50},
            {"guestID": 38, "firstName": "Guest38", "lastName": "LRH38", "avgRevenuePerCharge": 705.00},
            {"guestID": 74, "firstName": "Guest74", "lastName": "LRH74", "avgRevenuePerCharge": 700.00},
        ]

        q6_results = [
            {"buildingName": "Golden Tower", "avgStayDays": 3.0},
            {"buildingName": "Cliff Hub", "avgStayDays": 3.0},
        ]

        q7_results = [
            {"hostID": 101, "totalEvents": 4},
            {"hostID": 102, "totalEvents": 4},
            {"hostID": 103, "totalEvents": 4},
            {"hostID": 104, "totalEvents": 4},
            {"hostID": 105, "totalEvents": 4},
        ]

        q8_results = [
            {"month": "2025-10", "totalReservations": 62},
            {"month": "2025-11", "totalReservations": 60},
            {"month": "2025-12", "totalReservations": 58},
        ]

        data_source = "demo"

    total_service_revenue = sum(row["totalRevenue"] for row in q1_results) if q1_results else 0
    overall_avg_stay = round(sum(row["avgStayDays"] for row in q2_results) / len(q2_results), 1) if q2_results else 0

    if q8_results:
        peak_row = max(q8_results, key=lambda r: r["totalReservations"])
        peak_month = peak_row["month"]
        peak_reservations = peak_row["totalReservations"]
    else:
        peak_month = ""
        peak_reservations = 0

    if q4_results:
        top_guest_name = f"{q4_results[0]['firstName']} {q4_results[0]['lastName']}"
        top_guest_spend = q4_results[0]["totalSpend"]
    else:
        top_guest_name = ""
        top_guest_spend = 0

    return {
        "q1_results": q1_results,
        "q2_results": q2_results,
        "q3_results": q3_results,
        "q4_results": q4_results,
        "q5_results": q5_results,
        "q6_results": q6_results,
        "q7_results": q7_results,
        "q8_results": q8_results,
        "total_service_revenue": total_service_revenue,
        "overall_avg_stay": overall_avg_stay,
        "peak_month": peak_month,
        "peak_reservations": peak_reservations,
        "top_guest_name": top_guest_name,
        "top_guest_spend": top_guest_spend,
        "data_source": data_source,
    }


@app.route("/")
def dashboard():
    data = load_data()
    return render_template("dashboard.html", **data)


@app.route("/search")
def search():
    query = request.args.get("q", "").strip()
    data = load_data()
    q4_results = data["q4_results"]

    matches = []
    if query:
        q_lower = query.lower()
        for row in q4_results:
            full_name = f"{row['firstName']} {row['lastName']}".lower()
            if q_lower in full_name:
                matches.append(row)

    data["search_query"] = query
    data["search_results"] = matches
    return render_template("dashboard.html", **data)


if __name__ == "__main__":
    app.run(debug=True)
