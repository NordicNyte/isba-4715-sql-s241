USE SQL_Project_Spring_2024;

-- Counties table remains unchanged
CREATE TABLE Counties (
    county_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    fips_code VARCHAR(10)
);

-- Zip Codes table remains unchanged
CREATE TABLE ZipCodes (
    zip_id INT AUTO_INCREMENT PRIMARY KEY,
    county_id INT,
    zip_code VARCHAR(10),
    FOREIGN KEY (county_id) REFERENCES Counties(county_id)
);

-- Updated Plans table to use VARCHAR(33) for db_id
CREATE TABLE Plans (
    db_id VARCHAR(33) PRIMARY KEY,
    name VARCHAR(255),
    metal_level VARCHAR(50),
    plan_type VARCHAR(100),
    product_division VARCHAR(100),
    premium DECIMAL(10, 2),
    premium_with_credit DECIMAL(10, 2),
    ehb_premium DECIMAL(10, 2)
);

-- Update PlanZipCodes junction table to reference VARCHAR(33) db_id
CREATE TABLE PlanZipCodes (
    db_id VARCHAR(33),
    zip_id INT,
    PRIMARY KEY (db_id, zip_id),
    FOREIGN KEY (db_id) REFERENCES Plans(db_id),
    FOREIGN KEY (zip_id) REFERENCES ZipCodes(zip_id)
);

-- Update Deductibles table to reference VARCHAR(33) db_id
CREATE TABLE Deductibles (
    deductible_id INT AUTO_INCREMENT PRIMARY KEY,
    db_id VARCHAR(33),
    deductible_type VARCHAR(100),
    amount DECIMAL(10, 2),
    FOREIGN KEY (db_id) REFERENCES Plans(db_id)
);

-- Update MOOPs table to reference VARCHAR(33) db_id
CREATE TABLE MOOPs (
    moop_id INT AUTO_INCREMENT PRIMARY KEY,
    db_id VARCHAR(33),
    moop_type VARCHAR(100),
    amount DECIMAL(10, 2),
    FOREIGN KEY (db_id) REFERENCES Plans(db_id)
);

-- Update Benefits table
CREATE TABLE Benefits (
    benefit_id INT AUTO_INCREMENT PRIMARY KEY,
    db_id VARCHAR(33),
    name VARCHAR(255),
    covered BOOLEAN,
    coinsurance_rate DECIMAL(5, 2),
    coinsurance_options VARCHAR(255),
    copay_amount DECIMAL(10, 2),
    copay_options VARCHAR(255),
    network_tier VARCHAR(100),
    cost_sharing_reduction VARCHAR(255),
    display_string VARCHAR(255),
    has_limits BOOLEAN,
    limit_unit VARCHAR(50),
    limit_quantity INT,
    FOREIGN KEY (db_id) REFERENCES Plans(db_id)
);
