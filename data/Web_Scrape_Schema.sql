-- Set the default schema to Web_Scrape_Schema
USE Web_Scrape_Schema;

-- Create Plan_Details table
CREATE TABLE Plan_Details (
    Plan_Name VARCHAR(255) PRIMARY KEY,
    Plan_Description TEXT,
    Phone_Number VARCHAR(20),
    TTY_Number VARCHAR(20),
    Website_URL VARCHAR(255),
    Estimated_Monthly_Premium DECIMAL(10, 2),
    Individual_Deductible DECIMAL(10, 2),
    Family_Deductible DECIMAL(10, 2),
    Individual_Out_of_Pocket_Limit DECIMAL(10, 2),
    Family_Out_of_Pocket_Limit DECIMAL(10, 2),
    Plan_Type VARCHAR(50),
    Coverage_Level VARCHAR(50),
    Child_Only_Coverage BOOLEAN,
    HSA_Eligible BOOLEAN,
    Rx_Coverage BOOLEAN,
    Wellness_Program_Offered BOOLEAN,
    Out_of_Service_Area_Coverage BOOLEAN,
    National_Network BOOLEAN,
    Out_of_Country_Coverage BOOLEAN
);

-- Create Disease_Management_Programs table
CREATE TABLE Disease_Management_Programs (
    Program_ID INT AUTO_INCREMENT PRIMARY KEY,
    Plan_Name VARCHAR(255),
    Disease VARCHAR(255),
    FOREIGN KEY (Plan_Name) REFERENCES Plan_Details(Plan_Name)
);

-- Create Junction table for Dental_Coverage
CREATE TABLE Plan_Dental_Coverage (
    Plan_Name VARCHAR(255),
    Basic_Dental_Adult BOOLEAN,
    Basic_Dental_Child BOOLEAN,
    Routine_Dental_Adult BOOLEAN,
    Routine_Dental_Child BOOLEAN,
    Major_Dental_Adult BOOLEAN,
    Major_Dental_Child BOOLEAN,
    Orthodontia_Adult BOOLEAN,
    Orthodontia_Child BOOLEAN,
    PRIMARY KEY (Plan_Name),
    FOREIGN KEY (Plan_Name) REFERENCES Plan_Details(Plan_Name)
);

-- Create Junction table for Vision_Coverage
CREATE TABLE Plan_Vision_Coverage (
    Plan_Name VARCHAR(255),
    Routine_Eye_Exam_Adult BOOLEAN,
    Routine_Eye_Exam_Child BOOLEAN,
    Eyeglasses_for_Child BOOLEAN,
    PRIMARY KEY (Plan_Name),
    FOREIGN KEY (Plan_Name) REFERENCES Plan_Details(Plan_Name)
);

-- Create Health_Services table
CREATE TABLE Health_Services (
    Service_ID INT AUTO_INCREMENT PRIMARY KEY,
    Plan_Name VARCHAR(255),
    Service_Type VARCHAR(100),
    Coinsurance DECIMAL(5, 2),
    Copay DECIMAL(10, 2),
    Referral_Required BOOLEAN,
    Maximum_Days INT,
    FOREIGN KEY (Plan_Name) REFERENCES Plan_Details(Plan_Name)
);

-- Create Drug_Coverage table
CREATE TABLE Drug_Coverage (
    Drug_ID INT AUTO_INCREMENT PRIMARY KEY,
    Plan_Name VARCHAR(255),
    Drug_Type VARCHAR(100),
    Coinsurance DECIMAL(5, 2),
    Copay DECIMAL(10, 2),
    FOREIGN KEY (Plan_Name) REFERENCES Plan_Details(Plan_Name)
);

-- Create Mental_Health_Services table
CREATE TABLE Mental_Health_Services (
    Mental_Health_ID INT AUTO_INCREMENT PRIMARY KEY,
    Plan_Name VARCHAR(255),
    Service_Type VARCHAR(100),
    Coinsurance DECIMAL(5, 2),
    Copay DECIMAL(10, 2),
    FOREIGN KEY (Plan_Name) REFERENCES Plan_Details(Plan_Name)
);

-- Create Pregnancy_Coverage table
CREATE TABLE Pregnancy_Coverage (
    Pregnancy_ID INT AUTO_INCREMENT PRIMARY KEY,
    Plan_Name VARCHAR(255),
    Notification_Required BOOLEAN,
    Prenatal_Postnatal_Care DECIMAL(5, 2),
    Delivery_Cost DECIMAL(10, 2),
    FOREIGN KEY (Plan_Name) REFERENCES Plan_Details(Plan_Name)
);

-- Create Benefits table
CREATE TABLE Benefits (
    Benefit_ID INT AUTO_INCREMENT PRIMARY KEY,
    Plan_Name VARCHAR(255),
    Included_Benefits TEXT,
    Excluded_Benefits TEXT,
    Limited_Benefits TEXT,
    FOREIGN KEY (Plan_Name) REFERENCES Plan_Details(Plan_Name)
);
