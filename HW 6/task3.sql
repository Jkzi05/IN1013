-- 1.	List the names of the waiters who have served the customer Tanya Singh.

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.cust_name = 'Tanya Singh';


-- 2.	On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room? The output date should be in the format they are stored.

SELECT restRoom_management.room_date
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles' AND restRoom_management.room_name = 'Green' 
AND restRoom_management.room_date BETWEEN 160201 AND 160229;

-- 3.	List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.headwaiter = (
    SELECT restStaff.headwaiter
    FROM restStaff
    WHERE restStaff.first_name = 'Zoe' AND restStaff.surname = 'Ball'
);

-- 4.	List the customer name, the amount they spent and the waiter’s name for all bills. Order the list by the amount spent, highest bill first.

SELECT restBill.cust_name, restBill.bill_total, 
       restStaff.first_name || ' ' || restStaff.surname AS waiter_name
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

-- 5.	List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017.

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.staff_no IN (
    SELECT restBill.waiter_no
    FROM restBill
    WHERE restBill.bill_no IN (00014, 00017)
);

-- 6 