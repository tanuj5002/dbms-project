||||||||||||||||||||||||||||||||||||||||||||||||||||||||       Railway Reservation System     ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


This project is a complete database system for managing train reservations, built using MySQL. It includes table schemas, procedures, and triggers for real-time operations like booking, cancellation, seat allocation, payments, and reporting.

------------------------------------------------------------------------------------------------------------------------------------------------------

>>>>>>>>>>>> Files Included <<<<<<<<<<<<<<

-> `railway.sql`: Contains schema for all tables such as `Booking`, `Route`, `Passenger`, `Train`, etc.
-> `queries-proc.txt`: Contains stored procedures and triggers for core functionality.
-> CSV export commands (optional) for table data backup or analytics.

-----------------------------------------------------------------------------------------------------------------------------------------------------------

>>>>>>>>>>>> Database Tables Overview <<<<<<<<<<<<<<

-------------------------------------------------------------------
| Table            | Purpose                                      |
|------------------|----------------------------------------------|
| Booking          | Stores ticket and seat reservation data      |
| Passenger        | Stores passenger details                     |
| Train            | Holds info on train services                 |
| Route            | Defines stops and distances per train        |
| Seat, Coach      | Seat and coach assignment                    |
| Class            | Class and fare details                       |
| Payment          | Payment records for bookings                 |
| SeatAllocation   | Tracks live allocation of seats              |
| Station          | Stores station codes and names               |
| BookingStatus    | Tracks booking status (confirmed, waitlist)  |
| Feedback         | Stores passenger feedback                    |
| Users            | Login/authentication data (if used)          |
-------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------

>>>>>>>>>>>> Stored Procedures <<<<<<<<<<<<<<

==>  Booking Operations ------------
-> `BookTicket`: Assigns seat, calculates fare, displays itemized bill
-> `cancel`: Cancels a booking and updates refund/seat allocation
-> `MakePayment`: Handles payment logic and updates booking status

==>  Reporting Procedures
-> `wlist(p_trainID)`: Shows waitlist count per train
-> `totalAmount()`: Returns net revenue = total paid - refunds
-> `revgen(stDate, endDate)`: Revenue generated in a specific date range
-> `track(pnr)`: Tracks PNR and shows journey/seat info
-> `passengerlist(p_trainid, p_date)`: Lists all passengers on a train/date
-> `availseats(p_trainid, p_date, p_class)`: Shows available seats
-> `listwl(p_trainid, p_date)`: Lists waitlisted passengers
-> `slookup(p_trainID)`: Shows train schedule and stop details

--------------------------------------------------------------------------------------------------------------------------------------------------------

>>>>>>>>>>>> Triggers <<<<<<<<<<<<<<

==> `after_booking_insert`
-> Allocates seat after successful booking
-> Inserts into `SeatAllocation`

==>  `after_booking_cancel`
-> Triggered when a booking is cancelled
-> Marks seat as available
-> Updates payment and refund info
-> Updates `SeatAllocation` status

--------------------------------------------------------------------------------------------------------------------------------------------------------

>>>>>>>>>>>> Ticket Bill (Fare Calculation) <<<<<<<<<<<<<<

-> Fare is calculated as:
   BaseFare = (journey distance * fare-per-km)

-> Additional charges:
-> Convenience Fee = ₹50
-> Platform Fee = ₹50
-> Total = BaseFare + 50 + 50

-> Bill is shown inside the `BookTicket` procedure — **no result sets are returned from triggers** due to MySQL limitations.

---

>>>>>>>>>>>> Export Data to CSV <<<<<<<<<<<<<<

You can export each table to `.csv` from MySQL using:

```sql
SELECT * INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/booking.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' FROM Booking;


