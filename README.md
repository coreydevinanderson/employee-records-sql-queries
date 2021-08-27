This repository contains postgreSQL code and supporting files for employee records from the "Packard Hewlett" PostgreSQL database.

There are two .sql files:
    
    1) table_schema.sql
    2) employee_queries.sql

The image file (.png) of the ERD is named: QuickDBD-EmployeeSQL_schema.png

The directory "data" contains the source .csv files (n = 6) that should be imported after running table_schema.sql 
    
    1) employees.csv 
    2) departments.csv
    3) dept_emp.csv
    4) dept_manager.csv
    5) titles.csv
    6) salaries.csv

The eight questions/queries are in employee_queries.sql 

Extra content is contained in a jupyter notebook (.ipynb).

I used 'pandas' along with create_engine from 'sqlalchemy' to emulate the postgreSQL database. Configuring the database_path for postgreSQL required installing 'psycopg2'.

The image file (.png) of the ERD is named: QuickDBD-EmployeeSQL_schema.png





