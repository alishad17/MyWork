-- Keep a log of any SQL queries you execute as you solve the mystery.

-- examine crime scene reports for date and location
SELECT *
FROM crime_scene_reports
WHERE year = '2021'
AND day = '28'
AND month = '7'
AND street like 'Humphrey%';
-- DISCOVERED: bakery, 10:15am, 3 witnesses

-- find interviews of witnessess at bakery
SELECT *
FROM interviews
WHERE year = '2021'
AND day = '28'
AND month = '7'
AND transcript like '%bakery%';
-- DISCOVERED: thief drove away in car within 10 mins, thief went to ATM on Leggett Street sometime before, thief plans to take earliest flight away tomorrow

-- retrieve persons who went to ATM around the correct time and location
SELECT person_id
FROM bank_accounts
WHERE account_number IN
(SELECT account_number
FROM atm_transactions
WHERE year = '2021'
AND day = '28'
AND month = '7'
AND atm_location like '%Leggett%');
-- 9 possible suspects

-- examine flight logs/plane schedule for suspects
SELECT passport_number
FROM passengers
WHERE flight_id IN
(SELECT id
FROM flights
WHERE origin_airport_id IN
(SELECT id
FROM airports
WHERE city like '%Fiftyville%') -- thief is taking flight out of fiftyville
AND year = '2021'
AND month = '7'
AND day = '29'
AND hour = (SELECT MIN(hour) FROM flights -- thief plans to take earliest flight
WHERE origin_airport_id IN
(SELECT id
FROM airports
WHERE city like '%Fiftyville%')
AND year = '2021'
AND month = '7'
AND day = '29'));
-- 8 possible suspects

-- get suspects from phone call placed at specific time
SELECT caller
FROM phone_calls
WHERE year = '2021'
AND month = '7'
AND day = '28'
AND duration < 60; -- phone call was less than a minute
-- 9 possible suspects

-- gather suspects from licence plate when driving away
SELECT license_plate
FROM bakery_security_logs
WHERE year = '2021'
AND month = '7'
AND day = '28'
AND hour = '10'
AND minute BETWEEN 15 AND 25; -- drove away within 1o mins of theft
-- suspect list retrieved

-- combine suspect list to see if we have a common person
SELECT name
FROM people
WHERE id in
(SELECT person_id
FROM bank_accounts
WHERE account_number IN
(SELECT account_number
FROM atm_transactions
WHERE year = '2021'
AND day = '28'
AND month = '7'
AND atm_location like '%Leggett%'))
AND phone_number IN
(SELECT caller
FROM phone_calls
WHERE year = '2021'
AND month = '7'
AND day = '28'
AND duration < 60)
AND passport_number IN
(SELECT passport_number
FROM passengers
WHERE flight_id IN
(SELECT id
FROM flights
WHERE origin_airport_id IN
(SELECT id
FROM airports
WHERE city like '%Fiftyville%')
AND year = '2021'
AND month = '7'
AND day = '29'
AND hour = (SELECT MIN(hour) FROM flights
WHERE origin_airport_id IN
(SELECT id
FROM airports
WHERE city like '%Fiftyville%')
AND year = '2021'
AND month = '7'
AND day = '29')))
AND license_plate IN
(SELECT license_plate
FROM bakery_security_logs
WHERE year = '2021'
AND month = '7'
AND day = '28'
AND hour = '10'
AND minute BETWEEN 15 AND 25);
-- The thief is Bruce

-- Finding city thief escaped to
SELECT city
FROM airports
WHERE id IN
(SELECT destination_airport_id
FROM flights
WHERE origin_airport_id IN
(SELECT id
FROM airports
WHERE city like '%Fiftyville%') -- departed from FIftyville
AND year = '2021' -- time of flight
AND month = '7'
AND id IN
(SELECT flight_id
FROM passengers
WHERE passport_number = '5773159633')) -- passenger's passport number
-- Thief escaped to New York City

-- Finding accomplice
SELECT name
FROM people
WHERE phone_number IN -- thief called accomplice
(SELECT receiver
FROM phone_calls
WHERE caller = '(367) 555-5533'
AND year = '2021'
AND month = '7'
AND day = '28'
AND duration < 60);
-- Accomplice is Robin
