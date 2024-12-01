-- 1.	Which waiters have taken 2 or more bills on a single date? List the waiter names and surnames, the dates and the number of bills they have taken.

SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, COUNT(restBill.bill_no) AS num_bills
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY restStaff.first_name, restStaff.surname, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 2;


-- 2.	List the rooms with tables that can server more than 6 people and how many of such tables they have.

SELECT restRest_table.room_name, COUNT(restRest_table.table_no) AS num_large_tables
FROM restRest_table
WHERE restRest_table.no_of_seats > 6
GROUP BY restRest_table.room_name;

-- 3.	List the names of the rooms and the total amount of bills in each room

SELECT restRoom_management.room_name, SUM(restBill.bill_total) AS total_bill
FROM restBill
JOIN restRest_table ON restBill.table_no = restRest_table.table_no
JOIN restRoom_management ON restRoom_management.room_date = restBill.bill_date
AND restRoom_management.room_name = restRest_table.room_name
GROUP BY restRoom_management.room_name;

-- 4.	List the headwaiter’s name and surname and the total bill amount their waiters have taken. Order the list by total bill amount, largest first.
                     
SELECT restStaff.first_name, restStaff.surname, SUM(restBill.bill_total) AS total_bill_amount
FROM restStaff
JOIN restBill ON restStaff.staff_no = (
    SELECT restStaff.headwaiter
    FROM restStaff
    WHERE restBill.waiter_no = restStaff.staff_no
)
GROUP BY restStaff.first_name, restStaff.surname
ORDER BY total_bill_amount DESC;

-- 5.	List any customers who have spent more than £400 on average. 

SELECT restBill.cust_name, AVG(restBill.bill_total) AS avg_spent
FROM restBill
GROUP BY restBill.cust_name
HAVING AVG(restBill.bill_total) > 400.00;


-- 6.	Which waiters have taken 3 or more bills on a single date? List the waiter names, surnames, and the number of bills they have taken.

SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, COUNT(restBill.bill_no) AS num_bills
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY restStaff.first_name, restStaff.surname, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 3;