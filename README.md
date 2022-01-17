# Database querying for Business Development 
Data engineering and analysis 

## Background
Examining the six remaining CSV files from a corporation containing data on employees from the 1980s and 1990s. Tasked with designing the tables to hold the data in the CSVs, import the CSVs into a SQL database, and answewr questions about the data

## Data Engineering
Table schema was created for each of the six CSV files, specifying data types, primary keys, foreign keys and any other constraints. For this section it is important to create tables in the correct order to handle foreign keys. CSV files imported into the corresponding SQL table. For this part it is important to import the data in the same order the tables are created and account for headers when importing to avoid errors. Completing these steps will arrive us at a complete database ready to be analyzed 

## Data Analysis
The following instructions were succesfully quered in the database using the 'query.sql' file in the 'Employee Query' folder:
  
  -List the following details of each employee: employee number, last name, first name, sex, and salary.

  -List first name, last name, and hire date for employees who were hired in 1986.

  -List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

  -List the department of each employee with the following information: employee number, last name, first name, and department name.

  -List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

  -List all employees in the Sales department, including their employee number, last name, first name, and department name.

  -List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

  -In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.


  
