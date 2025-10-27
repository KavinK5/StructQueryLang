"""
CONSTRAINTS IN StructQueryLang

    1. Assigning the COLUMN that it should never take NULLs
    2. Assigning DEFAULT value to a COLUMN of its specified datatype
    3. The COLUMN must hold UNIQUE values
    4. CHECK: Performs Criteria Check

DIFFERENT WAYS TO ADD CONSTRAINTS

    1. While Table CREATE
    2. After Table Creation, Table ALTER  
"""


-- Adding NOT NULL Constraint
CREATE TABLE EmployeeSalaryTable(
    EmployeeID VARCHAR NOT NULL,
    EmployeeName VARCHAR NOT NULL,
    Department VARCHAR,
    Salary BIGINT
)

-- Adding DEFAULT Constraint
CREATE TABLE BarclaysStakeHolders(
    EmployeeID   VARCHAR,
    Gender_ VARCHAR DEFAULT 'NonSpecified',
    EmployeeName VARCHAR
)


-- Adding UNIQUE Constraint #1
CREATE TABLE EmployeeTable(
    EmployeeID VARCHAR NOT NULL,
    EmployeeName VARCHAR NOT NULL,
    Department VARCHAR,
    UNIQUE (EmployeeID)
)

-- Adding UNIQUE Constraint #2
CREATE TABLE EmployeeTable_(
    EmployeeID VARCHAR NOT NULL,
    EmployeeName VARCHAR NOT NULL,
    Department VARCHAR,
    UNIQUE (EmployeeName, Department)
)


-- Adding CHECK Constraint
CREATE TABLE BarclaysPublicInvestors(
    Fundraiser VARCHAR,
    DepositAmount BIGINT,
    createdAt TIMESTAMP,
    CHECK ( 
            (TRIM(Fundraiser) != '')    AND 
            (Fundraiser IS NOT NULL)    AND 
            (DepositAmount >= 1500000) 
        )
)



--ALTER COMMANDS
ALTER TABLE EmployeeSalaryTable
ALTER COLUMN Department
SET DEFAULT  NULL



ALTER TABLE BarclaysStakeHolders
ALTER COLUMN EmployeeID
SET NOT NULL



ALTER TABLE EmployeeSalaryTable
ADD CONSTRAINT SalaryCheckConstraint
CHECK  (Salary > 0)



ALTER TABLE BarclaysStakeHolders
ADD CONSTRAINT EmpIDUnique_Constraint
UNIQUE (EmployeeID)



-- DROP CONSTRAINS
ALTER TABLE BarclaysStakeHolders DROP CONSTRAINT EmpIDUnique_Constraint
ALTER TABLE EmployeeSalaryTable DROP CONSTRAINT SalaryCheckConstraint