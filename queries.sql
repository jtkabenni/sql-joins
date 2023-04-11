-- Join the two tables so that every column and record appears, 
-- regardless of if there is not an owner_id.
SELECT * 
FROM owners 
FULL JOIN vehicles ON owners.id = vehicles.owner_id

-- Count the number of cars for each owner. Display the owners first_name , 
-- last_name and count of vehicles. The first_name should be ordered in ascending order. 
SELECT first_name, last_name, count(owner_id) 
FROM owners 
JOIN vehicles ON owners.id = vehicles.owner_id 
GROUP BY (first_name, last_name) 
ORDER BY first_name;

-- Count the number of cars for each owner and display the average price for each of the 
-- cars as integers. Display the owners first_name , last_name, average price and 
-- count of vehicles. The first_name should be ordered in descending order. 
-- Only display results with more than one vehicle and an average price greater than 10000. 
SELECT first_name, last_name, round(avg(price)), count(owner_id) 
FROM owners 
JOIN vehicles on owners.id = vehicles.owner_id 
GROUP BY (first_name, last_name) 
HAVING avg(price)>10000 AND count(owner_id)>1
ORDER BY first_name desc;
