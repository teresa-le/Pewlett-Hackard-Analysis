-- Deliverable 1 Queries

-- Create Retirement Titles table for retiring employees 
SELECT e.emp_no, 
	   first_name,
	   last_name, 
 	   title,
	   from_date,
	   to_date
INTO retirement_titles
FROM titles as t INNER JOIN employees as e
	ON t.emp_no = e.emp_no 
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Find number of retiring employees by title 
SELECT COUNT(*),
	   title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC

-- Deliverable 2 Queries 

-- Employees eligibile for mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	   first_name,
	   last_name,
	   birth_date,
	   de.from_date, 
	   de.to_date,
	   title 
INTO mentorship_eligibility 
FROM employees AS e 
	INNER JOIN dept_emp AS de
		ON e.emp_no = de.emp_no
	INNER JOIN titles AS t
		ON e.emp_no = t.emp_no 
WHERE de.to_date = '9999-01-01'
	AND birth_date BETWEEN '1965-01-01' AND '12-31-1965'
ORDER BY emp_no;







