
# COVID-19 Analysis Project

## Project Overview

This project aims to analyze COVID-19 data, specifically focusing on death rates and vaccination coverage. The analysis is conducted using data from Excel sheets and presented through visualizations in Tableau.

## Project Files

- **covid_analysis.ssmssln**: SQL Server Management Studio solution file used to query and extract relevant data from the Excel sheets.
- **covid_analysis.twb**: Tableau workbook containing the visualizations created from the queried data.

## Data Source

The project utilizes two primary data sources:

1. **COVID-19 Deaths**: Data on COVID-19 related deaths, including demographics, dates, and regions.
2. **COVID-19 Vaccinations**: Data on vaccination rates, including vaccine type, distribution, and coverage.

## Steps to Reproduce

1. **Data Extraction**:
   - Use the SQL queries in the `covid_analysis.ssmssln` file to extract the required data from the Excel sheets.
   - The queries are designed to filter, aggregate, and join the relevant information for further analysis.

2. **Data Visualization**:
   - Open the `covid_analysis.twb` file in Tableau.
   - The Tableau workbook contains pre-built dashboards and visualizations that display the extracted data in a meaningful way.

## Visualization Highlights

The Tableau workbook includes several key visualizations:

- **Death Rates Over Time**: A time series analysis of COVID-19 deaths across different regions.
- **Vaccination Coverage by Region**: A geographical representation of vaccination rates.
- **Deaths vs. Vaccination Rates**: A comparative analysis to observe any correlation between death rates and vaccination coverage.

## Tools Used

- **SQL Server Management Studio (SSMS)**: For querying and manipulating the data in the Excel sheets.
- **Tableau**: For visualizing the extracted data.

## How to Use

1. Clone the repository to your local machine.
2. Open the `covid_analysis.ssmssln` file in SQL Server Management Studio to view and run the SQL queries.
3. Open the `covid_analysis.twb` file in Tableau to explore the visualizations.

