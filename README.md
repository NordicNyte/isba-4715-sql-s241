# Project Overview: Competitive Analysis in Medicare Advantage Market

## Project Objective
The objective of this project is to conduct a competitive analysis of Medicare Advantage plans to identify market trends with the goal of creating competitive advantages early.

### What problem are you solving?
Actuarial data is a primary driver for pricing within the healthcare industry, particularly in Medicare Advantage plans. Pricing is a significant point of competition, and leveraging data effectively can provide a competitive edge.

### How are you solving this problem?
The solution involves conducting a comprehensive analysis of Medicare Advantage plans to gather insights into pricing, benefits, and coverage. This analysis includes data from CMS Marketplace API and web scraping of Finder.healthcare.gov.

## Job Description
This project is related to a senior finance position within a healthcare organization. The job involves serving as an experienced finance leader and operational consultant for various departments, providing operational and financial reporting, analysis, and consultation. Responsibilities include interpreting large volumes of complex data, conducting statistical analyses, and collaborating with clinical department leadership to drive operational excellence.

## Data
### Source
- **CMS Marketplace API**: Provides a vast amount of data related to provider services, payment plans, and other healthcare-related information.
- **Web Scraping (Finder.healthcare.gov)**: Extracts additional data on pricing, benefits, and coverage from insurance comparison websites, provider websites, and healthcare directories.

### Characteristics
The data include information on provider services, payment plans, claims data, patient care data, pricing, benefits, and coverage details of healthcare plans.

## Notebooks
- [API_ETL Notebook](https://github.com/NordicNyte/isba-4715-sql-s241/blob/main/API_ETL.ipynb): This notebook extracts data from CMS's Marketplace API and uploads it to an AWS server and RDS.
  - Purpose: The purpose of this notebook is to pull data from CMS's Marketplace API, process it, and upload it to an AWS server and RDS for further analysis. It involves data extraction, transformation, and loading processes.

- [Web_Scrape_ETL Notebook](https://github.com/NordicNyte/isba-4715-sql-s241/blob/main/Web_Scrape_ETL.ipynb): This notebook performs web scraping on Finder.healthcare.gov to gather additional data.
  - Purpose: The purpose of this notebook is to pull information from Finder.healthcare.gov using web scraping techniques. It extracts data that cannot be found on Marketplace API, enriching the dataset for more comprehensive analysis.

## Future Improvements
- Develop a full front-end website to revolutionize the way users shop for insurance plans.
- Implement a map-based interface displaying prices by zip code or FIPS code, allowing users to compare plans visually.
- Expand data sources to include a broader range of healthcare and Medicare/Medicaid plans from multiple sources.
