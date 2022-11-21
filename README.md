# Employee Database Analysis 

## Overview of Analysis 

### Purpose

The purpose of this analysis is to analyze data on employees to gain a better understanding of the population of employees that will likely retire. This will assist with forecasting future vacanies and hiring needs.

## Results

* Half of the staff members who are going to be retiring are engineers, and most of the staff members who are going to be retiring are senior staff members.

<img src="https://github.com/teresa-le/pewlett-hackard-analysis/blob/main/Resources/Retiring_Titles.png">

* There are currently no managers amongst the staff members who are eligible for mentorship.

<image src="https://github.com/teresa-le/pewlett-hackard-analysis/blob/main/Resources/Mentorship_Eligibility.png">

* In terms of hiring needs, Pewlett Hackard needs to prioritize mentoring future staff members to become managers and senior SMEs and look to hire externally in the future for both senior and junior staff members. 

## Summary 

### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

The retirement eligible employees hold 72,458 roles. Of those, 16,981 of them are held by those born in 1952 and will need to be filled as the "silver tsunami" begins to make its impact. 

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

There are enough qualified, retirement-ready employees in the departments to mentor the next generation of employees (50,844 senior staff members and managers). They greatly outnumber the number of employees eligible for mentorship, which is 1,549.


#### Appendix to Summary 

-- Number of retiring employees 
SELECT SUM(COUNT)
FROM retiring_titles;

-- Number of employees retiring born in 1952 
SELECT COUNT(*)
FROM (SELECT DISTINCT ON (e.emp_no) e.emp_no
	FROM titles as t INNER JOIN employees as e
		ON t.emp_no = e.emp_no 
	WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31'
	AND to_date = '9999-01-01') as q 

-- Number of employees eligible for mentorship
SELECT COUNT(*)
FROM mentorship_eligibility;
