-- 1.	List the names of customers who spent more than 450.00 on a single bill on occasions when ‘Charles’ was their Headwaiter.

SELECT restBill.cust_name
FROM restBill
WHERE restBill.bill_total > 450.00
AND restBill.waiter_no IN (
    SELECT restStaff.staff_no
    FROM restStaff
    WHERE restStaff.headwaiter = (
        SELECT restStaff.staff_no
        FROM restStaff
        WHERE restStaff.first_name = 'Charles'
    )
);

-- 2.	A customer called Nerida has complained that a waiter was rude to her when she dined at the restaurant on the 11th January 2016. What is the name and surname of the Headwaiter who will have to deal with the matter?

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.staff_no = (
    SELECT restStaff.headwaiter
    FROM restStaff
    WHERE restStaff.staff_no = (
        SELECT restBill.waiter_no
        FROM restBill
        WHERE restBill.cust_name = 'Nerida Smith' AND restBill.bill_date = 160111
    )
);

-- 3.	What are the names of customers with the smallest bill?

SELECT restBill.cust_name, restBill.bill_total
FROM restBill
WHERE restBill.bill_total = (
    SELECT MIN(restBill.bill_total)
    FROM restBill
); 

-- 4.	List the names of any waiters who have not taken any bills.

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.staff_no NOT IN (
    SELECT DISTINCT restBill.waiter_no
    FROM restBill
);      


-- 5.	Which customers had the largest single bill? List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.

SELECT DISTINCT restBill.cust_name, 
       restStaff.first_name, 
       restStaff.surname, 
       restRoom_management.room_name
FROM restBill
JOIN restRoom_management ON restBill.bill_date = restRoom_management.room_date
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restBill.bill_total = (
    SELECT MAX(restBill.bill_total)
    FROM restBill
);
