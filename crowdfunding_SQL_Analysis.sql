-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT COUNT (back.backer_id), camp.cf_id
FROM backers AS back
INNER JOIN campaign AS camp
ON (back.cf_id = camp.cf_id)
WHERE (camp.outcome = 'live')
GROUP BY camp.cf_id
ORDER BY COUNT DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT(cf_id)
FROM backers
GROUP BY cf_id
ORDER BY COUNT DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT con.first_name, con.last_name, con.email, (camp.goal - camp.pledged) AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts AS con
JOIN campaign AS camp
ON con.contact_id = camp.contact_id
WHERE camp.outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC;


-- Check the table
select * from email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT ba.email, ba.first_name, ba.last_name, ba.cf_id, cam.company_name, cam.description, cam.end_date, (cam.goal - cam.pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers as ba
JOIN campaign AS cam
ON (cam.cf_id = ba.cf_id)
WHERE (cam.outcome = 'live')
order by ba.email desc;

-- Check the table
select * from email_backers_remaining_goal_amount

