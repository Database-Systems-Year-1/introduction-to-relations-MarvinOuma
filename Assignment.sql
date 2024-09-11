CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    sex CHAR(1),
    salary DECIMAL(10, 2),
    super_id INT,
    branch_id INT,
    FOREIGN KEY (super_id) REFERENCES Employee(emp_id), 
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id) 
);


CREATE TABLE Branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY (mgr_id) REFERENCES Employee(emp_id) 
);



CREATE TABLE Client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(100),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id) 
);


CREATE TABLE Works_With (
    emp_id INT,
    client_id INT,
    total_sales DECIMAL(10, 2),
    PRIMARY KEY (emp_id, client_id), 
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id), 
    FOREIGN KEY (client_id) REFERENCES Client(client_id) 
);


CREATE TABLE Branch_Supplier (
    branch_id INT,
    supplier_name VARCHAR(100),
    supply_type VARCHAR(50),
    PRIMARY KEY (branch_id, supplier_name), 
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id) 
);


INSERT INTO Employee (emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES 
(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, 1),
(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1),
(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, 2),
(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2),
(104, 'Kelly', 'Kapoor', '1980-05-05', 'F', 55000, 102, 2),
(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2),
(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, 3),
(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3),
(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


INSERT INTO Branch (branch_id, branch_name, mgr_id, mgr_start_date)
VALUES 
(1, 'Corporate', 100, '2006-02-09'),
(2, 'Scranton', 102, '1992-04-06'),
(3, 'Stamford', 106, '1998-02-13');


INSERT INTO Client (client_id, client_name, branch_id)
VALUES 
(400, 'Dunmore Highschool', 2),
(401, 'Lackawanna Country', 2),
(402, 'FedEx', 3),
(403, 'John Daly Law, LLC', 3),
(404, 'Scranton Whitepages', 2),
(405, 'Times Newspaper', 3),
(406, 'FedEx', 2);


INSERT INTO Works_With (emp_id, client_id, total_sales)
VALUES 
(105, 400, 55000),
(102, 401, 267000),
(108, 402, 22500),
(107, 403, 5000),
(108, 403, 12000),
(105, 404, 33000),
(107, 405, 26000),
(102, 406, 15000),
(105, 406, 130000);


INSERT INTO Branch_Supplier (branch_id, supplier_name, supply_type)
VALUES 
(2, 'Hammer Mill', 'Paper'),
(2, 'Uni-ball', 'Writing Utensils'),
(2, 'Patriot Paper', 'Paper'),
(2, 'J.T. Forms & Labels', 'Custom Forms'),
(3, 'Uni-ball', 'Writing Utensils'),
(3, 'Hammer Mill', 'Paper'),
(3, 'Stamford Labels', 'Custom Forms');


SELECT E.first_name, E.last_name, B.branch_name
FROM Employee E
JOIN Branch B ON E.branch_id = B.branch_id;


SELECT E.first_name, E.last_name, SUM(W.total_sales) AS total_sales
FROM Employee E
JOIN Works_With W ON E.emp_id = W.emp_id
GROUP BY E.first_name, E.last_name;

